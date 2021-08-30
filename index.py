"""
Docker Volume User Tests
Author: Jean Mattes
Author-URI: https://risingcode.net/
License: CC-BY-4.0 (Docs) and MIT (Code)
"""

from flask import Flask


def setup_routes(flask_app: Flask):
    pass


app = Flask(__name__)
setup_routes(app)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
