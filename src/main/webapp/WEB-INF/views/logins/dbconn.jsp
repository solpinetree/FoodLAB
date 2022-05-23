
<%@ page import="java.sql.*" %>
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
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>