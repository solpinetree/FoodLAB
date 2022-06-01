<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />

<div class="filter">
        

        <div class="filter__location">
        <form name="search_res" action="${root}/restaurants/search2">
            <input type="text" name="seach_text" class="search-click" placeholder="식당 이름으로 검색">
            <i class="fa fa-magnifying-glass"></i>
        </form>
        </div>
        
        <div class="filter__tags">
            <h6>카테고리</h6>
            	<c:forEach items="${categories}" var="category">
            	       <label for="${category}" onclick="javascript:selectByCategory('${category}')"> ${category}
            	      <%--  <input type="button" onclick="selectByCategory('${category}')" value="${category }"/> --%>
<%--             	       <input type="button" id="${category}" onclick="selectByCategory(${category})" class="category-click"> --%>
<%--             	       <c:set var="categoryID" value="${category}"/>
            	       <input type="hidden" id="categoryIdValue" value="${categoryID}"/> --%>
            	       </label>
            	</c:forEach>
       
        </div>
        
        
        
    </div>