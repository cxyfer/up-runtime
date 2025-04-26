@echo off
setlocal EnableDelayedExpansion

REM Use fixed username and password
set "_USER=upclass"
set "_PASS=password"

set _SSHPORT=22222

REM Get script directory
set "_DIR=%~dp0"
set "_DIR=!_DIR:~0,-1!"

echo ** Using user: !_USER!; password = !_PASS!
if not exist "!_DIR!\home" mkdir "!_DIR!\home"

REM Run docker container
docker run -d --name up-runtime --restart unless-stopped ^
    --privileged ^
    --cap-add SYS_ADMIN --cap-add NET_ADMIN --cap-add DAC_READ_SEARCH ^
    -v "!_DIR!\home:/home" -p "!_SSHPORT!:22/tcp" ^
    upclass/runtime /entrypoint.sh "!_USER!" "!_PASS!" "1000" "1000"