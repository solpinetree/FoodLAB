function sendmessage() {
	var chatName = $('#chatName').val();
	var chatContent = $('#chatContent').val();
	var chat
	console.log("sendmessage in");
	$.ajax({
		type: "POST",
		url: "./chat/",
		
		// parametername : realData
		data: {
			chatName : chatName,
			chatContent: chatContent
		},
		
		success: function(result){
			if(result == 1){
				alert("transmit Success");
			} else if(result == 0){
				alert("chatName or chatContent error");
			} else {
				alert("transmit Fail DB error");
			}
		}
		
		
		
	});
	// chatContent clean
	$('#chatContent').val('');
	
	//	메시지 박스에 있는 데이터를 전송한다.
	/*
	var msg = memberUsername + ":" + document.getElementById("sendmsg").value;
	websocket.send(msg);
	
	//	메시지를 보내고, 메시지 입력 부분을 지워준다. 
	document.getElementById("sendmsg").value = "";
	*/
	
}

//	엔터키가 눌리면, 메시지를 전송하는 함수
function keypress()
{
	var keycode = event.keyCode;
	
	if (keycode == 13)
		sendmessage();
}