<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp" %>


<head>
    <title>오늘의 서비스왕</title>
    <link rel="stylesheet" href="${resources}/css/restaurant/restaurant.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7bd0f4b1049158f735df04c6710e2c5b&libraries=services"></script>
</head>

<body class="ov-hid">
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
    <!-- Header Section-->
	<jsp:include page="../includes/header.jsp"/>
    
    <!-- 헤더의 배경화면이 흰색일 경우 -->
    <script type="text/javascript">
    	var element = document.querySelector('header');
    	element.classList.add('header--normal');
    	document.getElementById('header-logo-custom').src="${resources}/img/footer-logo.png";
    </script>

    <!-- Filter -->
    <jsp:include page="ranking-left-filter.jsp"/>

    <!-- Listing Section -->
   	<jsp:include page="ranking-right-listing.jsp"/>

    <!-- Map  -->
    <div class="listing__map" id="map"></div>

    <!-- Js Plugins -->
 	<%@ include file="../includes/plugins.jsp" %>
	<script type="text/javascript" src="${resources}/js/restaurant/kakaomap.js"></script>
</body>

</html>