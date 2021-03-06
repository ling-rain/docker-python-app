FROM gliderlabs/alpine:latest
MAINTAINER Kami Gerami <kami.gerami@gmail.com>
LABEL Description="This image is used to start the python Flask app." Version="1.0"
ADD . /code
WORKDIR /code
RUN apk-install python \
    python-dev \
    py-pip &&\
    pip install --trusted-host e.pypi.python.org -i http://e.pypi.python.org/simple -r requirements.txt
CMD ["python", "app.py"]
