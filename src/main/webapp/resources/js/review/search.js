
function searchclick(e) {
	
	var langSelect = document.getElementById("selectbox");
	var selectValue = langSelect.options[langSelect.selectedIndex].value;
	var code = e.code;
	var search = document.getElementById("search").value;

	if (code == 'Enter') {
			window.alert(selectValue);
			loadListDivBySearchKeyword(1, search,selectValue);
	}
}


function loadListDivBySearchKeyword(page, search, selectValue){
		$.ajax({
		url: "/foodlab/restaurants/loadListBySearchKeyword?search=" + search +"&currentPage="+page +"&option="+selectValue,
		method: "GET",
		async: false,
		success: function(response) {
			$('#review-content').html(response);
		}

	})
}

