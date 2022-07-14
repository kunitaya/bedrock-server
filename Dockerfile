From ubuntu:22.10

ARG VERSION="1.19.2.02"

EXPOSE 19132/udp 19133/udp

RUN echo "deb http://security.ubuntu.com/ubuntu impish-security main" >> /etc/apt/sources.list.d/impish-security.list \
    && apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y \
    libssl1.1 \
    wget \
    zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q -P /tmp https://minecraft.azureedge.net/bin-linux/bedrock-server-${VERSION}.zip \
    && unzip /tmp/bedrock-server-${VERSION}.zip -d /opt/bedrock-server \
    && rm -f /tmp/bedrock-server-${VERSION}.zip

WORKDIR /opt/bedrock-server
ENV LD_LIBRARY_PATH .
ENV PATH /opt/bedrock-server:$PATH
CMD ["bedrock_server"]