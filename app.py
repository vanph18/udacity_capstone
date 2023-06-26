from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    # html = "Hello World, my name is VanPH5 v1"
    html = "Hello World, my name is VanPH5 v2"
    return html

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80, debug=True) # specify port=80
