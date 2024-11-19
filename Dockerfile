# app/Dockerfile

FROM python:3.9-slim

EXPOSE 8080
WORKDIR /app

COPY . ./

RUN pip3 install -r requirements.txt


ENTRYPOINT ["streamlit", "run", "shadowapp.py", "--server.port=8080", "--server.address=0.0.0.0"]