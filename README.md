# versoes-python

This project demonstrates a Python application setup with automated versioning using python-semantic-release, CI/CD pipeline with Jenkins, and containerization with Docker. It serves as a template or example for managing Python project releases and deployments

## Getting Started

### Prerequisites

- Python 3.12 or higher
- [uv](https://github.com/astral-sh/uv)

### Installation

1. Clone the repository:
   ```sh
   git clone <repository-url>
   cd versoes-python
   ```
2. Install dependencies using uv:
   ```sh
   uv sync
   ```

### Running the application

To run the application, execute:
```sh
python main.py
```

## CI/CD

This project uses Jenkins for continuous integration and deployment. The pipeline is defined in the [Jenkinsfile](Jenkinsfile).

[python-semantic-release](https://python-semantic-release.readthedocs.io/) is used for automated versioning and changelog generation, configured in [pyproject.toml](pyproject.toml).

## Docker

A [Dockerfile](Dockerfile) is provided to build a container image for the application.
To build the image:
```sh
docker build -t versoes-python .
```

A [docker-compose.yml](docker-compose.yml) file is also included to run a Jenkins instance.
To start Jenkins:
```sh
docker-compose up -d
```
Access Jenkins at `http://localhost:8080`.