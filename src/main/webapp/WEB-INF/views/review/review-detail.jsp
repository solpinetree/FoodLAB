<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp"%>

<head>
<title>${review.title}</title>
<link rel="stylesheet" href="${resources}/css/review/review-detail.css">
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
	                        <img src="img/listing/details/comment.png" alt="">
	                    </div>
	                    <div class="listing__details__comment__item__text">
	                        <div class="listing__details__comment__item__rating">
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
	                        </div>
	                        <span>March 22, 2019</span>
	                        <h5>Marry Jane</h5>
	                        <p>From ships to airports, museums to burger vans, from revered Michelin star
	                            establish to the fleeting dynamism of pop-ups.</p>
	                        <ul>
	                            <li><i class="fa fa-hand-o-right"></i> Like</li>
	                            <li><i class="fa fa-share-square-o"></i> Reply</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="listing__details__comment__item">
	                    <div class="listing__details__comment__item__pic">
	                        <img src="img/listing/details/comment.png" alt="">
	                    </div>
	                    <div class="listing__details__comment__item__text">
	                        <div class="listing__details__comment__item__rating">
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
	                        </div>
	                        <span>March 22, 2019</span>
	                        <h5>Marry Jane</h5>
	                        <p>From ships to airports, museums to burger vans, from revered Michelin star
	                            establish to the fleeting dynamism of pop-ups.</p>
	                        <ul>
	                            <li><i class="fa fa-hand-o-right"></i> Like</li>
	                            <li><i class="fa fa-share-square-o"></i> Reply</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="listing__details__comment__item">
	                    <div class="listing__details__comment__item__pic">
	                        <img src="img/listing/details/comment.png" alt="">
	                    </div>
	                    <div class="listing__details__comment__item__text">
	                        <div class="listing__details__comment__item__rating">
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
	                        </div>
	                        <span>March 22, 2019</span>
	                        <h5>Marry Jane</h5>
	                        <p>From ships to airports, museums to burger vans, from revered Michelin star
	                            establish to the fleeting dynamism of pop-ups.</p>
	                        <ul>
	                            <li><i class="fa fa-hand-o-right"></i> Like</li>
	                            <li><i class="fa fa-share-square-o"></i> Reply</li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
                
               	<div class="listing__details__review">
                    <h4>Add Review</h4>
                    <form action="#">
                        <input type="text" placeholder="Name">
                        <input type="text" placeholder="Email">
                        <textarea placeholder="Review"></textarea>
                        <button type="submit" class="site-btn">Submit Now</button>
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
	                            <div class="listing__sidebar__contact__map">
	                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d24168.833995532765!2d-74.79633710628465!3d40.78172222265886!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c384de7a5300b9%3A0x8afc61979217d49d!2sLong%20Valley%2C%20NJ%2007853%2C%20USA!5e0!3m2!1sen!2sbd!4v1586852528126!5m2!1sen!2sbd" height="200" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
	                                <img src="img/listing/details/map-icon.png" alt="">
	                            </div>
	                            <div class="listing__sidebar__contact__text">
	                                <h4>${restaurant.name }</h4>
	                                <ul>
	                                    <li><span class="icon_pin_alt"></span> ${restaurant.address }</li>
	                                    <li><span class="icon_phone"></span>  ${restaurant.tel }</li>
	                                    <li><span class="icon_mail_alt"></span> ${restaurant.avgRate }</li>
	                                    <li><span class="icon_globe-2"></span> ${restaurant.category }</li>
	                                    <li><span class="icon_globe-2"></span> ${restaurant.operationHour }</li>
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
	
</body>

</html>