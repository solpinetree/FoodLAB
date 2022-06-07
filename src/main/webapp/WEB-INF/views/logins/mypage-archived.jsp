<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp" %>

 
 <script type="text/javascript" src="${resources}/js/login/mypage-archived.js"></script>
 <script type="text/javascript" src="${resources}/js/restaurant/archived-process.js"></script>

<body>

	<!-- Tab links -->
	<div class="tab">
	  <button class="tablinks" onclick="openCity(event, 'London')">내가 찜한 식당</button>
	  <button class="tablinks" onclick="openCity(event, 'Paris')">좋아요 누른 게시물</button>
	</div>
	
	<!-- Tab content -->
	<div id="London" class="tabcontent">
	  <jsp:include page="restaurant-archived.jsp"/>
	</div>
	
	<div id="Paris" class="tabcontent">
	  <jsp:include page="review-archived.jsp"/>
	</div>
	

</body>

