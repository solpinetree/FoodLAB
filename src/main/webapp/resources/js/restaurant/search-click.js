$(document).ready(function(){



	var formValues = $("form[name=search_res]").serialize();
	
	$.ajax({
    	url: "/foodlab/restaurants/search2",
        type: "Get",
        data: formValues,
        success: function(){
        	$('.showsearch').html(response);
        },
        error: function(){
        	alert("실패")
        },
    })


});