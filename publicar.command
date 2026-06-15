#!/bin/bash
# ============================================================
#  Publicar Newsletter "IA para Entusiastas" en Vercel
#  Doble clic para publicar la edición más reciente.
#  Por Mary Cárdenas de Gil · Ateneo Empresarial
# ============================================================

# Ir a la carpeta donde está este script (el repo)
cd "$(dirname "$0")" || exit 1

echo "============================================="
echo "  Publicando IA para Entusiastas en Vercel"
echo "  Carpeta: $(pwd)"
echo "============================================="
echo

# 1) Limpiar posibles archivos de bloqueo de git
rm -f .git/HEAD.lock .git/index.lock 2>/dev/null

# 2) Mostrar qué cambió
echo "Cambios detectados:"
git status --short
echo

# 3) Preparar todos los cambios (nuevas ediciones + index)
git add -A

# 4) Commit con fecha automática
FECHA=$(date "+%Y-%m-%d %H:%M")
git commit -m "Publica Newsletter IA para Entusiastas ($FECHA)"

# 5) Subir a GitHub (dispara el deploy de Vercel)
echo
echo "Subiendo a GitHub..."
if git push origin main; then
  echo
  echo "============================================="
  echo "  ✅ Publicado. Vercel desplegará en ~1 min."
  echo "  → https://newsletter.marycardenas.ai"
  echo "============================================="
else
  echo
  echo "⚠️  El push falló. Revisa tu conexión o credenciales de GitHub."
fi

echo
read -n 1 -s -r -p "Presiona cualquier tecla para cerrar..."
echo
