<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.Random"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />
<%
String DB_PROPERTIES = "?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true"; // MySQL Connector J 8.0
String DB_SCHEMAS = "foodlab";
String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver"; // deprecated "com.mysql.jdbc.Driver";  // try "com.mysql.cj.jdbc.Driver"
String DB_URL = "jdbc:mysql://localhost/" + DB_SCHEMAS + DB_PROPERTIES; 
String USER = "labadmin";
String PASS = "1234";

Class.forName(JDBC_DRIVER);
Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
%>
<%
	request.setCharacterEncoding("UTF-8");

   
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");

	

	
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost/foodlab?&useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&serverTimezone=UTC&useSSL=false"
	driver="com.mysql.cj.jdbc.Driver" user="labadmin" password="1234"/>

<sql:update dataSource="${dataSource}" var="resultSet">
   INSERT INTO member(email,password,username) VALUES (?, ?, ?)
   
   
   <sql:param value="<%=email%>" />
	<sql:param value="<%=password%>" />
	<sql:param value="<%=name%>" />
	
	
</sql:update>
<%
session.setAttribute("useremail", email);
%>

<c:if test="${resultSet>=1}">
	<c:redirect url="emailSendAction" />
</c:if> 

 > 


<%-- <c:if test="${resultSet>=1}">
	<c:redirect url="resultMember?msg=1" />
</c:if> 
 --%>


