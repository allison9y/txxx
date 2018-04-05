FROM ubuntu:latest

ENV Txxx txxx.jar

RUN	apt-get update \
	&& apt-get install openjdk-8-jre-headless curl gdal-bin tesseract-ocr \
		tesseract-ocr-eng tesseract-ocr-ita tesseract-ocr-fra tesseract-ocr-spa tesseract-ocr-deu -y \
	&& curl -sSL "$Txxx" -o /txxx.jar \
	&& apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 9998
ENTRYPOINT java -jar /txxx.jar -h 0.0.0.0 
