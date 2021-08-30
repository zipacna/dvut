"""
Docker Volume User Tests
Author: Jean Mattes
Author-URI: https://risingcode.net/
License: CC-BY-4.0 (Docs) and MIT (Code)
"""

from flask import Flask


class Route:
    def __init__(self, flask_app: Flask):
        self.app = flask_app
        self.setup_routes()

    def setup_routes(self):
        self.app.add_url_rule('/', 'index', self.home)

    def home(self):
        with open('test.txt', 'w+') as f:
            f.write('test\n')
        return 'works;\n'


app = Flask(__name__)
Route(app)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
