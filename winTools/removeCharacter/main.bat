@echo off
setlocal enabledelayedexpansion

set "searchTerm=keyword"
set "text=This is a sample text containing the keysword."

echo !text! | findstr /c:"%searchTerm%" > nul
if errorlevel 1 (
    echo Search term not found.
) else (
    echo Search term found.
)

endlocal
pause