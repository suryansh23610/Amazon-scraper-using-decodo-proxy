# 🕷️ Amazon Product Scraper

A powerful Python-based Amazon product scraper that extracts product information in batch processing mode, similar to the Google Sheets version. The scraper processes URLs from an Excel file and outputs results to another Excel file with comprehensive error handling and real-time progress tracking.

## ✨ Features

- **Sequential Processing**: Processes products one by one from start to finish
- **Retry Logic**: Automatically retries failed requests up to 3 times
- **Real-time Progress**: Shows live progress with detailed logging
- **Error Handling**: Comprehensive error handling with detailed error messages
- **Excel Integration**: Reads from `input.xlsx` and writes to `output.xlsx`
- **Color Coding**: Out-of-stock items are highlighted in red
- **Logging**: Detailed logs saved to `scraper.log`
- **Resume Capability**: Can handle interruptions gracefully

## 📋 Requirements

- Python 3.7 or higher
- Internet connection
- Excel file with product URLs

**Platform Support:**
- ✅ Windows (run_scraper.bat)
- ✅ macOS (run_scraper.sh) - See [MACOS_SETUP.md](MACOS_SETUP.md)
- ✅ Linux (run_scraper.sh)

## 🚀 Quick Start

1. **Install Dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

2. **Prepare Your Input File**:
   - Create an Excel file named `input.xlsx`
   - Add your Amazon product URLs in a column (any column name containing "URL")

3. **Run the Scraper**:
   
   **On Windows:**
   ```bash
   python amazon_scraper.py
   ```
   Or use the batch file:
   ```bash
   run_scraper.bat
   ```
   
   **On macOS/Linux:**
   ```bash
   python3 amazon_scraper.py
   ```
   Or use the shell script:
   ```bash
   chmod +x run_scraper.sh
   ./run_scraper.sh
   ```

## 📊 Input File Structure

Your `input.xlsx` file should have the following structure:

| PRODUCT_URL | Other columns (optional) |
|-------------|--------------------------|
| https://www.amazon.in/dp/B0DQ44X5CL | ... |
| https://www.amazon.in/dp/B0DN34XG7N | ... |
| ... | ... |

**Important Notes:**
- The URL column can have any name containing "URL" (case insensitive)
- URLs can be with or without "https://" prefix
- Other columns are ignored but preserved
- The scraper will automatically detect the URL column

## 📈 Output File Structure

The scraper creates `output.xlsx` with the following columns:

| Column | Description | Example |
|--------|-------------|---------|
| PRODUCT_URL | Original product URL | https://www.amazon.in/dp/... |
| Availability | Stock status | In Stock / Out of Stock |
| Price | Product price (without currency) | 25999 |
| No_of_Reviews | Number of customer reviews | 1245 |
| Rating | Average rating | 4.3 |
| Electronics_Rank | Rank in Electronics category | 245 |
| Last_Updated | Timestamp of scraping | 2024-01-15 14:30:25 |
| Status | Processing status | Success / Error message |

## 🔧 Configuration

You can modify the scraper behavior by editing the `AmazonScraper` class:

```python
class AmazonScraper:
    def __init__(self, input_file='input.xlsx', output_file='output.xlsx'):
        self.max_retries = 3        # Retry attempts per product
```

## 📝 Detailed Usage

### Method 1: Direct Python Execution
**Windows:**
```bash
python amazon_scraper.py
```
**macOS/Linux:**
```bash
python3 amazon_scraper.py
```

### Method 2: Using Platform Scripts
**Windows:**
```bash
run_scraper.bat
```
**macOS/Linux:**
```bash
chmod +x run_scraper.sh
./run_scraper.sh
```

### Method 3: Custom File Names
```python
from amazon_scraper import AmazonScraper

# Use custom file names
scraper = AmazonScraper(input_file='my_products.xlsx', output_file='results.xlsx')
scraper.run_scraper()
```

## 🛠️ Troubleshooting

### Common Issues and Solutions

1. **"Input file not found" Error**:
   - Ensure `input.xlsx` exists in the same folder as the script
   - Check file name spelling and extension

2. **"No URL column found" Error**:
   - Make sure your Excel file has a column containing "URL" in its name
   - Examples: "PRODUCT_URL", "Product_URL", "url", "URL"

3. **"Empty input file" Error**:
   - Ensure your Excel file has at least one row of data
   - Check that URLs are properly formatted

4. **API Request Failures**:
   - Check your internet connection
   - The scraper automatically retries failed requests
   - Wait a few minutes and try again if experiencing rate limits

