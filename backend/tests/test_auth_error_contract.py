def test_duplicate_email_error_contract(client) -> None:
    payload = {"email": "local-quality@example.com", "password": "password123"}

    client.post("/auth/signup", json=payload)
    response = client.post("/auth/signup", json=payload)

    assert response.status_code == 409
    assert response.json()["detail"] == {
        "code": "email_already_registered",
        "message": "Email is already registered.",
    }


def test_invalid_login_error_contract(client) -> None:
    client.post(
        "/auth/signup",
        json={"email": "local-quality@example.com", "password": "password123"},
    )

    response = client.post(
        "/auth/login",
        json={"email": "local-quality@example.com", "password": "wrongpassword"},
    )

    assert response.status_code == 401
    assert response.headers["www-authenticate"] == "Bearer"
    assert response.json()["detail"] == {
        "code": "invalid_credentials",
        "message": "Invalid email or password.",
    }


def test_missing_token_error_contract(client) -> None:
    response = client.get("/users/me")

    assert response.status_code == 401
    assert response.headers["www-authenticate"] == "Bearer"
    assert response.json()["detail"] == {
        "code": "invalid_or_expired_token",
        "message": "Authentication is required.",
    }


def test_malformed_authorization_header_is_rejected(client) -> None:
    response = client.get(
        "/users/me",
        headers={"Authorization": "Token not-a-bearer-token"},
    )

    assert response.status_code == 401
    assert response.json()["detail"]["code"] == "invalid_or_expired_token"


def test_signup_validation_errors_use_fastapi_422(client) -> None:
    response = client.post(
        "/auth/signup",
        json={"email": "not-an-email", "password": "short"},
    )

    assert response.status_code == 422
    assert isinstance(response.json()["detail"], list)


def test_login_validation_errors_use_fastapi_422(client) -> None:
    response = client.post(
        "/auth/login",
        json={"email": "not-an-email", "password": "short"},
    )

    assert response.status_code == 422
    assert isinstance(response.json()["detail"], list)
