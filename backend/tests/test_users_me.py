def test_users_me_with_valid_token_returns_current_user(client) -> None:
    signup_response = client.post(
        "/auth/signup",
        json={"email": "user@example.com", "password": "password123"},
    )
    token = signup_response.json()["access_token"]

    response = client.get(
        "/users/me",
        headers={"Authorization": f"Bearer {token}"},
    )

    assert response.status_code == 200
    assert response.json()["email"] == "user@example.com"
    assert "hashed_password" not in response.json()


def test_users_me_without_token_is_rejected(client) -> None:
    response = client.get("/users/me")

    assert response.status_code == 401
    assert response.json()["detail"]["code"] == "invalid_or_expired_token"


def test_users_me_with_invalid_token_is_rejected(client) -> None:
    response = client.get(
        "/users/me",
        headers={"Authorization": "Bearer not-a-valid-token"},
    )

    assert response.status_code == 401
    assert response.json()["detail"]["code"] == "invalid_or_expired_token"
