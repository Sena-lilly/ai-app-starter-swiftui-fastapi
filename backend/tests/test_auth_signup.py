def test_signup_success_returns_user_and_token(client) -> None:
    response = client.post(
        "/auth/signup",
        json={"email": "USER@example.com", "password": "password123"},
    )

    assert response.status_code == 201
    body = response.json()
    assert body["token_type"] == "bearer"
    assert body["access_token"]
    assert body["user"]["email"] == "user@example.com"
    assert "hashed_password" not in body["user"]


def test_signup_duplicate_email_is_rejected(client) -> None:
    payload = {"email": "user@example.com", "password": "password123"}

    first_response = client.post("/auth/signup", json=payload)
    second_response = client.post("/auth/signup", json=payload)

    assert first_response.status_code == 201
    assert second_response.status_code == 409
    assert second_response.json()["detail"]["code"] == "email_already_registered"
