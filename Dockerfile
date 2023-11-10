FROM python:3.11.1-alpine3.17

ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN  apk update \
    && pip3 install pipenv 

COPY Pipfile Pipfile.lock ./

RUN pipenv install --system

COPY app .

EXPOSE 8000

CMD ["python", "manage.py", "runserver"]