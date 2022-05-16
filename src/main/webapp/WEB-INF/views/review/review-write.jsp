<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp"%>

<head>
<title>푸드로그 작성</title>
<link rel="stylesheet" href="${resources}/css/review/stars.css">
<link rel="stylesheet" href="${resources}/css/review/image-upload.css">
<link rel="stylesheet" href="${resources}/css/review/review-write.css">
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7bd0f4b1049158f735df04c6710e2c5b&libraries=services"></script>
<!-- Include the Quill library -->
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<!-- Quill Image Resize Module -->
<script src="${resources}/js/review/quilleditor/image-resize.min.js"></script>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<jsp:include page="../includes/header.jsp" />
	<!-- Header Section End -->




	<div class="container-fluid" style="margin-top: 120px;">
	    <div class="row justify-content-center">
	        <div class="col-11 col-sm-9 col-md-7 col-lg-6 col-xl-5 text-center p-0 mt-3 mb-2">
	            <div class="card px-0 pt-4 pb-0 mt-3 mb-3">
	                <form id="msform" onsubmit="return false;">
	                    <!-- progress bar -->
	                    <ul id="progressbar">
	                        <li class="active" id="search"><strong>주소 검색</strong></li>
	                        <li id="thumbnail"><strong>썸네일 입력</strong></li>
	                        <li id="review"><strong>리뷰 작성</strong></li>
	                        <li id="personal"><strong>가격, 인원, 별점 등록</strong></li>
	                        <li id="confirm"><strong>작성 완료</strong></li>
	                    </ul>
	                  	<br> 
	                  	<!-- fieldsets 태그로 form들을 나눈다. -->
	                  	<!--  식당이름으로 식당 주소 입력받는 fieldset 시작 -->
	                    <fieldset>
	                        <div class="form-card">
	                            <label class="fieldlabels"></label> 
	                            <input type="text" name="address" id="address" style="width: 50%" onkeyup="enterkey()" placeholder="리뷰를 작성할 식당 이름을 입력해주세요." /> 
	                            <button type="button" class="searchButton">
	       							 <i class="fa fa-search"></i>
	   						 	</button>
	                        </div> 
	                        <!--  맵을 보여주는 div -->
			                <div class="map_wrap">
							    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
							
							    <div id="menu_wrap" class="bg_white">
							        <div class="option">
							        </div>
							        <ul id="placesList"></ul>
							        <div id="pagination"></div>
							    </div>
							</div>
	                        <button type="button" name="next" id="firstNextBtn" class="next action-button" style="visibility:hidden">NEXT</button>
	                    </fieldset>
	                    <!--  식당이름으로 식당 주소 입력받는 fieldset 끝 -->
	                    <!--  썸네일 입력받는 fieldset 시작 -->
	                    <fieldset>
	                        <div class="form-card">
								<!--  썸네일 고르는 div 시작-->
								<div class="image-upload-wrap">
									<input class="file-upload-input" type='file'
										onchange="readURL(this);" accept="image/*" />
									<div class="drag-text">
										<h3>+</h3>
									</div>
								</div>
								<div class="file-upload-content">
									<img class="file-upload-image" src="#" alt="your image" />
									<div class="image-title-wrap">
										<button type="button" onclick="removeUpload()" class="remove-image">
											Remove <span class="image-title">Uploaded Image</span>
										</button>
									</div>
								</div>
								<!--  썸네일 고르는 div 끝 -->
	                        </div> 
	                        <input type="button" name="next" class="next action-button" value="►" /> 
	                        <input type="button" name="previous" class="previous action-button-previous" value="◄" />
	                    </fieldset>
	                    <!--  썸네일 입력받는 fieldset 끝 -->  
	                    <fieldset>
	                        <div class="form-card">
		                        <input type="text" name="review-title" placeholder="이 리뷰의 제목을 입력해주세요" style="background-color: white; font-weight: 500"> 
	                            
	                            <!-- Quill Editor 시작 -->
	                             <div id="standalone-container" style="width:100%;height:100%;position:relative;overflow:hidden;">
							      <div id="toolbar-container">
							        <span class="ql-formats">
							          <button class="ql-bold"></button>
							          <button class="ql-italic"></button>
							          <button class="ql-underline"></button>
							          <button class="ql-strike"></button>
							        </span>
							        <span class="ql-formats">
							          <button class="ql-header" value="1"></button>
							          <button class="ql-header" value="2"></button>
							          <button class="ql-blockquote"></button>
							        </span>
							        <span class="ql-formats">
							          <button class="ql-list" value="ordered"></button>
							          <button class="ql-list" value="bullet"></button>
							          <button class="ql-indent" value="-1"></button>
							          <button class="ql-indent" value="+1"></button>
							        </span>
							        <span class="ql-formats">
							          <button class="ql-image"></button>
							        </span>
							        <span class="ql-formats">
							          <button class="ql-clean"></button>
							        </span>
							      </div>
							      <div id="editor-container"></div>
							    </div>
							    <!-- Quill Editor 끝 -->
	
	                        </div> 
	                        
	                        <input type="button" name="next" id="review-title-next-btn" class="next action-button" value="►" onclick="showDelta()"/> 
	                        <input type="button" name="previous" class="previous action-button-previous" value="◄" />
	                    </fieldset>
	                    <!--  리뷰 작성하는 fieldset 끝 -->
	                    <!--  가격, 인원, 별점을 등록하는 fieldset 시작 -->
	                    <fieldset>
	                        <div class="form-card" style="text-align:left;">
	                              <div class="col-7">
                                    <h2 class="fs-title" id="place-name"></h2>
                                    <p  id="road-address-name"></p>
                                </div><br><br>
	                            <label class="fieldlabels">인원</label> 
	                            <input type="text" name="people">
	                            <label class="fieldlabels">가격 만족도</label> 
                                <div class="cont">
									<div class="stars">
								      <input class="star star-5" id="star-5" type="radio" name="price-star" value="5"/>
								      <label class="star star-5" for="star-5"></label>
								      <input class="star star-4" id="star-4" type="radio" name="price-star" value="4"/>
								      <label class="star star-4" for="star-4"></label>
								      <input class="star star-3" id="star-3" type="radio" name="price-star" value="3"/>
								      <label class="star star-3" for="star-3"></label>
								      <input class="star star-2" id="star-2" type="radio" name="price-star" value="2"/>
								      <label class="star star-2" for="star-2"></label>
								      <input class="star star-1" id="star-1" type="radio" name="price-star" value="1"/>
								      <label class="star star-1" for="star-1"></label>
									</div>
								</div>
	                            <label class="fieldlabels">별점</label> 
							    <div class="cont">
								    <div class="stars">
								      <input class="star star-5" id="star-5-2" type="radio" name="rate-star" value="5"/>
								      <label class="star star-5" for="star-5-2"></label>
								      <input class="star star-4" id="star-4-2" type="radio" name="rate-star" value="4"/>
								      <label class="star star-4" for="star-4-2"></label>
								      <input class="star star-3" id="star-3-2" type="radio" name="rate-star" value="3"/>
								      <label class="star star-3" for="star-3-2"></label>
								      <input class="star star-2" id="star-2-2" type="radio" name="rate-star" value="2"/>
								      <label class="star star-2" for="star-2-2"></label>
								      <input class="star star-1" id="star-1-2" type="radio" name="rate-star" value="1"/>
								      <label class="star star-1" for="star-1-2"></label>
								    </div>
							    </div>
	                        </div> 
	                        <input type="button" name="next" class="next action-button" value="Submit" /> 
	                        <input type="button" name="previous" class="previous action-button-previous" value="◄" />
	                    </fieldset>
	                    <!--  가격, 인원, 별점을 등록하는 fieldset 끝 -->
	                    <!--  미리보기 fieldset 시작 -->
	                    <fieldset>
	                        <div class="form-card">
	                           <br><br>
	                            <h2 class="purple-text text-center"><strong>작성 완료!</strong></h2> <br>
	                            <div class="row justify-content-center">
	                                <div class="col-3"> <img src="https://i.imgur.com/GwStPmg.png" class="fit-image"> </div>
	                            </div> <br><br>
	                            <div class="row justify-content-center">
	                                <div class="col-7 text-center">
	                                    <h5 class="purple-text text-center">잠시 후 방금 작성한 리뷰 페이지로 이동합니다.</h5>
	                                </div>
	                            </div>
	                        </div>
	                    </fieldset>
	                    <!--  미리보기 fieldset 끝 -->
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
	<script type="text/javascript"
		src="${resources}/js/review/kakaomap.js"></script>
	<script type="text/javascript"
		src="${resources}/js/review/quilleditor/quill-config.js"></script>
</body>
</html>