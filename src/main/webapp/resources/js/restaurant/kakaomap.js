$( document ).ready(function() {
	loadMap();
});

function loadMap(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    	mapOption = {
	        center: new kakao.maps.LatLng(37.3216, 127.1268), // 지도의 중심좌표-  단국대의 위도, 경도로 설정
	        level: 4 // 지도의 확대 레벨
    	};  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	return map;
}

function drawMarker(address, name){
	
	console.log('drawMarker: '+address+' , '+name);
	
	var map = loadMap();
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(address, function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
		
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	}); 
}

