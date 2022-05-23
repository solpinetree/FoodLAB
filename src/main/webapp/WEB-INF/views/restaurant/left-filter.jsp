<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="filter nice-scroll">
        <div class="filter__title">
            <h5><i class="fa fa-filter"></i> Filter</h5>
        </div>
        <div class="filter__search">
            <input type="text">
        </div>
        <div class="filter__location">
            <input type="text" placeholder="식당 이름으로 검색하기">
            <i class="fa fa-map-marker"></i>
        </div>
        
        <div class="filter__tags">
            <h6>카테고리</h6>
            	<c:forEach items="${categories}" var="category">
            	       <label for="coupon"> ${category}
			                <input type="checkbox" id="coupon">
			                <span class="checkmark"></span>
			            </label>
            	</c:forEach>
        </div>
        <div class="filter__btns">
            <button type="submit">필터링</button>
            <button type="submit" class="filter__reset">필터 초기화</button>
        </div>
    </div>