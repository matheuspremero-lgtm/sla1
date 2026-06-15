#!/bin/bash

# 1. Cria uma tela virtual na memória (Resolução 1280x720)
Xvfb :1 -screen 0 1280x720x24 &
export DISPLAY=:1

# 2. Inicia o ambiente visual do Linux
startxfce4 &

# 3. Inicia o servidor que captura a tela
x11vnc -display :1 -nopw -listen localhost -xkb -forever &

# 4. Transforma a tela em uma página Web na porta 6080
/usr/share/novnc/utils/launch.sh --vnc localhost:5900 --listen 6080