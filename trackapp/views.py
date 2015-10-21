from flask import render_template

from trackapp import app

@app.route('/')
def index():
    return "Everything seems fine..."
