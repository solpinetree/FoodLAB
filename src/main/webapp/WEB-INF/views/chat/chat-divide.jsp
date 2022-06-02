<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp"%>

<head>
<title>오픈 채팅</title>

</head>

<body onkeypress = "keypress()" >
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<jsp:include page="../includes/header.jsp" />
	<!-- Header Section End -->

	<!-- 헤더의 배경화면이 흰색일 경우 -->
    <script type="text/javascript">
    	var element = document.querySelector('header');
    	element. classList.add('header--normal');
    	document.getElementById('header-logo-custom').src="${resources}/img/footer-logo.png";
    </script>
    
    <!-- Breadcrumb Begin -->
    <div class="title-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="title__text">
                        <h1 class="blackHansFont">${chatroomTitle}</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

	<!-- Blog Section Begin -->
	
	<!--  
	<section class="blog-section spad">
				<section class="chatbox">
					<section class="chat-window">
						<article class="msg-container msg-remote" id="msg-0">
							<div class="msg-box">
								<img class="user-img" id="user-0"
									src="//gravatar.com/avatar/00034587632094500000000000000000?d=retro" />
								<div class="flr">
									<div class="messages">
										<p class="msg" id="msg-0">곰순이 앞에 새로 생긴 짜장면집 맛있나요?</p>
									</div>
									<span class="timestamp"><span class="username">짜장면킬러</span>&bull;<span
										class="posttime">3 minutes ago</span></span>
								</div>
							</div>
						</article>
						<article class="msg-container msg-self" id="msg-0">
							<div class="msg-box">
								<div class="flr">
									<div class="messages">
										<p class="msg" id="msg-1">맛있어요! </p>
									</div>
									<span class="timestamp"><span class="username"></span>&bull;<span
										class="posttime">2 minutes ago</span></span>
								</div>
								<img class="user-img" id="user-0"
									src="//gravatar.com/avatar/56234674574535734573000000000001?d=retro" />
							</div>
						</article>
						<article class="msg-container msg-remote" id="msg-0">
							<div class="msg-box">
								<img class="user-img" id="user-0"
									src="//gravatar.com/avatar/002464562345234523523568978962?d=retro" />
								<div class="flr">
									<div class="messages">
										<p class="msg" id="msg-0">저는 개인적으로 짬뽕이 더 맛있었어요~ 탕수육은 찹쌀이에요.</p>
									</div>
									<span class="timestamp"><span class="username">유저1</span>&bull;<span
										class="posttime">1 minute ago</span></span>
								</div>
							</div>
						</article>
						<article class="msg-container msg-remote" id="msg-0">
							<div class="msg-box">
								<img class="user-img" id="user-0"
									src="//gravatar.com/avatar/00034587632094500000000000000007?d=retro" />
								<div class="flr">
									<div class="messages">
										<p class="msg" id="msg-0">곰순이 앞 vs 도서관 앞</p>
									</div>
									<span class="timestamp"><span class="username">아무개</span>&bull;<span
										class="posttime">Now</span></span>
								</div>
							</div>
						</article>
						<article class="msg-container msg-self" id="msg-0">
							<div class="msg-box">
								<div class="flr">
									<div class="messages">
										<p class="msg" id="msg-1">저는 그래도 도서관 앞이 제 취향입니당..</p>
									</div>
									<span class="timestamp"><span class="username"></span>&bull;<span
										class="posttime">Now</span></span>
								</div>
								<img class="user-img" id="user-0"
									src="//gravatar.com/avatar/56234674574535734573000000000001?d=retro" />
							</div>
						</article>
					</section>
					<form class="chat-input" onsubmit="return false;" style="margin-block-end: 0em;">
						<input type="text" autocomplete="on" placeholder="Type a message" />
						<button>
							</button>
					</form>
					
					</section>
	</section>
	-->
	<!--
	<div class="msg-box">
		<div class="flr">
			<div class="messages" >
				<p class="msg" id = "chat"></p>
			</div>
			<span class="timestamp"><span class="username"></span>&bull;<span
				class="posttime">Now</span></span>
		</div>
		<img class="user-img" id="user-0"
			src="//gravatar.com/avatar/56234674574535734573000000000001?d=retro" />
	</div> 
	-->

	
	
	<section class="blog-section cpad">
		<section class="chatbox" id = "chatbox">
			<section class="chat-window" id="chat-window">
			
		
			
			
			<c:forEach var = "chat" items = "${chatHistory}">
				<article class = "msg-container msg-self">
					<div class="msg-box">
						<div class = "flr">
							<div class = "messages">
								<p class = "msg" id = "chat">${chat.content}</p>
							</div>
								<span class = "timestamp">
									<span class = "username">${chat.memberId}</span>&bull;
									
									<!-- time split(hh:mm)-->
									<c:set var = "chatTime" value = "${fn:split(chat.createdAt, ':')[0]}"/>
									<c:choose>
										<c:when test = "${chatTime>='12'}">
											<span class = "posttime">오후 ${chat.createdAt}</span>
										</c:when>
										<c:otherwise>
											<span class = "posttime">오전 ${chat.createdAt}</span>
										</c:otherwise>
									</c:choose>

								
								</span>
						</div> 
						<img class = "user-img" id = "user-0" src = "//gravatar.com/avatar/56234674574535734573000000000001?d=retro" />
					 </div>
				 </article>
			</c:forEach>
			
			
		
			</section>
			<form class = "chat-input" id = "chat-input-form" action = "chatForm.getMap" onsubmit = "return false" method = "post" style= "margin-block-end: 0em;" >
				
				<input type = "text" name = "chatContent" id = "chatContent" placeholder = "메시지를 입력해주세요" autocomplete = "on" maxlength = "100" onclick="activeButton()">
				
				<!-- 로그인했을 때 사용자 닉네임 -->
				<input type="hidden" id = "chatName" name="chatName" value="${sessionScope.sessionMember.username}"/>
				<input type="hidden" id = "memberId" name = "memberId" value = "${sessionScope.sessionMember.id}">
				<input type="hidden" id = "chatroomId" name="chatroomId" value="${chatroomId}"/>
				<!--  sendmessage javascript function execute -->
				<button type = "button" id = "sendbtn"  onclick = "sendmessage()">
					<svg style="width: 24px; height: 24px" viewBox="0 0 24 24">
					<path fill="rgba(0,0,0,.38)"
						d="M17,12L12,17V14H8V10H12V7L17,12M21,16.5C21,16.88 20.79,17.21 20.47,17.38L12.57,21.82C12.41,21.94 12.21,22 12,22C11.79,22 11.59,21.94 11.43,21.82L3.53,17.38C3.21,17.21 3,16.88 3,16.5V7.5C3,7.12 3.21,6.79 3.53,6.62L11.43,2.18C11.59,2.06 11.79,2 12,2C12.21,2 12.41,2.06 12.57,2.18L20.47,6.62C20.79,6.79 21,7.12 21,7.5V16.5M12,4.15L5,8.09V15.91L12,19.85L19,15.91V8.09L12,4.15Z" /></svg>
				</button>
				
			</form>
			
		</section>
	</section>
					
					
					
				

	

	<!-- Footer Section Begin -->
	<jsp:include page="../includes/footer.jsp" />

	<!-- Js Plugins -->
	<%@ include file="../includes/plugins.jsp"%>
	
	<script type="text/javascript" src="${resources}/js/chat/chat.js"></script> 
	</body>

</html>