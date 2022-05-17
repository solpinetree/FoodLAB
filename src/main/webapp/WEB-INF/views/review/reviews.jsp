<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp" %>

<head>
    <title>푸드로그</title>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
	<jsp:include page="../includes/header.jsp"/>
    <!-- Header Section End -->


    <!-- Blog Section Begin -->
    <section class="blog-section spad" style="padding-top: 130px">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row">
                    	<c:forEach items="${reviews}" var="review">
	                        <div class="col-lg-6 col-md-6">
	                            <div class="blog__item">
	                                <div class="blog__item__pic set-bg" data-setbg="${resources}/upload/review-thumb/${review.thumbnailSavedName}"></div>
	                                <div class="blog__item__text">
	                                    <ul class="blog__item__tags">
	                                        <li><i class="fa fa-tags"></i> Travel</li>
	                                        <li>Videos</li>
	                                    </ul>
	                                    <h5><a href="${root}/reviews/review?reviewId=${review.reviewId}">${ review.title }</a></h5>
	                                    <ul class="blog__item__widget">
	                                        <li><i class="fa fa-clock-o"></i> ${ review.createdAt}</li>
	                                        <li><i class="fa fa-user"></i> ${ review.writerId} </li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>
                    </div>
                    
 					<!--  pagination div 시작 -->      
                    <div class="blog__pagination" style="align-items:center">
                        <a href="#"><i class="fa fa-long-arrow-left"></i> Pre</a>
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">Next <i class="fa fa-long-arrow-right"></i></a>
                    </div>
                    <!--  pagination div 끝 -->
                    
                </div>
                <div class="col-lg-4">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Searching...">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__recent">
                            <h5>이번주 인기 리뷰</h5>
                            <a href="#" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="${resources}/img/blog/recent-1.jpg" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <span><i class="fa fa-tags"></i> 양식 </span>
                                    <h6>샐러드파스타</h6>
                                    <p><i class="fa fa-clock-o"></i> 19th March, 2019</p>
                                </div>
                            </a>
                            <a href="#" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="${resources}/img/blog/recent-2.jpg" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <span><i class="fa fa-tags"></i> 샐러드</span>
                                    <h6>샐러드 도시락</h6>
                                    <p><i class="fa fa-clock-o"></i> 22th March, 2019</p>
                                </div>
                            </a>
                            <a href="#" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="${resources}/img/blog/recent-3.jpg" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <span><i class="fa fa-tags"></i> 디저트, 카페</span>
                                    <h6>수플레 팬케이크</h6>
                                    <p><i class="fa fa-clock-o"></i> 25th March, 2019</p>
                                </div>
                            </a>
                            <a href="#" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="${resources}/img/blog/recent-5.jpg" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <span><i class="fa fa-tags"></i> 치킨</span>
                                    <h6>치킨 테이크아웃 전문점</h6>
                                    <p><i class="fa fa-clock-o"></i> 19th March, 2019</p>
                                </div>
                            </a>
                        </div>
                        <div class="blog__sidebar__categories">
                            <h5>Categories</h5>
                            <ul>
                                <li><a href="#">양식 <span>18</span></a></li>
                                <li><a href="#">중식 <span>20</span></a></li>
                                <li><a href="#">일식 <span>07</span></a></li>
                                <li><a href="#">한식 <span>22</span></a></li>
                                <li><a href="#">치킨 <span>19</span></a></li>
                                <li><a href="#">분식 <span>19</span></a></li>
                                <li><a href="#">디저트, 카페 <span>23</span></a></li>
                            </ul>
                        </div>
                        <div class="blog__sidebar__tags">
                            <h5>Popular Tag</h5>
                            <a href="#">Business</a>
                            <a href="#">Marketing</a>
                            <a href="#">Payment</a>
                            <a href="#">Travel</a>
                            <a href="#">Finance</a>
                            <a href="#">Videos</a>
                            <a href="#">Ideas</a>
                            <a href="#">Unique</a>
                            <a href="#">Music</a>
                            <a href="#">Key</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->


     <!-- Footer Section Begin -->
	<jsp:include page="../includes/footer.jsp"/>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
   	<script type="text/javascript"
	src="${resources}/js/nav-text-in-black.js"></script>
	<%@ include file="../includes/plugins.jsp" %>
</body>

</html>