FROM nginx

RUN apt-get update && apt-get install -y \
        git \
        python2.7 \
        python-dev \
        python-pip \
        && rm -rf /var/lib/apt/lists/*

RUN pip --no-cache-dir install \
        sphinx

RUN pip --no-cache-dir install \
        sphinx_rtd_theme

RUN mkdir -p /work
COPY entrypoint.sh /work
RUN chmod 755 /work/entrypoint.sh
WORKDIR /work

EXPOSE 80

ENTRYPOINT ["bash", "entrypoint.sh"]
