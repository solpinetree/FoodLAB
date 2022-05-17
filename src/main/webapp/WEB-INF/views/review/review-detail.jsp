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
    <div class="blog-details-hero set-bg" style="background-color:#EFF8E2">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="blog__hero__text">
                        <div class="label">Trending</div>
                        <h2>${review.title}</h2>
                        <ul>
                            <li><i class="fa fa-clock-o"></i>${review.createdAt}</li>
                            <li><i class="fa fa-user"></i> ${ review.writerId} </li>
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
                 <div class="blog__details__text">
                     
                     	<img src="${resources}/upload/review-thumb/${review.thumbnailSavedName}" style="background-size:cover; overflow: hidden"/>
                     <hr><br>
                     <div style="position: relative; float:left;">${review.content }</div>
                 </div>
                  
                 
                   
	             <div class="listing__details__comment">
	                <h4>리뷰</h4>
	              
	                <div class="listing__details__comment__item">
	                    <div class="listing__details__comment__item__pic">
	                        <img src="${resources }/img/defaultProfile.jpeg" alt="">
	                    </div>
	                    <div class="listing__details__comment__item__text">
	                        <span>March 22, 2019</span>
	                        <h5>Marry Jane</h5>
	                        <p>From ships to airports, museums to burger vans, from revered Michelin star
	                            establish to the fleeting dynamism of pop-ups.</p>
	                        <ul>
	                            <li><i class="fa fa-share-square-o"></i> 대댓글 달기</li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
                
               	<div class="listing__details__review">
                    <form action="#">
                        <textarea placeholder="Review"></textarea>
                        <button type="submit" class="site-btn">댓글 달기</button>
                    </form>
                </div>
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
                  	
                    	
                    	 <c:if test="${ restaurant ne null }">
	                    	<div class="listing__sidebar__contact">
	                            <div class="listing__sidebar__contact__map" id="review-detail-map">
	                            </div>
	                            <div class="listing__sidebar__contact__text">
	                                <h4>${restaurant.name }</h4>
	                                <ul>
                                		<c:if test="${!empty restaurant.category}">
	                                    	<li><span>${restaurant.category }</span></li><br><br>
                                    	</c:if>
	                                    <li><span class="icon_pin_alt"></span> ${restaurant.address }</li>
	                                    <li><span class="icon_phone"></span>  ${restaurant.tel }</li>
                                    	<c:if test="${restaurant.avgRate ne 0.0}">
		                                    <li>
	                                    	<span>평점 </span> 
                                    		<c:forEach var="i" begin="1" end="5" >
                                    			<c:if test="${restaurant.avgRate>i}">
			                                		<span class="star-rate-icon icon_star"></span>
			                                		<c:if test="${restaurant.avgRate < i+1}">
			                                			<c:if test="${restaurant.avgRate > i+0.3 }">
			                                				<c:if test="${restaurant.avgRate < i+0.7 }">
			                                					<span class="star-rate-icon icon_star_half"></span>
			                                				</c:if>
			                                				<c:if test="${restaurant.avgRate > i+0.7 }">
			                                					<span class="star-rate-icon icon_star"></span>
			                                				</c:if>
			                                			</c:if>
			                                			<c:if  test="${restaurant.avgRate < i+0.3}">
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
                                    <span><i class="fa fa-tags"></i> Shopping</span>
                                    <h6>Tortoise grilled on salt</h6>
                                    <p><i class="fa fa-clock-o"></i> 19th March, 2019</p>
                                </div>
                            </a>
                            <a href="#" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="${resources}/img/blog/recent-2.jpg" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <span><i class="fa fa-tags"></i> Hotels</span>
                                    <h6>Shrimp floured and fried</h6>
                                    <p><i class="fa fa-clock-o"></i> 22th March, 2019</p>
                                </div>
                            </a>
                            <a href="#" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="${ resources}/img/blog/recent-3.jpg" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <span><i class="fa fa-tags"></i> Restaurant</span>
                                    <h6>Sweet and sour pork ribs</h6>
                                    <p><i class="fa fa-clock-o"></i> 25th March, 2019</p>
                                </div>
                            </a>
                        </div>
                        <div class="blog__sidebar__categories">
                            <h5>Categories</h5>
                            <ul>
                                <li><a href="#">Finance <span>18</span></a></li>
                                <li><a href="#">Business <span>20</span></a></li>
                                <li><a href="#">Loan <span>07</span></a></li>
                                <li><a href="#">Consulting <span>22</span></a></li>
                                <li><a href="#">Credit <span>19</span></a></li>
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

	<!-- Js Plugins -->
	<%@ include file="../includes/plugins.jsp"%>
	<script type="text/javascript"
		src="${resources}/js/review/review-detail-kakomap.js"></script>
</body>

</html>