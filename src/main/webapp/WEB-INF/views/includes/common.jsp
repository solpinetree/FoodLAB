<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!--  resources 디렉토리 위치를 가리키는 변수 선언 -->
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />

<!--  views 디렉토리 위치를 가리키는 변수 선언 -->
<c:set var="views" value="${pageContext.request.contextPath }/WEB-INF/views" />


<head>

    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

	<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="${resources}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${resources}/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="${resources}/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="${resources}/css/flaticon.css" type="text/css">
	<link rel="stylesheet" href="${resources}/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="${resources}/css/barfiller.css" type="text/css">
	<link rel="stylesheet" href="${resources}/css/magnific-popup.css" type="text/css">
	<link rel="stylesheet" href="${resources}/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="${resources}/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="${resources}/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="${resources}/css/style.css"> 



</head>