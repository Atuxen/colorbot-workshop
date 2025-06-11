FROM python:3.12.3-slim

# Environment setup
ENV POETRY_VERSION=1.8.2 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Install system deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    libffi-dev \
    libssl-dev \
    openssh-client \
 && apt-get clean && rm -rf /var/lib/apt/lists/*


# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/root/.local/bin:$PATH"

# Work dir
WORKDIR /app

# Install dependencies
COPY pyproject.toml poetry.lock* /app/
RUN poetry install --no-root --no-interaction --no-ansi \
 && rm -rf ~/.cache/pypoetry/* ~/.cache/pip/*

# Copy app files
COPY . /app

# Expose JupyterLab port
EXPOSE 8888

# Run JupyterLab without token or password
CMD ["poetry", "run", "jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--ServerApp.token=", "--ServerApp.password="]
