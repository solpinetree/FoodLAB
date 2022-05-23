<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="menucss.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<header class="header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="header__logo">
                    <h1 style = "color: #f03250"><a href = "${root}/">FOOD LAB</a></h1>
                </div>
            </div>
            <div class="col-lg-9 col-md-9">
                <div class="header__nav">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li class="active"><a href="${root}/">Home</a></li>
                            <li><a href="#">리뷰</a>
                                <ul class="dropdown">
                                    <li><a href="${root}/reviews/write">리뷰 작성</a></li>
                                    <li><a href="${root}/reviews/list">리뷰 보기</a></li>
                                </ul>
                            </li>
                            <li><a href="#">맛집 추천</a>
                                <ul class="dropdown">
                                    <li><a href="${root}/restaurants/list">맛집 정보</a></li>
                                    <li><a href="./listing-details.html">오늘의 서비스왕</a></li>
                                </ul>
                            </li>
                            <li><a href="${root}/chat">오픈채팅</a></li>
                        </ul>
                    </nav>
                    <%-- 로그인/로그아웃 --%>
                  <c:choose>
                  <c:when test="${empty sessionId}">
                   <div class="header__menu__right">
                        <a href="${root}/logins/login" class="primary-btn">로그인/회원가입</a>
                       
                    </div>
                  </c:when>
                  <c:otherwise>
                   <div class="header__menu__right">
                        <a href="${root}/logins/logoutMember" class="primary-btn">로그아웃</a>
                        <a href="${root}/logins/mypage" class="login-btn"><i class="fa fa-user"></i></a>
                    </div>
                  </c:otherwise>
                  </c:choose>
                 
                </div>
            </div>
        </div>
        <div id="mobile-menu-wrap"></div>
    </div>
</header>