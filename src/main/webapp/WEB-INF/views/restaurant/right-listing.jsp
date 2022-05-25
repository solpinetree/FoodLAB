<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  resources 디렉토리 위치를 가리키는 변수 선언 -->
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />
<c:set var="root" value="${pageContext.request.contextPath }" />
<section class="listing nice-scroll">
       <div class="listing__text__top">
           <div class="listing__text__top__left">
               <h5>필터 적용 결과</h5>
               <span>18 Results Found</span>
           </div>
           <div class="listing__text__top__right">Nearby <i class="fa fa-sort-amount-asc"></i></div>
       </div>
       <div class="listing__list">
       
       	<c:forEach items="${restaurants}" var="restaurant">
       	
	       	  <!--  식당 하나 div 시작 -->
	           <div class="listing__item">  
	      
	           <div class="listing__item__pic set-bg" style=" cursor: pointer;" onclick="location.href='${root}/restaurants/detail?restaurantId=${restaurant.restaurantId}';" data-setbg="${restaurant.imgUrl}" style="border-radius: 40px 40px 0 0;">
	                  <div class="listing__item__pic__tag" style="background: #f9adbd">${restaurant.category}</div>
	                  <div class="listing__item__pic__btns">
	                      <div class="listing__item__pic__btns">
                           	<a href="#"><span class="icon_heart_alt"></span></a>
                          </div>
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
	                          <li><span class="icon_phone"></span> ${ restaurant.tel} </li>
	                          <li><span class="icon_archive_alt"></span> 누적 리뷰수 : <text style="font-weight: bold;">120</text></li>                          
	                      </ul>
	                  </div>
	                  <div class="listing__item__text__info">
	                      
	                      <div class="listing__item__text__info__right">${ restaurant.operationHour} </div>
	                  </div>
	              </div>
	          </div>
	          <!--  식당 하나 div 끝 -->
          
          </c:forEach>
        
      </div>
		
		
		    <!-- pagination 시작 -->
		    <c:if test="${category==null}">
			<div id="paginationBox">
				<ul class="pagination">
					<c:if test="${pagination.previousPage}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_prev('${pagination.currentPage}')">Previous</a></li>
					</c:if>
		
					<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
						<li
							class="page-item <c:out value="${pagination.currentPage == idx ? 'active' : ''}"/> "><a
							class="page-link" href="#"
							onClick="fn_pagination('${idx}')">
								${idx} </a></li>
					</c:forEach>
		
					<c:if test="${pagination.nextPage}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_next('${pagination.currentPage}')">Next</a></li>
					</c:if>
				</ul>
			</div>
			</c:if>
			
			
			<!-- pagination 끝 -->
  </section>