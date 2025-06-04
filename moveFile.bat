@echo off
rem Moves a file specified by the first parameter to the directory specified
rem by the second parameter keeping the original file name.

if "%~2"=="" (
    echo Usage: %0 sourceFile targetDirectory
    exit /b 1
)

if not exist "%~1" (
    echo Source file not found: %~1
    exit /b 1
)

if not exist "%~2" (
    echo Target directory not found: %~2
    exit /b 1
)

move "%~1" "%~2\" >nul
if errorlevel 1 (
    echo Failed to move file.
    exit /b 1
)

