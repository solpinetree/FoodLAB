<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/path.jsp"%>

<section class = "current-review-6">	
	<c:set var="reviewURL" value="${reviewImageByReviewId}" />
	<c:set var="restaurant" value="${restaurantName}" />
	
	<c:forEach var = "reviewContent" items = "${reviewByRestaurantCategoryList}" begin = "0" end = "5" step = "1" varStatus="status">
	
         	
             	<div class="col-lg-4 col-md-4">
				<div class="FoodLog__Item">
					<div class = "FoodLog__Title">
						<div class = "FoodLog__item__text__inside">
							<!-- 리뷰제목 -->
							<h5>${reviewContent.title}</h5> <!-- 게시물 이름 -->
						</div>
					</div>
					<!-- 리뷰 썸네일 review_images url 하고 연결시켜줘야함 dao 메서드 하나 필요 -->
					<div class="FoodLog__item__pic set-bg" data-setbg="${resources}/${reviewURL[status.index].imgUrl}">
					 
					</div>

					<div class="FoodLog__item__text">
				  		<div class="FoodLog__item__text__inside">
				      		<h5>${restaurant[status.index]}</h5> <!-- 식당이름  -->
						</div>
						<div class = "listing__item__text__inside">
				  			<!-- 2줄 정도만 나타내야함 textarea로 하면될듯? -->
							<h6>${reviewContent.content}</h6>
							<hr>
						</div>


						<div class="FoodLog__item__text__rating">
						     <div class="FoodLog__item__rating__star">
						         <span class="icon_star"></span>
						         <span class="icon_star"></span>
						         <span class="icon_star"></span>
						         <span class="icon_star"></span>
						         <span class="icon_star-half_alt"></span>
						         <span class = "FoodLog__item__rating__people__price">(평점)</span>
								 <span class = "FoodLog__item__rating__people__price"><br>명 가격</span>
						<!-- 평점, 인원수, 가격 데이터를 불러와야함 -->            
					     	</div>  	
						</div>
					</div>     
				</div>
			</div>
	</c:forEach>
</section>