5. **Permission Errors**:
   - Close Excel files before running the scraper
   - Ensure you have write permissions in the folder

## 📊 Real-time Progress Tracking

The scraper provides detailed real-time information:

```
============================================================
🕷️  AMAZON SCRAPER STARTED
============================================================
✅ Input file validated successfully!
📊 Found 50 rows to process
✅ Output file 'output.xlsx' created successfully!

📊 Processing 50 products...
⚙️ Batch size: 30
🔄 Max retries per product: 3
------------------------------------------------------------

🔄 Processing Batch 1/2 (Rows 1-30)
----------------------------------------
🔍 [1/50] Processing: https://www.amazon.in/dp/B0DQ44X5CL
✅ Success! Price: 25999, Stock: In Stock
🔍 [2/50] Processing: https://www.amazon.in/dp/B0DN34XG7N
✅ Success! Price: 15999, Stock: Out of Stock
...
```

## 🔄 Sequential Processing Logic

The scraper processes products one by one sequentially:

1. **Processing Order**: Products processed from first to last row
2. **Speed**: No delays between products for maximum performance ⚡
3. **Retry Logic**: Up to 3 attempts per product (no retry delays)
4. **Progress Tracking**: Real-time progress updates and statistics
5. **Immediate Writing**: Results written to Excel file after each product

⚠️ **Performance Mode**: All delays have been removed for fastest processing.

## 📋 Error Handling

The scraper includes comprehensive error handling:

- **Network Errors**: Automatic retries with exponential backoff
- **API Errors**: Detailed error messages and status codes
- **File Errors**: Clear messages for file-related issues
- **Data Extraction Errors**: Graceful handling of missing data
- **Interruption Handling**: Safe handling of user interruptions

## 🎯 Performance Optimization

- **Sequential Processing**: Processes products one by one from start to finish
- **Maximum Speed**: All delays removed for fastest possible processing ⚡
- **Memory Management**: Processes data in chunks to avoid memory issues
- **Error Recovery**: Continues processing even if individual products fail
- **Immediate Writing**: Results saved to Excel after each product

⚠️ **Note**: Delays have been disabled for maximum speed. Monitor for rate limiting if processing large datasets.

## 🔍 Logging

All activities are logged to `scraper.log`:

```
2024-01-15 14:30:25,123 - INFO - 🔄 Attempting to scrape (Attempt 1/3): https://www.amazon.in/dp/B0DQ44X5CL
2024-01-15 14:30:26,456 - INFO - ✅ Successfully scraped: https://www.amazon.in/dp/B0DQ44X5CL
2024-01-15 14:30:27,789 - ERROR - ❌ API request failed with status 429
```

## 🛡️ Rate Limiting Protection

The scraper includes built-in protection features:

- **Request Speed**: No delays for maximum performance ⚡
- **Retry Logic**: Immediate retries (no delays between attempts)
- **Smart Validation**: Checks for valid data before continuing

⚠️ **Note**: Delays have been disabled. Monitor API responses if processing large datasets.

## 📊 Success Metrics

After completion, you'll see a summary:

```
============================================================
🎉 SCRAPING COMPLETED!
============================================================
📊 Total processed: 50
✅ Successful: 45
❌ Errors: 5
📁 Results saved to: output.xlsx
📄 Log saved to: scraper.log
============================================================
```

## 🔧 Advanced Usage

### Custom Configuration
```python
scraper = AmazonScraper(
    input_file='custom_input.xlsx',
    output_file='custom_output.xlsx'
)
scraper.max_retries = 5  # Try up to 5 times per product
```

### Monitoring Progress
The scraper provides multiple ways to monitor progress:
- **Console Output**: Real-time progress in terminal
- **Log File**: Detailed logs in `scraper.log`
- **Excel File**: Live updates in `output.xlsx`

## 🚨 Important Notes

1. **API Usage**: This scraper uses a third-party API service
2. **Rate Limits**: Built-in delays prevent rate limiting
3. **Data Accuracy**: Results depend on Amazon's current page structure
4. **Legal Compliance**: Ensure compliance with Amazon's terms of service
5. **File Handling**: Close Excel files before running the scraper

## 📞 Support

If you encounter any issues:

1. Check the `scraper.log` file for detailed error messages
2. Ensure your input file follows the correct format
3. Verify your internet connection
4. Try running with a smaller batch size if experiencing issues

---

**Happy Scraping! 🕷️** 