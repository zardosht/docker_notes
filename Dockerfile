FROM ubuntu

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get -y install python3 python3-pip

RUN pip3 install flask
RUN pip3 install flask-mysql

EXPOSE 8080
EXPOSE 5000

COPY . /opt/source-code

ENTRYPOINT FLASK_ENV=development python3 /opt/source-code/flask-app/app.py 

