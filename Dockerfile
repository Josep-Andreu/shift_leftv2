# Debian 10 (Buster) té vulnerabilitats però encara funciona
FROM debian:10

LABEL maintainer="tu@exemple.com"
LABEL org.opencontainers.image.description="Imatge vulnerable per proves de Trivy"

# Instal·la paquets amb vulnerabilitats conegudes
RUN apt-get update && \
    apt-get install -y \
        curl \
        openssl \
        apache2 \
        python && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD echo "⚠️ Aquesta és una imatge vulnerable per provar Trivy" && apache2 -v && openssl version
