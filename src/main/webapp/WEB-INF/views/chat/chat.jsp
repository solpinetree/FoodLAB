<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp" %>

<head>
    <title>Chatrooms</title>

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
            	
            		<div class = "col-lg-2">
            		</div>
            		
	               	<div class="col-lg-4">
	                   	<c:forEach var = "chr" items = "${chatrooms}" begin = "0" end = "3" step = "1">
                            <div class="blog__item" onclick="location.href='${root}/chat/chatroom?chatroomId=${chr.chatroomId }'">
                                <div class="blog__item__pic set-bg" data-setbg="${chr.imgUrl}">
                    	        </div>
                                <div class="blog__item__text">
                                    <h5 class="font_bold">${chr.title}</h5>
                                </div>
                            </div>
	                   	</c:forEach>  
	               	</div>
	               	<div class="col-lg-4">
	                   	<c:forEach var = "chr" items = "${chatrooms}"  begin = "4" end = "8" step = "1">
                            <div class="blog__item" onclick="location.href='${root}/chat/chatroom?chatroomId=${chr.chatroomId }'">
                                <div class="blog__item__pic set-bg" data-setbg="${chr.imgUrl}">
                    	        </div>
                                <div class="blog__item__text">
                                    <h5 class="font_bold">${chr.title}</h5>
                                </div>
                       		</div>
	                   	</c:forEach>  
	               	</div>
	            	<div class = "col-lg-2">
            		</div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

    
    <!-- Newslatter Section End -->

     <!-- Footer Section Begin -->
	<jsp:include page="../includes/footer.jsp"/>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
	<%@ include file="../includes/plugins.jsp" %>
</body>

</html>