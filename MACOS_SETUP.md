# 🍎 macOS Setup Guide - Amazon Scraper

Quick setup guide for running the Amazon scraper on your MacBook.

## 🚀 Quick Setup (3 Steps)

### Step 1: Install Python
**Option A: Using Homebrew (Recommended)**
```bash
# Install Homebrew if you don't have it
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Python
brew install python
```

**Option B: Download from Python.org**
1. Go to [python.org/downloads](https://www.python.org/downloads/)
2. Download Python 3.11+ for macOS
3. Run the installer

### Step 2: Prepare the Scraper
```bash
# Navigate to the scraper folder
cd /path/to/amazon_scraper

# Install dependencies
pip3 install -r requirements.txt

# Make the script executable
chmod +x run_scraper.sh
```

### Step 3: Run the Scraper
**Option A: Using the Shell Script (Easy)**
```bash
./run_scraper.sh
```

**Option B: Direct Python Command**
```bash
python3 amazon_scraper.py
```

## 📋 Prerequisites

1. **input.xlsx file** - Your Excel file with Amazon URLs
2. **Internet connection** - For API access
3. **macOS 10.15+** - Modern macOS version

## 📊 Input File Structure

Your `input.xlsx` should have:
- A column containing "URL" in the name (e.g., "PRODUCT_URL")
- Amazon product URLs in that column

Example:
```
PRODUCT_URL
https://www.amazon.in/dp/B0DQ44X5CL
https://www.amazon.in/dp/B0DN34XG7N
```

## ⚡ What the Scraper Does

1. **Reads** your input.xlsx file
2. **Processes** each URL sequentially (one by one)
3. **Extracts** product data (price, availability, reviews, etc.)
4. **Saves** results immediately to output.xlsx
5. **Logs** all activity to scraper.log

## 🔧 Troubleshooting

### "Command not found: python3"
```bash
# Check if Python is installed
python3 --version

# If not found, install via Homebrew
brew install python
```

### "Permission denied: ./run_scraper.sh"
```bash
# Make the script executable
chmod +x run_scraper.sh
```

### "No module named 'requests'"
```bash
# Install dependencies
pip3 install -r requirements.txt

# Or install manually
pip3 install requests pandas openpyxl
```

### "input.xlsx not found"
- Make sure your Excel file is named exactly `input.xlsx`
- Place it in the same folder as the scraper files
- Check that it has a column with "URL" in the name

### Excel file is locked
- Close any open Excel files before running
- Make sure no other programs are using the files

## 📁 File Structure

Your folder should look like this:
```
amazon_scraper/
├── amazon_scraper.py       # Main scraper
├── run_scraper.sh         # macOS launcher  
├── requirements.txt       # Dependencies
├── input.xlsx            # Your URLs
├── output.xlsx           # Results (created)
├── scraper.log          # Logs (created)
└── README.md            # Documentation
```

## 🎯 Performance Notes

⚡ **Fast Processing**: All delays have been removed for maximum speed
⚠️ **Rate Limiting**: Be careful not to overload the API
🔄 **Retry Logic**: Failed requests are retried up to 3 times
💾 **Immediate Saving**: Each product result is saved immediately

## 🚨 Important Notes

- **Close Excel files** before running the scraper
- **Internet required** for API access
- **Results vary** based on Amazon's current page structure
- **Sequential processing** means one product at a time
- **No delays** between requests (removed for speed)

## 📞 Need Help?

1. Check `scraper.log` for detailed error messages
2. Ensure input.xlsx has correct structure
3. Verify internet connection
4. Try running with a smaller number of URLs first

## 🎉 You're Ready!

Once setup is complete, just run:
```bash
./run_scraper.sh
```

And watch your products get scraped! The results will appear in `output.xlsx` as each product is processed.

---

**Happy Scraping on macOS! 🕷️🍎** 