FROM python:latest


WORKDIR  /usr/src/app/

COPY app.py /usr/src/app/
COPY connect_to_mongoDB.py /usr/src/app/
COPY connect_to_TMDB.py /usr/src/app/
COPY passwords_and_keys.py /usr/src/app/
RUN mkdir -p /usr/src/app/templates
RUN mkdir -p /usr/src/app/static
COPY ./templates/* /usr/src/app/templates/
COPY ./static/* /usr/src/app/static/


RUN pip install flask pymongo requests Pillow flask_wtf form

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python", "/usr/src/app/app.py"]
