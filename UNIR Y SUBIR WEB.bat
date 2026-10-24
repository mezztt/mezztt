@echo off
setlocal
cd /d "%~dp0"
echo ============================================
echo   Unir con lo que ya hay en GitHub y subir
echo ============================================
echo.
echo El repositorio de GitHub ya tenia contenido. Se baja y se une con
echo la web de esta carpeta (no se borra nada de GitHub: queda todo el historial).
echo Si un archivo esta en los dos lados, queda la version de esta PC.
echo.
git add -A
git commit -m "Web de Mezztt: cambios locales" >nul 2>&1
git fetch origin
if errorlevel 1 goto fallo
git pull origin main --allow-unrelated-histories --no-rebase -X ours --no-edit
if errorlevel 1 goto fallo
git push -u origin main
if errorlevel 1 goto fallo
echo.
echo LISTO: la web quedo subida a GitHub.
echo Archivos que ya estaban en GitHub y se conservaron:
git ls-tree -r --name-only origin/main
goto fin

:fallo
echo.
echo Algo fallo. Copia el mensaje de arriba y pasaselo a Claude.

:fin
echo.
pause
