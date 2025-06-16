FROM python:3.12.3-slim

# Environment setup
ENV POETRY_VERSION=1.8.2 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_ONLY_BINARY=:all: \
    PIP_NO_BUILD_ISOLATION=1 \
    PIP_EXTRA_INDEX_URL=https://download.pytorch.org/whl/cpu


# Install system deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    libffi-dev \
    libssl-dev \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Add Poetry to PATH
ENV PATH="/root/.local/bin:$PATH"

# Set work directory
WORKDIR /app


# Install dependencies
COPY pyproject.toml poetry.lock* /app/
RUN poetry install --no-root --no-interaction --no-ansi 

# Copy app files
COPY . /app

# Expose JupyterLab port
EXPOSE 8888

# Run JupyterLab without token or password
CMD ["poetry", "run", "env", "PYTHONPATH=/app", "jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]




