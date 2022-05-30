<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp" %>

<head>
    <title>${restaurants.name }</title>
    <link rel="stylesheet" href="${resources}/css/review/review-detail.css">
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
    <section class="listing-hero set-bg" data-setbg="${restaurant.imgUrl}">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="listing__hero__option">
                        <div class="listing__hero__icon">
                            <img src="${resources}/img/listing/details/ld-icon.png" alt="">
                        </div>
                        <div class="listing__hero__text">
                            <h2>${restaurant.name}</h2>
                            <div class="listing__hero__widget">
                                <div class="listing__hero__widget__rating">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star-half_alt"></span>
                                </div>
                                <div>120 Review</div>
                            </div>
                            <p><span class="icon_pin_alt"></span> ${restaurant.address}</p>
                            <p><span class="icon_pin_alt"></span> ${restaurant.category}</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="listing__hero__btns">
                        <a href="#" class="primary-btn share-btn"><i class="fa fa-mail-reply"></i> 리뷰보기</a>
                        <a href="#" class="primary-btn"><i class="fa fa-bookmark"></i> 좋아요</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Listing Section End -->

    <!-- Listing Details Section Begin -->
    <section class="listing-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="listing__details__text">

                        <div class="listing__details__gallery">
                            <h4>Gallery</h4>
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
                       
                        <div class="listing__details__rating">
                            <h4>Rate</h4>
                            <div class="listing__details__rating__overall">
                                <h2>4.7</h2>
                                <div class="listing__details__rating__star">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                </div>
                                <span>(120 Rating)</span>
                            </div>
                            <div class="listing__details__rating__bar">
                                <div class="listing__details__rating__bar__item">
                                    <span>4.4</span>
                                    <div id="bar1" class="barfiller">
                                        <span class="fill" data-percentage="100"></span>
                                    </div>
                                    <span class="right">Quality</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>3.9</span>
                                    <div id="bar2" class="barfiller">
                                        <span class="fill" data-percentage="75"></span>
                                    </div>
                                    <span class="right">Price</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>4.2</span>
                                    <div id="bar3" class="barfiller">
                                        <span class="fill" data-percentage="80"></span>
                                    </div>
                                    <span class="right">Space</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>4.8</span>
                                    <div id="bar4" class="barfiller">
                                        <span class="fill" data-percentage="80"></span>
                                    </div>
                                    <span class="right">Service</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>4.0</span>
                                    <div id="bar5" class="barfiller">
                                        <span class="fill" data-percentage="85"></span>
                                    </div>
                                    <span class="right">Location</span>
                                </div>
                            </div>
                        </div>
                        <div class="listing__details__comment">
                            <h4>ë¦¬ë·°</h4>
                            <div class="listing__details__comment__item">
                                <div class="listing__details__comment__item__pic">
                                    <img src="${resources}/img/listing/details/comment.png" alt="">
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
                                    <img src="${resources}/img/listing/details/comment.png" alt="">
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
                                    <img src="${resources}/img/listing/details/comment.png" alt="">
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
                </div>
                <div class="col-lg-4">
                    <div class="listing__sidebar">
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