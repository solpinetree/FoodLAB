<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp"%>

<head>
<title>푸드로그 작성</title>
<link rel="stylesheet" href="${resources}/css/review/review-write1.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7bd0f4b1049158f735df04c6710e2c5b&libraries=services"></script>
<script
	src="https://cdn.tiny.cloud/1/qemp52o2jujgbjw6eubqbb8f0f28on4enitcunnyhcpyhwhj/tinymce/6/tinymce.min.js"
	referrerpolicy="origin"></script>
<script>
  tinymce.init({
    selector: '#mytextarea',
   plugins: 'a11ychecker advcode casechange export formatpainter image editimage linkchecker autolink lists checklist media mediaembed pageembed permanentpen powerpaste table advtable tableofcontents tinycomments tinymcespellchecker',
   toolbar: 'a11ycheck addcomment showcomments casechange checklist code export formatpainter image editimage pageembed permanentpen table tableofcontents',
   toolbar_mode: 'floating',
   tinycomments_mode: 'embedded',
   tinycomments_author: 'Author name',
  });
</script>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<jsp:include page="../includes/header.jsp" />
	<!-- Header Section End -->

    <!-- 헤더의 배경화면이 흰색일 경우 -->
    <script type="text/javascript">
    	var element = document.querySelector('header');
    	element.classList.add('header--normal');
    	document.getElementById('header-logo-custom').src="${resources}/img/footer-logo.png";
    </script>


	<div class="container-fluid" style="margin-top: 200px;">
	    <div class="row justify-content-center">
	        <div class="col-11 col-sm-9 col-md-7 col-lg-6 col-xl-5 text-center p-0 mt-3 mb-2">
	            <div class="card px-0 pt-4 pb-0 mt-3 mb-3">
	                <form id="msform">
	                    <!-- progress bar -->
	                    <ul id="progressbar">
	                        <li class="active" id="account"><strong>주소 검색</strong></li>
	                        <li id="personal"><strong>썸네일 입력</strong></li>
	                        <li id="payment"><strong>리뷰 작성</strong></li>
	                        <li id="confirm"><strong>가격, 인원, 별점 등록</strong></li>
	                        <li id="confirm"><strong>작성 완료</strong></li>
	                    </ul>
	                  	<br> 
	                  	<!-- fieldsets 태그로 form들을 나눈다. -->
	                  	<!--  식당이름으로 식당 주소 입력받는 fieldset 시작 -->
	                    <fieldset>
	                        <div class="form-card">
	                            <label class="fieldlabels"></label> 
	                            <input type="text" name="address" id="address" style="width: 85%" placeholder="리뷰를 작성할 식당 이름을 입력해주세요." /> 
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
	                        <input type="button" name="next" class="next action-button" value="Next" />
	                    </fieldset>
	                    <!--  식당이름으로 식당 주소 입력받는 fieldset 끝 -->
	                    <fieldset>
	                        <div class="form-card">
	                            <div class="row">
	                                <div class="col-7">
	                                    <h2 class="fs-title">Personal Information:</h2>
	                                </div>
	                                <div class="col-5">
	                                    <h2 class="steps">Step 2 - 4</h2>
	                                </div>
	                            </div> <label class="fieldlabels">First Name: *</label> <input type="text" name="fname" placeholder="First Name" /> <label class="fieldlabels">Last Name: *</label> <input type="text" name="lname" placeholder="Last Name" /> <label class="fieldlabels">Contact No.: *</label> <input type="text" name="phno" placeholder="Contact No." /> <label class="fieldlabels">Alternate Contact No.: *</label> <input type="text" name="phno_2" placeholder="Alternate Contact No." />
	                        </div> <input type="button" name="next" class="next action-button" value="Next" /> <input type="button" name="previous" class="previous action-button-previous" value="Previous" />
	                    </fieldset>
	                    <fieldset>
	                        <div class="form-card">
	                            <div class="row">
	                                <div class="col-7">
	                                    <h2 class="fs-title">Image Upload:</h2>
	                                </div>
	                                <div class="col-5">
	                                    <h2 class="steps">Step 3 - 4</h2>
	                                </div>
	                            </div> <label class="fieldlabels">Upload Your Photo:</label> <input type="file" name="pic" accept="image/*"> <label class="fieldlabels">Upload Signature Photo:</label> <input type="file" name="pic" accept="image/*">
	                        </div> <input type="button" name="next" class="next action-button" value="Submit" /> <input type="button" name="previous" class="previous action-button-previous" value="Previous" />
	                    </fieldset>
	                    <fieldset>
	                        <div class="form-card">
	                            <div class="row">
	                                <div class="col-7">
	                                    <h2 class="fs-title">Image Upload:</h2>
	                                </div>
	                                <div class="col-5">
	                                    <h2 class="steps">Step 3 - 4</h2>
	                                </div>
	                            </div> <label class="fieldlabels">Upload Your Photo:</label> <input type="file" name="pic" accept="image/*"> <label class="fieldlabels">Upload Signature Photo:</label> <input type="file" name="pic" accept="image/*">
	                        </div> <input type="button" name="next" class="next action-button" value="Submit" /> <input type="button" name="previous" class="previous action-button-previous" value="Previous" />
	                    </fieldset>
	                    <fieldset>
	                        <div class="form-card">
	                            <div class="row">
	                                <div class="col-7">
	                                    <h2 class="fs-title">Finish:</h2>
	                                </div>
	                                <div class="col-5">
	                                    <h2 class="steps">Step 4 - 4</h2>
	                                </div>
	                            </div> <br><br>
	                            <h2 class="purple-text text-center"><strong>SUCCESS !</strong></h2> <br>
	                            <div class="row justify-content-center">
	                                <div class="col-3"> <img src="https://i.imgur.com/GwStPmg.png" class="fit-image"> </div>
	                            </div> <br><br>
	                            <div class="row justify-content-center">
	                                <div class="col-7 text-center">
	                                    <h5 class="purple-text text-center">You Have Successfully Signed Up</h5>
	                                </div>
	                            </div>
	                        </div>
	                    </fieldset>
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
		src="${resources}/js/review/review-write1.js"></script>
		<script type="text/javascript"
	src="${resources}/js/review/kakaomap.js"></script>
</body>

</html>
