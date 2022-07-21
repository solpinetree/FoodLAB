<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp"%>

<head>
<title>푸드랩 | 리뷰 작성</title>
<link rel="stylesheet" href="${resources}/css/review/stars.css">
<link rel="stylesheet" href="${resources}/css/review/image-upload.css">
<link rel="stylesheet" href="${resources}/css/review/review-write.css">
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7bd0f4b1049158f735df04c6710e2c5b&libraries=services"></script>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<jsp:include page="../includes/header.jsp" />
	<!-- Header Section End -->

	<%
		request.setCharacterEncoding("utf-8");
	%>


	<div class="container-fluid" style="margin-top: 80px;">
		<div class="row justify-content-center">
			<div class="col-11 col-sm-9 col-md-7 col-lg-6 col-xl-5 text-center p-0 mt-3 mb-2">
				<div class="card px-0 pt-4 pb-0 mt-3 mb-3">
					<form id="msform" name="reviewForm" method="post" enctype="multipart/form-data" action="${root}/reviews/writeProcess">
						<!-- progress bar -->
						<ul id="progressbar">
							<li class="active" id="search"><strong>식당 검색</strong></li>
							<li id="confirm"><strong>사진 첨부</strong></li>
							<li id="review"><strong>리뷰 작성</strong></li>
							<li id="personal"><strong>별점 등록</strong></li>
						</ul>
						<!-- fieldsets 태그로 form들을 나눈다. -->

						<!--  식당이름으로 식당 주소 입력받는 fieldset 시작 -->
					 	<fieldset>
							<div class="form-card">
								<label class="fieldlabels"></label> 
								<input type="text" name="address" id="address" style="width: 50%"
									onkeyup="enterkey()" placeholder="" />
								<button type="button" class="searchButton">
									<i class="fa fa-search"></i>
								</button>
							</div>
							<!-- 맵을 보여주는 div -->
							<div class="map_wrap">
								<div id="map"
									style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

								<div id="menu_wrap" class="bg_white">
									<div class="option"></div>
									<ul id="placesList"></ul>
									<div id="pagination"></div>
								</div>
							</div>
							<button type="button" name="next" id="firstNextBtn"
								class="next action-button" onclick="next(this)"
								style="visibility: hidden">NEXT</button>
						</fieldset>  
						<!-- 식당이름으로 식당 주소 입력받는 fieldset 끝 -->

						<!--       사진 첨부 fieldset 시작 -->
						<jsp:include page="review-write-image-upload.jsp"/>
						<!--       사진 첨부 fieldset 끝 -->

						<!--       리뷰 작성 fieldset 시작 -->
						<jsp:include page="review-write-text.jsp"/>
						<!--       리뷰 작성 fieldset 끝 -->

						<!--       별점을 등록하는 fieldset 시작  -->
						<fieldset>

							<div class="form-card" style="text-align: left; height: 50vh;">
								<div class="col-7">
									<h2 class="fs-title" id="place-name"></h2>
									<p id="road-address-name"></p>
								</div>
								<input type="hidden" name="restaurantName" id="restaurantName"/>
								<br>
								<div class="cont" style="max-width: 479px;">
									<div class="stars" style="width: 68%">
										<input class="star star-5"
											id="star-5 star" type="radio" name="rate" value="5" onclick="allowSubmit()"/>
										<label class="star star-5" for="star-5 star" ></label>
										<input class="star star-4"
											   id="star-4 star" type="radio" name="rate" value="4" onclick="allowSubmit()"/>
										<label class="star star-4" for="star-4 star" ></label>
										<input class="star star-3"
											   id="star-3 star" type="radio" name="rate" value="3" onclick="allowSubmit()"/>
										<label class="star star-3" for="star-3 star"></label>
										<input class="star star-2"
											id="star-2 star" type="radio" name="rate" value="2" onclick="allowSubmit()"/>
										<label class="star star-2" for="star-2 star"></label>
										<input class="star star-1"
											   id="star-1 star" type="radio" name="rate" value="1" onclick="allowSubmit()"/>
										<label class="star star-1"
											for="star-1 star"></label>
									</div>
								</div>
							</div>

							<input type="submit" name="next" id="submitBtn"
								class="next action-button submitBtn" value="SUBMIT" style="display:none;" />
							<input
								type="button" name="previous"
								class="previous action-button-previous" value="PREVIOUS" />
							<input type="hidden" name="writerId" value="${sessionScope.sessionMember.id}"/>
						</fieldset>
						<!--   별점을 등록하는 fieldset 끝 -->
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer Section Begin -->
	<jsp:include page="../includes/footer.jsp" />
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="../includes/plugins.jsp"%>
	<script type="text/javascript"
		src="${resources}/js/nav-text-in-black.js"></script>
	<script type="text/javascript"
		src="${resources}/js/review/image-upload.js"></script>
	<script type="text/javascript"
		src="${resources}/js/review/review-write1.js"></script>
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	<script type="text/javascript"
		src="${resources}/js/review/review-write-swiper.js"></script>
	<script type="text/javascript"
		src="${resources}/js/review/kakaomap.js"></script>
</body>
</html>