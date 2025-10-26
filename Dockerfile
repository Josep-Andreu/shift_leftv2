FROM debian:10

LABEL maintainer="tu@exemple.com"
LABEL org.opencontainers.image.description="Imatge vulnerable per proves amb Trivy"

# Reconfigura les fonts APT a l'arxiu antic
RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid && \
    apt-get update && \
    apt-get install -y curl openssl apache2 python && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD echo "⚠️ Imatge de prova amb vulnerabilitats (per a Trivy)" && apache2 -v && openssl version
