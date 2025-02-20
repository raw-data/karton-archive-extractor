FROM python:3.7
RUN sed -i 's/ main/ main non-free/' /etc/apt/sources.list \
    && apt-get update && apt-get install -y \
    p7zip-full \
    rar \
    unace \
    cabextract \
    lzip

WORKDIR /app/service
COPY ./requirements.txt ./requirements.txt
RUN pip install -r requirements.txt
COPY ./README.md ./README.md
COPY ./MANIFEST.in ./MANIFEST.in
COPY ./karton ./karton
COPY ./setup.py ./setup.py
RUN pip install .
ENTRYPOINT karton-archive-extractor
