function readURL(input, i) {
  if (input.files && input.files[0]) {

    var reader = new FileReader();

    reader.onload = function(e) {
	
	  var content = $('.file-upload-content'+i);
	  var imgTag = $('.file-upload-image'+i);
	
      $('.image-upload-wrap'+i).hide();

      imgTag.attr('src', e.target.result);
      content.show();

      $('.image-title'+i).html(input.files[0].name);

	  const img = new Image();
	  img.src = e.target.result;

	  img.onload = function(){
		
		  var canvas = document.createElement("canvas");
		  var ctx = canvas.getContext("2d");
	
		  ctx.drawImage(img, 0, 0);
	
	      // 최대폭을 400 으로 정했다고 가정했을때
	      // 최대폭을 넘어가는 경우 canvas 크기를 변경해 줍니다.
	      var MAX_WIDTH = 713;
	      var MAX_HEIGHT = 500;
	      var width = img.width;
	      var height = img.height;
	
	      if (width > height) {
	         if (width > MAX_WIDTH) {
	            height *= MAX_WIDTH / width;
	            width = MAX_WIDTH;
	         }
	      } else {
	          if (height > MAX_HEIGHT) {
	            width *= MAX_HEIGHT / height;
	            height = MAX_HEIGHT;
	          }
	      }
	      canvas.width = width;
	      canvas.height = height;
	 
	      // canvas에 변경된 크기의 이미지를 다시 그려줍니다. 
	      var ctx = canvas.getContext("2d");
	      ctx.drawImage(img, 0, 0, width, height);
		
		  // canvas 에 있는 이미지를 img 태그로 넣어줍니다
	      var dataurl = canvas.toDataURL("image/png");
	    //  document.getElementById('output').src = dataurl;
		  $('.file-upload-image'+i).attr('src', dataurl);
	  }

 
   } 

    reader.readAsDataURL(input.files[0]);

  } else {
    removeUpload(i);
  }
} // function readURL ends

function removeUpload(i) {
  $('.file-upload-content'+i).hide();
  $('.image-upload-wrap'+i).show();
}

$('.image-upload-wrap').bind('dragover', function () {
	$('.image-upload-wrap').addClass('image-dropping');
});

$('.image-upload-wrap').bind('dragleave', function () {
	$('.image-upload-wrap').removeClass('image-dropping');
});

