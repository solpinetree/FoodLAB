var currentPage = 1
loadReviews(currentPage);

function loadReviews(){
		$.ajax({
		url: "/foodlab/reviews/loadReviews?currentPage="+currentPage,
		method: "GET",
		async: false,
		success: function(response) {
			$('#reviews-load-div').append(response);
			currentPage++;
		}
	})
}

