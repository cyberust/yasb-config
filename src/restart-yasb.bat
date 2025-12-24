@echo off
echo yasbを再起動しています...

REM 1. 既存のyasbプロセスを強制終了
taskkill /F /IM pythonw.exe /FI "WINDOWTITLE eq yasb*" >nul 2>&1

REM もしプロセス名だけで判定するなら以下（他のPythonツールも巻き込む可能性あり）
taskkill /F /IM pythonw.exe >nul 2>&1

REM 少し待機
timeout /t 1 /nobreak >nul

REM 2. yasbをバックグラウンドで起動
cd /d "%USERPROFILE%\yasb"
start "" "%LOCALAPPDATA%\Programs\Python\Python312\pythonw.exe" src\main.py

exit