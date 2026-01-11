from flask import Flask, jsonify, request, send_from_directory
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
player_data = []

@app.route('/update', methods=['POST'])
def update_players():
    global player_data
    player_data = request.json
    return jsonify({"status": "ok"})

@app.route('/players', methods=['GET'])
def get_players():
    return jsonify(player_data)

@app.route('/')
def index():
    return send_from_directory('.', 'index.html')

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)