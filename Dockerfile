FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# git нужен для установки из GitHub
RUN apt-get update && apt-get install -y --no-install-recommends git \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# ставим свежий nbviewer напрямую из GitHub (в master уже фиксы с html.escape)
# при желании потом можно зафиксировать SHA: @<commit_sha>
RUN pip install --no-cache-dir "git+https://github.com/jupyter/nbviewer.git@main"

EXPOSE 8080

# Render/Fly/Railway передают PORT; локально остаётся 8080
CMD ["sh", "-c", "python -m nbviewer --port=${PORT:-8080} --no-cache"]
