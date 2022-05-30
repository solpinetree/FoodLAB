<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp" %>

<head>
    <title>오픈 채팅</title>
    <link rel="stylesheet" href="${resources}/css/chat/chat.css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
	<jsp:include page="../includes/header.jsp"/>
    <!-- Header Section End -->

	<!-- 헤더의 배경화면이 흰색일 경우 -->
    <script type="text/javascript">
    	var element = document.querySelector('header');
    	element. classList.add('header--normal');
    	document.getElementById('header-logo-custom').src="${resources}/img/footer-logo.png";
    </script>

    <section class="blog-section spad" style="padding-top: 10%">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row">
                    	<c:forEach var = "chr" items = "${chatrooms}">
                    		<div class="col-lg-6 col-md-6">
	                            <div class="blog__item" onclick="location.href=${root}/chat/${chr.chatroomId}">
	                                <div class="blog__item__pic set-bg" data-setbg="${resources}/img/${chr.imgUrl}">
	                                </div>
	                                <div class="blog__item__text">
	                                    <h5 class="font_bold">${chr.title}</h5>
	                                </div>
	                            </div>
                        	</div>
                    	</c:forEach>  
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
	<jsp:include page="../includes/footer.jsp"/>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
	<%@ include file="../includes/plugins.jsp" %>
</body>

</html>