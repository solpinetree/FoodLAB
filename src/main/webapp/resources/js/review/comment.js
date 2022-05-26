function showComments(reviewId) {
	
	$.ajax({
		//Get comment html code
		url:"/foodlab/comments/list?reviewId="+reviewId,
		method:"GET",
		success:function(response) {
			$('#showComments').html(response);
		}
	})
}


$(document).ready(function(){
	
	var reviewId = document.getElementById("reviewIdValue").value;
	
	showComments(reviewId);
	
	$('#commentForm').on('submit', function(event){
		event.preventDefault();
		// post comment
		$.ajax({
			url: "/foodlab/comments/insert",
			method: "post",
			data: $("#commentForm").serialize(),
			success:function() {
				document.getElementById("content").value ="";
				showComments(reviewId);
			}
		})
	});
	
	$(document).on('click', '.reply-btn', function(){
		//Reply to this id
		var commentId = $(this).attr("id");
		$('#parent_id').val(commentId);
		$('#content').focus();

	});
});