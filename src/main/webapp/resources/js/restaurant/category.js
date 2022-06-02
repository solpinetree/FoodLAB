$(document).ready(function(){
	selectByCategory('general');
});

function selectByCategory(categoryValue){
	
	console.log(categoryValue);
	
	$.ajax({
		url:"/foodlab/restaurants/loadListDiv?category="+categoryValue,
		method:"GET",
		async: false,
		success:function(response) {
			$('#restaurants-content').html(response);
		}

	})
	

	
}


function selectByCategory2(currentPage){
	
	console.log(currentPage);
	
	$.ajax({
		url:"/foodlab/restaurants/restaurantpagination?currentPage="+currentPage,
		method:"GET",
		async: false,
		success:function(response) {
			$('#restaurants-content').html(response);
		}

	})
	

	
}
