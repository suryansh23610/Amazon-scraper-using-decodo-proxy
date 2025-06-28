# 🚀 Portable Setup Guide - Run Without Installing Python

This guide shows you how to run the Amazon scraper without installing Python system-wide on your computer (Windows, macOS, and Linux).

## 🎯 Option 1: Using Portable Python

### For Windows (Recommended)

#### Step 1: Download Portable Python
1. Go to [WinPython](https://winpython.github.io/) 
2. Download **WinPython 3.11.x** (Zero edition is fine)
3. Extract to a folder like `C:\PortablePython\`

#### Step 2: Setup the Scraper
1. Copy all scraper files to the WinPython folder
2. Open command prompt in that folder
3. Install dependencies:
   ```bash
   python -m pip install -r requirements.txt
   ```

#### Step 3: Create Batch File for Portable Execution
Create `run_portable.bat`:
```batch
@echo off
set PYTHONPATH=%~dp0
%~dp0python.exe amazon_scraper.py
pause
```

### For macOS (Using Homebrew - Recommended)

#### Step 1: Install Homebrew (if not installed)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Step 2: Install Python via Homebrew
```bash
brew install python
```

#### Step 3: Setup and Run
```bash
# Navigate to scraper folder
cd /path/to/amazon_scraper

# Install dependencies
pip3 install -r requirements.txt

# Make script executable
chmod +x run_scraper.sh

# Run the scraper
./run_scraper.sh
```

### For macOS (Using Pyenv - Advanced)

#### Step 1: Install Pyenv
```bash
brew install pyenv
```

#### Step 2: Install Python
```bash
pyenv install 3.11.0
pyenv local 3.11.0
```

#### Step 3: Setup Dependencies
```bash
pip install -r requirements.txt
```

## 🎯 Option 2: Using Virtual Environment (Clean Solution)

### Step 1: Install Python (One-time setup)
1. Download Python from [python.org](https://python.org/downloads/)
2. **Important**: Check "Add to PATH" during installation

### Step 2: Create Isolated Environment
```bash
# Create virtual environment
python -m venv amazon_scraper_env

# Activate it (Windows)
amazon_scraper_env\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

### Step 3: Create Batch File for Virtual Environment
Create `run_venv.bat`:
```batch
@echo off
call amazon_scraper_env\Scripts\activate
python amazon_scraper.py
pause
```

## 🎯 Option 3: Using PyInstaller (Single Executable)

### Create Single .exe File (Advanced)
```bash
# Install PyInstaller
pip install pyinstaller

# Create executable
pyinstaller --onefile --console amazon_scraper.py

# The .exe will be in dist/ folder
```

**Note**: This creates a large file (~50MB) but runs without Python installed.

## 🎯 Option 4: Using Conda (Data Science Focused)

### Step 1: Install Miniconda
1. Download [Miniconda](https://docs.conda.io/en/latest/miniconda.html)
2. Install (lightweight, doesn't affect system Python)

### Step 2: Create Environment
```bash
conda create -n scraper python=3.11 pandas openpyxl requests
conda activate scraper
pip install regex
```

## 📦 Complete Portable Package Structure

Your final folder should look like this:
```
amazon_scraper/
├── amazon_scraper.py       # Main scraper
├── requirements.txt        # Dependencies
├── run_scraper.bat        # Easy execution
├── input.xlsx             # Your URLs
├── output.xlsx            # Results (created)
├── scraper.log           # Logs (created)
├── README.md             # Full documentation
├── INSTRUCTIONS.txt      # Quick guide
└── PORTABLE_SETUP.md     # This file
```

## ⚡ Quick Setup for Non-Technical Users

### Easiest Method (Recommended):
1. **Download & Install Python** from python.org (one-time, 5 minutes)
2. **Double-click `run_scraper.bat`** - it handles everything automatically!

The batch file will:
- ✅ Check if Python is installed
- ✅ Install dependencies automatically
- ✅ Validate your input file
- ✅ Run the scraper
- ✅ Show clear error messages

## 🛠️ Troubleshooting Portable Setup

### "Python not found" Error
- Make sure Python is in your PATH
- Or use the portable Python method above
- Or specify full path in batch file

### "Permission denied" Error
- Run as Administrator
- Check antivirus software
- Use a different folder location

### "Module not found" Error
- Dependencies not installed
- Run: `pip install -r requirements.txt`
- Check virtual environment is activated

## 🚀 One-Click Setup Script

Create `setup.bat` for complete automation:
```batch
@echo off
echo Installing Python dependencies...
pip install -r requirements.txt
echo.
echo Creating sample input file...
python create_sample_input.py
echo.
echo Setup complete! You can now run the scraper.
pause
```

## 💡 Pro Tips for Portable Usage

1. **Use Virtual Environment**: Keeps your system clean
2. **Backup Your Files**: Keep copies of input files
3. **Test First**: Run with sample data before bulk processing
4. **Monitor Logs**: Check scraper.log for issues
5. **Update Regularly**: Keep dependencies updated

## 🎯 Distribution to Other Users

To share with someone without Python:

### Method 1: Virtual Environment Package
1. Create virtual environment with all dependencies
2. Zip the entire folder
3. They just need to run the batch file

### Method 2: Conda Environment Export
```bash
conda env export > environment.yml
# Share environment.yml for easy recreation
```

### Method 3: Docker Container (Advanced)
```dockerfile
FROM python:3.11-slim
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
CMD ["python", "amazon_scraper.py"]
```

## 📋 Benefits of Each Method

| Method | Pros | Cons |
|--------|------|------|
| Portable Python | No system changes | Larger download |
| Virtual Environment | Clean, isolated | Requires Python |
| PyInstaller .exe | Single file | Very large file |
| System Python + Batch | Simple, fast | Affects system |

## 🎉 Recommended Setup for Most Users

1. **Install Python** (one-time, safe)
2. **Use the provided `run_scraper.bat`**
3. **Let it handle everything automatically**

This gives you the best balance of simplicity and functionality!

---

**Need help? Check the main README.md for detailed documentation.** 