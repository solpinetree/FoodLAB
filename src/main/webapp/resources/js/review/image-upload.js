function readURL(input, i) {
  if (input.files && input.files[0]) {

    var reader = new FileReader();

    reader.onload = function(e) {
	
	  var content = $('.file-upload-content'+i);
	  var imgTag = $('.file-upload-image'+i);
	
      $('.image-upload-wrap'+i).hide();

   	  $('.file-upload-image'+i).attr('src', e.target.result);
      $('.file-upload-content'+i).show();

      $('.image-title'+i).html(input.files[0].name);
    };


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

