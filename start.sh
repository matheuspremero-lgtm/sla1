#!/bin/bash

# 1. Cria a tela virtual básica
Xvfb :1 -screen 0 1280x720x24 &
export DISPLAY=:1

# 2. Inicia o Openbox como gerenciador de janelas
openbox-session &

# 3. Inicia o servidor que captura a tela virtual
x11vnc -display :1 -nopw -listen localhost -xkb -forever &

# 4. Abre a transmissão para o seu navegador web
/usr/share/novnc/utils/launch.sh --vnc localhost:5900 --listen 6080
