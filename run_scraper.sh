#!/bin/bash

# Amazon Product Scraper - macOS/Linux Runner
# Make this file executable: chmod +x run_scraper.sh

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo ""
echo "================================================"
echo "  🕷️  Amazon Product Scraper (macOS/Linux)"
echo "================================================"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    if ! command -v python &> /dev/null; then
        echo -e "${RED}❌ Python is not installed or not in PATH!${NC}"
        echo "Please install Python 3.7+ and try again."
        echo "Download from: https://www.python.org/downloads/"
        echo "Or install via Homebrew: brew install python"
        echo ""
        read -p "Press any key to exit..."
        exit 1
    else
        PYTHON_CMD="python"
    fi
else
    PYTHON_CMD="python3"
fi

echo -e "${GREEN}✅ Python found!${NC}"

# Check if input.xlsx exists
if [ ! -f "input.xlsx" ]; then
    echo ""
    echo -e "${RED}❌ ERROR: input.xlsx file not found!${NC}"
    echo ""
    echo "Please create an input.xlsx file with your Amazon product URLs."
    echo "The file should have a column containing 'URL' in its name."
    echo ""
    echo "Example structure:"
    echo "PRODUCT_URL"
    echo "https://www.amazon.in/dp/B0DQ44X5CL"
    echo "https://www.amazon.in/dp/B0DN34XG7N"
    echo ""
    read -p "Press any key to exit..."
    exit 1
fi

echo -e "${GREEN}✅ Input file found!${NC}"

# Check if requirements are installed
echo -e "${BLUE}🔍 Checking Python dependencies...${NC}"
$PYTHON_CMD -c "import requests, pandas, openpyxl" 2>/dev/null
if [ $? -ne 0 ]; then
    echo ""
    echo -e "${YELLOW}⚠️  Some dependencies are missing. Installing...${NC}"
    echo ""
    
    # Try pip3 first, then pip
    if command -v pip3 &> /dev/null; then
        pip3 install -r requirements.txt
    elif command -v pip &> /dev/null; then
        pip install -r requirements.txt
    else
        echo -e "${RED}❌ pip is not available!${NC}"
        echo "Please install pip or run: $PYTHON_CMD -m pip install -r requirements.txt"
        exit 1
    fi
    
    if [ $? -ne 0 ]; then
        echo ""
        echo -e "${RED}❌ Failed to install dependencies!${NC}"
        echo "Please run manually: pip3 install -r requirements.txt"
        echo ""
        read -p "Press any key to exit..."
        exit 1
    fi
fi

echo -e "${GREEN}✅ All dependencies ready!${NC}"
echo ""

# Close any existing Excel files warning
echo -e "${BLUE}🔄 Starting Amazon Product Scraper...${NC}"
echo ""
echo -e "${YELLOW}⚠️  Please close any Excel files before continuing.${NC}"
echo -n "Press any key to start scraping..."
read -n 1 -s
echo ""

# Run the scraper
$PYTHON_CMD amazon_scraper.py

# Check if the script ran successfully
if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}🎉 Scraping completed successfully!${NC}"
    echo "Check output.xlsx for results."
else
    echo ""
    echo -e "${RED}❌ Scraper encountered an error!${NC}"
    echo "Check the error messages above or scraper.log for details."
fi

echo ""
echo -n "Press any key to exit..."
read -n 1 -s
echo "" 