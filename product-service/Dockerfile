
FROM python:3.11-slim

WORKDIR /app

# Copy only requirement first for layer caching
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy actual app code
COPY ./app/ .

EXPOSE 5000

CMD ["python", "app.py"]
