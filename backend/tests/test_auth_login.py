def test_login_success_returns_bearer_token(client) -> None:
    payload = {"email": "user@example.com", "password": "password123"}
    client.post("/auth/signup", json=payload)

    response = client.post("/auth/login", json=payload)

    assert response.status_code == 200
    body = response.json()
    assert body["token_type"] == "bearer"
    assert body["access_token"]
    assert body["user"]["email"] == "user@example.com"
    assert "hashed_password" not in body["user"]


def test_login_invalid_credentials_are_rejected(client) -> None:
    client.post(
        "/auth/signup",
        json={"email": "user@example.com", "password": "password123"},
    )

    response = client.post(
        "/auth/login",
        json={"email": "user@example.com", "password": "wrongpassword"},
    )

    assert response.status_code == 401
    assert response.json()["detail"]["code"] == "invalid_credentials"
