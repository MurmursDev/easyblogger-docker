FROM python:3

ARG TARGETARCH
WORKDIR /app

RUN git clone https://github.com/MurmursDev/easyblogger.git
RUN cd easyblogger && pip install .
RUN rm -rf easyblogger
RUN wget https://github.com/jgm/pandoc/releases/download/3.1.1/pandoc-3.1.1-1-$TARGETARCH.deb
RUN dpkg -i pandoc-3.1.1-1-$TARGETARCH.deb
RUN rm pandoc-3.1.1-1-$TARGETARCH.deb

ENTRYPOINT ["/usr/local/bin/easyblogger"]
