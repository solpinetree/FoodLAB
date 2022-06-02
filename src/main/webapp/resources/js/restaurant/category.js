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