<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp" %>


<head>
    <title>맛집 정보</title>
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

    <!-- Filter -->
    <jsp:include page="left-filter.jsp"/>

    <!-- Listing Section -->
   	<jsp:include page="right-listing.jsp"/>
   	
    <!-- Map  -->
    <div class="listing__map" id="map"></div>
    

	<script type="text/javascript">
		//이전 버튼 이벤트
		function fn_prev(page) {
			loadUrl(page-1);
		}

	  	//페이지 번호 클릭
		function fn_pagination(page) {
			loadUrl(page);	
		}

		//다음 버튼 이벤트
		function fn_next(page) {
			loadUrl(page+1);
		}
		
		function loadUrl(page){
			var url = "${root}/restaurants/list";
			url = url + "?currentPage=" + page;
			location.href = url;
		}
	</script>

    

    <!-- Js Plugins -->
 	<%@ include file="../includes/plugins.jsp" %>
 	<script type="text/javascript" src="${resources}/js/nav-text-in-black.js"></script>
	<script type="text/javascript" src="${resources}/js/restaurant/kakaomap.js"></script>
</body>

</html>