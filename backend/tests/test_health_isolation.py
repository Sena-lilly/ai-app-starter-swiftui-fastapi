from fastapi.testclient import TestClient

from app.db.session import get_db
from app.main import create_app


def test_health_endpoint_does_not_require_database_dependency() -> None:
    app = create_app()

    def broken_get_db():
        raise AssertionError("health should not request a database session")

    app.dependency_overrides[get_db] = broken_get_db

    with TestClient(app) as client:
        response = client.get("/health")

    assert response.status_code == 200
    assert response.json()["status"] == "ok"
