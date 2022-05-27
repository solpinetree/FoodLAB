function showComments(reviewId) {
	
	$.ajax({
		//Get comment html code
		url:"/foodlab/comments/list?reviewId="+reviewId,
		method:"GET",
		async: true,
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
			aysnc: true,
			data: $("#commentForm").serialize(),
			success:function(data) {
				document.getElementById("content").value="";
				document.getElementById("parentCommentId").value="";
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