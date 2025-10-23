@echo off
setlocal enabledelayedexpansion
color 0A
title Installation de la coloration syntaxique STP pour Kate

echo ========================================
echo Installation de la coloration syntaxique
echo         STP Routes pour Kate
echo ========================================
echo.

:: Définir le nom du fichier
set "FILENAME=stp-routes.xml"

:: Vérifier si le fichier existe dans le dossier courant
if not exist "%FILENAME%" (
    echo [ERREUR] Le fichier %FILENAME% n'a pas ete trouve dans le dossier courant.
    echo Veuillez placer ce script dans le meme dossier que %FILENAME%
    echo.
    pause
    exit /b 1
)

:: Définir les chemins possibles pour Kate
set "PATHS[0]=%LOCALAPPDATA%\org.kde.syntax-highlighting\syntax"
set "PATHS[1]=%LOCALAPPDATA%\katepart5\syntax"
set "PATHS[2]=%APPDATA%\katepart5\syntax"
set "PATHS[3]=%USERPROFILE%\.local\share\katepart5\syntax"
set "PATHS[4]=%USERPROFILE%\.kde\share\apps\katepart\syntax"

:: Variable pour savoir si au moins un dossier a été trouvé
set "INSTALLED=0"

echo Recherche des dossiers de configuration Kate...
echo.

:: Parcourir tous les chemins possibles
for /L %%i in (0,1,4) do (
    if defined PATHS[%%i] (
        set "CURRENT_PATH=!PATHS[%%i]!"
        
        :: Vérifier si le dossier existe
        if exist "!CURRENT_PATH!" (
            echo [TROUVE] !CURRENT_PATH!
            
            :: Copier le fichier
            echo Copie du fichier en cours...
            copy /Y "%FILENAME%" "!CURRENT_PATH!\" >nul 2>&1
            
            if !errorlevel! equ 0 (
                echo [OK] Installation reussie dans ce dossier
                set "INSTALLED=1"
            ) else (
                echo [ATTENTION] Impossible de copier dans ce dossier
            )
            echo.
        )
    )
)

:: Si aucun dossier n'a été trouvé, créer le premier
if !INSTALLED! equ 0 (
    echo Aucun dossier Kate existant trouve.
    echo Creation du dossier de configuration...
    echo.
    
    set "DEFAULT_PATH=%LOCALAPPDATA%\org.kde.syntax-highlighting\syntax"
    
    :: Créer le dossier
    mkdir "!DEFAULT_PATH!" 2>nul
    
    if exist "!DEFAULT_PATH!" (
        echo [OK] Dossier cree: !DEFAULT_PATH!
        
        :: Copier le fichier
        copy /Y "%FILENAME%" "!DEFAULT_PATH!\" >nul 2>&1
        
        if !errorlevel! equ 0 (
            echo [OK] Installation reussie
            set "INSTALLED=1"
        ) else (
            echo [ERREUR] Impossible de copier le fichier
        )
    ) else (
        echo [ERREUR] Impossible de creer le dossier
    )
)

echo.
echo ========================================

if !INSTALLED! equ 1 (
    echo Installation terminee avec succes!
    echo.
    echo Pour activer la coloration syntaxique:
    echo 1. Redemarrez Kate
    echo 2. Ouvrez un fichier .str
    echo 3. La coloration devrait s'appliquer automatiquement
    echo.
    echo Si la coloration ne s'applique pas:
    echo - Menu Outils -^> Mode de coloration -^> Other -^> STP Routes
) else (
    echo [ERREUR] L'installation a echoue.
    echo.
    echo Essayez de copier manuellement le fichier %FILENAME% dans:
    echo %LOCALAPPDATA%\org.kde.syntax-highlighting\syntax\
)

echo ========================================
echo.
pause