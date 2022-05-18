
var sendbtn = document.getElementById('sendbtn');


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
	//	메시지가 18개이면, 채팅창의 내용을 지운다.
	/*
	if (++line % 18 == 0){
		line = 0;
		document.getElementById("chat").innerHTML = "";
	}
	*/
	addChat(message.data);
	
}

function sendmessage()
{
	//"[${sessionScope.sessionMember.id}]"
	//	메시지 박스에 있는 데이터를 전송한다.
	var msg = "[${sessionScope.sessionMember.id}] : " + document.getElementById("sendmsg").value;
	websocket.send(msg);
	
	//	메시지를 보내고, 메시지 입력 부분을 지워준다. 
	document.getElementById("sendmsg").value = "";
	
	
}

// websocket onmessage 에서 호출하는 함수
// div 단위로 메시지를 생성한다.
function addChat(message){
	
	var rmsg = document.getElementById('rmsg');
	console.log(message);
	var el = document.createElement('div'); // <div> element 생성
	
	itemStr = '<div class = "flr"><div class = "messages">' + 
			'<p class = "msg" id = "chat">' + message + '</p></div>' +
			'<span class = "timestamp">' + 
			'<span class = "username"></span>' + "&bull;" +
			'<span class = "posttime">Now</span></span>' + '</div>' +
			'<img class = "user-img" id = "user-0" src = "//gravatar.com/avatar/56234674574535734573000000000001?d=retro" />';
	
	el.innerHTML = itemStr;
	el.setAttribute("class", "msg-box");
	
	console.log(el);
	rmsg.appendChild(el);
	
	
}

//	엔터키가 눌리면, 메시지를 전송하는 함수
function keypress()
{
	var keycode = event.keyCode;
	
	if (keycode == 13)
		sendmessage();
}