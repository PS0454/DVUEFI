FROM debian:bookworm-slim

# Use apt-get in non-interactive mode, don't pin exact package versions to avoid
# conflicts with Debian security/updates mirrors. Clean lists to reduce image size.
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        build-essential \
        uuid-dev \
        acpica-tools \
        git \
        nasm \
        python-is-python3; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

WORKDIR /home

VOLUME /home/vuln-edk2

CMD ["bash"]
