FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libopencv-dev \
    libfreetype6-dev \
    libpng-dev \
    && rm -rf /var/lib/apt/lists/*

# Verify Python and pip versions
RUN python3 --version && pip3 --version

# Check network connectivity with curl
RUN curl -sSL https://pypi.org

# Install Python dependencies with verbose output
RUN pip3 install --no-cache-dir -U -r requirements.txt --verbose

COPY . .
CMD ["bash","start.sh"]
