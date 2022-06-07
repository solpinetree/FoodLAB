
function searchclick(e) {
	
	var langSelect = document.getElementById("selectbox");
	var selectValue = langSelect.options[langSelect.selectedIndex].value;
	var code = e.code;
	var search = document.getElementById("search").value;

	if (code == 'Enter') {
			loadListDivBySearchKeyword(1, search,selectValue);
	}
}

function searchclickIcon() {

	var langSelect = document.getElementById("selectbox");
	var selectValue = langSelect.options[langSelect.selectedIndex].value;
	var search = document.getElementById("search").value;
		loadListDivBySearchKeyword(1, search,selectValue);
}


function loadListDivBySearchKeyword(page, search, selectValue){
		$.ajax({
		url: "/foodlab/reviews/loadListBySearchKeyword?search=" + search +"&currentPage="+page +"&option="+selectValue,
		method: "GET",
		async: false,
		success: function(response) {
			$('#review-content').html(response);
		}

	})
}

