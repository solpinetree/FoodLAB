$(document).ready(function(){
$(".category-click").click(function() {
	
	var category = document.getElementById("categoryIdValue").value;
	
	$.ajax({
		//Post comment html code
		url:"/foodlab/restaurants/select_res2?category="+category,
		method:"GET",
		async: true,
		success:function(response) {
			$('#showcategorys').html(response);
		}

	})
});

});