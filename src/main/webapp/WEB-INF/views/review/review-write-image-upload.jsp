<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../includes/path.jsp" %>
<!DOCTYPE html>

<fieldset>
    <div class="form-card">

        <!-- Slider main container -->
        <div class="swiper">
            <!-- Additional required wrapper -->
            <div class="swiper-wrapper">

                <!-- Slides -->
                <c:forEach var="i" begin="1" end="4">
                    <div class="swiper-slide">
                        <div class="image-upload-wrap${i }">
                            <input class="file-input" name="img${ i}" id="img${ i}" multiple="multiple" type="file"
                                   accept="image/*"
                                   onchange="readURL(this, ${i });">
                            <a class="Neon-input-choose-btn">+</a>
                        </div>
                        <div class="file-upload-content${i }">
                            <img class="file-upload-image${i }" style="object-fit:contain; max-height:50vh"
                                 alt="리뷰 이미지 미리보기"/>
                        </div>
                    </div>
                </c:forEach>

            </div>
            <!-- If we need pagination -->
            <div class="swiper-pagination"></div>

            <!-- If we need navigation buttons -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>

        </div>

        <c:forEach var="i" begin="1" end="4">
            <div style="float:left" class="file-upload-content${i }">
                <div class="image-title-wrap">
                    <button type="button" onclick="removeUpload('${i}')" class="remove-image">
                        <span
                            class="image-title${i }">Uploaded Image</span> 삭제
                    </button>
                </div>
            </div>
        </c:forEach>

    </div>

    <input type="button" name="next" id="photoNextBtn"
           class="next contentNextBtn action-button" value="NEXT"
           style="display: block; margin: 101px 0px 10px 5px;"/>
    <input type="button" name="previous"
           class="previous action-button-previous" value="PREVIOUS"
            style="margin: 101px 5px 10px 0px"/>
</fieldset>


