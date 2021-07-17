@echo off
setlocal

set REPOS=

echo %1

if %1==clone (
 goto ghclone
) else if %1==view (
 goto ghwview
)

:ghclone
for /f "usebackq tokens=1 delims==" %%i in (`gh repo list --json nameWithOwner -q ".[].nameWithOwner" ^| fzf`) do set REPOS=%%i
gh repo clone %REPOS%
exit /b

:ghwview
for /f "usebackq tokens=1 delims==" %%i in (`gh repo list --json nameWithOwner -q ".[].nameWithOwner" ^| fzf`) do set REPOS=%%i
gh repo view --web %REPOS%
exit /b
