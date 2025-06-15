FROM python:3.10-slim

# Install system dependencies (distutils not needed in Python 3.10)
RUN apt-get update && apt-get install -y gcc

# Set working directory
WORKDIR /data

# Copy files
COPY . .

# Install dependencies
RUN pip install --upgrade pip
RUN pip install django==3.2

# Apply migrations
RUN python manage.py migrate

# Expose the port
EXPOSE 8000

# Start server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
