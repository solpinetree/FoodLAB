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
                                    <span class="recent-activity__caption">리뷰 작성
                                        <%-- 사진을 같이 첨부했다면 몇개의 사진을 업로드 했는지 정보를 주기 위함 --%>
                                        <c:if test="${ reviews[status +i].numOfUploadedImgs ne 0}">
                                            - ${ reviews[status +i].numOfUploadedImgs} 개의 사진 업로드
                                        </c:if>
                                    </span>
                                </div>
                            </div>
                            <c:if test="${ reviews[status +i].numOfUploadedImgs ne 0}">
                                <a href="javascript:void(0);">
                                    <img
                                            src="${resources}/upload/${reviews[status +i].thumbnail.savedPath}"
                                            alt="rest-photo" width="100%" class="thumb-with-content"/>
                                </a>
                            </c:if>
                            <h3 class="recent-activity__heading"><a href="javascript:void(0);">${reviews[status + i].restaurant.name}</a></h3>
                            <div class="restaurants__rating">
                                <div class="restaurants__rating__star five-stars">
                                    <c:forEach begin="1" end="${ reviews[status +i].rate }" >
                                        <i class="star-rate-icon icon_star"></i>
                                    </c:forEach>
                                    <c:forEach begin="${reviews[status +i].rate +1}" end="5">
                                        <i class="star-rate-icon icon_star_alt"></i>
                                    </c:forEach>
                                </div>
                            </div>
                            <c:choose>
                                <%-- 썸네일이 있는지 없는지에 따라 리뷰 텍스트에 부여되는 Height이 달라져야 하므로 따로 처리 --%>
                                <c:when test="${!empty reviews[status +i].thumbnail.savedPath}">
                                    <div class="text-container-with-thumbnail">
                                </c:when>
                                <c:otherwise>
                                    <div class="text-container-without-thumbnail">
                                </c:otherwise>

                            </c:choose>
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