from sqlalchemy import inspect

from app.db.session import create_database_engine, create_session_factory, ensure_database_tables


def test_sqlite_engine_and_session_factory_do_not_require_postgres() -> None:
    engine = create_database_engine("sqlite+pysqlite:///:memory:")

    assert engine is not None
    assert engine.url.get_backend_name() == "sqlite"

    session_factory = create_session_factory(engine)
    assert session_factory is not None

    with session_factory() as session:
        assert session.bind is engine


def test_ensure_database_tables_creates_sqlite_user_table() -> None:
    engine = create_database_engine("sqlite+pysqlite:///:memory:")
    assert engine is not None

    ensure_database_tables(engine)

    assert "users" in inspect(engine).get_table_names()
