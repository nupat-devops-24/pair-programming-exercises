ARG PYTHON_VERSION="3.11"
# bookworm > bullseye > slim > alpine

# FROM python:3.11-slim
FROM python:${PYTHON_VERSION}-slim

WORKDIR /app

# Copy requirements first for better layer caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY api.py .
COPY channels.json .

# Expose the port that FastAPI will run on
EXPOSE 8000

# Command to run the application
CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "8000"]