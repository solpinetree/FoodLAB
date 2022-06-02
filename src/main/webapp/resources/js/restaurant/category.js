$(document).ready(function(){
/*$(".category-click").click(function() {
	
	var category = document.getElementById("categoryIdValue").value;
	console.log(category);
	
	$.ajax({
		url:"/foodlab/restaurants/select_res2?category="+category,
		method:"GET",
		async: true,
		success:function(response) {
			$('#showcategorys').html(response);
		}

	})
});*/


});
function selectByCategory(categoryValue,currentPage){
	
	//var category = document.getElementById("categoryIdValue").value;
	console.log(categoryValue);
	
	
	$.ajax({
		url:"/foodlab/restaurants/select_res2?category="+categoryValue+"&currentpage=?"+currentPage,
		method:"GET",
		async: true,
		success:function(response) {
			$('#showcategorys').html(response);
		}

	})
	
}