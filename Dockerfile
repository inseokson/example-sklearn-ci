FROM python:3.9-slim-buster

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu
WORKDIR /home/ubuntu

USER ubuntu
COPY requirements/prd.txt ./requirements.txt
COPY main.py ./

ENV PATH=$PATH:/home/ubuntu/.local/bin
RUN pip install --no-cache-dir --upgrade \
        pip \
        wheel \
        setuptools && \
    pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["python", "main.py"]