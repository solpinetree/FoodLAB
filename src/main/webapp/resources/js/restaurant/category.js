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
	
		$.ajax({
		url:"/foodlab/restaurants/select_res3?category="+categoryValue+"&currentpage=?"+currentPage,
		method:"GET",
		async: true,
		success:function(response) {
			$('#showcategorys').html(response);
		}

	})
	
}