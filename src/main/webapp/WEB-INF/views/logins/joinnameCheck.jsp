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
<h2>닉네임중복체크</h2>
<% request.setCharacterEncoding("UTF-8");
String name = request.getParameter("username");
MemberDTO member = new MemberDTO();
MemberDAOImpl MemberDAO = new MemberDAOImpl();
member = MemberDAO.selectname(name);

int result = -1;

	if(member.getUsername()!=null){	
		result = 0;
	}else{
		result = 1;
	}


if (result == 1){
	out.print("사용가능한 닉네임입니다");
	//5. Add name button => Use synchronous method
	%>
	 <input type="button" value="닉네임 사용하기" onclick="result();">
	<%
	
}else if(result == 0){
	out.print("중복된 닉네임입니다");
}else{
	out.print("에러 발생!!!(-1)"); 
}
%>
<!-- 4.팝업창구현  -->
<fieldset>
	<!-- <form action="" method="post">
	action속성에 값이 없으면 기본적으로 자기자신을 불러오지만 중복확인 버튼을 클릭했을때 변경되지않는다.-->	
	<form action="${root}/logins/joinnameCheck" method="post" name="newMember">
		name : <input type="text" name="username" value="<%=name%>">
		<input type="submit" value="중복 확인">	 
	</form>
</fieldset>

<!-- 6. 선택된아이디는 중복확인창에서 회원가입 페이지로 정보전달  -->
 <script type="text/javascript">
    function result(){
    	/*
    	The name information of the pop-up window is delivered 
    	
    	to the membership registration window as the name information
    	
    	The pop-up window has a dependent relationship with the existing window, 
    	
    	so you can use the opener.
    	
    	alert("name value of pop-up window"+document.wfr.username.value+",name value of membership window:"+opener.document.fr.name.value)
    	
    	6-1. Insert the name value selected by duplicate name into the name value of the membership registration page.
    	*/
    	opener.document.newMember.name.value = document.newMember.username.value;
    	
    	/*
    	6-3. Member registration window control
    	
    	read only attribute control
    	*/
    	opener.document.newMember.name.readOnly=true;
    	
    	//6-2. Close a window
    	window.close();
    }
    
 
 </script>



</body>
</html>