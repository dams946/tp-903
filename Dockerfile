FROM ubuntu:latest
RUN apt-get update

RUN apt-get install -y python3-pip python-dev build-essential
COPY . /app

WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT [ "python3" ]
CMD ["motd-api.py"]