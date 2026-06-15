FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Instala o Openbox (super leve), Xvfb, noVNC e as dependências do Ryujinx
RUN apt-get update && apt-get install -y \
    openbox \
    xvfb \
    x11vnc \
    novnc \
    websockify \
    wget \
    curl \
    unzip \
    libsdl2-2.0-0 \
    libopenal1 \
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    && apt-get clean

WORKDIR /root

COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh

EXPOSE 6080

CMD ["/root/start.sh"]
