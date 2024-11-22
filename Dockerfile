# Python 3.11 이미지를 기반으로 생성
FROM python:3.12.2

# 작업 디렉토리 설정
WORKDIR /app

# 시스템 패키지 업데이트 및 pip 최신 버전으로 업그레이드
RUN apt-get update && apt-get install -y \
    && pip install --upgrade pip --root-user-action=ignore

# requirements.txt 복사 및 라이브러리 설치
COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt --root-user-action=ignore

# 모델 저장을 위한 디렉토리 생성
RUN mkdir -p /app/model && chmod 777 /app/model

# 모델 다운로드 스크립트 복사 및 실행
COPY model_download.py /app/model_download.py
RUN python /app/model_download.py

# 포트 설정
EXPOSE 8080

# 애플리케이션 코드 복사
COPY . .

# Streamlit 실행
CMD ["streamlit", "run", "--server.port", "8080", "--server.enableCORS", "false", "shadowapp.py"]
