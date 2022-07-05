<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../includes/path.jsp" %>
<!DOCTYPE html>

<fieldset>
    <div class="form-card">

        <textarea name="content" id="content" rows="0" cols="0" style="font-weight: 500; height: 50vh;
                    border-radius: 3px; margin-bottom: 0px;"
                  placeholder="예시 : 식당 분위기, 가격 만족도, 인원, .. "></textarea>
    </div>

    <input type="button" name="next" id="contentNextBtn"
           class="next contentNextBtn action-button" value="NEXT"
           style="display: none"/>
    <input type="button" name="previous"
           class="previous action-button-previous" value="PREVIOUS"/>
</fieldset>


