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

<%
   request.setCharacterEncoding("UTF-8");
   String code = null;
   if(request.getParameter("code") != null) {
	   code = request.getParameter("code");
   }
  
   
   String userEmail = (String)session.getAttribute("useremail");
   boolean isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
   if(isRight == true) {
	   
	   
	   
	   String SQL = "UPDATE member SET userEmailChecked = true WHERE email = ?";    
    
       PreparedStatement pstmt = null; //특정한 SQL 문장을 수행 하도록 하는 class
       ResultSet rs = null; // 특정한 SQL 문장을 수행한 이후에 나온 결과값에 대해 처리하고자 할 때 사용하는 class
       try {                   
           pstmt = conn.prepareStatement(SQL); //conn 객체에서 prepareStatement를 실행하도록 준비
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
	   script.println("location.href = '../'");
	   script.println("</script>");
	   script.close();
	   return;
   } else {
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('회원가입을 실패하였습니다.');");
	   script.println("location.href = '../'");
	   script.println("</script>");
	   script.close();
	   return;
   }
 
 %>