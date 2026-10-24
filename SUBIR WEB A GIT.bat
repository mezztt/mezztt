@echo off
setlocal
cd /d "%~dp0"
echo ============================================
echo   Subir la web de Mezztt a Git
echo ============================================
echo.
where git >nul 2>&1
if errorlevel 1 goto sin_git
if not exist ".git" goto sin_repo
echo Cambios pendientes:
git status --short
echo.
git add -A
git commit -m "Web: POS por sistema, cotizador con POS, barras oscuras"
echo.
echo Subiendo...
git push
if errorlevel 1 goto fallo
echo.
echo LISTO: la web quedo subida.
goto fin

:sin_git
echo No se encontro Git instalado en esta PC.
goto fin

:sin_repo
echo Esta carpeta todavia no es un repositorio de Git.
echo Para crearlo y conectarlo hay que tener la direccion del repositorio de GitHub.
echo Avisale a Claude y lo dejamos armado.
goto fin

:fallo
echo.
echo El commit se hizo pero el push fallo. Mira el mensaje de arriba
echo (puede ser que falte iniciar sesion en GitHub o que no haya remoto).

:fin
echo.
pause
