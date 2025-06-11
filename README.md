# AI-Orchestrated Self-Driving Labs — Exercises

Welcome to the exercises for the **AI-Orchestrated Self-Driving Labs** course.

This repository provides the code, Jupyter notebooks, and configuration files for working with the colorbot.

---

## How to Run the Exercises

### Option 1: For wireless mode only, running in Jupyterlab in Docker:

If you are using this for DTU course 47332 or 47216, this is the mode you should use where you run the notebooks in a Docker image. This option uses a a prebuilt Docker image to run the exercises in an isolated environment with no need for installing dependencies.

#### 1. Install Docker Desktop

Download and install Docker Desktop from:  
https://www.docker.com/products/docker-desktop/

From your instructor, you will be given a secrets_mqtt.py file, which you should put in your working directory, from which you run this command:

Then in a terminal:
```bash
docker run --rm -it -p 8888:8888 \
  -v "$PWD/secrets_mqtt.py:/app/secrets_mqtt.py" \
  registry.gitlab.com/auto_lab/ai-orchestrated-sdl:1.1

```


Building the docker image yourself: 

```bash
git clone https://gitlab.com/auto_lab/ai-orchestrated-sdl.git
cd ai-orchestrated-sdl
 ```

Now put your secrets_mqtt.py file in the same ai-orchestrated-sdl folder and build the image. This should have docker build to whatever chip running on your machine:
 ```bash
docker build -t sdl-lab .
docker run -p 8888:8888 sdl-lab
 ```

 
Now your Docker image is running, and you can see it in your browser by entering:
```bash
 http://127.0.0.1:8888/lab
 ```




### Option 2: Local Setup (Required for USB Serial)

If you're using the **ColorBot via USB (Arduino/Serial)**, you must run the code locally.

#### 1. Clone the repository

```bash
git clone https://gitlab.com/auto_lab/ai-orchestrated-sdl.git
cd ai-orchestrated-sdl
```

####  2. Set up the environment
Then install poetry, using pip or pip3:

```bash
pip install poetry
```

It is recommended to use python 3.12.3 for stability. You can use ´pyenv´for setting the python version, by first installing it, and then setting it. 

```bash
 pyenv install 3.12.3  
pyenv local 3.12.3
 ```

Then install dependencies:
```bash
poetry install
```

You are now ready to run the noetbooks:
```bash
poetry run jupyter lab
```

This will open JupyterLab in your browser, where you can begin working with the exercises.
