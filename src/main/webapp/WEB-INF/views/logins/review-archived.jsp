<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp" %>



<body>

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

										<c:forEach items="${ archivedReviews}" var="review">
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
							</div>
						</div>
					</div>
				</div>
			</section>
	

</body>

