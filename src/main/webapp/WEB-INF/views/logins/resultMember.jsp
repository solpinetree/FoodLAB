<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="../includes/common.jsp" %>
<%@ page import="com.aj22.foodlab.dto.*"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />

<html>
<head>
<link rel="stylesheet" href="../css/loginbootstrap.min.css" />
<title>회원 정보</title>

</head>
<body>
<jsp:useBean id="sessionMember" scope="session" class="com.aj22.foodlab.dto.MemberDTO" type="com.aj22.foodlab.dto.MemberDTO"/>
	 



    <!-- Header Section Begin -->
	<jsp:include page="../includes/header.jsp"/>
    <!-- Header Section End -->

	<!-- 헤더의 배경화면이 흰색일 경우 -->
    <script type="text/javascript">
    	var element = document.querySelector('header');
    	element. classList.add('header--normal');
    	document.getElementById('header-logo-custom').src="${resources}/img/footer-logo.png";
    </script>
    

	<div align="center">
	
	<h1>${msg}</h1>
	
	
	<c:if test="${msg != null}">
		<c:if test="${msg eq '0'}">
		<h2 class='alert alert-danger resultmember'>회원정보가 수정되었습니다.</h2>
		</c:if>
		
		<c:if test="${msg eq '1'}">
		<h2 class='alert alert-danger resultmember'>회원가입을 축하드립니다.</h2>
		</c:if>
		
		<c:if test="${msg eq '2'}">
		<h2 class='alert alert-danger resultmember'><img src="${resources}/img/icon/firecracker.svg" alt="폭죽아이콘" class="firecracker-icon"/>
		<img src="${resources}/img/icon/firecracker.svg" alt="폭죽아이콘" class="firecracker-icon"/>
		<img src="${resources}/img/icon/firecracker.svg" alt="폭죽아이콘" class="firecracker-icon"/>
		<% out.println(sessionMember.getUsername()); %>님 환영합니다!
		<img src="${resources}/img/icon/firecracker.svg" alt="폭죽아이콘" class="firecracker-icon"/>
		<img src="${resources}/img/icon/firecracker.svg" alt="폭죽아이콘" class="firecracker-icon"/>
		<img src="${resources}/img/icon/firecracker.svg" alt="폭죽아이콘" class="firecracker-icon"/></h2>
		</c:if>
	
	</c:if>
	
	<c:if test="${msg == null}">
	
	<h2 class='alert alert-danger resultmember'>회원정보가 삭제되었습니다.</h2>
	
	</c:if>

		
	</div>	
	<%-- contoller로 resultMember를 보내서 ${resultMember}형식으로 jstl if문으로 코드를 재작성한다. --%>
	<div>
	<h2> hi </h2>
	</div>
</body>
</html>