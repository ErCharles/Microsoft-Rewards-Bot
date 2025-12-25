#!/bin/sh
# Crear carpeta src si no existe
mkdir -p src
# Copiar las cuentas secretas
cp /etc/secrets/accounts.jsonc src/accounts.jsonc
# Iniciar el bot
npm start
