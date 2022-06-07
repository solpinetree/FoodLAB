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
	
	console.log('commentId :'+ commentId);
	
	const sendingData = new FormData();
	var memberId = document.getElementById("memberId").value;
	var content = document.getElementById("content"+commentId).value;
	console.log('content: '+content);
	var reviewId = document.getElementById("reviewIdValue").value;
	sendingData.append('reviewId', reviewId);
	sendingData.append('parentCommentId', commentId);
	sendingData.append('memberId', memberId);
	sendingData.append('content', content);
	
	console.log("sendingData:"+sendingData);
	
	$.ajax({
		url: "/foodlab/comments/insert",
		method: "post",
	   	processData: false,
	    contentType: false,
	    cache: false,
		aysnc: true,
		data: sendingData,
		enctype: 'multipart/form-data',
		success:function(data) {
			document.getElementById("content").value="";
			document.getElementById("parentCommentId").value="";
			showComments(reviewId);
		}
	});
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
		
		var parentMarginVal = parentElement.style.marginLeft.replace(/[^-\d\.]/g, '');

		
		var marginValue = (parentMarginVal==0)? 48 : Number(parentMarginVal)+48;
		
		
		
		$('#comment'+commentId).after(
			"<div class='listing__details__review' style='margin-left:"+ marginValue +"px'>" 
	      +    		"<textarea id='content" + commentId+"' name='content'></textarea>"
	      +	   		"<button style='margin-bottom:24px; float: right' type='submit' onClick='load(this,"+ commentId +"); return false;' class='site-btn'>댓글 달기</button>"
	  	  +	"</div>"
		);

		$('#content'+commentId).focus();
	});
	
});