<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/common.jsp" %>


<head>
    <title>Food LAB</title>
</head>


<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div> 

    <!-- Header Section Begin -->
	<jsp:include page="logins/header.jsp"/>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero set-bg" data-setbg="resources/img/hero/hero-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="hero__text">
                        <div class="section-title">
                            <h2>Food LAB</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Most Search Section Begin -->
    <section class="most-search spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>리뷰 게시판</h2>
                    </div>
                </div>
            </div>
            
            <!-- 메인페이지 리뷰게시판 카테고리 -->
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="most__search__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                    <span class="flaticon-039-fork"></span>
                                    한식
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">
                                    <span class="flaticon-030-kebab"></span>
                                    중식
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">
                                    <span class="flaticon-032-food-truck"></span>
                                    패스트푸드
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">
                                    <span class="flaticon-017-croissant"></span>
                                    피자
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-5" role="tab">
                                    <span class="flaticon-038-take-away"></span>
                                    카페-디저트
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">
                                    <span class="flaticon-031-delivery"></span>
                                    분식
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-7" role="tab">
                                    <span class="flaticon-031-delivery"></span>
                                    야식
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-8" role="tab">
                                    <span class="flaticon-031-delivery"></span>
                                    도시락
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-1.jpg">
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>고반식당 용인보정점</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>30000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>경기 용인시 기흥구 죽전로15번길 4-9</li>
                                                    <li><span class="icon_phone"></span> 031-889-1506</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>양식</span>
                                                </div>
                                                <div class="listing__item__text__info__right">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-2.jpg">      
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>옵서예</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>55000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>경기 용인시 기흥구 죽전로15번길 8-20 1층 옵서에</li>
                                                    <li><span class="icon_phone"></span>031-889-8876</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-2.png" alt="">
                                                    <span>양식</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">영업종료</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-3.jpg">
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>내대지238</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>25000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>경기 용인시 수지구 죽전로238번길 78-2</li>
                                                    <li><span class="icon_phone"></span>010-2351-2380</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>양식</span>
                                                </div>
                                                <div class="listing__item__text__info__right">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-4.jpg">
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>목구멍 용인점</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>30000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>경기 용인시 기흥구 죽전로15번길 3-14</li>
                                                    <li><span class="icon_phone"></span>031-262-0292</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>양식</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">영업종료</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-5.jpg">

                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>일호식 신세계 경기점</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>50000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>경기 용인시 수지구 포은대로 536 지하2층</li>
                                                    <li><span class="icon_phone"></span>0507-1429-1498</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-4.png" alt="">
                                                    <span>양식</span>
                                                </div>
                                                <div class="listing__item__text__info__right">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-6.jpg">
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>생선집</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>25000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>횟집</span>
                                                </div>
                                                <div class="listing__item__text__info__right">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-1.jpg">
                                   
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>중국집</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>7000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>중국집</span>
                                                </div>
                                                <div class="listing__item__text__info__right">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-2.jpg">
                         
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>짜왕</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>8000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-2.png" alt="">
                                                    <span>중국집</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">영업종료</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-3.jpg">
                                            
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>자강성</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>9000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>중국집</span>
                                                </div>
                                                <div class="listing__item__text__info__right">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-4.jpg">
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>은빛바람</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>12000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>중국집</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">영업종료</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-5.jpg">
                                   
                                            <div class="listing__item__pic__btns">
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
                                                    <h6>14000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-4.png" alt="">
                                                    <span>중국집</span>
                                                </div>
                                                <div class="listing__item__text__info__right">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-3.jpg">
                                          
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>맥도날드</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>12000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>패스트푸드</span>
                                                </div>
                                                <div class="listing__item__text__info__right">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-4.jpg">
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>롯데리아</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>9000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>패스트푸드</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">영업종료</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-5.jpg">
                                         
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>맘스터치</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>12000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-4.png" alt="">
                                                    <span>패스트푸드</span>
                                                </div>
                                                <div class="listing__item__text__info__right">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-6.jpg">
                                 
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>버거킹</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>14000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>패스트푸드</span>
                                                </div>
                                                <div class="listing__item__text__info__right">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-4" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-1.jpg">
                                
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>피자스쿨</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>15000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>피자</span>
                                                </div>
                                                <div class="listing__item__text__info__right">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-2.jpg">
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>피자헛</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>21000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-2.png" alt="">
                                                    <span>피자</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">영업종료</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-3.jpg">
                                    
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>청년피자</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>13000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>피자</span>
                                                </div>
                                                <div class="listing__item__text__info__right">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-6.jpg">
                                           
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>피자빵</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>14000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>피자</span>
                                                </div>
                                                <div class="listing__item__text__info__right">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-5" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-1.jpg">
                                            
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>메가커피</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>14000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>커피</span>
                                                </div>
                                                <div class="listing__item__text__info__right">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-2.jpg">
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>스타벅스</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>12000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-2.png" alt="">
                                                    <span>커피</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">영업종료</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-3.jpg">
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>2nd Story</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>11000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>커피</span>
                                                </div>
                                                <div class="listing__item__text__info__right">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-4.jpg">
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>와플나라</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>10000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>와플</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-6.jpg">
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>CAFE</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>10000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>커피</span>
                                                </div>
                                                <div class="listing__item__text__info__right">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-6" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-1.jpg">
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>분식이맛있다</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>9000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>떡볶이</span>
                                                </div>
                                                <div class="listing__item__text__info__right">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-2.jpg">
                                           
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>죠스떡볶이</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>16000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-2.png" alt="">
                                                    <span>분식</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">영업종료</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-4.jpg">
                                            
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>엄마네분식</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>9000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>분식</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">영업종료</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-5.jpg">
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>배달의떡볶이</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>10000원</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span>주소</li>
                                                    <li><span class="icon_phone"></span>전화번호</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-4.png" alt="">
                                                    <span>분식</span>
                                                </div>
                                                <div class="listing__item__text__info__right">영업중</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
    <section class="most-search spad">
        <div class="container">
            <div class="row">
               <div class="col-lg-12">
	               <div class="section-title">
	                  <h2>오픈채팅</h2>
	                  <a href = "${root}/chat/openchat"><img src="resources/img/blog/chatimageDemo.PNG" alt=""></a>
	               </div>
               </div>
            </div>
        </div>
    </section>
    <!-- Most Search Section End -->

    <!-- Work Section Begin -->
    <section class="work spad">
        <div class="container">
            <div class="row">
 
            </div>
        </div>
    </section>
    <!-- Work Section End -->

    <!-- Feature Location Section Begin -->
    <section class="feature-location spad">
        <div class="container">
            <div class="row">
               
           
            </div>
        </div>
    </section>
    <!-- Feature Location Section End -->

    
    <!-- Footer Section Begin -->
	<jsp:include page="includes/footer.jsp"/>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
	<%@ include file="includes/plugins.jsp" %>
</body>

</html>