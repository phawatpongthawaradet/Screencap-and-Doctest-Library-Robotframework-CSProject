# 🧪 PDF Automation Testing with Robot Framework

This project demonstrates automated testing for PDF documents using Robot Framework with the help of the following libraries:
- `DocTest.PdfTest` – for extracting and comparing PDF text
- `DocTest.VisualTest` – for comparing images inside PDFs
- `ScreenCapLibrary` – for recording video during test executions

## 📁 Project Structure

CS-PROJECT/
├── data/
│ └── pdf file for use example doctest
├── keywords/
│ ├── Doctest_keywords.robot
│ └── Screencap_keywords.robot
├── locators/
│ ├── Common_locators.yaml
├── results/
│ └── log_doctest
│ └── log_screencap
├── testcases/ 
│ └──Doctest_testcases.robot
│ └──Screencap_testcases.robot
└── README.md


## 🔧 Requirements

- Python 3.8+
- Robot Framework
- [DocTest Library](https://pypi.org/project/robotframework-doctest/)
- ScreenCapLibrary

### Install dependencies

```bash
pip install robotframework
pip install robotframework-doctest
pip install robotframework-screencaplibrary
```

👤 Author

Phawat Pongthawaradet
