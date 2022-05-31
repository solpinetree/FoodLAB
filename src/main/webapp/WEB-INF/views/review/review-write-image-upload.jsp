<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/path.jsp"%>
<!DOCTYPE html>

<fieldset>  
	<div class="form-card">
		<input type="text" name="title" id="title"
			placeholder="리뷰의 제목을 입력해주세요."
			style="background-color: white; font-weight: 500">
			
		   <!-- Slider main container -->
	        <div class="swiper">
	            <!-- Additional required wrapper -->
	            <div class="swiper-wrapper">
	
	                <!-- Slides -->
	                <div class="swiper-slide"> 
	                	<div class="image-upload-wrap1">
						 	<input class="file-input" name="img1" id="img1" multiple="multiple" type="file" accept="image/*"
						 	onchange="readURL(this, 1);">
						 	<a class="Neon-input-choose-btn">사진을 공유해주세요</a>
					 	</div>
				 	  	<div class="file-upload-content1">
						    <img class="file-upload-image1" src="#" alt="your image" />
						</div>
					</div>
					
 										
					<c:forEach var="i" begin="2" end="4">
		                <div class="swiper-slide">
	                		<div class="image-upload-wrap${i }">
							 	<input class="file-input" name="img${ i}" id="img${ i}" multiple="multiple" type="file" accept="image/*"
							 	onchange="readURL(this, ${i });">
							 	<a class="Neon-input-choose-btn">+</a>
						 	</div>
					 	  	<div class="file-upload-content${i }">
							    <img class="file-upload-image${i }" src="#" alt="your image" />
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
				      <button type="button" onclick="removeUpload(i)" class="remove-image">Remove <span class="image-title${i }">Uploaded Image</span></button>
				    </div>
				</div>
		    </c:forEach>
			
		<textarea name="content" id="content" rows="0" cols="0" style="font-weight: 500; height: 141px" placeholder="간단한 리뷰를 작성해주세요."></textarea>
	</div>

	<input type="button" name="next" id="contentNextBtn"
		class="next contentNextBtn action-button" value="NEXT"
		style="display: none" /> <input type="button" name="previous"
		class="previous action-button-previous" value="PREVIOUS" />
</fieldset>


