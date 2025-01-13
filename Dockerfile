# Retrieve the Alpine base image
FROM python:3.9-alpine

LABEL maintainer="xavierington@tuta.com"

# Update repos and upgrade packages
RUN apk update && apk upgrade && apk add --no-cache py3-requests py3-yaml py3-psutil

# Set Python to unbuffered mode for logging
ENV PYTHONUNBUFFERED=1

# Set a working directory in the container
WORKDIR /app

# Copy the python script and requirements files
COPY cache-mover.py /app/cache-mover.py

# By default, run the cache-mover script
ENTRYPOINT ["python", "/app/cache-mover.py"]
