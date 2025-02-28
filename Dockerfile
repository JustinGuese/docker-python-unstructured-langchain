# FROM python:3.12-slim
FROM bitnami/minideb:latest
RUN apt update # && apt upgrade -y
RUN apt install -y  \
    python3 \
    libmagic1 \
    poppler-utils \
    libreoffice \ 
    pandoc \
    tesseract-ocr \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt