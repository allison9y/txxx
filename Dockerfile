FROM ubuntu:latest

ENV TIKA_RACT_SERVER https://hisuntrust.com/tika/tika-ract-server-1.13.jar
RUN	apt-get update \
	&& apt-get install openjdk-8-jre-headless curl gdal-bin tesseract-ocr \
		tesseract-ocr-eng tesseract-ocr-ita tesseract-ocr-fra tesseract-ocr-spa tesseract-ocr-deu -y \
	&& curl -sSL "$TIKA_RACT_SERVER" -o /tika-ract-server.jar \
	&& apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 9998
ENTRYPOINT java -jar /tika-ract-server.jar -h 0.0.0.0 --cors "http://localhost:8000"
