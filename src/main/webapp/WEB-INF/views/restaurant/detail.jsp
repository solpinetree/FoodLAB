<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp" %>

<head>
    <title>${restaurants.name }</title>
    <link rel="stylesheet" href="${resources}/css/review/review-detail.css">
    <link rel="stylesheet" href="${resources}/css/restaurant/restaurant-detail.css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section-->
	<jsp:include page="../includes/header.jsp"/>
	<c:set var="restaurant" value="${restaurants}"/>
    <!-- Listing Section Begin -->
    <section style="margin-top:160px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="listing__hero__option">
                        <div class="listing__hero__text">
                            <h2>${restaurant.name}</h2>
                        </div>
                    </div>
                </div>
             </div>
        </div>
    </section>
    <!-- Listing Section End -->

    <!-- Listing Details Section Begin -->
    <section class="listing-details spad" style = "padding-top:50px;">
        <div class="container">
            <div class="row row-menu">
                <div class="col-lg-8">
                    <div class="listing__details__text">
                    	<c:if test="${fn:length(menus) ne 0 }">
	                    	<div class="listing__details__gallery">
		                    	<h4>메뉴</h4>
		                    	<c:forEach var="menu" items="${menus}">
		                    		<div class="row row-menu">
			                    		<p class="menu-name">${ menu.menuName}</p>
			                    		<p class="menu-price">${ menu.price}</p>
		                    		</div>
		                    	</c:forEach>
	                    	</div>
                    	</c:if>

                        <div class="listing__details__gallery">
                            <h4>식당 사진</h4>
                            <div class="listing__details__gallery__pic">
                                <div class="listing__details__gallery__item">
                                    <img class="listing__details__gallery__item__large"
                                        src="${restaurant.imgUrl}" alt="">
                                    <span><i class="fa fa-camera"></i> 170 Image</span>
                                </div>
                                <div class="listing__details__gallery__slider owl-carousel">
                                    <img data-imgbigurl="${resources}/img/listing/details/listing-details-1.jpg"
                                        src="${resources}/img/listing/details/thumb-1.jpg" alt="">
                                    <img data-imgbigurl="${resources}/img/listing/details/listing-details-1.jpg"
                                        src="${resources}/img/listing/details/thumb-2.jpg" alt="">
                                    <img data-imgbigurl="${resources}/img/listing/details/listing-details-1.jpg"
                                        src="${resources}/img/listing/details/thumb-3.jpg" alt="">
                                    <img data-imgbigurl="${resources}/img/listing/details/listing-details-1.jpg"
                                        src="${resources}/img/listing/details/thumb-4.jpg" alt="">
                                </div>
                            </div>
                        </div>
                       
                       <%-- 리뷰 div 시작 --%>
                        <div class="listing__details__comment">
                            <h4>리뷰</h4>
                            
                            <%-- 하나의 리뷰 --%>
                            <c:forEach var="review" items="${ reviews}">
	                            <div class="listing__details__comment__item">
	                                <div class="listing__details__comment__item__pic">
	                                    <img src="${resources}/img/defaultProfile.jpeg" alt="">
	                                </div>
	                                <div class="listing__details__comment__item__text">
	                                    <div class="listing__details__comment__item__rating">
	                                 		<c:if test="${ review.rate ne null }">
	                                   			<span class="star-rate-star">
				                                	<c:forEach var="i" begin="1" end="${ review.rate }" >
				                                		<i class="star-rate-icon icon_star"></i>
				                                	</c:forEach>
			                                		<c:forEach var="i" begin="${review.rate + 1 }" end="5">
			                                			<i class="star-rate-icon icon_star_alt"></i>
			                                		</c:forEach>
				                                </span>
                                			</c:if>
	                                    </div>
	                                    <span>${review.createdAt } &nbsp;&nbsp; ♥ ${fn:length(review.membersIdsWhoLike) }</span>
	                                    <h5>${review.writer.username }</h5>
	                                    <p>${review.content }</p>
	                                </div>
	                            </div>
                            </c:forEach>
                            <%-- 하나의 리뷰 --%>
                        </div>
                        <%-- 리뷰 div 시작 --%>
                        
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="listing__sidebar">
        	           <div class="blog__sidebar__categories star-rate">
                             <ul>
                                 <li class="star-rate-li">
                                 	<span>
                                 		<p class="star-rate-text">평점</p> 
                                		<c:if test="${ restaurant.avgRate ne 0 }">
                                			<span class="star-rate-star">
                                				<c:forEach var="i" begin="1" end="${ restaurant.avgRate }" >
                                					<i class="star-rate-icon icon_star"></i>
                                				</c:forEach>
                               					<c:forEach var="i" begin="${restaurant.avgRate+ 1 }" end="5">
                               						<i class="star-rate-icon icon_star_alt"></i>
                               					</c:forEach>
                                			</span>
                             			</c:if>
                             			<c:if test="${ restaurant.avgRate eq 0 }">
                             				<span class="star-rate-star">데이터를 수집 중 입니다.</span>
                             			</c:if>
                             		</span> 
                                 </li>
                             </ul>
                        </div>
                        <%@ include file="../map/map.jsp"%>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Listing Details Section End -->

 	<!-- Footer Section -->
	<jsp:include page="../includes/footer.jsp" />

     <!-- Js Plugins -->
 	<%@ include file="../includes/plugins.jsp" %>
 	<script type="text/javascript" src="${resources}/js/nav-text-in-black.js"></script>
</body>

</html>