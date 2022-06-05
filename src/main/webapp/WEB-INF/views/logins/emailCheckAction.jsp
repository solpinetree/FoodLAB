<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.aj22.foodlab.dto.*"%>
<%@ page import="com.aj22.foodlab.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%@ include file="../includes/common.jsp" %>
<%@ page import = "com.aj22.foodlab.dao.member.*" %>
<%@ page import = "com.aj22.foodlab.dto.MemberDTO" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />

<%-- Check email authentication as the final procedure for membership registration --%>

<%
   request.setCharacterEncoding("UTF-8");
   String code = null;
   if(request.getParameter("code") != null) { // The code is an encrypted string that has hashed user email
	   code = request.getParameter("code");
   }
  
   
   String userEmail = (String)session.getAttribute("useremail");
   boolean isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
   // If the encrypted value of the user's email is the same as the authentication value of the email
   if(isRight == true) {
	   
	   
	   // If the e-mail authentication is successful, change the user's e-mail authentication in the DB value to true
	   String SQL = "UPDATE member SET userEmailChecked = true WHERE email = ?";    
    
       PreparedStatement pstmt = null; //Class that lets you perform a specific SQL statements
       ResultSet rs = null; // The class you use to process results after performing a particular SQL statement
       try {                   
           pstmt = conn.prepareStatement(SQL); //Prepare to run prepareStatement on conn object
           pstmt.setString(1, userEmail);
           pstmt.executeUpdate();        
       } catch (Exception e) {
            e.printStackTrace();
       } finally { 
         try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
         try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
         try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
      }
       
   
      
	   
	   
	   
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('회원가입이 완료되었습니다.');");
	   script.println("location.href = 'resultMember?msg=1'"); // Member registration completed
	   script.println("</script>");
	   script.close();
	   return;
   } else {
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('회원가입을 실패하였습니다.');");
	   script.println("location.href = '../'"); // home
	   script.println("</script>");
	   script.close();
	   return;
   }
 
 %>