import os
from flask import Flask
from flask_restful import Resource, Api

web_app = Flask(__name__)

@web_app.route('/')
def hello_world():
    return 'Bot is alive!'

def run_web_server():
    port = int(os.environ.get("PORT", 8080))
    web_app.run(host='0.0.0.0', port=port)
