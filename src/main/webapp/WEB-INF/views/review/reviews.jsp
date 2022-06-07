<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp"%>

<head>
<title>푸드로그</title>

<!-- search panel 시작 -->
<link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet" />
<link href="${resources }/css/review/search-panel.css" rel="stylesheet" />
<!-- search panel 끝 -->
<link rel="stylesheet" href='${resources }/css/review/table.css'>
<link rel="stylesheet" href='${resources }/css/review/pagination.css'>
</head>

<body>
	<!-- Page Preloder -->

<div id="review-content">
	<!-- Header Section Begin -->
	<jsp:include page="../includes/header.jsp" />
	<!-- Header Section End -->


	<!-- Blog Section Begin -->
	<section class="blog-section spad" style="padding-top: 80px">
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
											<th class="createdAt">작성날짜</th>
											<th class="likes"><img
												src="${resources }/img/icon/heart-red.png" alt="좋아요 수"
												class="list-heart" /></th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${ reviews}" var="review">
											<tr class="arow"
												onclick="location.href='${root}/reviews/review?reviewId=${review.reviewId }'">
												<td class="category"><a href="#"
													class="btn btn-category">${ review.restaurant.category }</a></td>
												<td class="restaurant-name">${ review.restaurant.name }</td>
												<td class="title">${ review.title}</td>
												<td class="rate">
													<c:if test="${ review.rate ne null }">
														<c:forEach var="i" begin="1" end="${review.rate }">
															<span class="star-rate-icon icon_star"></span>
														</c:forEach>
													</c:if></td>
												<c:choose>
													<c:when test="${review.isDummy eq 0 }">
														<td class="writer">${ review.writer.username }</td>
														<td class="createdAt">${ review.createdAt }</td>
													</c:when>
													<c:otherwise>
														<td class="writer">${ review.dummyUsername }</td>
														<td class="createdAt">${ review.dummyCreatedAt }</td>
													</c:otherwise>
												</c:choose>
												<td class="likes"><span>${ fn:length(review.membersIdsWhoLike) }</span>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<c:if test="${ !empty sessionScope.sessionMember.username }">
									<a href="${root }/reviews/write"><button class="reviews-write-btn">리뷰 작성하기</button></a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</section>
			</div>
			
			<div class="row">
			
				<!--  search panel 시작 -->
				 <div class="s003">
			      <form>
			        <div class="inner-form">
			          <div class="input-field first-wrap">
			            <div class="input-select">
			              <select id="selectbox" data-trigger="" name="choices-single-defaul" onchange="selectOption()">
			                <option value="searchAll" placeholder="">제목+내용</option>
			                <option value="res">식당 이름</option>
			                <option value="writer">작성자</option>
			              </select>
			            </div>
			          </div>
			          <div class="input-field second-wrap">			          
			            <input type="text" name="search_text" id="search"  onkeypress="searchclick(event)"> 
			          </div>
			          <div class="input-field third-wrap">
			            <button class="btn-search" type="button">
			              <svg class="svg-inline--fa fa-search fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="search" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
			                <path fill="currentColor" d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path>
			              </svg>
			            </button>
			          </div>
			        </div>
			      </form>
			    </div>
			    <!--  search panel 끝 -->
			
				<!-- pagination 시작 -->
				<div id="paginationBox" class="paginationBox">
					<ul class="pagination">
						<c:if test="${pagination.previousPage}">
						
						<c:choose>
						<c:when test="${empty search}">
							<li class="page-item"><a class="page-link" href="#"
								onClick="loadUrl('${pagination.currentPage-1}')">Previous</a></li>
						</c:when>
						
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="#"
								onClick="loadUrl_search('${pagination.currentPage-1}','${search}','${option}')">Previous</a></li>
						</c:otherwise>
						</c:choose>
						
						</c:if>
	
						<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
						<c:choose>
						<c:when test="${empty search}">
							<li
								class="page-item <c:out value="${pagination.currentPage == idx ? 'active' : ''}"/> "><a
								class="page-link" href="#"
								onClick="loadUrl('${idx}')">
									${idx} </a></li>
						</c:when>
						<c:otherwise>
							<li
								class="page-item <c:out value="${pagination.currentPage == idx ? 'active' : ''}"/> "><a
								class="page-link" href="#"
								onClick="loadUrl_search('${idx}','${search}','${option}')">
									${idx} </a></li>
						</c:otherwise>
						</c:choose>
						</c:forEach>
	
						<c:if test="${pagination.nextPage}">
						<c:choose>
						<c:when test="${empty search}">
							<li class="page-item"><a class="page-link" href="#"
								onClick="loadUrl('${pagination.currentPage+1}')">Next</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="#"
								onClick="loadUrl_search()'${pagination.currentPage+1}','${search}','${option}')">Next</a></li>
						</c:otherwise>
						</c:choose>
						</c:if>
					</ul>
				</div>
				<!-- pagination 끝 -->
				
			</div>
					
			
					


			<script type="text/javascript">
				function loadUrl(page){
					var url = "${root}/reviews/list";
					url = url + "?currentPage=" + page;
					location.href = url;
				}
				
				function loadUrl_search(page,search,option) {
					var url = "${root}/reviews/loadListBySearchKeyword";
					url = url + "?currentPage=" + page + "&search=" + search + "&option=" + option;
					location.href = url;
				}
			</script>

		
	</section>
	<!-- Blog Section End -->


	<!-- Footer Section Begin -->
	<jsp:include page="../includes/footer.jsp" />
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="../includes/plugins.jsp"%>
	<script type="text/javascript"
		src="${resources}/js/nav-text-in-black.js"></script>
	<script type="text/javascript"
		src="${resources}/js/review/choices.js"></script>
	<script type="text/javascript"
		src="${resources}/js/review/search-panel.js"></script>
	<script type="text/javascript"
		src="${resources}/js/review/search.js"></script>
	
</div>
</body>

</html>