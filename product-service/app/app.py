from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def index():
    return jsonify({"message": "Welcome to Product Service! CreatedBy - By Aaron"})

@app.route("/health")
def health():
    return jsonify({"status": "ok, CreatedBy - By Aaron"})

@app.route("/product")
def product():
    return jsonify([
        {"message": "CreatedBy - By Aaron"},
        {"name": "Laptop", "price": 999},
        {"name": "Mouse", "price": 25},
        {"name": "Keyboard", "price": 45}
    ])

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
