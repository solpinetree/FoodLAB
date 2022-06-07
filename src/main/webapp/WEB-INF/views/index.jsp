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
						<p>푸드로거 분들에게 인기가 가장많은 TOP 3 맛집을 소개합니다.<p>
					</div>
				
			
			<!--  
			<div class = "row">
				<!
				
				<div class = "col-balance-1 col-lg-6 col-md-6">
					<div class = "most__search__tab"> 
						<div id="slide" class="img-box">
						
					        <img class="slide__link" src="${resources}/img/blog/blog-1.jpg" alt="">
					        <img class="slide__link" src="${resources}/img/blog/blog-2.jpg" alt="">
					        <img class="slide__link" src="${resources}/img/blog/blog-3.jpg" alt="">
					      
					    
					        <button id = "prev">&lang;</button> 
        					<button id = "next">&rang;</button>
    					</div>
    					
    					
					</div>
				</div>
			</div> -->
			
			
				<!-- 각 이미지마다 리뷰 3개씩 -->
				
                    <!-- 추후에 db에서 받아올것임 리뷰 2줄로 제한해서 -->
                    
                    <!-- 식당정보 -->
                    <div id = "restaurant-content">
                    
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
                
            
            <!-- 메인페이지 리뷰게시판 카테고리 -->
                    
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
	                                <p class="nav-link" data-toggle="tab" onclick = "reviewCategoryTab('${category}')" role="tab" >
	                                    <span class="flaticon-039-fork"></span>
	                                    ${category}
	                                </p>
	                            </li>
			                </c:forEach>
                        </ul>
                     </div>
                
            
            
					<div id = "reviews-content">
					               
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
	                  <h2>푸드로거 오픈채팅방</h2>
	                 
	               </div>
               </div>

               <div class = "col-lg-8 col-md-8">
               		<a href = "${root}/chat/chat"><img src="${resources}/img/logos/FoodlabOpenChatLogo.png" alt="Foodlab OpenChat Logo"></a>
               </div>
               
               <div class = "col-lg-4 col-md-4">
					<h5>푸드로거들을 위한 수다공간입니다</h5>
					<h5>다양한 푸드로거분들과 맛집에 대한 정보를 공유하세요!</h5>
				</div>
            </div>
        </div>
    </section>
 
    
    <!-- Footer Section Begin -->
	<jsp:include page="includes/footer.jsp"/>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
	<%@ include file="includes/plugins.jsp" %>
</body>
<script type = "text/javascript" src = "${resources}/js/main/reviewRequest.js"></script>
<script type = "text/javascript" src = "${resources}/js/main/restaurantRequest.js"></script>
<script type = "text/javascript" src = "${resources}/js/main/slideshow.js"></script>
</html>