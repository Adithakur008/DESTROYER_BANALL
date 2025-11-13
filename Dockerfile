 # Use official Python runtime
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies (for cryptography, psutil, etc.)
RUN apt-get update && apt-get install -y \
    gcc \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first (for better caching)
COPY requirements.txt .

# Upgrade pip and install dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt --verbose

# Copy app code
COPY . .

# Expose port (Render uses $PORT)
EXPOSE $PORT

# Run the app
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8080"]
