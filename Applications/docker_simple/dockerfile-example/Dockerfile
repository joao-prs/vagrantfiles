# example dockerfile

# based
FROM ubuntu:24.04

# run
RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    build-essential \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# move or copy
COPY app.py /app/app.py
COPY requirements.txt /app/

