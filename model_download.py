
from sentence_transformers import SentenceTransformer  # 텍스트 백터 변환
    

model_simul = SentenceTransformer('paraphrase-xlm-r-multilingual-v1')

model_simul.save('./path_to_save_model')