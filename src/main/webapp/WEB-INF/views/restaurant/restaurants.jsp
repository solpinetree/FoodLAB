<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp" %>

<head>
    <title>맛집 정보</title>
    <link rel="stylesheet" href="${resources}/css/restaurant/restaurant.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7bd0f4b1049158f735df04c6710e2c5b&libraries=services"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body class="ov-hid">

    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
    <!-- Header Section-->
	<jsp:include page="../includes/header.jsp"/>

    <!-- Filter -->
    <jsp:include page="left-filter.jsp"/>

    <!-- Listing Section -->
   	<div id="restaurants-content"></div>
   	
    <!-- Map  -->
    <div class="listing__map" id="map"></div>

    <!-- Js Plugins -->
 	<%@ include file="../includes/plugins.jsp" %>
 	<script type="text/javascript" src="${resources}/js/nav-text-in-black.js"></script>
	<script type="text/javascript" src="${resources}/js/restaurant/kakaomap.js"></script>
	<script type="text/javascript" src="${resources}/js/restaurant/category.js"></script>
	<script type="text/javascript" src="${resources}/js/restaurant/search-click.js"></script>
	<script type="text/javascript" src="${resources}/js/restaurant/archive-process.js"></script>
	
</body>

</html>