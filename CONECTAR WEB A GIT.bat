@echo off
setlocal
cd /d "%~dp0"
echo ============================================
echo   Conectar la web de Mezztt a GitHub
echo ============================================
echo.
where git >nul 2>&1
if errorlevel 1 goto sin_git

if exist ".git" goto ya_repo
echo Esta carpeta todavia no es un repositorio. Se va a crear.
echo.
echo Pega la direccion del repositorio de GitHub
echo (ejemplo: https://github.com/usuario/mezztt-web.git)
echo El repositorio tiene que estar creado en GitHub, preferentemente vacio.
echo.
set /p REPO=Direccion: 
if "%REPO%"=="" goto sin_url
git init -b main
git remote add origin %REPO%
goto subir

:ya_repo
echo Ya es un repositorio. Se sube lo pendiente.

:subir
git add -A
git commit -m "Web de Mezztt: POS por sistema, cotizador con POS, barras oscuras"
echo.
echo Subiendo a GitHub (si pide iniciar sesion, hacelo en la ventana que se abre)...
git push -u origin main
if errorlevel 1 goto fallo
echo.
echo LISTO: la web quedo subida a GitHub.
goto fin

:sin_git
echo No se encontro Git instalado en esta PC.
echo Instalalo desde https://git-scm.com/download/win y volve a abrir este archivo.
goto fin

:sin_url
echo No escribiste ninguna direccion. No se hizo nada.
goto fin

:fallo
echo.
echo El commit local se hizo, pero el push fallo. Causas comunes:
echo  - el repositorio de GitHub no esta vacio (tiene otro contenido)
echo  - no iniciaste sesion en GitHub
echo  - la direccion esta mal escrita
echo Copia el mensaje de arriba y pasaselo a Claude.

:fin
echo.
pause
