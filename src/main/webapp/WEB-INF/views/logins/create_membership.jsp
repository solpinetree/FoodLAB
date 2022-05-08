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
		    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");		  
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
				                    	<div class="form-group">
				                        	<label class="sr-only" for="form-email">이메일</label>
				                        	<input type="text" name="email" placeholder="이메일" class="form-email form-control" id="form-email">
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
				                        	<label class="sr-only" for="form-email">닉네임</label>
				                        	<input type="text" name="name" placeholder="성명" class="form-email form-control" id="form-email">
				                        </div>
				                        
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
        <!--  style="background-color:#19b9e7;" -->
        <footer style="background-color:#19b9e7;">
        	
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