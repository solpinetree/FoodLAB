<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/common.jsp" %>

<head>
    <title>Food LAB</title>
    
    <link rel="stylesheet" href='${resources }/css/main/main.css'>
</head>


<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div> 

    <!-- Header Section Begin -->
	<jsp:include page="includes/header.jsp"/>
    <!-- Header Section End -->
 

    <!-- Food Lab Main page Background -->
    <section class="hero set-bg" data-setbg="resources/img/hero/hero-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="hero__text">
                        <div class="section-title-main">
                            <h2 class="welcome-main-text">맛집 연구소</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    

	<!-- 오늘의 서비스왕  -->
	<section class = "most-search spad">
		<div class = "container">
			<div class = "row">
				<div class = "col-lg-12">
					<div class = "section-title">
						<h2>오늘의 서비스왕</h2> <!-- 오늘의 서비스왕 탭하고 링크해야함 -->
						<p>오늘의 서비스왕에 대한 설명입니다 블라블라블라<p>
					</div>
				</div>
			</div>
			
			
			<div class = "row">
				<!-- 이미지 슬라이드  -->
				
				<div class = "col-balance-1 col-lg-6 col-md-6">
					<div class = "most__search__tab"> <!-- padding 값 넣어주려고 한거임 나중에 css수정해서 이 부분 없애야됨 -->
						<div id="slide" class="img-box">
						
					        <img class="slide__link" src="${resources}/img/blog/blog-1.jpg" alt="">
					        <img class="slide__link" src="${resources}/img/blog/blog-2.jpg" alt="">
					        <img class="slide__link" src="${resources}/img/blog/blog-3.jpg" alt="">
					      
					        <!-- 이전, 다음 버튼 구현 -->
					        <button id = "prev">&lang;</button> 
        					<button id = "next">&rang;</button>
    					</div>
    					
    					
					</div>
				</div>
	
				
			
				<!-- 각 이미지마다 리뷰 3개씩 -->
				<div class = "col-balance-1 col-lg-6 col-md-6">
					<div class = "most__search__tab">
						<div class="slide__item">
                            <div class="slide__item__text">
                               <!-- 추후에 db에서 받아올것임 리뷰 2줄로 제한해서 -->
                               <h5>리뷰1</h5>
                               
                               <div class="slide__item__text__rating">
                                   <div class="slide__item__rating__star">
                                       <span class="icon_star"></span>
                                       <span class="icon_star"></span>
                                       <span class="icon_star"></span>
                                       <span class="icon_star"></span>
                                       <span class="icon_star-half_alt"></span>
                                   </div>
                               </div>        
                            </div>                
                        </div>
                        
                        <div class="slide__item">
                            <div class="slide__item__text">
                               <h5>리뷰2</h5>
                               
                               <div class="slide__item__text__rating">
                                   <div class="slide__item__rating__star">
                                       <span class="icon_star"></span>
                                       <span class="icon_star"></span>
                                       <span class="icon_star"></span>
                                       <span class="icon_star"></span>
                                       <span class="icon_star-half_alt"></span>
                                   </div>
                               </div>        
                            </div>                
                        </div>
                        
                        <div class="slide__item">
                            <div class="slide__item__text">
                               <h5>리뷰3</h5>
                               
                               <div class="slide__item__text__rating">
                                   <div class="slide__item__rating__star">
                                       <span class="icon_star"></span>
                                       <span class="icon_star"></span>
                                       <span class="icon_star"></span>
                                       <span class="icon_star"></span>
                                       <span class="icon_star-half_alt"></span>
                                   </div>
                               </div>        
                            </div>                
                        </div>
                    </div>
				</div>				
			</div>
		</div>
	</section>
    <!-- Most Search Section Begin -->
    <section class="most-search spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>푸드 로그</h2>
                        <p>푸드로거분들의 식당 리뷰를 할 수 있는 공간입니다</p>
                    </div>
                </div>
            </div>
            
            <!-- 메인페이지 리뷰게시판 카테고리 -->
            <div class="row">
                <div class="col-lg-12 col-md-12">           
                    <div class="most__search__tab most__search__tab_category">             
                        <ul class="nav nav-tabs nav-tabs-category" role="tablist">
                <c:forEach items="${categories}" var="category">
                <c:if test="${category eq '피자/양식'}">
                <c:set var="category_id" value="${fn:replace(category, '/', '')}" />
                </c:if>
                <c:if test="${category != '피자/양식'}">
                <c:set var="category_id" value="${fn:replace(category, '.', '')}" />
                </c:if>
                            <li class="nav-item nav-item-category">
                                <a class="nav-link" data-toggle="tab" href="#${category_id}" role="tab">
                                    <span class="flaticon-039-fork"></span>
                                    ${category}
                                </a>
                            </li>
                </c:forEach>
                        </ul>
                
                    </div>
                
                    <div class="tab-content">
                    
                    
                        <div class="tab-pane active" id="도시락" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-4">
                                    <div class="FoodLog__Item">
                                    	<div class = "FoodLog__Title">
                                    		<div class = "FoodLog__item__text__inside">
                                    			<h5>게시물 제목</h5> <!-- 게시물 이름 -->
                                    		</div>
                                    	</div>
                                    	<!-- 리뷰 썸네일 -->
                                        <div class="FoodLog__item__pic set-bg" data-setbg="resources/img/listing/list-1.jpg">
                                           
                                        </div>
                                        
                                        <div class="FoodLog__item__text">
                                            <div class="FoodLog__item__text__inside">
                                                <h5>식당 이름</h5> <!-- 식당이름  -->
                                     
                                            </div>
                                            <div class = "listing__item__text__inside">
                                                <h6>게시물 (2줄)</h6>
                                                <hr>
                                            </div>
                                            <div class="FoodLog__item__text__rating">
                                                <div class="FoodLog__item__rating__star">
                                                    <span class="icon_star"></span>
                                                    <span class="icon_star"></span>
                                                    <span class="icon_star"></span>
                                                    <span class="icon_star"></span>
                                                    <span class="icon_star-half_alt"></span><span class = "FoodLog__item__rating__people__price">(평점)</span>
                                        			<span class = "FoodLog__item__rating__people__price"><br>명 가격</span>
                                        			<!-- 평점, 인원수, 가격 데이터를 불러와야함 -->            
                                            	</div>  	
                                        	</div>
                                      	</div>     
                                   	  </div>
                                    </div>
                             
                                <div class="col-lg-4 col-md-4">
                                <div class = "FoodLog__Title">
                                    		<div class = "FoodLog__item__text__inside">
                                    			<h5>게시물 제목</h5> <!-- 게시물 이름 -->
                                    		</div>
                                    	</div>
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
                                                    <span>${category}</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">영업종료</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               </div>
                               </div>
                               
                   
                      <c:forEach items="${categories}" var="category">
                      
                      
     				  <c:if test="${category eq '피자/양식'}">
                	  <c:set var="category_id" value="${fn:replace(category, '/', '')}" />
                	  </c:if>
                	  <c:if test="${category != '피자/양식'}">
                	  <c:set var="category_id" value="${fn:replace(category, '.', '')}" />
                	  </c:if>
                	  
                      <div class="tab-pane" id="${category_id}" role="tabpanel">
                        
      
                       
                       
                            <div class="row">
                                <div class="col-lg-4 col-md-4">
                                <div class = "FoodLog__Title">
                                    		<div class = "FoodLog__item__text__inside">
                                    			<h5>${category}</h5> <!-- 게시물 이름 -->
                                    		</div>
                                    	</div>
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-1.jpg">
                                   
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>${category}</h5>
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
                                <div class = "FoodLog__Title">
                                    		<div class = "FoodLog__item__text__inside">
                                    			<h5>게시물 제목</h5> <!-- 게시물 이름 -->
                                    		</div>
                                    	</div>
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
                                <div class = "FoodLog__Title">
                                    		<div class = "FoodLog__item__text__inside">
                                    			<h5>게시물 제목</h5> <!-- 게시물 이름 -->
                                    		</div>
                                    	</div>
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
                                <div class = "FoodLog__Title">
                                    		<div class = "FoodLog__item__text__inside">
                                    			<h5>게시물 제목</h5> <!-- 게시물 이름 -->
                                    		</div>
                                    	</div>
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
                                <div class = "FoodLog__Title">
                                    		<div class = "FoodLog__item__text__inside">
                                    			<h5>게시물 제목</h5> <!-- 게시물 이름 -->
                                    		</div>
                                    	</div>
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
                       </c:forEach>
                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-4">
                                <div class = "FoodLog__Title">
                                    		<div class = "FoodLog__item__text__inside">
                                    			<h5>게시물 제목</h5> <!-- 게시물 이름 -->
                                    		</div>
                                    	</div>
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
                                <div class = "FoodLog__Title">
                                    		<div class = "FoodLog__item__text__inside">
                                    			<h5>게시물 제목</h5> <!-- 게시물 이름 -->
                                    		</div>
                                    	</div>
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
    	
    
    <!-- 오픈 채팅 서비스로 이동 구현 -->
    <section class="most-search spad">
        <div class="container">
            <div class="row">
               <div class="col-lg-12">
	               <div class="section-title">
	                  <h2>오픈채팅</h2>
	                 
	               </div>
               </div>
               
               <div class = "col-lg-4 col-md-4">
               	<h4>푸드로거 여러분들을 위한 공간입니다.</h4>
               </div>
               
               <div class = "col-lg-8 col-md-8">
               	<a href = "${root}/chat/openchat"><img src="resources/img/blog/chatimageDemo.PNG" alt=""></a>
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
<script type = "text/javascript" src = "${resources}/js/main/slideshow.js"></script>
</html>