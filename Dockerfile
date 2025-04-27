# Use official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install required packages
RUN pip install --no-cache-dir fastapi uvicorn pytest httpx

# Copy your FastAPI app and python tests
COPY ./app ./app
COPY ./tests ./tests
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port FastAPI will run on
EXPOSE 8000

# Run the server
# CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

COPY run_with_tests.sh /run_with_tests.sh
RUN chmod +x /run_with_tests.sh
CMD ["/bin/bash", "/run_with_tests.sh"]

