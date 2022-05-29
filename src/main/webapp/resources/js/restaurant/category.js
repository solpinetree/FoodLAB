$("category-click").click(function() {
	
	var category = document.getElementById("categoryIdValue").value;

	$.ajax({
		//Get comment html code
		url:"/foodlab/restaurants/select_res?category="+category,
		method:"GET",
		async: true,
		success:function(response) {
			location.replace("/foodlab/restaurants/select_res?category="+category);
		}

	})
});