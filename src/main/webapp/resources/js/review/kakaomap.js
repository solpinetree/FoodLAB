$(document).ready(function(){
	
	$(".searchButton").on('click', function(){
		getAddress();
	});
});

function enterkey(){
	// input 칸에서 엔터를 누르면
	if(window.event.keyCode == 13){
		getAddress();
	}
}

function getAddress(){
	const address = document.getElementById('address').value;
	loadMap('단국대 '+address);
}


function loadMap(address){
	
	// 마커를 담을 배열입니다
	var markers = [];
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.3216, 127.1268), // 지도의 중심좌표 - 단국대의 위도, 경도로 설정
	        level: 5 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	// 클릭한 마커를 담을 변수
	var selectedMarker = null;
	// 이전 클릭된 리스트의 index를 저장할 변수
	var prevSelectedListIdx = null;
	// 키워드로 장소를 검색합니다
	searchPlaces();
	
	
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
	
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch(address, placesSearchCB); 
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);
	
	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);
	
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	
	        alert('검색 결과가 존재하지 않습니다.');
	        return;
	
	    } else if (status === kakao.maps.services.Status.ERROR) {
	
	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;
	
	    }
	}
	
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {
	
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    listEl = removeAllChildNods(listEl);
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    markers = removeMarker(markers);
	    
	    for ( var i=0; i<places.length; i++ ) {
		
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            itemEl = getListItem(i, places[i]), // 검색 결과 항목 Element를 생성합니다
	            marker = addMarker(placePosition, itemEl, places[i], i);

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
	
	        fragment.appendChild(itemEl);
	    }
	
	    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
	
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}

	
	// 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
	function addMarker(position, itemEl, places, idx) {
	
	    // 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
	    var normalImage = createMarkerImage(idx, 'normal'),
	        overImage = createMarkerImage(idx, 'over'),
	        clickImage = createMarkerImage(idx, 'click');
	    
	    // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: position,
	        image: normalImage
	    });
	
	    // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
	    marker.normalImage = normalImage;

		// 마커나 특정 infowindow 리스트에 마우스 오버를 했을 때 실행되는 함수
		function mouseover(){
	        // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
	        // 마커의 이미지를 오버 이미지로 변경합니다
	        if (!selectedMarker || selectedMarker !== marker) {
	            marker.setImage(overImage);
				displayInfowindow(marker, places.place_name);
	        }
		}
		
		// 마커나 특정 infowindow 리스트에 마우스 아웃이 되었을 때 실행되는 함수
		function mouseout(){
        	// 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
	        // 마커의 이미지를 기본 이미지로 변경합니다
	        if (!selectedMarker || selectedMarker !== marker) {
	            marker.setImage(normalImage);
				infowindow.close();
	        }
		}
		
		// 마커나 특정 infowindow 리스트를 클릭했을 때 실행되는 함수
		function click(idx){
	        // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
	        // 마커의 이미지를 클릭 이미지로 변경합니다
	        if (!selectedMarker || selectedMarker !== marker) {
	
	            // 클릭된 마커 객체가 null이 아니면
	            // 클릭된 마커의 이미지를 기본 이미지로 변경하고
	            !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);
	
	            // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
	            marker.setImage(clickImage);
	        }

			// selected 된 식당의 인포윈도우 정보란의 마커도 변경시킵니다.
			toggleSelectedMarker(idx, prevSelectedListIdx);

			prevSelectedListIdx = idx;
	        
			// 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
	        selectedMarker = marker;

			// selectedMarker가 있을 때만 Next 버튼을 보인다.
			showFirstNextBtn(places);	
		}
	
	    // 마커에 mouseover 이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'mouseover', function() {
			mouseover();
	    });
	
		// infowindow 식당 정보에 mouseover 이벤트를 등록합니다
        itemEl.onmouseover =  function () {
      		mouseover();
        };

	    // 마커에 mouseout 이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'mouseout', function() {
			mouseout();
	    });

		// infowindow 식당 정보에 mouseout 이벤트를 등록합니다.
        itemEl.onmouseout =  function () {
			mouseout();
        };
	
	    // 마커에 click 이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
			click(idx);
	    });

		itemEl.onclick = function () {
			click(idx);
		};

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
		
	
	    return marker;
	}

	
	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 
	
	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }
	
	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;
	
	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }
	
	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}

} // loadMap() 함수 끝

//next 버튼을 보여주는 함수
function showFirstNextBtn(places){
	const firstNextBtn = document.getElementById('firstNextBtn');
	firstNextBtn.style.visibility = 'visible';
	
	var restaurantName = document.getElementById('place-name');
	restaurantName.innerText = places.place_name;
	
	var restaurantAddress = document.getElementById('road-address-name');
	restaurantAddress.innerText = places.road_address_name;
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
	while (el.hasChildNodes()) {
		el.removeChild (el.lastChild);
	}
	return el;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker(markers) {
	for ( var i = 0; i < markers.length; i++ ) {
		markers[i].setMap(null);
	}   
	markers = [];

	return markers;
}

// MakrerImage 객체를 생성하여 반환하는 함수입니다
function createMarkerImage(idx, option) {

	var MARKER_URL, markerImage;

	if(option === 'normal'){
		MARKER_URL = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png';
		markerImage = new kakao.maps.MarkerImage(
			MARKER_URL, 
			new kakao.maps.Size(36, 37), // 마커의 크기
			{
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}
		);
	}else{
		MARKER_URL = 'https://tistory2.daumcdn.net/tistory/3056305/skin/images/map-marker-red.png';
		markerImage = new kakao.maps.MarkerImage(
			MARKER_URL, 
			new kakao.maps.Size(35, 35), // 마커의 크기
			{
				offset: new kakao.maps.Point(17, 40)
			}
		);
	}
	
	return markerImage;
}

// selected 된 식당의 인포윈도우 정보의 마커를 변경시키는 함수
function toggleSelectedMarker(idx, prevSelectedListIdx){
	if(prevSelectedListIdx!=null){
		if(prevSelectedListIdx != idx){
			const prevSpan = document.querySelector('#marker_'+(prevSelectedListIdx+1));
			prevSpan.classList.add("markerbg");
			prevSpan.classList.add("marker_"+(prevSelectedListIdx+1));
			prevSpan.classList.remove('selected_marker');
		}
	}
	
	if(prevSelectedListIdx!=idx){
		const currentSpan = document.querySelector('#marker_'+(idx+1));
		currentSpan.classList.remove("markerbg");
		currentSpan.classList.remove("marker_"+(idx+1));
		currentSpan.classList.add('selected_marker');
	}

}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

	var el = document.createElement('li'),

	itemStr = '<span class="markerbg marker_' + (index+1) + '" id="marker_' + (index+1) + '" ></span>' +
				'<div class="info">' +
				'   <h5>' +  places.place_name + '</h5>';


	if (places.road_address_name) {
		itemStr += '    <span>' + places.road_address_name + '</span>' +
					'   <span class="jibun gray">' +  places.address_name  + '</span>';
	} else {
		itemStr += '    <span>' +  places.address_name  + '</span>'; 
	}
					
		itemStr += '  <span class="tel">' + places.phone  + '</span>' +
				'</div>';           

	el.innerHTML = itemStr;
	el.className = 'item';

	return el;
}