from functools import lru_cache
from collections.abc import Generator
from pathlib import Path

from sqlalchemy import create_engine
from sqlalchemy.engine import Engine
from sqlalchemy.orm import Session, sessionmaker

from app.core.config import settings
from app.db.base import Base


@lru_cache
def create_database_engine(database_url: str | None = None) -> Engine | None:
    url = database_url or settings.database_url
    if not url:
        return None

    connect_args: dict[str, object] = {}
    if url.startswith("sqlite"):
        connect_args["check_same_thread"] = False

    return create_engine(url, pool_pre_ping=True, connect_args=connect_args)


def create_session_factory(
    engine: Engine | None = None,
) -> sessionmaker[Session] | None:
    selected_engine = engine or create_database_engine()
    if selected_engine is None:
        return None

    return sessionmaker(
        bind=selected_engine,
        autocommit=False,
        autoflush=False,
    )


_initialized_engine_ids: set[int] = set()


def ensure_database_tables(engine: Engine) -> None:
    engine_id = id(engine)
    if engine_id in _initialized_engine_ids:
        return

    if engine.url.get_backend_name() == "sqlite":
        database_path = engine.url.database
        if database_path and database_path != ":memory:":
            Path(database_path).parent.mkdir(parents=True, exist_ok=True)

    import app.models.user  # noqa: F401

    Base.metadata.create_all(bind=engine)
    _initialized_engine_ids.add(engine_id)


def get_db() -> Generator[Session]:
    engine = create_database_engine()
    if engine is None:
        raise RuntimeError("DATABASE_URL is required for auth endpoints.")

    ensure_database_tables(engine)
    session_factory = create_session_factory(engine)
    if session_factory is None:
        raise RuntimeError("Database session factory could not be created.")

    with session_factory() as session:
        yield session
