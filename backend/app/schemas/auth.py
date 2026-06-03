from pydantic import BaseModel, Field, field_validator

from app.schemas.user import UserPublic


class AuthCredentials(BaseModel):
    email: str = Field(min_length=3, max_length=320)
    password: str = Field(min_length=8, max_length=128)

    @field_validator("email")
    @classmethod
    def normalize_email(cls, value: str) -> str:
        normalized = value.strip().lower()
        local, separator, domain = normalized.partition("@")
        if not local or separator != "@" or "." not in domain:
            raise ValueError("Enter a valid email address.")
        return normalized


class AuthResponse(BaseModel):
    user: UserPublic
    access_token: str
    token_type: str = "bearer"
