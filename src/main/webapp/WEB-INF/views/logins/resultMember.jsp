<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="../includes/common.jsp" %>
<%@ page import="com.aj22.foodlab.dto.*"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />

<html>
<head>
<link rel="stylesheet" href="../css/loginbootstrap.min.css" />
<title>로그인/회원가입 결과창</title>
<%-- Login, membership result page --%>
</head>
<body>
<jsp:useBean id="sessionMember" scope="session" class="com.aj22.foodlab.dto.MemberDTO" type="com.aj22.foodlab.dto.MemberDTO"/>
	 



    <!-- Header Section Begin -->
	<jsp:include page="../includes/header.jsp"/>
    <!-- Header Section End -->

	<!-- If the header's wallpaper is white -->
    <script type="text/javascript">
    	var element = document.querySelector('header');
    	element. classList.add('header--normal');
    	document.getElementById('header-logo-custom').src="${resources}/img/footer-logo.png";
    </script>
    

	<div align="center">
	
	<c:if test="${msg != null}">
		<%-- Modify member information --%>
		<c:if test="${msg eq '0'}">
		<h2 class='alert alert-danger resultmember'>회원정보가 수정되었습니다.</h2>
		</c:if>
		
		<c:if test="${msg eq '1'}">
		<%-- Member registration result page --%>
		<div>
		<div class="col-lg-6 col-md-6 alert alert-danger" style="margin-top:200px;" >
		<h2 class="alert-danger">
		<img src="${resources}/img/icon/firecracker.svg" alt="폭죽아이콘" class="firecracker-icon"/>
		회원가입을 축하드립니다!
		<img src="${resources}/img/icon/firecracker.svg" alt="폭죽아이콘" class="firecracker-icon"/></h2><br>
		
		
			
		<h5 class="alert-danger welcomedeco">FoodLAB에서 마음에 맞는 맛집을 찾아보세요!<br><br>
		푸드로그에서 맛집 리뷰를 확인해 보세요!<br><br>
		맛집 정보에서 내마음에 맞는 맛집을 찾아보세요!<br><br>
		푸드톡에서 음식에 대한 이야기를 나눠보세요!</h5>
		</div>
		</div>
		
		</c:if>
		
		<c:if test="${msg eq '2'}">
		<%-- Login Results page --%>
		<div>
		<div class="col-lg-6 col-md-6 alert alert-danger" style="margin-top:200px;" >
		<h2 class="alert-danger">
		<img src="${resources}/img/icon/firecracker.svg" alt="폭죽아이콘" class="firecracker-icon"/>
		<% out.println(sessionMember.getUsername()); %>님 환영합니다!
		<img src="${resources}/img/icon/firecracker.svg" alt="폭죽아이콘" class="firecracker-icon"/></h2><br>
		
		
			
	<h5 class="alert-danger welcomedeco">FoodLAB에서 마음에 맞는 맛집을 찾아보세요!<br><br>
	푸드로그에서 맛집 리뷰를 확인해 보세요!<br><br>
	맛집 정보에서 내마음에 맞는 맛집을 찾아보세요!<br><br>
	푸드톡에서 음식에 대한 이야기를 나눠보세요!</h5>
	</div>
	</div>
		</c:if>
	
	</c:if>
	
	<c:if test="${msg == null}">
	<%-- Membership withdrawal page --%>
	<h2 class='alert alert-danger resultmember'>회원정보가 삭제되었습니다.</h2>
	
	</c:if>

		
	
	

	
	</div>	
</body>
</html>