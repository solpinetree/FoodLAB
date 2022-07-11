<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../includes/common.jsp" %>

<head>
    <title>푸드랩 | 리뷰 보기</title>
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
           <!-- 리뷰들-->
            <jsp:include page="reviews-review.jsp"></jsp:include>

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