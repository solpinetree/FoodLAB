<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/common.jsp" %>

<head>
    <title>오픈 채팅</title>
    <link rel="stylesheet" href="${resources}/css/chat.css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
	<jsp:include page="includes/header.jsp"/>
    <!-- Header Section End -->

	<!-- 헤더의 배경화면이 흰색일 경우 -->
    <script type="text/javascript">
    	var element = document.querySelector('header');
    	element.classList.add('header--normal');
    	document.getElementById('header-logo-custom').src="${resources}/img/footer-logo.png";
    </script>

    <!-- Blog Section Begin -->
    <section class="blog-section spad" style="padding-top: 10%">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="blog__item">
                                <div class="blog__item__pic set-bg" data-setbg="${resources}/img/blog/bp-1.jpg"></div>
                                <div class="blog__item__text">
                                    <ul class="blog__item__tags">
                                        <li><i class="fa fa-tags"></i> Travel</li>
                                        <li>Videos</li>
                                    </ul>
                                    <h5><a href="#">Florida for 20 YEARS swims in the Gulf for the FIRST</a></h5>
                                    <ul class="blog__item__widget">
                                        <li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
                                        <li><i class="fa fa-user"></i> John Smith</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="blog__item">
                                <div class="blog__item__pic set-bg" data-setbg="${resources}/img/blog/blog-large.jpg">
                                </div>
                                <div class="blog__item__text">
                                    <h5><a href="#">일반 채팅</a></h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="blog__item">
                                <div class="blog__item__pic set-bg" data-setbg="${resources}/img/blog/bp-3.jpg"></div>
                                <div class="blog__item__text">
                                    <ul class="blog__item__tags">
                                        <li><i class="fa fa-tags"></i> Hotel</li>
                                    </ul>
                                    <h5><a href="#">'Junior detectives' help Roseville, Calif police</a></h5>
                                    <ul class="blog__item__widget">
                                        <li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
                                        <li><i class="fa fa-user"></i> John Smith</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="blog__item">
                                <div class="blog__item__pic set-bg" data-setbg="${resources}/img/blog/bp-4.jpg">
                                    <a href="https://www.youtube.com/watch?v=8EJ3zbKTWQ8" class="play-btn video-popup"><i class="fa fa-play"></i></a>
                                </div>
                                <div class="blog__item__text">
                                    <ul class="blog__item__tags">
                                        <li><i class="fa fa-tags"></i> Restaurant</li>
                                    </ul>
                                    <h5><a href="#">Dog Rescues Florida Woman After Her iPad Catches</a></h5>
                                    <ul class="blog__item__widget">
                                        <li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
                                        <li><i class="fa fa-user"></i> John Smith</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="blog__item">
                                <div class="blog__item__pic set-bg" data-setbg="${resources}/img/blog/bp-5.jpg"></div>
                                <div class="blog__item__text">
                                    <ul class="blog__item__tags">
                                        <li><i class="fa fa-tags"></i> Videos</li>
                                    </ul>
                                    <h5><a href="#">Citrus Heights Snack Man Helps Feed The Homeless</a></h5>
                                    <ul class="blog__item__widget">
                                        <li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
                                        <li><i class="fa fa-user"></i> John Smith</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="blog__item">
                                <div class="blog__item__pic set-bg" data-setbg="${resources}/img/blog/bp-6.jpg"></div>
                                <div class="blog__item__text">
                                    <ul class="blog__item__tags">
                                        <li><i class="fa fa-tags"></i> Travel</li>
                                    </ul>
                                    <h5><a href="#">Homeless womanâs viral subway opera performance</a></h5>
                                    <ul class="blog__item__widget">
                                        <li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
                                        <li><i class="fa fa-user"></i> John Smith</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

    <!-- Newslatter Section Begin -->
    <section class="newslatter">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="newslatter__text">
                        <h3>Subscribe Newsletter</h3>
                        <p>Subscribe to our newsletter and donât miss anything</p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <form action="#" class="newslatter__form">
                        <input type="text" placeholder="Your email">
                        <button type="submit">Subscribe</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Newslatter Section End -->

     <!-- Footer Section Begin -->
	<jsp:include page="includes/footer.jsp"/>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
	<%@ include file="includes/plugins.jsp" %>
</body>

</html>