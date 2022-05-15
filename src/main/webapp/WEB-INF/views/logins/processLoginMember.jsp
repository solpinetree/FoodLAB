<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="dto.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String name = "lll";
%>

<%
String DB_PROPERTIES = "?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true"; // MySQL Connector J 8.0
String DB_SCHEMAS = "foodlab";
String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver"; // deprecated "com.mysql.jdbc.Driver";  // try "com.mysql.cj.jdbc.Driver"
String DB_URL = "jdbc:mysql://localhost/" + DB_SCHEMAS + DB_PROPERTIES; 
String USER = "labadmin";
String PASS = "1234";

Class.forName(JDBC_DRIVER);
Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
		
String sql = "select * from member";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			name = rs.getString("username");
		}
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
	MemberBean member= new MemberBean();
	member.setEmail(email);
	member.setPassword(password);
	member.setNickname(name);
		session.setAttribute("sessionemail", email);
		session.setAttribute("sessionpassword", password);
		session.setAttribute("sessionname", name);
		session.setAttribute("user",member);
	%>
	<c:redirect url="resultMember?msg=2" />
</c:forEach>

<c:redirect url="login?error=1" />