<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/path.jsp" %>

<section class="listing nice-scroll">
       <div class="listing__text__top">
           <div class="listing__text__top__left">
               <h5>오늘의 식당 순위</h5>
           </div>
       </div>
       <div class="listing__list">
       	  <!--  식당 하나 div 시작 -->
           <div class="listing__item" onclick="location.href='${root}/restaurants/detail'">
               <div class="listing__item__pic set-bg" data-setbg="${resources}/img/listing/list-1.jpg">
                  <div class="listing__item__pic__tag">1</div>
                  <div class="listing__item__pic__btns">
                      <a href="#"><span class="icon_zoom-in_alt"></span></a>
                      <a href="#"><span class="icon_heart_alt"></span></a>
                  </div>
              </div>
              <div class="listing__item__text">
                  <div class="listing__item__text__inside">
                      <h5>홍춘</h5>
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
                  <div class="listing__item__pic__tag">2</div>
                  <div class="listing__item__pic__btns">
                      <a href="#"><span class="icon_zoom-in_alt"></span></a>
                      <a href="#"><span class="icon_heart_alt"></span></a>
                  </div>
              </div>
              <div class="listing__item__text">
                  <div class="listing__item__text__inside">
                      <h5>고수찜닭</h5>
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
                  <div class="listing__item__pic__tag">3</div>
                  <div class="listing__item__pic__btns">
                      <a href="#"><span class="icon_zoom-in_alt"></span></a>
                      <a href="#"><span class="icon_heart_alt"></span></a>
                  </div>
              </div>
              <div class="listing__item__text">
                  <div class="listing__item__text__inside">
                      <h5>다린</h5>
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
                  <div class="listing__item__pic__tag">4</div>
                  <div class="listing__item__pic__btns">
                      <a href="#"><span class="icon_zoom-in_alt"></span></a>
                      <a href="#"><span class="icon_heart_alt"></span></a>
                  </div>
              </div>
              <div class="listing__item__text">
                  <div class="listing__item__text__inside">
                      <h5>일미돈까스</h5>
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
                  <div class="listing__item__pic__tag">4</div>
                  <div class="listing__item__pic__btns">
                      <a href="#"><span class="icon_zoom-in_alt"></span></a>
                      <a href="#"><span class="icon_heart_alt"></span></a>
                  </div>
              </div>
              <div class="listing__item__text">
                  <div class="listing__item__text__inside">
                      <h5>도스마스</h5>
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
                  <div class="listing__item__pic__tag">5</div>
                  <div class="listing__item__pic__btns">
                      <a href="#"><span class="icon_zoom-in_alt"></span></a>
                      <a href="#"><span class="icon_heart_alt"></span></a>
                  </div>
              </div>
              <div class="listing__item__text">
                  <div class="listing__item__text__inside">
                      <h5>그란데</h5>
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