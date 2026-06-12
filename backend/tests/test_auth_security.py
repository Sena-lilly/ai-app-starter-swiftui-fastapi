from datetime import datetime, timedelta, timezone

import jwt

from app.core.config import settings


def _encode_test_token(payload: dict[str, object]) -> str:
    return jwt.encode(payload, settings.jwt_secret_key, algorithm=settings.jwt_algorithm)


def _signup_and_get_token(client) -> str:
    response = client.post(
        "/auth/signup",
        json={"email": "p8b-test@example.com", "password": "password123"},
    )
    return response.json()["access_token"]


def test_auth_responses_never_expose_hashed_password(client) -> None:
    signup_response = client.post(
        "/auth/signup",
        json={"email": "p8b-test@example.com", "password": "password123"},
    )
    login_response = client.post(
        "/auth/login",
        json={"email": "p8b-test@example.com", "password": "password123"},
    )
    token = signup_response.json()["access_token"]
    me_response = client.get(
        "/users/me",
        headers={"Authorization": f"Bearer {token}"},
    )

    assert "hashed_password" not in signup_response.text
    assert "hashed_password" not in login_response.text
    assert "hashed_password" not in me_response.text


def test_expired_access_token_is_rejected(client) -> None:
    expired_token = _encode_test_token(
        {
            "sub": "1",
            "email": "p8b-test@example.com",
            "type": "access",
            "iat": datetime.now(timezone.utc) - timedelta(hours=2),
            "exp": datetime.now(timezone.utc) - timedelta(hours=1),
        }
    )

    response = client.get(
        "/users/me",
        headers={"Authorization": f"Bearer {expired_token}"},
    )

    assert response.status_code == 401
    assert response.json()["detail"]["code"] == "invalid_or_expired_token"


def test_token_with_wrong_type_is_rejected(client) -> None:
    token = _encode_test_token(
        {
            "sub": "1",
            "email": "p8b-test@example.com",
            "type": "refresh",
            "iat": datetime.now(timezone.utc),
            "exp": datetime.now(timezone.utc) + timedelta(minutes=30),
        }
    )

    response = client.get("/users/me", headers={"Authorization": f"Bearer {token}"})

    assert response.status_code == 401
    assert response.json()["detail"]["code"] == "invalid_or_expired_token"


def test_token_missing_subject_is_rejected(client) -> None:
    token = _encode_test_token(
        {
            "email": "p8b-test@example.com",
            "type": "access",
            "iat": datetime.now(timezone.utc),
            "exp": datetime.now(timezone.utc) + timedelta(minutes=30),
        }
    )

    response = client.get("/users/me", headers={"Authorization": f"Bearer {token}"})

    assert response.status_code == 401
    assert response.json()["detail"]["code"] == "invalid_or_expired_token"


def test_token_missing_email_is_rejected(client) -> None:
    token = _encode_test_token(
        {
            "sub": "1",
            "type": "access",
            "iat": datetime.now(timezone.utc),
            "exp": datetime.now(timezone.utc) + timedelta(minutes=30),
        }
    )

    response = client.get("/users/me", headers={"Authorization": f"Bearer {token}"})

    assert response.status_code == 401
    assert response.json()["detail"]["code"] == "invalid_or_expired_token"


def test_token_with_non_integer_subject_is_rejected(client) -> None:
    token = _encode_test_token(
        {
            "sub": "not-an-int",
            "email": "p8b-test@example.com",
            "type": "access",
            "iat": datetime.now(timezone.utc),
            "exp": datetime.now(timezone.utc) + timedelta(minutes=30),
        }
    )

    response = client.get("/users/me", headers={"Authorization": f"Bearer {token}"})

    assert response.status_code == 401
    assert response.json()["detail"]["code"] == "invalid_or_expired_token"


def test_token_for_deleted_or_missing_user_is_rejected(client) -> None:
    token = _signup_and_get_token(client)

    # The fixture uses an isolated SQLite database per test. A clearly absent
    # user id avoids relying on internals of a deleted-row workflow.
    missing_user_token = _encode_test_token(
        {
            "sub": "999999",
            "email": "p8b-test@example.com",
            "type": "access",
            "iat": datetime.now(timezone.utc),
            "exp": datetime.now(timezone.utc) + timedelta(minutes=30),
        }
    )

    assert token
    response = client.get(
        "/users/me",
        headers={"Authorization": f"Bearer {missing_user_token}"},
    )

    assert response.status_code == 401
    assert response.json()["detail"]["code"] == "invalid_or_expired_token"
