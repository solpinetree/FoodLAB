<%@ page contentType="text/html; charset=utf-8"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />
<%@ page import="com.aj22.foodlab.dto.*"%>

<%
	session.invalidate();
	response.sendRedirect("login");
%>