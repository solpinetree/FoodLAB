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

function load(btn, commentId){
	
	const sendingData = new FormData();
	var memberId = document.getElementById("memberId").value;
	var content = document.getElementById("content"+commentId).value;
	var reviewId = document.getElementById("reviewIdValue").value;
	sendingData.append('reveiwId', reviewId);
	sendingData.append('parentCommentId', commentId);
	sendingData.append('memberId', memberId);
	sendingData.append('content', content);
	
	console.log("sendingData:"+sendingData);
	
	$.ajax({
		url: "/foodlab/comments/insert",
		method: "post",
		aysnc: true,
		data: sendingData,
		success:function(data) {
			document.getElementById("content").value="";
			document.getElementById("parentCommentId").value="";
			showComments(reviewId);
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
		var parentElement = document.getElementById("comment"+commentId);
		$('#parentCommentId').val(commentId);
		
		$('#comment'+commentId).after(
			"<div class='listing__details__review' style='margin-left:"+ parentElement.style.marginLeft+"'>" 
	 //     +		"<form>"
	      +    		"<textarea id='content" + commentId+"' name='content'></textarea>"
	      +	   		"<button type='submit' onClick='load(this,"+ commentId +"); return false;' class='site-btn'>댓글 달기</button>"
	   //   +		"</form>"
	  	  +	"</div>"
		);

		$('#content'+commentId).focus();
	});
	
});