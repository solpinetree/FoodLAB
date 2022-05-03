<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <label for="coupon">
                양식
                <input type="checkbox" id="coupon">
                <span class="checkmark"></span>
            </label>
            <label for="sa">
               	중식
                <input type="checkbox" id="sa">
                <span class="checkmark"></span>
            </label>
            <label for="camping">
                일식
                <input type="checkbox" id="camping">
                <span class="checkmark"></span>
            </label>
            <label for="hot-spots">
                한식
                <input type="checkbox" id="hot-spots">
                <span class="checkmark"></span>
            </label>
            <label for="internet">
                치킨
                <input type="checkbox" id="internet">
                <span class="checkmark"></span>
            </label>
            <label for="tr">
                분식
                <input type="checkbox" id="tr">
                <span class="checkmark"></span>
            </label>
            <label for="hd">
                디저트, 카페
                <input type="checkbox" id="hd">
                <span class="checkmark"></span>
            </label>
        </div>
        <div class="filter__btns">
            <button type="submit">필터링</button>
            <button type="submit" class="filter__reset">필터 초기화</button>
        </div>
    </div>