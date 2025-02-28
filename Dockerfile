# FROM python:3.12-slim
FROM bitnami/minideb:latest
RUN apt update # && apt upgrade -y
RUN apt install -y  \
    python3 python3-pip \
    libmagic1 \
    poppler-utils \
    libreoffice \ 
    pandoc \
    tesseract-ocr \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip3 install -r requirements.txt