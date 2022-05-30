<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.aj22.foodlab.dao.member.*" %>
<%@ page import = "com.aj22.foodlab.dto.MemberDTO" %>
<%@ page import = "java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>이메일중복체크</h2>
<% request.setCharacterEncoding("UTF-8");
String email = request.getParameter("useremail");
MemberDTO member = new MemberDTO();
MemberDAOImpl MemberDAO = new MemberDAOImpl();
member = MemberDAO.select(email);
request.setCharacterEncoding("UTF-8");
int result = -1;

if(member.getEmail()!=null){	
	result = 0;
}else{
	result = 1;
}

if (result == 1){
	out.print("사용가능한 이메일입니다");
	//5. Add email button => Use synchronous method
	%>
	 <input type="button" value="이메일 사용하기" onclick="result();">
	<%
	
}else if(result == 0){
	out.print("중복된 이메일입니다");
}else{
	out.print("에러 발생!!!(-1)"); 
}
%>
<!--4. Pop-up window implementation  -->
<fieldset>
	<!-- <form action="" method="post">
	If there is no value in the action property, it will basically load itself, 
	but it will not change when you click the duplicate confirmation button.-->	
	<form action="${root}/logins/joinemailCheck" method="post" name="newMember">
		email : <input type="text" name="useremail" value="<%=email%>">
		<input type="submit" value="중복 확인">	 
	</form>
</fieldset>

<!-- 6. Send information on the selected email from the duplicate confirmation window 
to the membership registration page  -->
 <script type="text/javascript">
    function result(){
    	/*
    	The email information of the pop-up window is delivered 
    	
    	to the membership registration window as the email information
    	
    	The pop-up window has a dependent relationship with the existing window, 
    	
    	so you can use the opener.
    	
    	alert("Email value of pop-up window"+document.wfr.useremail.value+",email value of membership window:"+opener.document.fr.email.value)
    	
    	6-1. Insert the email value selected by duplicate email into the email value of the membership registration page.
    	*/
    	opener.document.newMember.email.value = document.newMember.useremail.value;
    	
    	/*
    	6-3. Member registration window control
    	
    	read only attribute control
    	*/
    	opener.document.newMember.email.readOnly=true;
    	
    	//6-2. Close a window
    	window.close();
    }
    
 
 </script>



</body>
</html>