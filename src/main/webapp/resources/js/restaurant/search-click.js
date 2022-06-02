
/*

function selectBySearch(searchValue){
	
	
alert($('form[name="search_res"]').attr('action'));

$.ajax({
		url:"/foodlab/restaurants/select_res2?category="+categoryValue,
		method:"GET",
		async: true,
		success:function(response) {
			$('#showcategorys').html(response);
		}

	})
    }

*/

        function searchclick(e){
	
	var code = e.code;
	var search = document.getElementById("searchText").value;
	
	if(code == 'Enter'){
	
	
	
$.ajax({
		url:"/foodlab/restaurants/restaurantpaginationSearch?search="+search,
		method:"GET",
		async: false,
		success:function(response) {
			$('#restaurants-content').html(response);
		}

	})
	
        }
        
}