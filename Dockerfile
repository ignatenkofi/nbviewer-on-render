FROM python:3.11-slim
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
RUN apt-get update && apt-get install -y --no-install-recommends build-essential git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN pip install --no-cache-dir nbviewer==0.4.0
EXPOSE 8080
CMD ["python", "-m", "nbviewer", "--port=8080", "--no-cache"]
