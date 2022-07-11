<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../includes/common.jsp" %>

<!--   recent-activity start's here -->
<section class="recent-activity">
    <div class="recent-activity__wrapper">
        <c:forEach var="status" begin="0" end="${fn:length(reviews)-1}" step="3">
            <!-- 리뷰 한 행(3개) 시작 -->
            <div class="recent-activity__row">
                <c:forEach var="i" begin="0" end="2">
                    <!-- 글 있는 리뷰 하나 시작 -->
                    <c:if test="${status+i < fn:length(reviews)}">
                        <div class="recent-activity__col feedback">
                            <div class="userinfo-wrapper">
                                <div class="img-container">
                                    <img src="${resources}/img/defaultProfile.jpeg" alt="profile-icon"/>
                                </div>
                                <div class="caption-wrapper">
                                    <span class="recent-activity__name"><a href="javascript:void(0);">${reviews[status + i].writer.username}</a></span>
                                    <span class="recent-activity__caption">리뷰 작성</span>
                                </div>
                            </div>
                            <a href="javascript:void(0);">
                                <img
                                        src="https://s3-media4.fl.yelpcdn.com/bphoto/u3WfxOE1DKuAENePexRmXg/l.jpg"
                                        alt="rest-photo" width="100%" class="thumb-with-content"/>
                            </a>
                            <h3 class="recent-activity__heading"><a href="javascript:void(0);">${reviews[status + i].restaurant.name}</a></h3>
                            <div class="restaurants__rating">
                                <div class="restaurants__rating__star five-stars">
                                    <i class="star-rate-icon icon_star"></i>
                                    <i class="star-rate-icon icon_star"></i>
                                    <i class="star-rate-icon icon_star"></i>
                                    <i class="star-rate-icon icon_star"></i>
                                    <i class="star-rate-icon icon_star_alt"></i>
                                </div>
                            </div>
                            <div class="text-container">
                                <p class="review-content">${reviews[status + i].content}  <a href="">Continue reading</a></p>
                            </div>
                            <a href="javascript:void(0);" class="recent-activity__likes facebook">
                                            <span class="recent-activity__likes fb-img-like">
                                                <svg width="24" height="24" class="icon_svg"><path
                                                        d="M22.35 9.13A3 3 0 0020 8h-3V4.28A3.28 3.28 0 0013.72 1a2 2 0 00-1.9 1.37L9.28 10H2a1 1 0 00-1 1v11a1 1 0 001 1h13.25c.21 0 5.11-.08 6.7-7.12l1-4.21a3 3 0 00-.6-2.54zM3 12h6v9H3v-9zm18-.77l-1 4.2C18.78 20.85 15.38 21 15.25 21H11v-9.84L13.72 3c.707 0 1.28.573 1.28 1.28V9a1 1 0 001 1h4a1 1 0 01.78.38 1 1 0 01.22.85z"></path>
                                                </svg>
                                            </span>
                                <span class="recent-activity__likes text-like">좋아요</span>
                            </a>
                        </div>
                    </c:if>
                    <!-- 글 있는 리뷰 하나 끝 -->
                </c:forEach>
            </div>
            <!-- 리뷰 한 행(3개) 끝 -->
        </c:forEach>
    </div>
</section>