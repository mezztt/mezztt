@echo off
setlocal
cd /d "%~dp0"
echo ============================================
echo   Subir la web de Mezztt a GitHub
echo ============================================
echo.
where git >nul 2>&1
if errorlevel 1 goto sin_git
if not exist ".git" goto sin_repo
git add -A
git commit -m "Web de Mezztt: buzon de cotizaciones y POS"
echo.
echo Trayendo lo que haya en GitHub (si hay algo nuevo)...
git pull origin main --no-rebase -X ours --no-edit --allow-unrelated-histories
echo.
echo Subiendo...
git push -u origin main
if errorlevel 1 goto fallo
echo.
echo LISTO: la web quedo subida. GitHub Pages tarda 1 o 2 minutos en actualizarla.
echo Despues abri la web y refresca con Ctrl+F5.
goto fin

:sin_git
echo No se encontro Git instalado en esta PC.
goto fin

:sin_repo
echo Esta carpeta no es un repositorio de Git.
goto fin

:fallo
echo.
echo El push fallo. Copia el mensaje de arriba y pasaselo a Claude.

:fin
echo.
pause
