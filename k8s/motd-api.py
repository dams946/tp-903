from flask import Flask, request, jsonify
import os

app = Flask(__name__)
@app.route("/")
def hello():
    msg = os.environ.get("MESSAGE") or "Hello World!"
    return jsonify({"message":  msg})

if __name__ == '__main__':
    port_str = os.environ.get("PORT") or "80"
    port = int(port_str)

    app.run(host='0.0.0.0', port=port)
