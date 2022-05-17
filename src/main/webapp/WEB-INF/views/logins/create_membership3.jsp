<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp" %>
<%@ include file="../includes/login/NewFile1.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap Login &amp; Register Templates</title>
<script type="text/javascript">
	function checkForm() {
		var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,25}$/;
		var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if (!document.newMember.email.value) {
			alert("이메일을 입력하세요.");
			return false;
		}
		
		if (!regEmail.test(document.newMember.email.value)) {
            alert("이메일 형식이 올바르지 않습니다");         
            return false;
      }	

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		
		if (!pwdCheck.test(document.newMember.password.value)) {
		    alert("비밀번호는 영문자+숫자 조합으로 6~25자리 사용해야 합니다.");		  
		    return false;
		  }
		


	
		<%--var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){3}$/;
		var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,25}$/; --%>
		
	}
	
	function mykeydown() {
		
		var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,25}$/;
		var name = /^(?=.*[a-zA-Z]).{2,20}$/;
		
		if (!regEmail.test(document.newMember.email.value)) {
			var str = document.getElementById("checkemail");
			str.innerHTML = "이메일 형식에 맞게 입력해주세요"        
            
      }
		
		if (regEmail.test(document.newMember.email.value)) {
			var str = document.getElementById("checkemail");
			str.innerHTML = ""        
            
      }
		
		
		if (!pwdCheck.test(document.newMember.password.value)) {
			var str2 = document.getElementById("checkpassword");
			str2.innerHTML = "비밀번호는 영문자+숫자 조합으로 6~25자리 사용해야 합니다."        
           
      }
		
		if (pwdCheck.test(document.newMember.password.value)) {
			var str2 = document.getElementById("checkpassword");
			str2.innerHTML = ""        
            
      }
		
		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			var str1 = document.getElementById("checkpassword_confirm");
			str1.innerHTML = "비밀번호를 동일하게 입력하세요"        
            
      }
		
		if (document.newMember.password.value == document.newMember.password_confirm.value) {
			var str1 = document.getElementById("checkpassword_confirm");
			str1.innerHTML = ""        
            
      }
		
		
		
		
		
		
		
		
		
		
		

		
		
	}
	
	
	function winopen(){
		//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
		//1. 아이디가 없으면 알림창과 진행x
		if(document.newMember.email.value =="" || document.newMember.email.value.length < 0){
			alert("이메일을 먼저 입력해주세요")
			document.newMember.email.focus();
		}else{
			//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
			//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
			window.open("${root}/logins/joinemailCheck?useremail="+document.newMember.email.value,"","width=500, height=300");
		}
	}
	
	function winopen2(){
		//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
		//1. 아이디가 없으면 알림창과 진행x
		if(document.newMember.name.value =="" || document.newMember.name.value.length < 0){
			alert("닉네임을 먼저 입력해주세요")
			document.newMember.name.focus();
		}else{
			//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
			//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
			window.open("${root}/logins/joinnameCheck?username="+document.newMember.name.value,"","width=500, height=300");
		}
	}
	
	
</script>
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-backstretch/2.0.4/jquery.backstretch.min.js"></script>
</head>

    <body>
    
    <jsp:include page="../includes/header.jsp" />
    
    <!-- 헤더의 배경화면이 흰색일 경우 -->
    <script type="text/javascript">
    	var element = document.querySelector('header');
    	element.classList.add('header--normal');
    	document.getElementById('header-logo-custom').src="${resources}/img/footer-logo.png";
    </script>
    

        <!-- Top content -->
        <div class="top-content top-padding-login" style="background-color:white ;">
        	
            <div class="inner-bg">
                <div class="container">
                	
                    <div class="row description">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1 style="margin-top:60px;">회원가입</h1>
                            
                        </div>
                    </div>
                    
                    <div class="row">
                        
                        
                        	
                        <div class="col-sm-8 col-sm-offset-2">
                        	
                        	<div class="form-box" style="width:500px; margin:auto;" >
                        		<div class="form-top">
	                        		<div class="form-top-left">
	                        			<h3>지금 회원가입하세요!</h3>
	                            		<p>이메일, 비밀번호, 닉네임을 형식에 맞게 입력해주세요</p>
	                        		</div>
	                        		<div class="form-top-right">
	                        			<i class="fa fa-pencil"></i>
	                        		</div>
	                            </div>
	                            <div class="form-bottom">
				                    <form name="newMember" role="form" action="${root}/logins/processAddMember" method="post" class="registration-form" onsubmit="return checkForm()">
				                    	<div class="form-group" style="margin-bottom:0px;">
				                        	<label class="sr-only" for="form-email">이메일</label>
				                        	<input type="text" name="email" placeholder="이메일" class="form-email form-control" id="form-email" onkeyup='mykeydown()'>
				                        	<p id=checkemail></p>
				                        </div>
				                        <input type="button" value="중복확인" class="dup" onclick="winopen()"><br>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-last-name">비밀번호</label>
				                        	<input type="text" name="password" placeholder="비밀번호" class="form-last-name form-control" id="form-last-name" onkeyup='mykeydown()' >
				                        	<p id=checkpassword></p>
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-email">비밀번호확인</label>
				                        	<input type="text" name="password_confirm" placeholder="비밀번호확인" class="form-email form-control" id="form-email" onkeyup='mykeydown()'>
				                        	<p id=checkpassword_confirm></p>
				                        </div>				                        
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-email">닉네임</label>
				                        	<input type="text" name="name" placeholder="닉네임" class="form-email form-control" id="form-email">
				                        </div>
				                         <input type="button" value="중복확인" class="dup" onclick="winopen2()"><br>
				                        <button type="submit" class="btn" value="등록">회원가입</button>
				                    </form>
			                    </div>
                        	</div>
                        	
                        </div>
                    </div>
                    
                </div>
            </div>
            
        </div>

        <!-- Footer -->
        <!--  style="background-color:#F9ADBD;" -->
        <footer style="background-color:#F9ADBD;">
        	
        </footer>

        <!-- Javascript -->
        <script type="text/javascript" src="${resources}/js/login/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="${resources}/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${resources}/js/login/jquery.backstretch.min.js"></script>
        <script type="text/javascript" src="${resources}/js/login/scripts.js"></script>
       
        <!--[if lt IE 10]>
            <script src="..resources/js/placeholder.js"></script>
        <![endif]-->

    </body>


</html>