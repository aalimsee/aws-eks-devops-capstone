from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/health")
def health():
    return jsonify({"status": "ok"})

@app.route("/product")
def product():
    return jsonify({"product": "Laptop", "price": 1200})

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
