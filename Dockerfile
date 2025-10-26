FROM ubuntu:18.04

LABEL maintainer="tu@exemple.com"
LABEL org.opencontainers.image.description="Imatge vulnerable de prova per Trivy"

# Instal·la paquets antics amb CVEs coneguts
RUN apt-get update && \
    apt-get install -y \
        curl \
        openssl \
        apache2 \
        python2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Afegeix un missatge d'exemple
CMD echo "⚠️ Aquesta és una imatge de prova amb vulnerabilitats per a Trivy" && apache2 -v && openssl version
