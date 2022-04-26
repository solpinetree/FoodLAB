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
       	  <!--  식당 하나 div 시작 -->
           <div class="listing__item">
               <div class="listing__item__pic set-bg" data-setbg="${resources}/img/listing/list-1.jpg">
                  <div class="listing__item__pic__tag">Popular</div>
                  <div class="listing__item__pic__btns">
                      <a href="#"><span class="icon_zoom-in_alt"></span></a>
                      <a href="#"><span class="icon_heart_alt"></span></a>
                  </div>
              </div>
              <div class="listing__item__text">
                  <div class="listing__item__text__inside">
                      <h5>Chinese Sausage Restaurant</h5>
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
                          <li><span class="icon_pin_alt"></span> 주소 </li>
                          <li><span class="icon_phone"></span> 번호</li>
                          <li><span class="icon_archive_alt"></span> 누적 리뷰수 : <text style="font-weight: bold;">120</text></li>                          
                      </ul>
                  </div>
                  <div class="listing__item__text__info">
                      <div class="listing__item__text__info__left">
                          <span>중식</span>
                      </div>
                      <div class="listing__item__text__info__right">Open Now</div>
                  </div>
              </div>
          </div>
          <!--  식당 하나 div 끝 -->
          <div class="listing__item">
              <div class="listing__item__pic set-bg" data-setbg="${resources}/img/listing/list-2.jpg">
                  <div class="listing__item__pic__tag top_rate">Top Rate</div>
                  <div class="listing__item__pic__btns">
                      <a href="#"><span class="icon_zoom-in_alt"></span></a>
                      <a href="#"><span class="icon_heart_alt"></span></a>
                  </div>
              </div>
              <div class="listing__item__text">
                  <div class="listing__item__text__inside">
                      <h5>Shrimp floured and fried</h5>
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
                          <li><span class="icon_pin_alt"></span> 주소 </li>
                          <li><span class="icon_phone"></span> 번호</li>
                          <li><span class="icon_archive_alt"></span> 누적 리뷰수 : <text style="font-weight: bold;">120</text></li>                          
                      </ul>
                  </div>
                  <div class="listing__item__text__info">
                      <div class="listing__item__text__info__left">
                          <span>양식</span>
                      </div>
                      <div class="listing__item__text__info__right closed">Closed</div>
                  </div>
              </div>
          </div>
          <!--  식당 하나 div 끝 -->
          <div class="listing__item">
              <div class="listing__item__pic set-bg" data-setbg="${resources}/img/listing/list-4.jpg">
                  <div class="listing__item__pic__tag">Popular</div>
                  <div class="listing__item__pic__btns">
                      <a href="#"><span class="icon_zoom-in_alt"></span></a>
                      <a href="#"><span class="icon_heart_alt"></span></a>
                  </div>
              </div>
              <div class="listing__item__text">
                  <div class="listing__item__text__inside">
                      <h5>Crab fried with tamarind</h5>
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
                          <li><span class="icon_pin_alt"></span>주소</li>
                          <li><span class="icon_phone"></span>번호</li>
                          <li><span class="icon_archive_alt"></span> 누적 리뷰수 : <text style="font-weight: bold;">120</text></li>                          
                      </ul>
                  </div>
                  <div class="listing__item__text__info">
                      <div class="listing__item__text__info__left">
                          <span>디저트, 카페</span>
                      </div>
                      <div class="listing__item__text__info__right closed">Closed</div>
                  </div>
              </div>
          </div>
           <!--  식당 하나 div 끝 -->
          <div class="listing__item">
              <div class="listing__item__pic set-bg" data-setbg="${resources}/img/listing/list-3.jpg">
                  <div class="listing__item__pic__tag">Popular</div>
                  <div class="listing__item__pic__btns">
                      <a href="#"><span class="icon_zoom-in_alt"></span></a>
                      <a href="#"><span class="icon_heart_alt"></span></a>
                  </div>
              </div>
              <div class="listing__item__text">
                  <div class="listing__item__text__inside">
                      <h5>Sweet and sour pork ribs</h5>
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
                          <li><span class="icon_pin_alt"></span> 주소</li>
                          <li><span class="icon_phone"></span> 번호</li>
                          <li><span class="icon_archive_alt"></span> 누적 리뷰수 : <text style="font-weight: bold;">120</text></li>                          
                      </ul>
                  </div>
                  <div class="listing__item__text__info">
                      <div class="listing__item__text__info__left">
                          <span>디저트, 카페</span>
                      </div>
                      <div class="listing__item__text__info__right">Open Now</div>
                  </div>
              </div>
          </div>
          <!--  식당 하나 div 끝 -->
          <div class="listing__item">
              <div class="listing__item__pic set-bg" data-setbg="${resources}/img/listing/list-5.jpg">
                  <div class="listing__item__pic__tag hot_deal">Hot Deal</div>
                  <div class="listing__item__pic__btns">
                      <a href="#"><span class="icon_zoom-in_alt"></span></a>
                      <a href="#"><span class="icon_heart_alt"></span></a>
                  </div>
              </div>
              <div class="listing__item__text">
                  <div class="listing__item__text__inside">
                      <h5>Tortoise grilled on salt</h5>
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
                          <li><span class="icon_pin_alt"></span> 주소</li>
                          <li><span class="icon_phone"></span> 번호</li>
                          <li><span class="icon_archive_alt"></span> 누적 리뷰수 : <text style="font-weight: bold;">120</text></li>
                      </ul>
                  </div>
                  <div class="listing__item__text__info">
                      <div class="listing__item__text__info__left">
                          <span>치킨</span>
                      </div>
                      <div class="listing__item__text__info__right">Open Now</div>
                  </div>
              </div>
          </div>
           <!--  식당 하나 div 끝 -->
          <div class="listing__item">
              <div class="listing__item__pic set-bg" data-setbg="${resources}/img/listing/list-6.jpg">
                  <div class="listing__item__pic__tag">Popular</div>
                  <div class="listing__item__pic__btns">
                      <a href="#"><span class="icon_zoom-in_alt"></span></a>
                      <a href="#"><span class="icon_heart_alt"></span></a>
                  </div>
              </div>
              <div class="listing__item__text">
                  <div class="listing__item__text__inside">
                      <h5>Fish cooked with fishsauce</h5>
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
                          <li><span class="icon_pin_alt"></span> 주소</li>
                          <li><span class="icon_phone"></span> 번호</li>
                          <li><span class="icon_archive_alt"></span> 누적 리뷰수 : <text style="font-weight: bold;">120</text></li>
                      </ul>
                  </div>
                  <div class="listing__item__text__info">
                      <div class="listing__item__text__info__left">
                          <span>디저트, 카페</span>
                      </div>
                      <div class="listing__item__text__info__right">Open Now</div>
                  </div>
              </div>
          </div>
      </div>
  </section>