$(".heart-icon-click").click(function(){
	
	var reviewId = document.getElementById("reviewIdValue").value;
	
	$.ajax({
		url: '/foodlab/likes/toggle?reviewId='+reviewId,
		type: 'post',
		success: function(data){
			document.getElementById("likes-count").innerHTML = data.likesCount;
			document.getElementById("heart-icon").src = data.heartImgUrl;
		}
	});
});