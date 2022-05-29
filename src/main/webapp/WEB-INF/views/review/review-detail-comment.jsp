<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/path.jsp"%>

<div class="listing__details__comment" style="display:block">
	<h4>댓글</h4>

  <div id="showComments"></div>
  
   <c:if test="${!empty sessionScope.sessionMember.username}">
	 	<div class="listing__details__review">
	      <form method="post" id="commentForm">
	          <textarea id="content" name="content" placeholder="댓글을 남겨주세요!"></textarea>
	          <input type="hidden" name="parentCommentId" id="parentCommentId" value=""/>
	          <input type="hidden" name="reviewId" value="${review.reviewId }"/>
	          <input type="hidden" name="memberId" value="${sessionScope.sessionMember.id }"/>
	          <button type="submit" class="site-btn">댓글 달기</button>
	      </form>
	  </div>
 	</c:if>
 	
 </div>