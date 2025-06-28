@echo off
title Amazon Product Scraper
color 0A

echo.
echo ================================================
echo   🕷️  Amazon Product Scraper
echo ================================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python is not installed or not in PATH!
    echo Please install Python 3.7+ and try again.
    echo Download from: https://www.python.org/downloads/
    echo.
    pause
    exit /b 1
)

echo ✅ Python found!

REM Check if input.xlsx exists
if not exist "input.xlsx" (
    echo.
    echo ❌ ERROR: input.xlsx file not found!
    echo.
    echo Please create an input.xlsx file with your Amazon product URLs.
    echo The file should have a column containing "URL" in its name.
    echo.
    echo Example structure:
    echo PRODUCT_URL
    echo https://www.amazon.in/dp/B0DQ44X5CL
    echo https://www.amazon.in/dp/B0DN34XG7N
    echo.
    pause
    exit /b 1
)

echo ✅ Input file found!

REM Check if requirements are installed
echo 🔍 Checking Python dependencies...
python -c "import requests, pandas, openpyxl" >nul 2>&1
if errorlevel 1 (
    echo.
    echo ⚠️  Some dependencies are missing. Installing...
    echo.
    pip install -r requirements.txt
    if errorlevel 1 (
        echo.
        echo ❌ Failed to install dependencies!
        echo Please run: pip install -r requirements.txt
        echo.
        pause
        exit /b 1
    )
)

echo ✅ All dependencies ready!
echo.

REM Close any existing Excel files
echo 🔄 Starting Amazon Product Scraper...
echo.
echo ⚠️  Please close any Excel files before continuing.
echo Press any key to start scraping...
pause >nul

REM Run the scraper
python amazon_scraper.py

REM Check if the script ran successfully
if errorlevel 1 (
    echo.
    echo ❌ Scraper encountered an error!
    echo Check the error messages above or scraper.log for details.
) else (
    echo.
    echo 🎉 Scraping completed successfully!
    echo Check output.xlsx for results.
)

echo.
echo Press any key to exit...
pause >nul 