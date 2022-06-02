<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  resources 디렉토리 위치를 가리키는 변수 선언 -->
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />
<c:set var="root" value="${pageContext.request.contextPath }" />
<section class="listing nice-scroll" id="restaurantList">
		<div id="resultNumDiv">
			<p>${category }</p>
			<c:if test="${!empty category }">
		       <div class="listing__text__top">
		           <div class="listing__text__top__left">
		               <h5>필터 적용 결과</h5>
		               <span>${numOfRecords }</span>
		           </div>
		       </div>
			</c:if>
		</div>
       <div class="listing__list showSeachText" id= "showcategorys">
       	<c:forEach items="${restaurants}" var="restaurant">
       	
	       	  <!--  식당 하나 div 시작 -->
	           <div class="listing__item">  
	      
	           <div class="listing__item__pic set-bg" style=" cursor: pointer;" onclick="location.href='${root}/restaurants/detail?restaurantId=${restaurant.restaurantId}';" data-setbg="${restaurant.imgUrl}" style="border-radius: 40px 40px 0 0;">
	                  <div class="listing__item__pic__tag" style="background: #f9adbd">${restaurant.category}</div>
	      
	                      <div class="listing__item__pic__btns">
	                      	<a href="#"><span class="icon_zoom-in_alt"></span></a>
                           	<a href="#"><span class="icon_heart_alt"></span></a>
                          </div>
	   
	              </div>
	          
	      
	           
	              <div class="listing__item__text">
	                  <div class="listing__item__text__inside">
	                      <h5>${restaurant.name}</h5>       
	                      <div class="listing__item__text__rating">
	                          <div class="listing__item__rating__star">
	                              <span class="icon_star"></span>
	                              <span class="icon_star"></span>
	                              <span class="icon_star"></span>
	                              <span class="icon_star"></span>
	                              <span class="icon_star-half_alt"></span>
	                          </div>
	                      </div>
	                      <ul>
	                          <li><span class="icon_pin_alt"></span> ${ restaurant.address} </li>
	                          <c:if test="${!empty restaurant.tel }">
	                          <li><span class="icon_phone"></span> ${ restaurant.tel} </li>
	                          </c:if>
	                          <c:if test="${empty restaurant.tel}">
	                          <li><span class="icon_phone"></span> 정보 없음 </li>
	                          </c:if> 
	                          <li><span class="icon_archive_alt"></span> 누적 리뷰수 : <text style="font-weight: bold;">120</text></li>                          
	                      </ul>
	                  </div>
	                  <div class="listing__item__text__info">
	                      <c:if test="${!empty restaurant.tel }">
	                      <div class="listing__item__text__info__right">${ restaurant.operationHour} </div>
	                      </c:if>
	                      <c:if test="${empty restaurant.tel }">
	                      <div class="listing__item__text__info__right">정보없음 </div>
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
						
							<c:if test="${pagevalue=='main'}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_prev('${pagination.currentPage}')">Previous</a></li>
							</c:if>>
							
							<c:if test="${pagevalue == 'select'}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_prev_category('${pagination.currentPage}','${category}')">Previous</a></li>
							</c:if>
							
					</c:if>
		
					<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
						
						<c:if test="${pagevalue=='main'}">
							<li
							class="page-item <c:out value="${pagination.currentPage == idx ? 'active' : ''}"/> "><a
							class="page-link" href="#"
							onclick="javascript:selectByCategory2('${idx}')">
								${idx} </a></li>
						</c:if>
								
								
								<c:if test="${pagevalue=='select'}">
						<li
							class="page-item <c:out value="${pagination.currentPage == idx ? 'active' : ''}"/> "><a
							class="page-link" href="#"
							onClick="fn_pagination_category('${idx}','${category}')">
								${idx} </a></li>
								</c:if>
								
					</c:forEach>
		
							
							<c:if test="${pagevalue=='main'}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_next('${pagination.currentPage}')">Next</a></li>
							</c:if>
							
							
							<c:if test="${pagevalue=='select'}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_next_category('${pagination.currentPage}','${category}')">Next</a></li>
							</c:if>
					
				</ul>
			</div>
			
					  
			<!-- pagination 끝 -->
  </section>