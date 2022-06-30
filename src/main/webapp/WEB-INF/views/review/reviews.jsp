<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../includes/common.jsp" %>

<head>
    <title>푸드로그</title>

    <!-- search panel 시작 -->
    <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet"/>
    <link href="${resources }/css/review/search-panel.css" rel="stylesheet"/>
    <!-- search panel 끝 -->
    <link rel="stylesheet" href='${resources }/css/review/pagination.css'>
    <link rel="stylesheet" href='${resources }/css/review/reviews.css'>
</head>

<body>

<div id="review-content">
    <!-- Header Section Begin -->
    <jsp:include page="../includes/header.jsp"/>
    <!-- Header Section End -->


    <!-- Blog Section Begin -->
    <section class="blog-section spad" style="padding-top: 150px">
        <div class="main-header__wrapper">
            <!--   recent-activity start's here -->
            <section class="recent-activity">
                <div class="recent-activity__wrapper">
                    <!-- 리뷰 한 행(3개) 시작 -->
                    <div class="recent-activity__row">
                        <!-- 글 있는 리뷰 하나 시작 -->
                        <div class="recent-activity__col feedback">
                            <div class="userinfo-wrapper">
                                <div class="img-container">
                                    <img src="${resources}/img/defaultProfile.jpeg"
                                         alt="profile-icon"/>
                                </div>
                                <div class="caption-wrapper">
                                    <span class="recent-activity__name"><a href="javascript:void(0);">Fred N.</a></span>
                                    <span class="recent-activity__caption">리뷰 작성</span>
                                </div>
                            </div>
                            <a href="javascript:void(0);">
                                <img
                                    src="https://s3-media4.fl.yelpcdn.com/bphoto/u3WfxOE1DKuAENePexRmXg/l.jpg"
                                    alt="rest-photo" width="100%"/></a>
                            <h3 class="recent-activity__heading"><a href="javascript:void(0);">Stay Gold Deli</a></h3>
                            <div class="restaurants__rating">
                                <div class="restaurants__rating__star five-stars">
                                    <i class="star-rate-icon icon_star"></i>
                                    <i class="star-rate-icon icon_star"></i>
                                    <i class="star-rate-icon icon_star"></i>
                                    <i class="star-rate-icon icon_star"></i>
                                    <i class="star-rate-icon icon_star_alt"></i>
                                </div>
                            </div>
                            <p>
                                I was pretty disappointed and perplexed by my experience here.
                                I was assured by the counter person that my order was plenty
                                for 2, which it wasn't. Why he would down-sell
                                me is a...
                                <a href="">Countinue reading</a>
                            </p>
                            <a href="javascript:void(0);" class="recent-activity__likes facebook">
                                <span class="recent-activity__likes fb-img-like">
                                    <svg width="24" height="24" class="icon_svg"><path
                                            d="M22.35 9.13A3 3 0 0020 8h-3V4.28A3.28 3.28 0 0013.72 1a2 2 0 00-1.9 1.37L9.28 10H2a1 1 0 00-1 1v11a1 1 0 001 1h13.25c.21 0 5.11-.08 6.7-7.12l1-4.21a3 3 0 00-.6-2.54zM3 12h6v9H3v-9zm18-.77l-1 4.2C18.78 20.85 15.38 21 15.25 21H11v-9.84L13.72 3c.707 0 1.28.573 1.28 1.28V9a1 1 0 001 1h4a1 1 0 01.78.38 1 1 0 01.22.85z"></path>
                                    </svg>
                                </span>
                                <span class="recent-activity__likes text-like">좋아요</span>
                            </a>
                        </div>
                        <!-- 글 있는 리뷰 하나 끝 -->
                    </div>
                    <!-- 리뷰 한 행(3개) 끝 -->
                </div>
            </section>
            <!--   /recent-activity end's here -->

            <div class="show-more-wrapper">
                <div class="show-more">
                    <a href="javascript:void(0);">
                        <svg width="24" height="24" class="icon_svg"><path d="M12 15.25a1 1 0 01-.7-.29l-4.58-4.5A1.011 1.011 0 018.12 9L12 12.85 15.88 9a1 1 0 111.4 1.42L12.7 15a1 1 0 01-.7.25z"></path></svg>
                        리뷰 더보기
                    </a>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->


    <!-- Footer Section Begin -->
    <jsp:include page="../includes/footer.jsp"/>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <%@ include file="../includes/plugins.jsp" %>
    <script type="text/javascript"
            src="${resources}/js/nav-text-in-black.js"></script>
    <script type="text/javascript"
            src="${resources}/js/review/search.js"></script>

</div>
</body>

</html>