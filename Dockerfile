FROM python:3

WORKDIR /app

RUN git clone https://github.com/MurmursDev/easyblogger.git
RUN pip install easyblogger
RUN wget https://github.com/jgm/pandoc/releases/download/3.1.1/pandoc-3.1.1-1-arm64.deb
RUN dpkg -i pandoc-3.1.1-1-arm64.deb
