# set base image (host OS)
FROM python:3.8

# set the working directory in the container
WORKDIR /code

# copy the dependencies file to the working directory
COPY requirements.txt .

RUN apk add cargo openssl-dev

# install dependencies
RUN pip install -U pip
RUN pip install setuptools_rust wheel
RUN pip install -r requirements.txt

# copy the content of the local src directory to the working directory
COPY main.py .
COPY plugins.py .

# command to run on container start
CMD [ "python", "./main.py" ]
