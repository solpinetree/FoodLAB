<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="../includes/common.jsp" %>
<%@ page import="dto.*"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />

<html>
<head>
<link rel="stylesheet" href="../css/loginbootstrap.min.css" />
<title>회원 정보</title>
</head>
<body>
<jsp:useBean id="sessionMember" scope="session" class="dto.MemberBean" type="dto.MemberBean"/>
	<jsp:include page="../includes/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원정보</h1>
		</div>
	</div>
	<div class="container" align="center">
	
		<%
			String msg = request.getParameter("msg");

			if (msg != null) {
				if (msg.equals("0"))
					out.println(" <h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
				else if (msg.equals("1"))
					out.println(" <h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
				else if (msg.equals("2")) {
					out.println(" <h2 class='alert alert-danger'>" + sessionMember.getusername() + "님 환영합니다</h2>");
				}				
			} else {
				out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
			}
		%>
		
	</div>	
</body>
</html>