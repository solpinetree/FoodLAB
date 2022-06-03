<%@ page contentType="text/html; charset=utf-8"%>

<%-- session.invalidate --%>
<%
	session.invalidate();
	response.sendRedirect("login");
%>