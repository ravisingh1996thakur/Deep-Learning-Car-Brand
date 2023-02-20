#!/bin/bash
export FLASK_APP=app.py
source car/bin/activate
pip install -r requirements.txt
export FLASK_ENV=production
export FLASK_RUN_PORT=$PORT
export FLASK_RUN_HOST=0.0.0.0
flask run
