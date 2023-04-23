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

## 要素が取得できない時の原因

要素がまだ読み込まれていない: ページの読み込みが完了する前に要素を取得しようとしている場合、エラーが発生<br>
解決策: WebDriverWaitとexpected_conditionsを使用して、要素が読み込まれるのを待つ

要素がJavaScriptによって動的に生成されている: JavaScriptによって動的に生成された要素は、ページが読み込まれた直後には存在しないことがある<br>
解決策: JavaScriptが実行され、要素が生成されるまで待つために、WebDriverWaitとexpected_conditionsを使用

要素が非表示または非アクティブ: 要素が非表示または非アクティブである場合、クリックできない<br>
解決策: 要素が表示され、アクティブになるまで待つためにWebDriverWaitとexpected_conditionsを使用

要素のセレクタが正しくない: 要素を特定するためのセレクタ（ID、クラス、XPATHなど）が間違っている場合、要素が見つからない<br>
解決策: セレクタを修正して、正確に要素を特定できるようにする

iframe内の要素: 要素がiframe内にある場合、直接アクセスできない
解決策: switch_to.frame()メソッドを使用して、iframeにアクセスし、その後で要素を取得

ページが遷移した後のタイミング問題: ページ遷移後、すぐに要素を取得しようとするとエラーが発生することがある<br>
解決策: WebDriverWaitとexpected_conditionsを使用して、ページ遷移後に要素が表示されるまで待つ

問題が解決しない場合は、Webページの構造や他の要因が原因である可能性がある

## Reference
- [selenium](https://www.selenium.dev/)
- [microsoft-edge webdriver](https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/)
- [locating-elements](https://kurozumi.github.io/selenium-python/locating-elements.html)
- [XPath Helper](https://chrome.google.com/webstore/detail/xpath-helper/hgimnogjllphhhkhlmebbmlgjoejdpjl)