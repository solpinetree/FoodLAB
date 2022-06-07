$(document).ready(function() {
	reviewCategoryTab('중화요리');
});


function reviewCategoryTab(category){
	
	console.log(category);
	$.ajax({
		url: "/foodlab/loadReviewList?category=" +category,
		method: "GET",
		async: false,
		success:function(response){
			$('#reviews-content').html(response);
		}
	})
}

