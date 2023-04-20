---
tags:
  - Python
---
# Python selenium を使用する最小単位の構成

## Install
```
pip install selenium
```

## Usage 
```py
from selenium import webdriver

# Microsoft Edge WebDriverのパスを指定する
edge_driver_path = 'C:/path/to/MicrosoftWebDriver.exe'

# Microsoft Edgeのオプションを設定する
edge_options = webdriver.EdgeOptions()
edge_options.use_chromium = True

# Microsoft EdgeのWebDriverを起動する
driver = webdriver.Edge(executable_path=edge_driver_path, options=edge_options)

# Webページを開く
driver.get('https://www.google.com')
```
### 要素の取得

```py

```

## Reference
- [selenium](https://www.selenium.dev/)
- [microsoft-edge webdriver](https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/)
- [locating-elements](https://kurozumi.github.io/selenium-python/locating-elements.html)