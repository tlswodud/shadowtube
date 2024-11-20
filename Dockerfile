FROM python:3.7
WORKDIR /app
COPY requirements.txt ./requirements.txt # 설치 필요한 라이브러리
COPY PatientInfo.csv ./PatientInfo.csv # 사용되는 데이터셋
COPY Region.csv ./Region.csv # 사용되는 데이터셋
RUN pip3 install -r requirements.txt
EXPOSE 8080
COPY . /app
CMD streamlit run --server.port 8080 --server.enableCORS false shadowapp.py