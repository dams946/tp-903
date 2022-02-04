import flask
from flask import jsonify
import os
app = flask.Flask(__name__)
from pymongo import MongoClient

#Creating a pymongo client
client = MongoClient('localhost', 27017)

#Getting the database instance
db = client['test']

@app.route('/')
def info():
   o = db.messages.find_one()
   return {"message": o['message']}

if __name__ == '__main__':
    app.config['DEBUG'] = True
    app.run(host='0.0.0.0', port=os.environ.get('PYTHON_PORT'))