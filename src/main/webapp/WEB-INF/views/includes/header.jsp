<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.aj22.foodlab.dto.*"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />
<jsp:useBean id="sessionMember" scope="session" class="com.aj22.foodlab.dto.MemberDTO" type="com.aj22.foodlab.dto.MemberDTO"/>

<header class="header">


<%

	String username = sessionMember.getUsername();

%>


    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="header__logo">
                <!--  style="width: 191px;height: 44px;" -->
                   <a href = "${root}/"><img src="${resources}/img/logos/logo.png" style="width: 273px;height: 70px;" alt="foodLAB"></a>
                </div>
            </div>
            <div class="col-lg-9 col-md-9">
                <div class="header__nav">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="${root}/">홈</a></li>
                            <li><a href="${root}/reviews/list">푸드로그</a> </li>
                            <li><a href="${root}/restaurants/list">맛집 정보</a> </li>
                            <li><a href="${root}/chat">푸드톡</a></li>
                        </ul>
                    </nav>
                    <%-- 로그인/로그아웃 --%>

                    
                  <c:choose>
                  <c:when test="${empty sessionMember.username}">
                   <div class="header__menu__right">
                        <a href="${root}/logins/login" class="primary-btn">로그인/회원가입</a>
                       
                    </div>
                  </c:when>
                  <c:otherwise>
                   <div class="header__menu__right">
                        <a href="${root}/logins/logoutMember" class="primary-btn">로그아웃</a>
                        <a href="${root}/logins/mypage" class="login-btn"><i class="fa fa-user" style="line-height: inherit"></i></a>
                    </div>
                  </c:otherwise>
                  </c:choose>
                  
                </div>
            </div>
        </div>
        <div id="mobile-menu-wrap"></div>
    </div>
</header>