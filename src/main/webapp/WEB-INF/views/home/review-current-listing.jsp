<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/path.jsp"%>

<div class = "current-review-6">	
	<c:set var="reviewURL" value="${reviewImageByReviewId}" />
	<c:set var="restaurant" value="${restaurantList}" />
	<c:forEach var = "reviewContent" items = "${reviewByRestaurantCategoryList}" begin = "0" end = "5" step = "1" varStatus="status">
	
         	
          <div class="col-lg-4 col-md-4 item_margin">
			<div class="FoodLog__Item">
				<div class = "FoodLog__Title">
					<div class = "FoodLog__item__text__inside">
						<!-- 리뷰제목 -->
						<h5>${reviewContent.title}</h5> <!-- 게시물 이름 -->
					</div>
				</div>
				<!-- 리뷰 썸네일 review_images url 하고 연결시켜줘야함 dao 메서드 하나 필요 -->
				<c:choose>
					<c:when test = "${reviewURL[status.index].imgUrl ne null}">
						<img class="FoodLog__item__pic" src="${reviewURL[status.index].imgUrl}">
					</c:when>
					<c:otherwise>
						<img class="FoodLog__item__pic" src="${reviewContent.dummyImg}">
					</c:otherwise>
				</c:choose>
				
				 
				

				<div class="FoodLog__item__text">
			  		<div class="FoodLog__item__text__inside">
			      		<ul>
			      			<li>
			      				<h5 class = "home-review-text-title">${restaurant[status.index].name}</h5> <!-- 식당이름  -->
			      				<hr>
			      			</li>
			      		
			      			<li class="home-star-rate-li">
			      				<div class = "home-star-rate-box">
                                   	<p class= "home-star-rate-text">평점</p> 
                                   	<c:choose>
                                   		<c:when test="${ reviewContent.rate ne null and reviewContent.rate ne 0}">
                                   			<span class="home-star-rate-star">
			                                	<c:forEach var="i" begin="1" end="${ reviewContent.rate }" >
			                                		<i class="star-rate-icon icon_star"></i>
			                                	</c:forEach>
		                                		<c:forEach var="i" begin="${reviewContent.rate + 1 }" end="5">
		                                			<i class="star-rate-icon icon_star_alt"></i>
		                                		</c:forEach> <span style = "color: black;">(${ reviewContent.rate })</span>
		                                		
			                                </span>
                                		</c:when>
                                		<c:otherwise>
                                			<span class="star-rate-star">정보 없음</span>
                                		</c:otherwise>
                               		</c:choose>
                               	</div>	
                             </li>
                             
			      			 <li class="home-star-rate-li">
			      			 	<div class = "home-star-rate-box">
                                   <p class="home-star-rate-text">가격만족도</p>
	                                	<c:choose>
		                                  	<c:when test="${ reviewContent.priceSatisfaction ne null and reviewContent.priceSatisfaction ne 0}">
			                                  	<span class="home-star-rate-star">
			                                	<c:forEach var="i" begin="1" end="${ reviewContent.priceSatisfaction }" >
			                                		<i class="star-rate-icon icon_star"></i>
			                                	</c:forEach>
			                                	
			                               		<c:forEach var="i" begin="${reviewContent.priceSatisfaction + 1 }" end="5">
			                               			<i class="star-rate-icon icon_star_alt"></i>
			                               		</c:forEach> <span style = "color: black;">(${ reviewContent.priceSatisfaction })</span>
		                               			</span>
	                               			</c:when>
	                               			<c:otherwise>
	                               				<span class="star-rate-star">정보 없음</span>
	                               			</c:otherwise>
                               			</c:choose>
                         			
                         		</div>
                         		
                              </li>
			      			  
			      			  <li class = "home-review-last-child">
			      			  		<p class = "home-review-text-title">리뷰요약</p>
			      			  		<c:choose>
			      			  			<c:when test = "${reviewContent.content ne null}">
			      			  				<p class = "home-review-text">${reviewContent.content}</p>
			      			  			</c:when>
			      			  			
			      			  			<c:otherwise>
			      			  				<p class = "home-review-text">리뷰 내용 없음</p>
			      			  			</c:otherwise>
			      					</c:choose>
			      			  </li>
			      			
			      			  
			      		  </ul>
					</div>

				</div>     
			</div>
		</div>
	</c:forEach>
</div>