FROM python:3.11

ARG BASIC_AUTH_USERNAME_ARG
ARG BASIC_AUTH_PASSWORD_ARG

ENV BASIC_AUTH_USERNAME=${BASIC_AUTH_USERNAME_ARG}
ENV BASIC_AUTH_PASSWORD=${BASIC_AUTH_PASSWORD_ARG}

COPY ./requirements.txt /usr/requirements.txt

WORKDIR /usr

RUN pip3 install -r requirements.txt

COPY ./src /usr/src
COPY ./models /usr/models

CMD ["python3", "/usr/src/app/main.py"]