$(document).ready(function() {

	var current_fs, next_fs, previous_fs; //fieldsets
	var opacity;
	var current = 1;
	var steps = $("fieldset").length;

	setProgressBar(current);

	// NEXT button click listener
	$(".next").click(function() {
		
		if($(this).hasClass('submitBtn')){
			let numberInPartyVal = document.getElementById('numberInParty').value;
			if(numberInPartyVal!==''){
				if(validateNumberInPartyVal(numberInPartyVal)){
					let content = document.getElementById("content");
					content.value = getQuillContent();
					
					next($(this));
					sleep(5000);
					document.getElementById('reviewSubmitBtn').click();
				}else{
					showError();
				}
			}else{
				next($(this));
			}
		}else{
			next($(this));
		}
	});
	
	function validateNumberInPartyVal(value){
		var regex = /^[0-9]+$/;
		return regex.test(value);
	}
	
	function showError(){
		document.getElementById("invalidInput").style.display="block";
	}
	
	
	function next(arg){
		current_fs = arg.parent();
		next_fs = arg.parent().next();

		//Add Class Active
		$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

		//show the next fieldset
		next_fs.show();
		
		//hide the current fieldset with style
		current_fs.animate({ opacity: 0 }, {
			step: function(now) {
				// for making fielset appear animation
				opacity = 1 - now;

				current_fs.css({
					'display': 'none',
					'position': 'relative'
				});
				next_fs.css({ 'opacity': opacity });
			},
			duration: 500
		});
		
		setProgressBar(++current);
		
		document.documentElement.scrollTop = 0;
	}

	// PREVIOUS button click listener
	$(".previous").click(function() {

		current_fs = $(this).parent();
		previous_fs = $(this).parent().prev();

		//Remove class active
		$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

		//show the previous fieldset
		previous_fs.show();

		//hide the current fieldset with style
		current_fs.animate({ opacity: 0 }, {
			step: function(now) {
				// for making fielset appear animation
				opacity = 1 - now;

				current_fs.css({
					'display': 'none',
					'position': 'relative'
				});
				previous_fs.css({ 'opacity': opacity });
			},
			duration: 500
		});
		setProgressBar(--current);
	});

	function setProgressBar(curStep) {
		var percent = parseFloat(100 / steps) * curStep;
		percent = percent.toFixed();
		$(".progress-bar")
			.css("width", percent + "%")
	}
	
	

});

document.reviewForm.addEventListener("keydown", evt => {
    if ((evt.keyCode || evt.which) === 13) {
        evt.preventDefault();
    }
});