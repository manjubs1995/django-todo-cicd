FROM python:3.13-slim

# ✅ Ensure Python looks in the correct place and install build tools
RUN apt-get update && \
    apt-get install -y python3-distutils python3-venv gcc && \
    ln -s /usr/lib/python3.13/distutils /usr/local/lib/python3.13/distutils

# Set working directory
WORKDIR /data

# Copy project files
COPY . .

# Upgrade pip and install dependencies
RUN pip install --upgrade pip
RUN pip install django==3.2

# Run DB migrations
RUN python manage.py migrate

# Expose the app port
EXPOSE 8000

# Run the Django app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
