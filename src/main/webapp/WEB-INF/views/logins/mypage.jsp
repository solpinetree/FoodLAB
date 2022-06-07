<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/login/NewFile.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/common.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>mypage</title>
        <%-- My Page, a collection of user's writing and user information --%>
</head>
<jsp:useBean id="sessionMember" scope="session" class="com.aj22.foodlab.dto.MemberDTO" type="com.aj22.foodlab.dto.MemberDTO"/>
    <body>
    <% String username = sessionMember.getUsername(); %>
    <% String profile_img = sessionMember.getProfile_img(); %>
        <!-- Responsive navbar-->
        <jsp:include page="../includes/header.jsp" />
        <c:choose>
        <c:when test="${empty sessionMember.email}">
		<%-- If you are not logged in --%>
        <header class="py-5 bg-image-full">
            <div class="text-center my-5">
                <img class="img-fluid rounded-circle mb-4" src="https://dummyimage.com/150x150/6c757d/dee2e6.jpg" alt="..." />
                <h1 class="text-black fs-3 fw-bolder">Hello</h1>
            </div>
        </header>
        
        <!-- Content section-->
        <section class="py-5">
            <div class="container my-5">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <h2>정보 수정</h2>
                        <%-- Modify simple information such as nicknames --%>
                        <p class="lead">A single, lightweight helper class allows you to add engaging, full width background images to sections of your page.</p>
                        <p class="mb-0">The universe is almost 14 billion years old, and, wow! Life had no problem starting here on Earth! I think it would be inexcusably egocentric of us to suggest that we're alone in the universe.</p>
                    </div>
                </div>
            </div>
            
           
        </section>
         </c:when>
        <c:otherwise>
        <%-- When you log in correctly --%>
        <div class="mypage_border">
        <%-- border --%>

        <header class="py-5 bg-image-full">
            <div class="text-center my-5">
                <img class="img-fluid rounded-circle mb-4" src="<%= profile_img %>" alt="..." />
                <h2 class="text-black fs-3 fw-bolder"><%= username %></h2>
            </div>
        </header>
        
        <!-- Content section-->

            
           </div>

        </c:otherwise>
        </c:choose>
        
        
        <!-- Footer-->

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
            <!-- Js Plugins -->
 	<%@ include file="../includes/plugins.jsp" %>
 	<script type="text/javascript" src="${resources}/js/nav-text-in-black.js"></script>
        <script type="text/javascript" src="${resources}/js/mypagescripts.js"></script>
    </body>
</html>
