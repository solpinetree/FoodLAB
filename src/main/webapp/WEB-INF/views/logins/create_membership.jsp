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
		var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
		var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		
		if (!pwdCheck.test(document.newMember.id.value)) {
		    alert("아이디는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");		  
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
		    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");		  
		    return false;
		  }
		if (!regEmail.test(document.newMember.email.value)) {
	            alert("이메일 형식이 올바르지 않습니다");         
	            return false;
	      }


	
		
		
	}
</script>
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-backstretch/2.0.4/jquery.backstretch.min.js"></script>
</head>

    <body>
    
    <jsp:include page="../includes/header.jsp" />
    

        <!-- Top content -->
        <div class="top-content top-padding-login" style="background-color:#19b9e7 ;">
        	
            <div class="inner-bg">
                <div class="container">
                	
                    <div class="row description">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1>회원가입</h1>
                            <div class="description">
                            	<p>
	                            	This is a free responsive <strong>"login and register forms"</strong> template made with Bootstrap. 
	                            	Download it on <a href="http://azmind.com" target="_blank"><strong>AZMIND</strong></a>, 
	                            	customize and use it as you like!
                            	</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        
                        
                        	
                        <div class="col-sm-8 col-sm-offset-2">
                        	
                        	<div class="form-box">
                        		<div class="form-top">
	                        		<div class="form-top-left">
	                        			<h3>Sign up now</h3>
	                            		<p>Fill in the form below to get instant access:</p>
	                        		</div>
	                        		<div class="form-top-right">
	                        			<i class="fa fa-pencil"></i>
	                        		</div>
	                            </div>
	                            <div class="form-bottom">
				                    <form name="newMember" role="form" action="${root}/logins/processAddMember" method="post" class="registration-form" onsubmit="return checkForm()">
				                    	<div class="form-group">
				                    		<label class="sr-only" for="form-first-name">아이디</label>
				                        	<input type="text" name="id" placeholder="아이디" class="form-first-name form-control" id="form-first-name">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-last-name">비밀번호</label>
				                        	<input type="text" name="password" placeholder="비밀번호" class="form-last-name form-control" id="form-last-name">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-email">비밀번호확인</label>
				                        	<input type="text" name="password_confirm" placeholder="비밀번호확인" class="form-email form-control" id="form-email">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-email">이메일</label>
				                        	<input type="text" name="email" placeholder="이메일" class="form-email form-control" id="form-email">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-email">성명</label>
				                        	<input type="text" name="name" placeholder="성명" class="form-email form-control" id="form-email">
				                        </div>
				                        
				                        <button type="submit" class="btn" value="등록">Sign me up!</button>
				                    </form>
			                    </div>
                        	</div>
                        	
                        </div>
                    </div>
                    
                </div>
            </div>
            
        </div>

        <!-- Footer -->
        <!--  style="background-color:#19b9e7;" -->
        <footer style="background-color:#19b9e7;">
        	<div class="container" >
        		<div class="row">
        			
        			<div class="col-sm-8 col-sm-offset-2">
        				<div class="footer-border"></div>
        				<p>Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a></p>
        			</div>
        			
        		</div>
        	</div>
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