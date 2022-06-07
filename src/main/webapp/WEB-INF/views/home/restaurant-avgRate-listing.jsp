<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/path.jsp"%>

<section class = "current-review-6">
	<c:forEach var = "restaurantContent" items = "${restaurantByAvgRate}" begin = "0" end = "5" step = "1" varStatus="status">
		<div class="col-lg-4 col-md-4">
			<div class="FoodLog__Item">
				<div class = "FoodLog__Title">
					<div class = "FoodLog__item__text__inside">
						<!-- 식당이름 -->
						<h5>${restaurantContent.name}</h5> <!-- 게시물 이름 -->
					</div>
				</div>
				<!-- 리뷰 썸네일 review_images url 하고 연결시켜줘야함 dao 메서드 하나 필요 -->
				<c:choose>
					<c:when test = "${restaurantContent.imgUrl ne null}">
						<img class="FoodLog__item__pic" src="${restaurantContent.imgUrl}">
					</c:when>
					<c:otherwise>
						<!-- default 이미지 -->
						<img class="FoodLog__item__pic" src="">
					</c:otherwise>
				</c:choose>
				
				 
				

				<div class="FoodLog__item__text">
			  		<div class="FoodLog__item__text__inside">
			      		<ul>		      		
			      			<li class="home-star-rate-li">
			      				<div class = "home-star-rate-box">
                                   	<p class= "home-star-rate-text">평점</p> 
                                   	<c:choose>
                                   		<c:when test="${ restaurantContent.avgRate ne null and restaurantContent.avgRate ne 0}">
                                   			<span class="home-star-rate-star">
			                                	<c:forEach var="i" begin="1" end="${ restaurantContent.avgRate }" >
			                                		<i class="star-rate-icon icon_star"></i>
			                                	</c:forEach>
		                                		<c:forEach var="i" begin="${restaurantContent.avgRate + 1 }" end="5">
		                                			<i class="star-rate-icon icon_star_alt"></i>
		                                		</c:forEach> <span style = "color: black;">(${ restaurantContent.avgRate })</span>
		                                		
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
		                                  	<c:when test="${ restaurantContent.avgPriceSatisRate ne null and restaurantContent.avgPriceSatisRate ne 0}">
			                                  	<span class="home-star-rate-star">
			                                	<c:forEach var="i" begin="1" end="${ restaurantContent.avgPriceSatisRate }" >
			                                		<i class="star-rate-icon icon_star"></i>
			                                	</c:forEach>
			                                	
			                               		<c:forEach var="i" begin="${restaurantContent.avgPriceSatisRate + 1 }" end="5">
			                               			<i class="star-rate-icon icon_star_alt"></i>
			                               		</c:forEach> <span style = "color: black;">(${ restaurantContent.avgPriceSatisRate })</span>
		                               			</span>
	                               			</c:when>
	                               			<c:otherwise>
	                               				<span class="star-rate-star">정보 없음</span>
	                               			</c:otherwise>
                               			</c:choose>
                         			
                         		</div>
                         		
                              </li>
			      			
			      			
			      			
			      	
							<li>
								<span class="icon_pin_alt"></span> ${restaurantContent.address}
							</li>
							<c:if test="${!empty restaurantContent.tel }">
								<li><span class="icon_phone"></span> ${ restaurantContent.tel}</li>
							</c:if>
							<c:if test="${empty restaurantContent.tel}">
								<li><span class="icon_phone"></span> 정보 없음</li>
							</c:if>
							<li>
								<span class="icon_archive_alt"></span> 
								누적 리뷰수 : 
								<text style="font-weight: bold;">${restaurantContent.numOfReviews }</text>
							</li>

							<div class="home-review-text">
								<c:if test="${!empty restaurantContent.operationHour }">
									<div class="home-review-text">${ restaurantContent.operationHour}
									</div>
								</c:if>
								<c:if test="${empty restaurantContent.operationHour }">
									<div class="home-review-text">정보없음</div>
								</c:if>
							</div>
			      			  
			      		  </ul>
					</div>

				</div>     
			</div>
		</div>
	
	</c:forEach>
</section>