---
tags:
  - JavaScript
---

## voicevox でchatGPTの回答を音声に変換する

- chatGPT API 
- voicevox API

## Overview

- chatGPTと子どもが音声で簡単に会話できるようにする
- スペースキーを押したときだけ、音声入力を受け付ける

```html
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.4/axios.min.js"></script>
    <title>Document</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <div id="app">
        <h1>ChatGPT Voice</h1>
        <button id="start-recording">スタート</button>
        <button id="stop-recording" disabled>ストップ</button>

        <label for="language-select">ことば:</label>
        <select name="lang" id="language-select">
            <option value="">--ことばをえらんでね-</option>
            <option value="en-US">えいご</option>
            <option value="ja-JP">にほんご</option>
        </select>
        <br/>
        <br/>
        <div id="transcript"></div>
        <div id="response"></div>
        <div id="history"></div>
        <audio class="audio" controls></audio>
    </div>
</body>
<script src="js/config.js"></script>
<script type="module" src="js/main.js"></script>
</html>
```

```js
 import { textToSpeech } from './voicevox.js';

const recognition = new webkitSpeechRecognition();
recognition.continuous = false;
recognition.interimResults = true;

const startButton = document.getElementById('start-recording');
const stopButton = document.getElementById('stop-recording');
const languageSelect = document.getElementById('language-select');
const transcriptDiv = document.getElementById('transcript');
const responseDiv = document.getElementById('response');
const historyDiv = document.getElementById('history');

let messages = [];
let isSpaceKeyDown = false;

startButton.addEventListener('click', startRecording);
stopButton.addEventListener('click', stopRecording);
languageSelect.addEventListener('change', changeLanguage);

function startRecording() {
  recognition.start();
  startButton.disabled = true;
  stopButton.disabled = false;
}

function stopRecording() {
  recognition.stop();
  startButton.disabled = false;
  stopButton.disabled = true;
}

function changeLanguage() {
  recognition.lang = languageSelect.value;
}

recognition.addEventListener('result', (event) => {
  let finalTranscript = '';

  for (let i = event.resultIndex; i < event.results.length; i++) {
    const transcript = event.results[i][0].transcript;

    if (event.results[i].isFinal) {
      finalTranscript += transcript;
    }
  }

//   transcriptDiv.textContent = finalTranscript;
  if (finalTranscript) {
    getChatGPTResponse(finalTranscript);
  }
});

recognition.addEventListener('end', () => {
  if (isSpaceKeyDown) {
    startRecording();
  }
});

recognition.lang = recognition.lang == ''
                   ? 'ja-JP'
                   : languageSelect.value;

async function getChatGPTResponse(text) {
    responseDiv.textContent = 'Thinking...';

    const userMessage = {
        role: 'user',
        content: text
    };
    messages.push(userMessage);

    // 最新のメッセージを保持
    const MAX_MESSAGE_LENGTH = 6;
    if (messages.length > MAX_MESSAGE_LENGTH) {
        messages.shift();
    }

    const headers = {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${API_KEY}`
    };

    const payload = {
        model: 'gpt-3.5-turbo',
        messages: [
            ...messages,
        ],
        temperature: 0.8,
    };

    try {
        const response = await fetch('https://api.openai.com/v1/chat/completions', {
            method: 'POST',
            headers: headers,
            body: JSON.stringify(payload),
        });

        const data = await response.json();

        if (data.choices[0].message.content) {
            const chatGPTResponse = data.choices[0].message.content;
            textToSpeech(chatGPTResponse);
            messages.push({ role: 'assistant', content: chatGPTResponse });
            displayHistory();
        } else {
            console.error('Error: No choices or text in API response');
            responseDiv.textContent = 'Error: ChatGPT did not provide a response';
        }
    } catch (error) {
        console.error('Error:', error);
        responseDiv.textContent = 'Error: Could not get response from ChatGPT';
    }
}

function displayHistory() {
    historyDiv.innerHTML = '';
    messages.forEach((message) => {
        const role = message.role === 'user' ? 'User' : 'AI';
        const pElement = document.createElement('p');
        pElement.textContent = `${role}: ${message.content}`;

        pElement.classList.add('message');
        pElement.classList.add(message.role);

        historyDiv.appendChild(pElement);
    });
    historyDiv.scrollTop = historyDiv.scrollHeight;
}

// spaceを押している間だけ、音声を受け付ける
function handleKeyDown(event) {
    if (event.code === 'Space' && !isRecognitionActive()) {
      isSpaceKeyDown = true;
      startRecording();
    }
}

function isRecognitionActive() {
    return startButton.disabled && !stopButton.disabled;
}

function handleKeyUp(event) {
    if (event.code === 'Space') {
        isSpaceKeyDown = false;
        stopRecording();
    }
}
  
function init() {
    document.body.addEventListener('keydown', handleKeyDown);
    document.body.addEventListener('keyup', handleKeyUp);
}

init();
```


## Reference
- [voicevox](https://voicevox.hiroshiba.jp/)
- [SpeechRecognition MDN](https://developer.mozilla.org/ja/docs/Web/API/SpeechRecognition)