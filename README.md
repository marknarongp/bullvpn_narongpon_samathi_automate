# BullVPN Login Automation Test

UI Automation สำหรับทดสอบระบบ Login โดยใช้ **Robot Framework + SeleniumLibrary**

## Objective

- ✅ Login สำเร็จ / ไม่สำเร็จ
- ✅ Validation username & password
- ✅ Session persistence
- ✅ Page navigation and UI validation

> ⚠️ **ข้อจำกัด**: reCAPTCHA เป็นข้อจำกัดในการ automate เพราะเป็นระบบป้องกัน bot

## Tech Stack

| Component | Version |
|-----------|---------|
| Robot Framework | 7.4.1 |
| SeleniumLibrary | 6.8.0 |
| Selenium | 4.40.0 |
| Python | 3.x |
| Browser | Chrome / Chromium |

## Project Structure

```
bullvpn_narongpon_samathi_automate/
├── testcases/              # Test case files
│   └── 1.robot             # Main test suite
├── keywords/               # Custom keywords
│   └── web/
│       ├── common_web.robot
│       ├── feature/
│       │   └── login_feature.robot
│       └── page/
│           ├── login_page.robot
│           └── my_account_page.robot
├── locators/               # UI element locators
│   └── web/
│       ├── login_locator.robot
│       └── my_account_locator.robot
├── resources/              # Shared resources
│   ├── import.robot        # Import all libraries and keywords
│   └── testdata/
│       ├── common/
│       │   ├── common_config.yaml
│       │   └── credential_testdata.yaml
│       └── translation/
│           ├── translation_en.yaml
│           └── translation_th.yaml
├── requirements.txt        # Python dependencies
└── README.md
```

## Installation & Setup

### Prerequisites
- Python 3.x installed
- pip package manager

### Step 1: Navigate to Project Directory

```bash
cd bullvpn_narongpon_samathi_automate
```

### Step 2: Create Virtual Environment

```bash
# Create venv
python3 -m venv venv

# Activate venv
# On macOS/Linux:
source venv/bin/activate

# On Windows:
venv\Scripts\activate
```

### Step 3: Install Dependencies

Using requirements.txt:
```bash
pip install -r requirements.txt
```

Or manually:
```bash
pip install robotframework==7.4.1
pip install robotframework-seleniumlibrary==6.8.0
pip install robotframework-pabot==5.2.0
pip install robotframework-yamllibrary==0.2.8
pip install PyYAML==6.0.3
```

### Browser Setup (macOS)

**Install Chrome using Homebrew:**
```bash
brew install --cask google-chrome
```

**Install ChromeDriver using Homebrew:**
```bash
brew install chromedriver@stable
```

## Running Tests

### Run with specific language

**Run tests in English:**
```bash
robot -v lang:en -o ./results testcases/
```

**Run tests in Thai:**
```bash
robot -v lang:th -o ./results testcases/
```

## Author

Narongpon Samathi