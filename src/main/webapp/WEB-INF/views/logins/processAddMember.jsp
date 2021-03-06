<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "com.aj22.foodlab.dao.member.*" %>
<%@ page import = "com.aj22.foodlab.dto.MemberDTO" %>
<%@ page import = "java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.aj22.foodlab.util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />

<%-- Save information to DB when you sign up correctly and move on to email authentication procedures --%>
<%
	request.setCharacterEncoding("UTF-8");

   
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	int random = (int)((Math.random()*6))+1;
	

	MemberDTO member = new MemberDTO();
		member.setUsername(name);
		member.setPassword(password);
		member.setEmail(email);
		member.setProfile_img("http://158.247.206.153:8085/foodlab/resources/img/profile/profile_image"+random+".png");
		MemberDAOImpl MemberDAO = new MemberDAOImpl();
		int result = MemberDAO.insert(member);
		session.setAttribute("useremail", email);
		if(result>=1) {
			response.sendRedirect("emailSendAction");
		}
		

	
%>
