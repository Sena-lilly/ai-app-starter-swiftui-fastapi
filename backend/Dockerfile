FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY backend/pyproject.toml backend/README.md ./
COPY backend/app ./app
COPY backend/alembic.ini ./
COPY backend/alembic ./alembic

RUN python -m pip install --upgrade pip \
    && python -m pip install --no-cache-dir -e ".[dev,postgres]"

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
