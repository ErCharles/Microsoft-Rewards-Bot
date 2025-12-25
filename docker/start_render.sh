#!/bin/sh

echo "🚀 Iniciando script de arranque para Render..."

# 1. Asegurar que la carpeta src existe (donde el bot busca los configs)
mkdir -p src

# 2. Copiar cuentas secretas desde Render (si existen)
if [ -f "/etc/secrets/accounts.jsonc" ]; then
    echo "✅ Copiando accounts.jsonc desde secrets..."
    cp /etc/secrets/accounts.jsonc src/accounts.jsonc
else
    echo "⚠️ ADVERTENCIA: No se encontró /etc/secrets/accounts.jsonc"
fi

# 3. Verificar que config.jsonc existe (debería estar por el Dockerfile)
if [ ! -f "src/config.jsonc" ]; then
    echo "⚠️ ADVERTENCIA: config.jsonc no encontrado en src/. Copiando ejemplo..."
    # Intento de rescate copiando el ejemplo si algo falló
    cp src/accounts.example.jsonc src/config.jsonc 2>/dev/null || echo "❌ No se pudo crear config.jsonc"
fi

# 4. Iniciar el bot
echo "🤖 Ejecutando npm start..."
npm start
