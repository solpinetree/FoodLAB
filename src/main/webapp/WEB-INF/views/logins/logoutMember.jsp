<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.*"%>

<%
	session.invalidate();
	response.sendRedirect("login");
%>