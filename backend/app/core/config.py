from functools import lru_cache
from pathlib import Path

from pydantic import Field
from pydantic_settings import BaseSettings, SettingsConfigDict


ROOT_ENV_FILE = Path(__file__).resolve().parents[3] / ".env"


class Settings(BaseSettings):
    app_name: str = Field(
        default="ai-app-starter-swiftui-fastapi",
        validation_alias="APP_NAME",
    )
    app_version: str = Field(
        default="0.1.0-dev",
        validation_alias="APP_VERSION",
    )
    environment: str = Field(
        default="local",
        validation_alias="APP_ENVIRONMENT",
    )
    database_url: str | None = Field(
        default="sqlite:///./.local/ai_app_starter.db",
        validation_alias="DATABASE_URL",
    )
    jwt_secret_key: str = Field(
        default="local-development-placeholder-change-me",
        validation_alias="JWT_SECRET_KEY",
    )
    jwt_algorithm: str = Field(
        default="HS256",
        validation_alias="JWT_ALGORITHM",
    )
    access_token_expire_minutes: int = Field(
        default=30,
        validation_alias="ACCESS_TOKEN_EXPIRE_MINUTES",
    )

    model_config = SettingsConfigDict(
        env_file=ROOT_ENV_FILE,
        env_file_encoding="utf-8",
        extra="ignore",
    )


@lru_cache
def get_settings() -> Settings:
    return Settings()


settings = get_settings()
