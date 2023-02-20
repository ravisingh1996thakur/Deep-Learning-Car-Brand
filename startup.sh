#!/bin/bash

# Install system dependencies
apt-get update
apt-get install -y build-essential
apt-get install -y curl

# Install rustup and Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# Set Flask environment variables
export FLASK_APP=app.py
export FLASK_ENV=production

# Activate virtual environment and install Python dependencies
source car/bin/activate
pip install -r requirements.txt

# Start the Flask application
flask run --host=0.0.0.0 --port=$PORT
