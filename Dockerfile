# Python 3.11 이미지를 기반으로 생성
FROM python:3.11

# 작업 디렉토리 설정
WORKDIR /app

# 시스템 패키지 업데이트 및 pip 최신 버전으로 업그레이드
RUN apt-get update && apt-get install -y \
    && pip install --upgrade pip --root-user-action=ignore

# requirements.txt 복사 및 라이브러리 설치
COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt --root-user-action=ignore

# 모델 다운로드 및 저장
RUN python -c "\
    from sentence_transformers import SentenceTransformer; \
    SentenceTransformer('paraphrase-xlm-r-multilingual-v1').save('/app/paraphrase-xlm-r-multilingual-v1')"

# 포트 설정
EXPOSE 8080

# 애플리케이션 코드 복사
COPY . .

# Streamlit 실행
CMD ["streamlit", "run", "--server.port", "8080", "--server.enableCORS", "false", "shadowapp.py"]
