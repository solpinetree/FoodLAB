/*
function reviewByCategory(category) {
	
	console.log("reviewByCategory:"+ category);
	$.ajax({
		//Get comment html code
		url:"/foodlab/index/category",
		method:"POST",
		async: true,
		success:function(response) {
			
		}
	})
}
*/
$("#reviewCategoryTab").on("click", function(e){
	e.preventDefault();
	
	
	console.log("buttonclick:");
	const sendingData = new FormData();
	
	var category = document.getElementById('category');
	
	sendingData.append('category', category);
	
	$.ajax({
		url: "/foodlab/index/reviewcategory",
		method: "post",
		aysnc: true,
		data: sendingData,
		success:function(data) {
		
			console.log("reviewByCategory:"+ data);
		}
	})
})

/*
function load(){
	
	const sendingData = new FormData();
	var category = document.getElementById('category').value;
	
	sendingData.append('category', category);
	
	console.log("load:"+sendingData);
	
	$.ajax({
		url: "/foodlab/index/reviewcategory",
		method: "post",
		aysnc: true,
		data: sendingData,
		success:function(data) {
		
			reviewByCategory(category);
		}
	})
}

$(document).ready(function(){
	
	
	console.log("ready:");
	var category = document.getElementById("category").value;
	var sendform = category.serialize();
	showComments(reviewId);
	
	$('#reviewCategoryTab').on('click', function(e){
		e.preventDefault(); // 추가 이벤트를 막아서 #의 최상위 이동을 막음
		
	
		$.ajax({
			url: "/foodlab/index/reviewcategory",
			method: "post",
			aysnc: true,
			data: sendform,
			success:function(data) {
			
				showComments(category);
			}
		})
	});
	*/
	
