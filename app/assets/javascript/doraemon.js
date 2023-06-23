function doraemon() {
    let speakButton = document.getElementById("voiceButton");
    speakButton.addEventListener("click", () => { stop() });

    let send_btn = document.getElementById("send");

    const videoElement = document.getElementById("doraemon");

    const stop_btn = document.getElementById("stop");
    stop_btn.addEventListener('click', function(e) {
        videoElement.pause();
    });

    let play_btn = document.getElementById("play");
    play_btn.addEventListener('click', function(e) {
        videoElement.play();
    });

    let text = document.getElementById('hidden-word').textContent;

    function speak(text){
        videoElement.play();
        speechSynthesis.cancel();
        let uttr = new SpeechSynthesisUtterance();
        // let text = document.getElementById('hidden-word').textContent;
        uttr.text = text;
        uttr.lang = 'ja-JP';
        // uttr.lang = 'en-US';
        let voice = speechSynthesis.getVoices().find(function(voice){
                // return voice.name === 'Google US English';
                // return voice.name === 'Google 日本語';
                return voice.lang === 'ja-JP' && voice.name.includes('Google');
                // return voice.name === 'Kyoko';
        });
        if(voice){
            uttr.voice = voice;
        }
        speechSynthesis.speak(uttr);
    }

    function stop(){
        text = document.getElementById('hidden-word').textContent;
        // times = text.length / 7; //Kyoko
        times = text.length / 5.5; //Google
        speak(text);
        // speak(text="");
        timeStop(times);
        // speechSynthesis.cancel();
    }

    // ビジーwaitを使う方法
    // function sleep(waitMsec) {
    // 	let startMsec = new Date();
    // 	// 指定ミリ秒間だけループさせる（CPUは常にビジー状態）
    // 	while (new Date() - startMsec < waitMsec);
    // }

    function timeStop(times){
        let counter = 0;
        const timerId = setInterval(function(){
            console.log((times+1) + '秒後に止まる')
            if(++counter > times){
                stop_btn.click();
                clearInterval(timerId)
            }
        }, 1000)
    }
    speechSynthesis.getVoices();


    let SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;

    if (!SpeechRecognition){
        if (typeof webkitSpeechRecognition !== 'undefined'){
            SpeechRecognition = webkitSpeechRecognition;
        }
    }
    
    if (SpeechRecognition){
        let btn_stt = document.getElementById('btn_stt');  
        btn_stt.onclick = function(){
            //
            btn_stt.style.background = 'gray';
            //
            btn_stt.disabled = true;
        
            // SpeechRecognitionの生成
            let recognition = new SpeechRecognition();  
            recognition.lang = 'ja'; 
        
            // 音声認識の開始
            recognition.start();
            
            // 結果
            recognition.onresult = function(event) {
            
                // 文字列の取得
                let speechResult = event.results[0][0].transcript;
                document.getElementById('msg-input').value = speechResult;
                send_btn.click();
                send_btn.style.backgroundColor = 'gray';
                send_btn.disabled = true;
                document.getElementById('output_stt').innerHTML = '認識結果：' + speechResult + '。';
                
                // 信頼度 ※Egdeは現在(2021/06)、信頼度には非対応で常に0になる
                document.getElementById('confidence_stt').innerHTML = '信頼度： ' + event.results[0][0].confidence + 
                    '<br>※信頼度は0.0 ～ 1.0で1.0に近いほど信頼度が高いです。';
            
                console.log(event.results);
            }
            
            // スピーチの終了
            recognition.onspeechend = function() {
            recognition.stop();
            btn_stt.disabled = false;
            btn_stt.style.background = 'rgb(164, 72, 72)';
            }
            
            // エラー
            recognition.onerror = function(event) {
            btn_stt.disabled = false;
            btn_stt.style.background = 'rgb(164, 72, 72)';
            alert('エラーが発生しました。');
            }
        }
    }else{
    alert('ブラウザはChromeをお使いください。');
    }
}
doraemon();