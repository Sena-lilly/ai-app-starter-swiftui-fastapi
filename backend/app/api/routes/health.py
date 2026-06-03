from fastapi import APIRouter

from app.core.config import settings


router = APIRouter(tags=["health"])


@router.get("/health")
def read_health() -> dict[str, str]:
    return {
        "status": "ok",
        "service": "backend",
        "version": settings.app_version,
    }
