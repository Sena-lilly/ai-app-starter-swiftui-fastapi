from app.core.config import Settings


def test_default_config_is_local_and_placeholder_only(monkeypatch) -> None:
    for key in [
        "APP_ENVIRONMENT",
        "APP_NAME",
        "APP_VERSION",
        "DATABASE_URL",
        "JWT_SECRET_KEY",
        "JWT_ALGORITHM",
        "ACCESS_TOKEN_EXPIRE_MINUTES",
    ]:
        monkeypatch.delenv(key, raising=False)

    settings = Settings(_env_file=None)

    assert settings.environment == "local"
    assert settings.database_url == "sqlite:///./.local/ai_app_starter.db"
    assert settings.jwt_secret_key == "local-development-placeholder-change-me"
    assert settings.jwt_algorithm == "HS256"
    assert settings.access_token_expire_minutes == 30


def test_config_can_read_placeholder_environment_values(monkeypatch) -> None:
    monkeypatch.setenv("APP_ENVIRONMENT", "local-test")
    monkeypatch.setenv("DATABASE_URL", "sqlite+pysqlite:///:memory:")
    monkeypatch.setenv("JWT_SECRET_KEY", "local-test-placeholder")
    monkeypatch.setenv("ACCESS_TOKEN_EXPIRE_MINUTES", "15")

    settings = Settings(_env_file=None)

    assert settings.environment == "local-test"
    assert settings.database_url == "sqlite+pysqlite:///:memory:"
    assert settings.jwt_secret_key == "local-test-placeholder"
    assert settings.access_token_expire_minutes == 15
