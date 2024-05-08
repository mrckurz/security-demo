
from flask import Flask, render_template
import random
import platform

app = Flask(__name__)

#list of cat images
images = [
    "https://brunocapuano.files.wordpress.com/2016/06/swarmnado.gif",
    "https://i.giphy.com/OP7kIfBat5sGY.gif",
    "https://i.imgur.com/0BpqqmW.gif"
]

@app.route('/')
def index():
    url = random.choice(images)
    hostname = platform.node()
    return render_template('index.html', url=url, hostname=hostname)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)
