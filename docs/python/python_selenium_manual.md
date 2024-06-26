---
tags:
  - Python
  - selenium
---
# Python selenium 設定

## インストール
```py
pip install selenium
```

## WebDriverの設定

Seleniumでは、WebDriverというブラウザを操作するためのドライバを使用する

主なWebDriverは、
- Google Chromeの`chromedriver`
- Firefoxの`geckodriver`

など

Google Chromeの例

1. [こちら](https://sites.google.com/a/chromium.org/chromedriver/downloads)から、自分のGoogle Chromeと互換性のあるバージョンの`chromedriver`をダウンロード
2. ダウンロードした`chromedriver`を適切な場所に配置し、そのパスを環境変数に追加するか、あるいはPythonスクリプト内でパスを指定する

以下は、Pythonスクリプト内でchromedriverのパスを指定する例

```py
from selenium import webdriver

chrome_driver_path = "/path/to/chromedriver"
driver = webdriver.Chrome(executable_path=chrome_driver_path)
```

## HTML要素の取得方法
### **要素の取得**

Seleniumでは、以下のメソッドを使ってHTML要素を取得できます。

- **`find_element_by_id(id)`**: ID属性で要素を取得
- **`find_element_by_name(name)`**: name属性で要素を取得
- **`find_element_by_class_name(class_name)`**: クラス名で要素を取得
- **`find_element_by_tag_name(tag_name)`**: タグ名で要素を取得
- **`find_element_by_css_selector(css_selector)`**: CSSセレクタで要素を取得
- **`find_element_by_xpath(xpath)`**: XPathで要素を取得

### **要素の操作**

取得したHTML要素に対して、以下のような操作が可能です。

- **`element.click()`**: 要素をクリック
- **`element.send_keys(text)`**: 要素にテキストを入力
- **`element.clear()`**: 要素のテキストをクリア
- **`element.get_attribute(attribute_name)`**: 要素の属性値を取得
- **`element.text`**: 要素のテキストを取得

## 例: HTML要素の取得と操作

以下は、PythonとSeleniumを使ってGoogle検索を行い、検索結果を取得する例

```PY

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

chrome_driver_path = "/path/to/chromedriver"
driver = webdriver.Chrome(executable_path=chrome_driver_path)

# Googleのトップページを開く
driver.get("https://www.google.com")

# 検索ボックスの要素を取得
search_box = driver.find_element_by_name("q")

# 検索ボックスにテキストを入力
search_box.send_keys("Python Selenium")

# 検索ボックスでEnterキーを押す
search_box.send_keys(Keys.RETURN)

# 検索結果が表示されるまで待つ
time.sleep(3)

# 検索結果の要素を取得
search_results = driver.find_elements_by_css_selector(".tF2Cxc")

# 検索結果を表示
for result in search_results:
    title = result.find_element_by_css_selector(".LC20lb.DKV0Md").text
    link = result.find_element_by_css_selector(".yuRUbf > a").get_attribute("href")
    print(title)
    print(link)
    print()

# ブラウザを閉じる
driver.quit()
```

この例では、Googleのトップページを開き、検索ボックスに"Python Selenium"と入力して検索を実行

その後、検索結果のタイトルとリンクを取得し、表示している

## Reference
- [selenium](https://www.selenium.dev/)