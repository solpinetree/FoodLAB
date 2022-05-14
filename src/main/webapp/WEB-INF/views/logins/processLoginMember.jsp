<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("UTF-8");

	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String id = email;
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost/foodlab?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true"
	driver="com.mysql.cj.jdbc.Driver" user="labadmin" password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM member WHERE email=? and password=?  
    <sql:param value="<%=email%>" />
	<sql:param value="<%=password%>" />
</sql:query>

<c:forEach var="row" items="${resultSet.rows}">
	<%
		session.setAttribute("sessionemail", email);
	%>
	<c:redirect url="resultMember?msg=2" />
</c:forEach>

<c:redirect url="login?error=1" />