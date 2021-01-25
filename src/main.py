import flask, json

PORT = 5000

app = flask.Flask(__name__)
app.config["DEBUG"] = True


@app.route('/', methods=["GET"])
def home():
    returnObject = { "status": "ok" }
    return json.dumps(returnObject)

app.run(port=PORT)