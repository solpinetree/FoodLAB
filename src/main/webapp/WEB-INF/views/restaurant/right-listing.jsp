<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  resources 디렉토리 위치를 가리키는 변수 선언 -->
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />

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
	               <div class="listing__item__pic set-bg" data-setbg="${restaurant.imgUrl}" style="border-radius: 40px 40px 0 0;">
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
      <div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
  <div class="btn-group me-2" role="group" aria-label="First group" style = "float:none; margin:0 auto;">
    <button type="button" class="btn btn-outline-secondary">1</button>
    <button type="button" class="btn btn-outline-secondary">2</button>
    <button type="button" class="btn btn-outline-secondary">3</button>
    <button type="button" class="btn btn-outline-secondary">4</button>
    <button type="button" class="btn btn-outline-secondary">5</button>
    <button type="button" class="btn btn-outline-secondary">6</button>
    <button type="button" class="btn btn-outline-secondary">7</button>
    <button type="button" class="btn btn-outline-secondary">8</button>
    <button type="button" class="btn btn-outline-secondary">9</button>
    <button type="button" class="btn btn-outline-secondary">10</button>
    <button type="button" class="btn btn-outline-secondary">></button>
  </div>
  </div>
  </section>