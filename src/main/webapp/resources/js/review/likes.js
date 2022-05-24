$(".heart-icon").click(function(){
	
	$.ajax({
		url: '/foodlab/toggle/'+${review.reviewId},
		type: 'post',
		success: function(){
			
		}
	});
});