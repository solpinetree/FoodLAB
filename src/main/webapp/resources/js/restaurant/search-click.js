
function searchclick(e) {

	var code = e.code;
	var search = document.getElementById("searchText").value;

	if (code == 'Enter') {
		loadListDivBySearchKeyword(1, search);
	}
}


function searchclickIcon() {

	var search = document.getElementById("searchText").value;

		loadListDivBySearchKeyword(1, search);
}

function loadListDivBySearchKeyword(page, search){
		$.ajax({
		url: "/foodlab/restaurants/loadListDivBySearchKeyword?search=" + search +"&currentPage="+page,
		method: "GET",
		async: false,
		success: function(response) {
			$('#restaurants-content').html(response);
		}

	})
}