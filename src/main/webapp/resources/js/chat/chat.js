
var sendbtn = document.getElementById('sendbtn');
sendbtn.addEventListener('click', sendmessage);
	
function sendmessage()
{
	console.log("버튼을 누르셨습니다.");
	/*
	//	메시지 박스에 있는 데이터를 전송한다.
	var msg = "[${sessionScope.sessionMember.id}]" + document.getElementById("sendmsg").value;
	websocket.send(msg);
	
	//	메시지를 보내고, 메시지 입력 부분을 지워준다. 
	document.getElementById("sendmsg").value = "";
	
	//	나의 메시지
	document.getElementById("chat").value = 
		document.getElementById("chat").value + "\n"+msg; 
	*/
}
var websocket = new WebSocket("ws://localhost:8085/wsocket");
var line = 0;
	
//	아래는 웹 소켓에서 사용하는 4가지 이벤트들이다.
websocket.onopen = function(message){
	document.getElementById("state").innerHTML = "소켓 시작"; 
}
websocket.onclose = function(message){}
websocket.onerror = function(message){}
//	onmessage는 외부에서 들어온 데이터를 받아서 처리를 하는 이벤트이다.
websocket.onmessage = function(message)
{
	//	메시지가 20개이면, 채팅창의 내용을 지운다.
	if (++line % 20 == 0){
		line = 0;
		document.getElementById("chat").value = "";
	}
	
	document.getElementById("chat").value = 
		document.getElementById("chat").value + "\n" +message.data;
}



//	엔터키가 눌리면, 메시지를 전송하는 함수
function keypress()
{
	var keycode = event.keyCode;
	
	if (keycode == 13)
		sendmessage();
}