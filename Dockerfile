FROM python:3.11
WORKDIR /app

RUN pip install --upgrade pip

COPY requirements.txt ./requirements.txt 


RUN pip3 install -r requirements.txt

RUN python -c "\
    from sentence_transformers import SentenceTransformer; \
    SentenceTransformer('paraphrase-xlm-r-multilingual-v1').save('/app/paraphrase-xlm-r-multilingual-v1')"

EXPOSE 8080
COPY . /app
CMD streamlit run --server.port 8080 --server.enableCORS false shadowapp.py