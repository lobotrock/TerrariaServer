FROM python:3.8-alpine

COPY requirements.txt /requirements.txt
COPY main.py /main.py

RUN pip install -r requirements.txt

CMD [ "python", "./main.py" ]