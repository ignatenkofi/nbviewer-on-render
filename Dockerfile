FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# git для установки из репо + тулчейн для сборки
RUN apt-get update && apt-get install -y --no-install-recommends \
    git build-essential libffi-dev libssl-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# инструменты сборки для pyproject-пакетов
RUN pip install --upgrade pip setuptools wheel hatchling hatch-vcs

# свежий nbviewer с фиксом escape (ветка main)
RUN pip install --no-cache-dir "git+https://github.com/jupyter/nbviewer.git@main"

EXPOSE 8080
CMD ["sh", "-c", "python -m nbviewer --port=${PORT:-8080} --no-cache"]
