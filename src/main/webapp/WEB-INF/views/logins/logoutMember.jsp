<%@ page contentType="text/html; charset=utf-8"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />
<%@ page import="com.aj22.foodlab.dto.*"%>
<jsp:useBean id="sessionMember" scope="session" class="com.aj22.foodlab.dto.MemberDTO" type="com.aj22.foodlab.dto.MemberDTO"/>

	<jsp:setProperty name="sessionMember" property="id" value=""/>
	<jsp:setProperty name="sessionMember" property="email" value=""/>
	<jsp:setProperty name="sessionMember" property="username" value=""/>
<%
	session.invalidate();
	response.sendRedirect("login");
%>