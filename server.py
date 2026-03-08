#!/usr/bin/env python3
"""
Daily Tasks - local server
Run with:  python server.py
Then open: http://localhost:8765
Tasks are saved to tasks.json in the same folder as this script.
"""

import json
import os
from http.server import BaseHTTPRequestHandler, HTTPServer

PORT = 8765
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
DATA_FILE  = os.path.join(SCRIPT_DIR, "tasks.json")
HTML_FILE  = os.path.join(SCRIPT_DIR, "tasks.html")


def load_tasks():
    if os.path.exists(DATA_FILE):
        with open(DATA_FILE, "r", encoding="utf-8") as f:
            return json.load(f)
    return {"tasks": [], "nextId": 1}


def save_tasks(data):
    with open(DATA_FILE, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)


class Handler(BaseHTTPRequestHandler):

    def log_message(self, fmt, *args):
        pass  # silence request logs

    def send_json(self, code, obj):
        body = json.dumps(obj).encode()
        self.send_response(code)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", len(body))
        self.send_header("Access-Control-Allow-Origin", "*")
        self.end_headers()
        self.wfile.write(body)

    def do_OPTIONS(self):
        self.send_response(204)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_GET(self):
        if self.path == "/tasks":
            self.send_json(200, load_tasks())
        elif self.path in ("/", "/tasks.html"):
            with open(HTML_FILE, "rb") as f:
                body = f.read()
            self.send_response(200)
            self.send_header("Content-Type", "text/html; charset=utf-8")
            self.send_header("Content-Length", len(body))
            self.end_headers()
            self.wfile.write(body)
        else:
            self.send_json(404, {"error": "not found"})

    def do_POST(self):
        if self.path == "/tasks":
            length = int(self.headers.get("Content-Length", 0))
            body   = self.rfile.read(length)
            data   = json.loads(body)
            save_tasks(data)
            self.send_json(200, {"ok": True})
        else:
            self.send_json(404, {"error": "not found"})


if __name__ == "__main__":
    server = HTTPServer(("localhost", PORT), Handler)
    print(f"✓ Daily Tasks running at http://localhost:{PORT}")
    print(f"  Tasks saved to: {DATA_FILE}")
    print("  Press Ctrl+C to stop.\n")
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\nStopped.")
