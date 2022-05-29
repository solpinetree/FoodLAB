<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.Address" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Authenticator" %>
<%@ page import="java.util.Properties" %>

<%@ page import="com.aj22.foodlab.util.*"%>

<%@ page import="java.io.PrintWriter"%>
<%@ include file="../includes/common.jsp" %>
<%@ include file="../includes/login/NewFile1.jsp" %>
<%
//Type the message you want to send to the user.

	String host = "http://localhost:8085/foodlab/";
	String from = "foodLAB1357@gmail.com";
	String to = (String)session.getAttribute("useremail");
	String subject = "FoodLAB 회원가입을 위한 이메일 확인 메일입니다.";
	String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." + // Send code to emailCheckAction
		"<a href='" + host + "logins/emailCheckAction?code=" + new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";
		
		
		// Fill in the information for accessing SMTP.

		   Properties p = new Properties();
	   p.put("mail.smtp.user", from);
	   p.put("mail.smtp.host", "smtp.googlemail.com");
	   p.put("mail.smtp.port", "456");
	   p.put("mail.smtp.starttls.enable", "true");
	   p.put("mail.smtp.auth", "true");
	   p.put("mail.smtp.ssl.protocols", "TLSv1.2"); 	
	   p.put("mail.smtp.debug", "true");
	   p.put("mail.smtp.socketFactory.port", "465");
	   p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	   p.put("mail.smtp.socketFactory.fallback", "false");
	 
		// Send confirmation link to user email
		try {
		   Authenticator auth = new Gmail();
		   Session ses = Session.getInstance(p, auth);
		   ses.setDebug(true);
		   MimeMessage msg = new MimeMessage(ses);
		   msg.setSubject(subject);
		   Address fromAddr = new InternetAddress(from);
		   msg.setFrom(fromAddr);
		   Address toAddr = new InternetAddress(to);
		   msg.addRecipient(Message.RecipientType.TO, toAddr);
		   msg.setContent(content, "text/html;charset=UTF8");
		   Transport.send(msg);
		   
	   } catch (Exception e) {
		   e.printStackTrace();
		   PrintWriter script = response.getWriter();
		   script.println("<script>");
		   script.println("alert('오류가 발생했습니다..');");
		   script.println("history.back();");
		   script.println("</script>");
		   script.close();
		   return;
	   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="./css/bootstrap.min.css">
 <link rel="stylesheet" href="./css/custom.css">
<title>Insert title here</title>
</head>
<body>

    

        <!-- Top content -->
        <div class="top-content top-padding-login" style="background-color:white ;">
        	
            <div class="inner-bg">
                <div class="container" style="margin-top:60px;">
                	
               
                    
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2">
                        	
                        	<div class="form-box" style="width:500px; margin:80 auto;" >
	                        	<div class="form-top" style="border:1px solid #e3e3e3">
	                        		<div class="form-top-left">
	                        			<h3>FoodLab에 로그인하세요</h3>
	                            		<p>이메일 인증번호를 보냄.</p>
	                            		<p>이메일 인증까지 마쳐야 회원가입이 완료됩니다.</p>
	                        		</div>
	                        		<div class="form-top-right">
	                        			<i class="fa fa-key"></i>
	                        		</div>
	                            </div>
	               
	                            
		                    </div>
		                
		                	
	                        
                        </div>
                        
                       
                    </div>
                    
                </div>
            </div>
            
        </div>

        <!-- Footer -->
        <!--  style="background-color:#19b9e7;" -->
        <footer style="background-color:#F9ADBD;">
        	
        </footer>

        <!-- Javascript -->
        <script type="text/javascript" src="${resources}/js/login/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="${resources}/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${resources}/js/login/jquery.backstretch.min.js"></script>
        <script type="text/javascript" src="${resources}/js/login/scripts.js"></script>
       
        <!--[if lt IE 10]>
            <script src="..resources/js/placeholder.js"></script>
        <![endif]-->

</body>
</html>