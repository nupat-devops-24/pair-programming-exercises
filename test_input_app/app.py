from fastapi import FastAPI, Form
from fastapi.responses import HTMLResponse
import mysql.connector
import os

app = FastAPI()

# DB config from environment variables
DB_CONFIG = {
    "host": os.getenv("DB_HOST", "db"),
    "port": int(os.getenv("DB_PORT", 3306)),
    "user": os.getenv("DB_USER", "textinput"),
    "password": os.getenv("DB_PASSWORD", "textinput1234"),
    "database": os.getenv("DB_NAME", "textinputdb")
}

conn = mysql.connector.connect(**DB_CONFIG)
cursor = conn.cursor()

# Create table if not exists
cursor.execute('''
    CREATE TABLE IF NOT EXISTS text_entries (
        id INT AUTO_INCREMENT PRIMARY KEY,
        text_content TEXT NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )
''')
conn.commit()


@app.get("/", response_class=HTMLResponse)
def index():
    with open("index.html") as f:
        return f.read()


@app.post("/submit")
def submit_text(content: str = Form(...)):
    cursor.execute(
        'INSERT INTO text_entries (text_content) VALUES (%s)', (content,))
    conn.commit()
    return {"message": "Text inserted successfully!", "id": cursor.lastrowid}


@app.get("/messages")
def get_messages():
    cursor.execute('SELECT * FROM text_entries ORDER BY created_at DESC')
    entries = cursor.fetchall()
    return [
        {"id": entry[0], "text": entry[1], "created_at": str(entry[2])}
        for entry in entries
    ]
