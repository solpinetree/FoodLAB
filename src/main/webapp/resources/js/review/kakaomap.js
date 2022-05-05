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
	loadMap('단국대 '+address); // 검색된 키워드에 단국대를 앞에 넣어준 후 카카오 맵 api로 넘긴다.
}


function loadMap(address){
	
	var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
    MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
    OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
    OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
    OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
    OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
    OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
    OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
    SPRITE_MARKER_URL = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
    SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
    SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
    SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

	var markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
	    markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
	    overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
	    overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
	    spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기
	
	
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
	    removeAllChildNods(listEl);
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
		
		   var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
		        originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
		        overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
		        normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
		        clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
		        overOrigin = new kakao.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표
			
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	           // marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]), // 검색 결과 항목 Element를 생성합니다
	            marker = addMarker(placePosition, normalOrigin, overOrigin, clickOrigin, places[i].place_name, itemEl, places[i]);

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
	
	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
	
	    var el = document.createElement('li'),
	
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
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
	
	// 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
	function addMarker(position, normalOrigin, overOrigin, clickOrigin, title, itemEl, places) {
	
	    // 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
	    var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
	        overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
	        clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);
	    
	    // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: position,
	        image: normalImage
	    });
	
	    // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
	    marker.normalImage = normalImage;
	
	    // 마커에 mouseover 이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'mouseover', function() {
	
	        // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
	        // 마커의 이미지를 오버 이미지로 변경합니다
	        if (!selectedMarker || selectedMarker !== marker) {
	            marker.setImage(overImage);
				displayInfowindow(marker, title);
	        }
	    });
	
	    // 마커에 mouseout 이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'mouseout', function() {
	
	        // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
	        // 마커의 이미지를 기본 이미지로 변경합니다
	        if (!selectedMarker || selectedMarker !== marker) {
	            marker.setImage(normalImage);
				infowindow.close();
	        }
	    });

        itemEl.onmouseover =  function () {
      	 // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
	        // 마커의 이미지를 오버 이미지로 변경합니다
	        if (!selectedMarker || selectedMarker !== marker) {
	            marker.setImage(overImage);
				displayInfowindow(marker, title);
	        }
        };

        itemEl.onmouseout =  function () {
			 // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
	        // 마커의 이미지를 기본 이미지로 변경합니다
	        if (!selectedMarker || selectedMarker !== marker) {
	            marker.setImage(normalImage);
				infowindow.close();
	        }
        };
	
	    // 마커에 click 이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	
	        // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
	        // 마커의 이미지를 클릭 이미지로 변경합니다
	        if (!selectedMarker || selectedMarker !== marker) {
	
	            // 클릭된 마커 객체가 null이 아니면
	            // 클릭된 마커의 이미지를 기본 이미지로 변경하고
	            !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);
	
	            // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
	            marker.setImage(clickImage);
	        }
	
	        // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
	        selectedMarker = marker;

			showFirstNextBtn(places);
	    });

		itemEl.onclick = function () {
	        // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
	        // 마커의 이미지를 클릭 이미지로 변경합니다
	        if (!selectedMarker || selectedMarker !== marker) {
	
	            // 클릭된 마커 객체가 null이 아니면
	            // 클릭된 마커의 이미지를 기본 이미지로 변경하고
	            !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);
	
	            // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
	            marker.setImage(clickImage);
	        }
	
	        // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
	        selectedMarker = marker;

			showFirstNextBtn(places);
		};

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
		
	
	    return marker;
	}
	
	// MakrerImage 객체를 생성하여 반환하는 함수입니다
	function createMarkerImage(markerSize, offset, spriteOrigin) {
	    var markerImage = new kakao.maps.MarkerImage(
	        SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
	        markerSize, // 마커의 크기
	        {
	            offset: offset, // 마커 이미지에서의 기준 좌표
	            spriteOrigin: spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
	            spriteSize: spriteImageSize // 스프라이트 이미지의 크기
	        }
	    );
	    
	    return markerImage;
}
	
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
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
	
	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}

	function showFirstNextBtn(places){
		const firstNextBtn = document.getElementById('firstNextBtn');
		firstNextBtn.style.visibility = 'visible';
		
		var restaurantName = document.getElementById('place-name');
		restaurantName.innerText = places.place_name;
		
		var restaurantAddress = document.getElementById('road-address-name');
		restaurantAddress.innerText = places.road_address_name;
	}
}
