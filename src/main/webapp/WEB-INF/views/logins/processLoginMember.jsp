<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.aj22.foodlab.dao.member.*" %>
<%@ page import = "com.aj22.foodlab.dto.MemberDTO" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="com.aj22.foodlab.dto.*"%>


<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	MemberDTO member = new MemberDTO();
	MemberDAOImpl MemberDAO = new MemberDAOImpl();
	member = MemberDAO.select(email);
%>




<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost/foodlab?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true"
	driver="com.mysql.cj.jdbc.Driver" user="labadmin" password="1234" />


<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM member WHERE email=? and password=?  
    <sql:param value="<%=email%>" />
	<sql:param value="<%=password%>" />
</sql:query>

<jsp:useBean id="sessionMember" scope="session" class="com.aj22.foodlab.dto.MemberDTO" type="com.aj22.foodlab.dto.MemberDTO"/>

<c:forEach var="row" items="${resultSet.rows}">
	<jsp:setProperty name="sessionMember" property="id" value="${row.member_id}"/>
	<jsp:setProperty name="sessionMember" property="email" value="${row.email}"/>
	<jsp:setProperty name="sessionMember" property="username" value="${row.username}"/>
	<jsp:setProperty name="sessionMember" property="userEmailChecked" value="${row.userEmailChecked}"/>
	<c:redirect url="resultMember?msg=2" />
</c:forEach>

<c:redirect url="login?error=1" />