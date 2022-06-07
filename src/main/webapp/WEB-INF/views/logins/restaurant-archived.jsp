<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/path.jsp" %>

<script type="text/javascript" src="${resources}/js/restaurant/archive-process.js"></script>

<body>

<section class="listing nice-scroll" id="restaurantList">
	<div id="resultNumDiv">
		<div class="listing__text__top">
			<div class="listing__text__top__left">
				<p>${fn:length(archivedRestaurants)}개의 찜한 식당</p>
			</div>
		</div>
	</div>
	<div class="listing__list showSeachText" id="showcategorys">
		<c:forEach items="${archivedRestaurants}" var="restaurant">

			<!--  식당 하나 div 시작 -->
			<div class="listing__item">
					<div class="listing__item__pic set-bg"
						style="background-image:url(${restaurant.imgUrl});"
						style="border-radius: 40px 40px 0 0;">
					<div class="listing__item__pic__tag" style="background: #f9adbd">${restaurant.category}</div>

					<div class="listing__item__pic__btns">
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
						<div class="listing__item__text__rating">
							<div class="listing__item__rating__star">
								<p>평점 </p><span class="icon_star"></span> <span class="icon_star"></span>
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
	

</body>



