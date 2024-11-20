FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt ./requirements.txt 


RUN pip3 install -r requirements.txt

RUN python -c "\
    from sentence_transformers import SentenceTransformer; \
    SentenceTransformer('paraphrase-xlm-r-multilingual-v1').save('/app/paraphrase-xlm-r-multilingual-v1')"

EXPOSE 8080
COPY . /app
CMD streamlit run --server.port 8080 --server.enableCORS false shadowapp.py