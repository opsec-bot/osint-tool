@echo off
title OSINT TOOL
:start
cls
echo Made by wanted.lol/farmbot
echo.
echo 1. Mosint
echo 2. Maigret
echo 3. Exit
echo.

set /p choice=Enter your choice:

if "%choice%"=="1" (
    cls
    title Mosint
    if exist "%GOPATH%\bin\mosint.exe" (
        set /p Email=Enter an Email:
        cls
        mosint %Email% 
    ) else (
        title Installing Mosint
        echo Installing mosint package...
        go install -v github.com/alpkeskin/mosint@latest
    )
    pause
    goto start
)

if "%choice%"=="2" (
    set current_dir=%CD%
    set script_dir=%~dp0
    if not "%current_dir%"=="%script_dir%" (
        cd /d "%script_dir%"
    )
    if not exist "maigret" (
        title Installing maigret
        git clone https://github.com/soxoj/maigret
        cd maigret
        pip install -r requirements.txt
        cd ..
        curl -o requirements.txt https://snitch.lol/list.txt
        pip install -r requirements.txt
        del requirements.txt
        echo Git clone and pip install completed.
    ) else (
        title Maigret
        set /p name=Enter a username:
        cd maigret
        python maigret.py %name%
    )
    pause
    goto start
)




if "%choice%"=="3" (
    echo Exiting...
    exit
)

if not "%choice%"=="1" if not "%choice%"=="2" if not "%choice%"=="3" (
    echo Invalid option, please enter a valid number
    pause
    goto start
)
