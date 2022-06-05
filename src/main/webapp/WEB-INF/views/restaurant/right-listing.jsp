<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/path.jsp"%>

<section class="listing nice-scroll" id="restaurantList">
	<div id="resultNumDiv">
		<c:if test="${!empty category}">
			<c:if test="${category ne '전체'}">
				<div class="listing__text__top">
					<div class="listing__text__top__left">
						<p>${numOfResults}개 식당 결과</p>
					</div>
				</div>
			</c:if>
		</c:if>
	</div>
	<div class="listing__list showSeachText" id="showcategorys">
		<c:forEach items="${restaurants}" var="restaurant">

			<!--  식당 하나 div 시작 -->
			<div class="listing__item">

				<div class="listing__item__pic set-bg"
					style="background-image:url(${restaurant.imgUrl});"
					style="border-radius: 40px 40px 0 0;">
					<div class="listing__item__pic__tag" style="background: #f9adbd">${restaurant.category}</div>

					<div class="listing__item__pic__btns">
						<a href="javascript:drawMarker('${restaurant.address }', '${restaurant.name }')">
							<span class="icon_zoom-in_alt"></span>
						</a> 
						<a href="#">
							<span class="icon_heart_alt"></span>
						</a>
					</div>

				</div>



				<div class="listing__item__text" style="cursor:pointer" onclick="location.href='${root}/restaurants/detail?restaurantId=${restaurant.restaurantId}'">
					<div class="listing__item__text__inside">
						<h5>${restaurant.name}</h5>
						<div class="listing__item__text__rating">
							<div class="listing__item__rating__star">
								<span class="icon_star"></span> <span class="icon_star"></span>
								<span class="icon_star"></span> <span class="icon_star"></span>
								<span class="icon_star-half_alt"></span> (${restaurant.avgRate })
							</div>
						</div>
						<ul>
							<li>
								<span class="icon_pin_alt"></span> ${ restaurant.address}
							</li>
							<c:if test="${!empty restaurant.tel }">
								<li><span class="icon_phone"></span> ${ restaurant.tel}</li>
							</c:if>
							<c:if test="${empty restaurant.tel}">
								<li><span class="icon_phone"></span> 정보 없음</li>
							</c:if>
							<li>
								<span class="icon_archive_alt"></span> 
								누적 리뷰수 : 
								<text style="font-weight: bold;">${restaurant.numOfReviews }</text>
							</li>
						</ul>
					</div>
					<div class="listing__item__text__info">
						<c:if test="${!empty restaurant.tel }">
							<div class="listing__item__text__info__right">${ restaurant.operationHour}
							</div>
						</c:if>
						<c:if test="${empty restaurant.tel }">
							<div class="listing__item__text__info__right">정보없음</div>
						</c:if>
					</div>
				</div>
			</div>
			<!--  식당 하나 div 끝 -->

		</c:forEach>

	</div>

	<!-- pagination 시작 -->

	<div id="paginationBox">
		<ul class="pagination">
			<c:if test="${pagination.previousPage}">
				<li class="page-item">
					<c:choose> 
						<c:when test="${!empty category }">
							<a class="page-link" onClick="loadRestaurantsPage('${pagination.currentPage-1}','${category}')">
						</c:when>
						<c:otherwise>
							<a class="page-link" onClick="loadListDivBySearchKeyword('${pagination.currentPage-1}','${search}')">
						</c:otherwise>
					</c:choose>
					Previous</a>
				</li>
			</c:if>

			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<li class="page-item <c:out value="${pagination.currentPage == idx ? 'active' : ''}"/> ">
					<c:choose>
						<c:when test="${!empty category}">
							<a class="page-link" onclick="loadRestaurantsPage('${idx}','${category}')"> ${idx} </a>
						</c:when>
						<c:otherwise>
							<a class="page-link" onClick="loadListDivBySearchKeyword('${idx}','${search}')"> ${idx} </a>
						</c:otherwise>
					</c:choose>
				</li>
			</c:forEach>


			<li class="page-item">
				<c:choose>
					<c:when test="${!empty category }">
						<a class="page-link" onClick="loadRestaurantsPage('${pagination.currentPage+1}','${category}')">
					</c:when>
					<c:otherwise>
						<a class="page-link" onClick="loadListDivBySearchKeyword('${pagination.currentPage+1}','${search}')">
					</c:otherwise>
				</c:choose>
				Next</a>
			</li>

		</ul>
	</div>


	<!-- pagination 끝 -->
</section>