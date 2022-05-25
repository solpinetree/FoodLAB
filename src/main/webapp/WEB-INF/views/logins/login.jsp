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
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
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
                <div class="container" style="margin-top:60px;">
                	
               
                    
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2">
                        	
                        	<div class="form-box" style="width:500px; margin:80 auto;" >
	                        	<div class="form-top" style="border:1px solid #e3e3e3">
	                        		<div class="form-top-left">
	                        			<h3>FoodLab에 로그인하세요</h3>
	                            		<p>이메일과 비밀번호를 입력해주세요</p>
	                        		</div>
	                        		<div class="form-top-right">
	                        			<i class="fa fa-key"></i>
	                        		</div>
	                            </div>
	                            <%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
				
				System.out.println(session.getAttribute("sessionMember"));
			%>
	                            <div class="form-bottom" style="padding-bottom:10px; border:1px solid #e3e3e3;">
	                            
				                    <form role="form" action="${root}/logins/processLoginMember" method="post" class="login-form">
				                    	<div class="form-group">
				                    		<label class="sr-only" for="inputUserName">email</label>
				                        	<input type="text" name="email" placeholder="이메일" class="form-username form-control" id="form-username">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="inputPassword">Password</label>
				                        	<input type="password" name="password" placeholder="비밀번호" class="form-password form-control" id="form-password">
				                        </div>
				                        <button type="submit" class="btn">로그인</button>	
				                        <div style="margin-top: 20px;">
				                        <a href="${root}/logins/clause" style="color:gray; text-decoration: underline; text-underline-position:under;">아직 가입하지 않았다면 회원가입</a>
				                        
				                        </div>
				                        
				                        
				                        
				                        
				                        
				                        		                     
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