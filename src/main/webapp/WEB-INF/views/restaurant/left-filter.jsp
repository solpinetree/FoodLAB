<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />

<div class="filter">
        

        <div class="filter__location">
        <form name="search_res" action="${root}/restaurants/search">
            <input type="text" name="seach_text" placeholder="식당 이름으로 검색">
            <i class="fa fa-magnifying-glass"></i>
        </form>
        </div>
        
        <div class="filter__tags">
            <h6>카테고리</h6>
            	<c:forEach items="${categories}" var="category">
            	       <label for="${category}"> ${category}
            	       
            	       		<input type="hidden" id="categoryIdValue" value="${category}"/>
			                <input type="button" id="${category}" class="category-click">
			                
			           
			            </label>
            	</c:forEach>
        </div>
        
        
        
    </div>