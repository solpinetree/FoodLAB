$(document).ready(function() {
	
});

function drawHeart(resId, memberId){
	$(".heartDiv"+resId).html(
			"<a href='javascript:archiveDelete("+resId + "," 
			+memberId +")'>"
			+"<span class='icon_heart'></span></a>"
	);
}

function removeHeart(resId, memberId){
	$(".heartDiv"+resId).html(
			"<a href='javascript:archiveInsert("+resId + "," 
			+memberId +")'>"
			+"<span class='icon_heart_alt'></span></a>"
	);
}

function archiveDelete(restaurantId, memberId){
	$.ajax({
		url:"/foodlab/archive/delete",
		method:"post",
		data:{
			restaurantId : restaurantId,
			memberId : memberId
		},
		success:function() {
			removeHeart(restaurantId, memberId);
		}
	})
}

function archiveInsert(restaurantId, memberId){
		$.ajax({
		url:"/foodlab/archive/insert",
		method:"post",
		data:{
			restaurantId : restaurantId,
			memberId : memberId
		},
		success:function() {
			drawHeart(restaurantId, memberId);
		}
	})
}