
var chatName = document.getElementById('chatName');
var chatContent = document.getElementById('chatContent');
var websocket = new WebSocket("ws://localhost:8085/foodlab/wsocket");
var line = 0;

	
//	아래는 웹 소켓에서 사용하는 4가지 이벤트들이다.
websocket.onopen = function(message){
	//document.getElementById("state").innerHTML = "소켓 시작"; 
}
websocket.onclose = function(message){}
websocket.onerror = function(message){}
//	onmessage는 외부에서 들어온 데이터를 받아서 처리를 하는 이벤트이다.

websocket.onmessage = function(message)
{
	addChat(message.data);
}

function sendmessage() {

	
	var msg = chatName.value + ":" + chatContent.value;
	websocket.send(msg);
	
	//	메시지를 보내고, 메시지 입력 부분을 지워준다. 
	chatContent.value = "";
	
}

// websocket onmessage 에서 호출하는 함수
// article 단위로 메시지를 생성한다.
function addChat(message){
	var msg_origin = message;
	var msg_origin = msg_origin.split(':');
	var nowTime = currentTime();
	// : 을 기준으로 split 
	// msg_origin[0] : chatName
	// msg_origin[1] : chatContent
	 
	
	
	
	var rmsg = document.getElementById('chat-window');
	console.log(message);
	var el = document.createElement('article'); // <div> element 생성
	
	
     
    
	
	
	itemStr = '<div class="msg-box">'
			+	'<div class = "flr">'
			+		'<div class = "messages">' 
			+			'<p class = "msg" id = "chat">' + msg_origin[1] + '</p>'
			+		'</div>' 
			+		'<span class = "timestamp">'
			+			'<span class = "username">' + chatName.value + '</span>' + "&bull;" 
			+			'<span class = "posttime">' + nowTime + '</span>'
			+		'</span>'
			+ 	'</div>' 
			+	'<img class = "user-img" id = "user-0" src = "//gravatar.com/avatar/56234674574535734573000000000001?d=retro" />'
			+ '</div>';
	
	el.innerHTML = itemStr;
	el.setAttribute("class", "msg-container msg-self");
	
	console.log(el);
	rmsg.appendChild(el);
	
	
}

function currentTime(){
    var date = new Date();
    var hh = date.getHours();
    var mm = date.getMinutes();
    var apm = hh > 12 ? "오후":"오전";
    var ct = apm + " "+hh+":"+mm+"";
    return ct;
}
//	엔터키가 눌리면, 메시지를 전송하는 함수
function keypress()
{
	var keycode = event.keyCode;
	
	if (keycode == 13)
		sendmessage();
}

