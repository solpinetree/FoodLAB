<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />

<div class="filter">
        

        <div class="filter__location">
        
            <input type="text" name="seach_text" id = "searchText" class="search-click" placeholder="식당 이름으로 검색" onkeypress="searchclick(event)">
            <p id="word"></p>
            
          	<span onclick="searchclickIcon()" style="cursor:pointer;">
            <i class="fa fa-magnifying-glass"></i>
			</span>
 

        </div>
        
        <div class="filter__tags">
            <h6>카테고리</h6>
       	       <label for="전체" onclick="javascript:loadRestaurantsPage(1,'전체')"> 전체
       	       </label>
            	<c:forEach items="${categories}" var="category">
            	       <label for="${category}" onclick="javascript:loadRestaurantsPage(1,'${category}')"> ${category}
            	       </label>
            	</c:forEach>
       
        </div>
        
        
        
    </div>