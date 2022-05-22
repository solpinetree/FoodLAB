<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp" %>

<head>
    <title>푸드로그</title>
    <link rel="stylesheet" href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' type="text/css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href='${resources }/css/review/table.css'>
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
                	<section class="ftco-section">
						<div class="container">
							<div class="row">
								<div class="col-md-12">
									<div class="table-wrap">
										<table class="table table-striped">
										  <thead>
										    <tr class="arow table-thead">
										      <th class="category">카테고리</th>
										      <th class="restaurant-name">식당 이름</th>
										      <th class="title">글 제목</th>
										      <th class="rate">평점</th>
										      <th class="writer">작성자</th>
										      <th class="createAt">작성날짜</th>
										      <th class="likes"><img src="${resources }/img/icon/heart-red.png" alt="좋아요 수" class="list-heart"/></th>
										    </tr>
										  </thead>
										  <tbody>
										  
										  	<c:forEach items="${ reviews}" var="review">
											    <tr class="arow" onclick="location.href='${root}/reviews/review?reviewId=${review.reviewId }'">
											      <td class="category"><a href="#" class="btn btn-category">${ review.restaurant.category }</a></td>
											      <td class="restaurant-name">${ review.restaurant.name }</td>
											      <td class="title">${ review.title}</td>
											      <td class="rate">
													<c:if test="${ review.rate ne null }">
														<c:forEach var="i" begin="1" end="${review.rate }">
				                                			<span class="star-rate-icon icon_star"></span>
														</c:forEach>
				                                	</c:if>
											      </td>
											      <td class="writer">${ review.writer.username }</td>
											      <td class="createAt">${ review.createdAt }</td>
											      <td class="likes">
											      	<span >${ review.likesCount }</span>
										      	  </td>
											    </tr>
										  	</c:forEach> 
										  </tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</section>
                
                    
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