FROM python:3.13-slim

# Install system dependencies (including distutils)
RUN apt-get update && apt-get install -y python3-distutils gcc

# Set working directory
WORKDIR /data

# Copy project files
COPY . .

# Install pip requirements
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Run DB migrations
RUN python manage.py migrate

# Expose the app port
EXPOSE 8000

# Run the Django app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
