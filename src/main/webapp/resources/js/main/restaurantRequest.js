$(document).ready(function() {
	
	console.log("restaurantResquest.js");
	$.ajax({
		url: "/foodlab/loadRestaurantList",
		method: "GET",
		async: false,
		success:function(response){
			$('#restaurant-content').html(response);
		}
	})
});
