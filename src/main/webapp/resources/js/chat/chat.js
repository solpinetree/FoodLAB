
var chatName = document.getElementById('chatName');
var chatContent = document.getElementById('chatContent');
var chatroomId = document.getElementById('chatroomId');

var chatWindow = document.getElementById('chat-window');
var wUrl = "ws://" + window.location.host + "/foodlab/wsocket";
//var websocket = new WebSocket("ws://localhost:8085/foodlab/wsocket");
console.log(wUrl);
var websocket = new WebSocket(wUrl);


	
//	아래는 웹 소켓에서 사용하는 4가지 이벤트들이다.
websocket.onopen = function(message){
	//document.getElementById("state").innerHTML = "소켓 시작"; 
	gotoBottom(chatWindow); // 채팅창을 처음 열었을 때 스크롤 하단으로
}
websocket.onclose = function(message){}
websocket.onerror = function(message){}
//	onmessage는 외부에서 들어온 데이터를 받아서 처리를 하는 이벤트이다.

websocket.onmessage = function(message) {
	
	console.log("js.websocket.onmessage ON");
	
	var chatmsg = message.data;
	
	if(chatmsg.substring(0,6) == 'server'){
		console.log("reciever");
		addChatReceiver(message.data);
		gotoBottom(chatWindow); // 입력했을 때 스크롤하단으로
	} else{
		console.log("send");
		addChat(message.data);
		gotoBottom(chatWindow); // 입력했을 때 스크롤하단으로
	}
	//서버로부터 메세지를 받았을 때 작동되는 함수

	
	
}

function sendmessage(){
	if(chatContent.value == ""){
		//메세지를 입력하지않고 버튼을 누른 경우
	} else {
		var msg = chatName.value + ":" + chatContent.value;
		websocket.send(msg);
		msgDB_insert(); // DB 에 msg insert by ajax
	}
	
	
	chatContent.value = ""; //	메시지를 보내고, 메시지 입력 부분을 지워준다. 
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
	console.log("addchat(id, msg)->" + message);
	var el = document.createElement('article'); // <div> element 생성
	
	itemStr = '<div class="msg-box">'
			+	'<div class = "flr">'
			+		'<div class = "messages">' 
			+			'<p class = "msg" id = "chat">' + msg_origin[1] + '</p>'
			+		'</div>' 
			+		'<span class = "timestamp">'
			+			'<span class = "username">' + msg_origin[0] + '</span>' + "&bull;" 
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


function addChatReceiver(message){
	
	var msg_origin = message;
	var msg_origin = msg_origin.split(':');
	var nowTime = currentTime();
	// : 을 기준으로 split 
	// msg_origin[0] : server
	// msg_origin[1] : chatName
	// msg_origin[2] : chatContent
	 

	var rmsg = document.getElementById('chat-window');
	console.log("addChatReceiver(id, msg)->" + message);
	var el = document.createElement('article'); // <div> element 생성
	
	itemStr = '<div class="msg-box">'
			+	'<div class = "flr">'
			+		'<div class = "messages">' 
			+			'<p class = "msg" id = "chat">' + msg_origin[2] + '</p>'
			+		'</div>' 
			+		'<span class = "timestamp">'
			+			'<span class = "username">' + msg_origin[1] + '</span>' + "&bull;" 
			+			'<span class = "posttime">' + nowTime + '</span>'
			+		'</span>'
			+ 	'</div>' 
			+	'<img class = "user-img" id = "user-0" src = "//gravatar.com/avatar/56234674574535734573000000000001?d=retro" />'
			+ '</div>';
	
	el.innerHTML = itemStr;
	el.setAttribute("class", "msg-container msg-other");
	
	console.log(el);
	rmsg.appendChild(el);
}


//현재 시간
function currentTime(){
    var date = new Date();
    var hh = addZero(date.getHours());
    var mm = addZero(date.getMinutes());
    var apm = hh > 12 ? "오후":"오전";
    var ct = apm + " "+hh+":"+mm+"";
    return ct;
}

function addZero(i) {
  if (i < 10) {i = "0" + i}
  return i;
}

//	엔터키가 눌리면, 메시지를 전송하는 함수
function keypress()
{
	var keycode = window.event.keyCode;
	
	if (keycode == 13)
		sendmessage();
}

function msgDB_insert(){
		var chatForm = $("#chat-input-form").serialize();
		
		console.log("chatform : " + chatForm);
		
		$.ajax({
			method: "post",
			url: "/foodlab/chat/chatroom/insert",
			data: chatForm,
			dataType: 'json',
			success: function (data){
				alert(data);
				console.log("success : " + data);

			},
			error: function(){
				console.log("Error");
			}
		});
}



//input type text 가 active or focus 상태가 되면 button 색이 바뀜
function activeButton(){
	document.getElementById('sendbtn').style.backgroundColor = 'white';
}

function gotoBottom(chatWindow){
   var element = chatWindow;
   element.scrollTop = element.scrollHeight - element.clientHeight;
}


