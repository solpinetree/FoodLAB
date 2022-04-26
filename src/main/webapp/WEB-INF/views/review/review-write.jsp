<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp"%>

<head>
<title>오픈 채팅</title>
<link rel="stylesheet" href="${resources}/css/review/review-write.css">
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

	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-area set-bg"
		data-setbg="${resources}/img/blog/blog-large.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>리뷰작성</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- 메인 바디 시작 -->
	<section class="blog-section spad">
		<div class="file-upload">
			<form action="#" class="contact__form">
				
				
				<!--  썸네일 고르는 div 시작-->
				<div class="image-upload-wrap">
					<input class="file-upload-input" type='file'
						onchange="readURL(this);" accept="image/*" />
					<div class="drag-text">
						<h3>드래그 하거나 클릭 해서 썸네일 업로드 하기</h3>
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

				<div style="margin-top:20px; margin-bottom: 20px;"><span class="icon_document_alt" style="font-weight: bold;">&nbsp;리뷰를 작성해주세요</span></div>
				
				<textarea id="mytextarea" placeholder="리뷰를 작성해주세요."></textarea>
				
				<div style="margin-top:20px;"><span class="icon_pin_alt" style="font-weight: bold;">&nbsp;식당 검색 후 클릭해주세요</span></div>
                
				<!--  카카오 지도 시작 -->
				<div class="map_wrap" style="margin-bottom: 20px; margin-top: 20px;'">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				    <div id="menu_wrap" class="bg_white">
				        <div class="option">
				            <div>
				                <form onsubmit="searchPlaces(); return false;">
				                    키워드 : <input type="text" value="단국대 피크닉" id="keyword" size="15"> 
				                    <button type="submit">검색하기</button> 
				                </form>
				            </div>
				        </div>
				        <hr>
				        <ul id="placesList"></ul>
				        <div id="pagination"></div>
				    </div>
				</div>
				<!--  카카오 지도 끝  -->
				<button type="submit" class="site-btn" style="margin-top:50px; width:100%;">리뷰 업로드하기</button>
			</form>
		</div>

		
	

	</section>
	<!-- 메인 바디 끝 -->



	<!-- Footer Section Begin -->
	<jsp:include page="../includes/footer.jsp" />
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="../includes/plugins.jsp"%>
	<script type="text/javascript"
		src="${resources}/js/review/review-write.js"></script>
		<script type="text/javascript"
	src="${resources}/js/review/kakaomap.js"></script>
</body>

</html>