from flask import Flask, render_template
from datetime import datetime

app = Flask(__name__)


@app.route('/')
def home_page():
    return render_template('base.html')


if __name__ == '__main__':
    app.run()
