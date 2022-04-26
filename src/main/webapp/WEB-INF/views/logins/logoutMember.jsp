<%@ page contentType="text/html; charset=utf-8"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />

<%
	session.invalidate();
	response.sendRedirect("login");
%>