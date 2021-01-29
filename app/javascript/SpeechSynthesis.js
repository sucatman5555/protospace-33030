window.onload =
function (){

  var btn = document.querySelector('.btn');
  var speech = document.querySelector('#speech');
  var text = speech.textContent;
  var btn2 = document.querySelector('.btn2');

  btn2.addEventListener( 'click', function() {
    if (!window.speechSynthesis) return;
    speechSynthesis.cancel();
  });
  //var text = speech.getAttribute('alt');
  // console.log(text);

  btn.addEventListener( 'click', function() {
    var msg = new SpeechSynthesisUtterance();
    msg.text = text; 
    msg.volume = 0.8; //ボリューム
    msg.rate   =   1; //レート
    msg.pitch  =   1; //ピッチ
    msg.text = text;
    // msg.name = 'Google 日本語'; //言語
    msg.lang = 'ja-JP'; //言語
    // msg.voiceURI = "Google 日本語";
    window.speechSynthesis.speak(msg);
    // console.log(msg.lang);
    // return;
  },false   
  );
}

// window.speechSynthesis.onvoiceschanged =speaking；
// setInterval(speaking,1000);
// window.addEventListener('load', speaking);