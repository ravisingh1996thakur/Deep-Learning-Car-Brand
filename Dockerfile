FROM python:3.9-slim-buster

# Install system dependencies
RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y curl && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    export PATH="$HOME/.cargo/bin:$PATH"

# Set Flask environment variables
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# Create and set the working directory
WORKDIR /app

# Copy the Flask application files to the container
COPY . /app

# Activate virtual environment and install Python dependencies
RUN python -m venv venv && \
    . venv/bin/activate && \
    pip install -r requirements.txt

# Expose the port that the application will run on
EXPOSE $PORT

# Start the Flask application
CMD ["flask", "run", "--host=0.0.0.0"]
