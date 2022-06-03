$(document).ready(function() {
	loadRestaurantsPage(1, 'all');
});

function loadRestaurantsPage(page, category) {

	$.ajax({
		url: "/foodlab/restaurants/loadListDiv?currentPage="+page+"&category="+category,
		method: "GET",
		async: false,
		success: function(response) {
			$('#restaurants-content').html(response);
		}
	})

}





