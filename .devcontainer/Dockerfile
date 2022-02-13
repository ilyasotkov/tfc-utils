FROM python:3.8-slim-bullseye
WORKDIR /workspace

RUN apt-get -qq update \
        && apt-get -qq install --no-install-recommends --no-install-suggests -y \
        bash \
        curl \
        jq \
        ca-certificates \
        zip \
        build-essential \
        git \
        gnupg \
        openssh-client

ENV PYTHONPATH /workspace
ENV VIRTUAL_ENV=/usr/local

ARG POETRY_VERSION=1.1.13
RUN pip install poetry==${POETRY_VERSION}

COPY pyproject.toml .
RUN poetry install
