@echo off
setlocal

set "目标目录=D:\media"

for /r "%目标目录%" %%i in (.) do (
    echo Creating empty file in "%%i"
    echo. > "%%i\readme.md"
)

echo All empty files created.
pause
