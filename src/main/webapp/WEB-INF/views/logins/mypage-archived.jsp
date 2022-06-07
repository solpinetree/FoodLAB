<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 
 <script type="text/javascript" src="${resources}/js/login/mypage-archived.js"></script>
 <script type="text/javascript" src="${resources}/js/restaurant/archived-process.js"></script>

<body>

	<!-- Tab links -->
	<div class="tab">
	  <button class="tablinks first-tabl" style="margin-left: 45.5%; font-size: 26px" onclick="openCity(event, 'London')"><span class="icon_archive_alt"></span></button>
	  
	  <button class="tablinks" onclick="openCity(event, 'Paris')"style="font-size: 26px">
	  	<span class='icon_heart'></span>
	  </button>
	</div>
	
	<!-- Tab content -->
	<div id="London" class="tabcontent">
	  <jsp:include page="restaurant-archived.jsp"/>
	</div>
	
	<div id="Paris" class="tabcontent">
	  <jsp:include page="review-archived.jsp"/>
	</div>
	

</body>

