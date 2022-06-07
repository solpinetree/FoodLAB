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
						<c:if test="${!empty sessionScope.sessionMember.username}">
							<script type="text/javascript">
								if(${restaurant.memberIdsArchivingThis}.includes(${sessionScope.sessionMember.id})){
									drawHeart(${restaurant.restaurantId},${sessionScope.sessionMember.id})
								}else{
									removeHeart(${restaurant.restaurantId},${sessionScope.sessionMember.id})								
								}			
							</script>
							<span class="heartDiv${restaurant.restaurantId }"></span>
						</c:if>
					</div>

				</div>



				<div class="listing__item__text" style="cursor:pointer" onclick="location.href='${root}/restaurants/detail?restaurantId=${restaurant.restaurantId}'">
					<div class="listing__item__text__inside">
						<h5>${restaurant.name}</h5>
						<!--
						<div class="listing__item__text__rating">
							<div class="listing__item__rating__star">
								<p class="listing_information_margin">평점 </p><span class="icon_star"></span> <span class="icon_star"></span>
								<span class="icon_star"></span> <span class="icon_star"></span>
								<span class="icon_star-half_alt"></span> (${restaurant.avgRate })
							</div>
						</div>
						
						<div class="listing__item__text__rating">
							<div class="listing__item__rating__star">
								<p>가격만족도 </p><span class="icon_star"></span> <span class="icon_star"></span>
								<span class="icon_star"></span> <span class="icon_star"></span>
								<span class="icon_star-half_alt"></span> (${restaurant.avgPriceSatisRate})
							</div>
						</div>  -->
						<div class="listing__item__text__rating">
							<div class="listing__item__rating__star">
								<ul>
                                    <li class="star-rate-li">
                                    	<p class="star-rate-text">평점</p>
                                    	<c:choose>
	                                     	<c:when test="${ restaurant.avgRate ne null and restaurant.avgRate ne 0}">
	                                     		<span class="star-rate-star">
				                                	<c:forEach var="i" begin="1" end="${ restaurant.avgRate }" >
				                                		<span class="icon_star"></span>
				                                	</c:forEach>
			                                		<c:forEach var="i" begin="${restaurant.avgRate + 1 }" end="5">
			                                			<span class="icon_star"></span>
			                                		</c:forEach>
			                                	</span>
		                                	</c:when>
		                                	<c:otherwise>
		                                		<span class="star-rate-star">정보 없음</span>
		                                	</c:otherwise>
	                                	</c:choose>
                                     </li>
                                    <li class="star-rate-li">
                                    	<p class="star-rate-text">가격만족도</p> 
                                    	<c:choose>
	                                   		<c:when test="${ restaurant.avgPriceSatisRate ne null and restaurant.avgPriceSatisRate ne 0}">
	                                   			<span class="star-rate-star">
				                                	<c:forEach var="i" begin="1" end="${ restaurant.avgPriceSatisRate }" >
				                                		<span class="icon_star"></span>
				                                	</c:forEach>
			                                		<c:forEach var="i" begin="${restaurant.avgPriceSatisRate + 1 }" end="5">
			                                			<span class="icon_star"></span>
			                                		</c:forEach>
				                                </span>
	                                		</c:when>
	                                		<c:otherwise>
	                                			<span class="star-rate-star">정보 없음</span>
	                                		</c:otherwise>
                                		</c:choose>
                                    </li>
                                </ul>
						
						
						
						
						
						
						
							</div>
						</div>
									
						
						
						
						
						
						<ul class="listing_information">
							<li class="listing_information_margin">
								<span class="icon_pin_alt"></span> ${ restaurant.address}
							</li>
							<c:if test="${!empty restaurant.tel }">
								<li class="listing_information_margin"><span class="icon_phone"></span> ${ restaurant.tel}</li>
							</c:if>
							<c:if test="${empty restaurant.tel}">
								<li class="listing_information_margin"><span class="icon_phone"></span> 정보 없음</li>
							</c:if>
							<li class="listing_information_margin">
								<span class="icon_archive_alt"></span> 
								누적 리뷰수 : 
								<text style="font-weight: bold;">${restaurant.numOfReviews }</text>
							</li>
						</ul>
					</div>
					<div class="listing__item__text__info">
						<c:if test="${!empty restaurant.operationHour }">
							<div class="listing__item__text__info__right">${ restaurant.operationHour}
							</div>
						</c:if>
						<c:if test="${empty restaurant.operationHour }">
							<div class="listing__item__text__info__right">정보없음</div>
						</c:if>
					</div>
				</div>
			</div>
			<!--  식당 하나 div 끝 -->

		</c:forEach>

	</div>

	<!-- pagination 시작 -->

	<div id="paginationBox" style="margin-top:50px; margin-bottom:100px;">
		<ul class="pagination" style="margin-left:35%">
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