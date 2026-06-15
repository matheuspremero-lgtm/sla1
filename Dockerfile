FROM ubuntu:22.04

# Evita perguntas interativas durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Instala ambiente gráfico leve, noVNC e dependências do Ryujinx
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    xvfb \
    x11vnc \
    novnc \
    websockify \
    wget \
    curl \
    unzip \
    libsdl2-2.0-0 \
    libopenal1 \
    && apt-get clean

# Configura o diretório de trabalho
WORKDIR /root

# Cria o script de inicialização
COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh

# Porta que o Render vai ler (o noVNC usa por padrão a 6080)
EXPOSE 6080

CMD ["/root/start.sh"]