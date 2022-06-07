<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp"%>

<head>
<title>${review.title}</title>
<link rel="stylesheet" href="${resources}/css/review/review-detail.css">
<link rel="stylesheet" href="${resources}/css/review/review-detail-image.css">
<link rel="stylesheet" href="${resources}/css/review/comment.css">
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
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
    <div class="blog-details-hero set-bg" style="background-color:white;">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="blog__hero__text">
                        <h2>${review.title}</h2>
                        <ul>
                            <c:choose>
								<c:when test="${review.isDummy eq 0 }">
									 <li><i class="fa fa-clock-o"></i>${review.createdAt}</li>
                           			 <li><i class="fa fa-user"></i> ${ review.writer.username} </li>
								</c:when>
								<c:otherwise>
									 <li><i class="fa fa-clock-o"></i>${review.dummyCreatedAt}</li>
                           			 <li><i class="fa fa-user"></i> ${ review.dummyUsername} </li>
								</c:otherwise>
							</c:choose>
                          
                            <c:if test="${sessionScope.sessionMember.id == review.writer.id }">
	                      		 <li class="li-underline">수정하기</li>
	                      		 <li class="li-underline" onclick="confirmDelete()"> 삭제하기</li>
	                    	</c:if>
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
            </div>
        </div>
    </div>
    <!-- Blog Hero End -->
    
    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
				   <!-- Slider main container -->
				   <c:if test="${ !empty reviewImages }">
				        <div class="swiper">
				            <!-- Additional required wrapper -->
				            <div class="swiper-wrapper">
				
								<c:forEach var="reviewImage" items="${ reviewImages}">
					                <div class="swiper-slide">
									   <img style="width:100%; height:100%; object-fit: contain" src="${reviewImage.imgUrl}" alt="리뷰 등록 이미지"/>
					                </div>
								</c:forEach>
								
				            </div>
				            
				            <c:if test="${fn:length(reviewImages) > 1 }">
					            <!-- If we need pagination -->
					            <div class="swiper-pagination"></div>
					            
					            <!-- If we need navigation buttons -->
					            <div class="swiper-button-prev"></div>
					            <div class="swiper-button-next"></div>
				            </c:if>
				        
		       			 </div>	
	       			 </c:if>
	       			 
	                 <div class="blog__details__text" style="margin-bottom: 50px; height: 15vh; overflow: visible;">
	                     <div style="position: relative; float:left;">${review.content }</div>
	                 </div>
                  
                 
	  				<jsp:include page="review-detail-comment.jsp"/>
                	
                </div>
               
               
                <div class="col-lg-4">
                    <div class="blog__sidebar">
	                    
                       	<div class="blog__sidebar__categories star-rate">
                                <ul>
                                    <li class="star-rate-li">
                                    	<span>
	                                    	<p class="star-rate-text">가격만족도</p>
	                                    	<c:choose>
		                                     	<c:when test="${ review.priceSatisfaction ne null and review.priceSatisfaction ne 0}">
		                                     		<span class="star-rate-star">
					                                	<c:forEach var="i" begin="1" end="${ review.priceSatisfaction }" >
					                                		<i class="star-rate-icon icon_star"></i>
					                                	</c:forEach>
				                                		<c:forEach var="i" begin="${review.priceSatisfaction + 1 }" end="5">
				                                			<i class="star-rate-icon icon_star_alt"></i>
				                                		</c:forEach>
				                                	</span>
			                                	</c:when>
			                                	<c:otherwise>
			                                		<span class="star-rate-star">정보 없음</span>
			                                	</c:otherwise>
		                                	</c:choose>
	                                	</span>
                                     </li>
                                    <li class="star-rate-li"><span>
                                    	<p class="star-rate-text">평점</p> 
                                    	<c:choose>
	                                   		<c:when test="${ review.rate ne null and review.rate ne 0}">
	                                   			<span class="star-rate-star">
				                                	<c:forEach var="i" begin="1" end="${ review.rate }" >
				                                		<i class="star-rate-icon icon_star"></i>
				                                	</c:forEach>
			                                		<c:forEach var="i" begin="${review.rate + 1 }" end="5">
			                                			<i class="star-rate-icon icon_star_alt"></i>
			                                		</c:forEach>
				                                </span>
	                                		</c:when>
	                                		<c:otherwise>
	                                			<span class="star-rate-star">정보 없음</span>
	                                		</c:otherwise>
                                		</c:choose>
                                		</span> 
                                    </li>
                                </ul>
                        </div>
                  	
                    	
                    	 <c:if test="${ review.restaurant ne null }">
                    	 	<c:set var="restaurant" value="${review.restaurant }"/>
                       		<%@ include file="../map/map.jsp"%>
               			 </c:if>
               			 
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
		src="${resources}/js/review/likes.js"></script>
	<script type="text/javascript"
		src="${resources}/js/review/comment.js"></script>
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	<script type="text/javascript"
		src="${resources}/js/review/review-write-swiper.js"></script>
	<script type="text/javascript"
		src="${resources}/js/nav-text-in-black.js"></script>
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