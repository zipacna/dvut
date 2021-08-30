#!/usr/bin/env bash
pipenv run gunicorn -w 5 -b 0.0.0.0:80 --reload index:app
