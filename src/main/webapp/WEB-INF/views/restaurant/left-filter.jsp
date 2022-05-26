<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />

<div class="filter">
        <div class="filter__title">
            <h5><i class="fa fa-filter"></i> Filter</h5>
        </div>
        <div class="filter__search">
            <input type="text" placeholder="${search_text}">
        </div>
        <div class="filter__location">
        <form name="search_res" action="${root}/restaurants/search">
            <input type="text" name="seach_text" placeholder="식당 이름으로 검색하기">
            <i class="fa fa-map-marker"></i>
        </form>
        </div>
        
        <div class="filter__tags">
            <h6>카테고리</h6>
            	<c:forEach items="${categories}" var="category">
            	       <label for="${category}"> ${category}
            	       <a href="${root}/restaurants/select_res?category=${category}">
			                <input type="button" id="${category}">
			           </a>
			            </label>
            	</c:forEach>
        </div>
        <div class="filter__btns">
            <button type="submit">필터링</button>
            <button type="submit" class="filter__reset">필터 초기화</button>
        </div>
    </div>