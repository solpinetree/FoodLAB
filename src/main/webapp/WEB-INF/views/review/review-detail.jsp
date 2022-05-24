<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp"%>

<head>
<title>${review.title}</title>
<link rel="stylesheet" href="${resources}/css/review/review-detail.css">
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

    <!-- Blog Hero Begin -->
    <div class="blog-details-hero set-bg" style="background-color:black;">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="blog__hero__text">
                        <h2>${review.title}</h2>
                        <ul>
                            <li><i class="fa fa-clock-o"></i>${review.createdAt}</li>
                            <li><i class="fa fa-user"></i> ${ review.writer.username} </li>
                            <li class="heart-icon-li">
	                            <c:choose>
				                    <c:when test="${empty sessionScope.sessionMember.username }"><%-- 비회원이라면 --%>
				                    	<img class="heart-icon" src="${resources }/img/icon/heart-red.png" alt="좋아요"/>
				                    </c:when>
				                    <c:otherwise><%-- 회원이라면 --%>
				                		<img title="좋아요를 눌러주세요!" id="heart-icon" class="heart-icon heart-icon-click" src="${heartImgUrl}" alt="좋아요"/>
				                    </c:otherwise>
			                    </c:choose>
		                 	</li>
		                 	<li id="likes-count">${fn:length(review.membersIdsWhoLike) }</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="listing__hero__btns">
	                	<c:if test="${sessionScope.sessionMember.id == review.writer.id }">
	                       <button onclick="confirmDelete()" class="primary-btn"> 삭제하기</button>
	                    </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Blog Hero End -->
    
    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                 <div class="blog__details__text" style="margin-bottom: 50px; height: 300px; overflow: visible;">
                     <div style="position: relative; float:left;">${review.content }</div>
                 </div>
                  
                  <hr>
                 
	             <div class="listing__details__comment" style="display:inline-block">
             		<h4>댓글</h4>
	              
	                <div class="listing__details__comment__item">
	                    <div class="listing__details__comment__item__pic">
	                        <img src="${resources }/img/defaultProfile.jpeg" alt="">
	                    </div>
	                    <div class="listing__details__comment__item__text">
	                        <span>5/18/2022 2:44</span>
	                        <h5>죽전 맛집 탐방러</h5>
	                        <p>1호점 맞나요?</p>
	                        <ul>
	                            <li><i class="fa fa-share-square-o"></i> 대댓글 달기</li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
                
                <c:if test="${!empty sessionScope.sessionMember.username}">
	               	<div class="listing__details__review">
	                    <form action="#">
	                        <textarea placeholder="댓글을 남겨주세요!"></textarea>
	                        <button type="submit" class="site-btn">댓글 달기</button>
	                    </form>
	                </div>
                </c:if>
                
                
                </div>
               
               
                <div class="col-lg-4">
                    <div class="blog__sidebar">
	                    <div class="rate-box">
	                      	<div class="listing__hero__widget">
	                    			<div class="star-category">가격 만족도</div>
	                                <div class="listing__hero__widget__rating">
	                                	<c:if test="${ review.priceSatisfaction ne null }">
		                                	<c:forEach var="i" begin="1" end="${ review.priceSatisfaction }" >
		                                		<span class="star-rate-icon icon_star"></span>
		                                	</c:forEach>
		                                	<c:if test="${review.priceSatisfaction<5} ">
		                                		<c:forEach var="i" begin="${review.priceSatisfaction + 1 }" end="5">
		                                			<span class="star-rate-icon icon_star_alt"></span>
		                                		</c:forEach>
		                                	</c:if>
	                                	</c:if>
	                                </div>
	                         </div>	
	                         
	                    	<div class="listing__hero__widget">
	                    		<div  class="star-category">평점</div>
	                       		 <div class="listing__hero__widget__rating">
                                	<c:if test="${ review.rate ne null }">
	                                	<c:forEach var="i" begin="1" end="${ review.rate }" >
	                                		<span class="star-rate-icon icon_star"></span>
	                                	</c:forEach>
                                		<c:if test="${review.rate <5} ">
	                                		<c:forEach var="i" begin="${review.rate + 1 }" end="5">
	                                			<span class="star-rate-icon icon_star_alt"></span>
	                                		</c:forEach>
	                                	</c:if>
                                	</c:if>
	                            </div>	
	                         </div>
	                    </div>
                  	
                    	
                    	 <c:if test="${ review.restaurant ne null }">
	                    	<div class="listing__sidebar__contact">
	                            <div class="listing__sidebar__contact__map" id="review-detail-map" style="border-radius: 40px 40px 0 0;">
	                            </div>
	                            <div class="listing__sidebar__contact__text">
	                                <h4>${review.restaurant.name }</h4>
	                                <ul>
                                		<c:if test="${!empty review.restaurant.category}">
	                                    	<li><span>${review.restaurant.category }</span></li><br><br>
                                    	</c:if>
	                                    <li><span class="icon_pin_alt"></span> ${review.restaurant.address }</li>
	                                    <li><span class="icon_phone"></span>  ${review.restaurant.tel }</li>
                                    	<c:if test="${review.restaurant.avgRate ne 0.0}">
		                                    <li>
	                                    	<span>평점 </span> 
                                    		<c:forEach var="i" begin="1" end="5" >
                                    			<c:if test="${review.restaurant.avgRate>i}">
			                                		<span class="star-rate-icon icon_star"></span>
			                                		<c:if test="${review.restaurant.avgRate < i+1}">
			                                			<c:if test="${review.restaurant.avgRate > i+0.3 }">
			                                				<c:if test="${review.restaurant.avgRate < i+0.7 }">
			                                					<span class="star-rate-icon icon_star_half"></span>
			                                				</c:if>
			                                				<c:if test="${review.restaurant.avgRate > i+0.7 }">
			                                					<span class="star-rate-icon icon_star"></span>
			                                				</c:if>
			                                			</c:if>
			                                			<c:if  test="${reveiw.restaurant.avgRate < i+0.3}">
			                                				<span class="star-rate-icon icon_star_alt"></span>
			                                			</c:if>
			                                		</c:if>
                                    			</c:if>
		                                	</c:forEach>
		                                    </li>
                                    	</c:if>
                                    	<c:if test="${!empty restaurant.operationHour}">
		                                    <li><span class="icon_clock"></span> ${restaurant.operationHour }</li>
                                    	</c:if>
	                                </ul>
	                            </div>
	             
	                        </div>
               			 </c:if>
                        <div class="blog__sidebar__recent">
                            <h5>최근 게시물</h5>
                            <a href="#" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="${resources }/img/blog/recent-1.jpg" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <span><i class="fa fa-tags"></i> 샐러드</span>
                                    <h6>그릴드 치킨 바질 샐러드</h6>
                                    <p><i class="fa fa-clock-o"></i> 5/16/2022</p>
                                </div>
                            </a>
                            <a href="#" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="${resources}/img/blog/recent-2.jpg" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <span><i class="fa fa-tags"></i> 퓨전한식</span>
                                    <h6>대나무밥 써니사이드업</h6>
                                    <p><i class="fa fa-clock-o"></i> 5/17/22</p>
                                </div>
                            </a>
                            <a href="#" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="${ resources}/img/blog/recent-3.jpg" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <span><i class="fa fa-tags"></i> 디저트</span>
                                    <h6>달지 않은 마카롱</h6>
                                    <p><i class="fa fa-clock-o"></i> 5/18/22</p>
                                </div>
                            </a>
                        </div>
                        <div class="blog__sidebar__categories">
                            <h5>카테고리</h5>
                            <ul>
                                <li><a href="#">양식 <span>18</span></a></li>
                                <li><a href="#"> 펍<span>20</span></a></li>
                                <li><a href="#">한식 <span>07</span></a></li>
                                <li><a href="#">디저트 <span>22</span></a></li>
                                <li><a href="#">회 <span>19</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->


 	<!-- Footer Section Begin -->
	<jsp:include page="../includes/footer.jsp" />
	<!-- Footer Section End -->
	
	<input type="hidden" id="reviewIdValue" value="${review.reviewId }"/>

	<!-- Js Plugins -->
	<%@ include file="../includes/plugins.jsp"%>
	<script type="text/javascript"
		src="${resources}/js/review/review-detail-kakomap.js"></script>
	<script type="text/javascript"
		src="${resources}/js/review/likes.js"></script>
    <script type="text/javascript">
       var mapContainer = document.getElementById('review-detail-map'), // 지도를 표시할 div 
       mapOption = {
           center: new kakao.maps.LatLng(37.3216, 127.1268), // 지도의 중심좌표 - 단국대
           level: 3 // 지도의 확대 레벨
       };  

      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption); 

      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();

      // 주소로 좌표를 검색합니다
      geocoder.addressSearch('${review.restaurant.address}', function(result, status) {

          // 정상적으로 검색이 완료됐으면 
           if (status === kakao.maps.services.Status.OK) {

              var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new kakao.maps.Marker({
                  map: map,
                  position: coords
              });

              // 인포윈도우로 장소에 대한 설명을 표시합니다
              var infowindow = new kakao.maps.InfoWindow({
                  content: '<div style="width:150px;text-align:center;padding:6px 0;">${review.restaurant.name}</div>'
              });
              infowindow.open(map, marker);

              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
              map.setCenter(coords);
          } 
      });    
    </script>
    <script type="text/javascript">
	    function confirmDelete(){
	    	var con = confirm("리뷰를 삭제하시겠습니까?");
	    	
	    	if(con == true){
	    		location.href = "${root}/reviews/delete?reviewId=${review.reviewId}";
	    	}
	    }
    </script>
</body>

</html>