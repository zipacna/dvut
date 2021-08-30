"""
Docker Volume User Experiments
Author: Jean Mattes
Author-URI: https://risingcode.net/
License: CC-BY-4.0 (Docs) and MIT (Code)
"""

from flask import Flask

app = Flask(__name__)



if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
