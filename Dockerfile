FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends build-essential git \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# правильная версия из PyPI
RUN pip install --no-cache-dir nbviewer==1.0.1

EXPOSE 8080
# Render/Fly/Railway передают PORT; дефолт на 8080 локально
CMD ["sh", "-c", "python -m nbviewer --port=${PORT:-8080} --no-cache"]
