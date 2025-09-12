ARG PYTHON_VERSION="3.11"

FROM python:${PYTHON_VERSION}-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY wait_for_db.sh /wait_for_db.sh

COPY . .

EXPOSE 5000

CMD ["./wait_for_db.sh", "uvicorn", "app:app", "--host", "0.0.0.0", "--port", "5000"]
#CMD ["/wait_for_db.sh","python", "app.py"]
