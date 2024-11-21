from sentence_transformers import SentenceTransformer

def download_model():
    print("Downloading model...")
    model_simul = SentenceTransformer('paraphrase-multilingual-MiniLM-L12-v2')
    # 도커 컨테이너 내부의 /app/model 디렉토리에 저장
    model_simul.save('/app/model/sentence_transformer')
    print("Model downloaded and saved successfully!")

if __name__ == "__main__":
    download_model() 