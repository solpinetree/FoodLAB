<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.aj22.foodlab.dto.*"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />
<jsp:useBean id="sessionMember" scope="session" class="com.aj22.foodlab.dto.MemberDTO" type="com.aj22.foodlab.dto.MemberDTO"/>

<header class="header">


<%
	String username = sessionMember.getUsername();
	String profile_img = sessionMember.getProfile_img();
%>


    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <c:if test="${param.isIndex ne 'true'}">
                    <div>${param.isIndex}</div>
                    <div class="header__logo">
                       <a href = "${root}/"><img src="${resources}/img/logos/foodlabLogo.png" style="width: 273px;height: 70px; top:10px" alt="foodLAB"></a>
                    </div>
                </c:if>
            </div>
            <div class="col-lg-9 col-md-9">
                <div class="header__nav">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="${root}/">홈</a></li>
                            <li>
                                <a href="${root}/reviews/list">리뷰 보기</a>
                                <c:if test="${sessionScope.sessionMember.username ne null}">
                                    <ul class="dropdown">
                                        <li>
                                            <a href="${root}/reviews/write">리뷰 작성</a>
                                        </li>
                                    </ul>
                                </c:if>
                            </li>
                            <li><a href="${root}/restaurants/list">식당 탐색</a> </li>
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
                        <a href="${root}/logins/mypage" class="login-btn"><img class="img-fluid rounded-circle mb-2" src="<%= profile_img %>" alt="..." /></a>
                    </div>
                  </c:otherwise>
                  </c:choose>
                  
                </div>
            </div>
        </div>
        <div id="mobile-menu-wrap"></div>
    </div>
</header>