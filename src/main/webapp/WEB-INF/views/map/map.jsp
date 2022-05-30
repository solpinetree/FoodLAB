<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7bd0f4b1049158f735df04c6710e2c5b&libraries=services"></script>




<div class="listing__sidebar__contact">

	<div class="listing__sidebar__contact__map" id="review-detail-map" style="border-radius: 40px 40px 0 0;">
	</div>
 
     <div class="listing__sidebar__contact__text">
         <h4>${restaurant.name }</h4>
         <ul>
       		<c:if test="${!empty restaurant.category}">
           		<li><span>${restaurant.category }</span></li><br><br>
           	</c:if>
           	<c:if test="${!empty restaurant.address }">
             	<li><span class="icon_pin_alt"></span> ${restaurant.address }</li>
             </c:if>
             <c:if test="${!empty restaurant.tel }">
             	<li><span class="icon_phone"></span>  ${restaurant.tel }</li>
             </c:if>
           	<c:if test="${restaurant.avgRate ne 0.0}">
              <li>
             	<span>평점 </span> 
           		<c:forEach var="i" begin="1" end="5" >
           			<c:if test="${restaurant.avgRate>i}">
         				<span class="star-rate-icon icon_star"></span>
           				<c:if test="${restaurant.avgRate < i+1}">
           				<c:if test="${restaurant.avgRate > i+0.3 }">
           				<c:if test="${restaurant.avgRate < i+0.7 }">
           					<span class="star-rate-icon icon_star_half"></span>
           				</c:if>
           				<c:if test="${restaurant.avgRate > i+0.7 }">
           					<span class="star-rate-icon icon_star"></span>
           				</c:if>
           			</c:if>
           			<c:if  test="${restaurant.avgRate < i+0.3}">
           				<span class="star-rate-icon icon_star_alt"></span>
           			</c:if>
           		</c:if>
            			</c:if>
          	</c:forEach>
              </li>
            	</c:if>
            	<c:if test="${!empty restaurant.operationHour}">
              <li><span class="icon_clock"></span> ${restaurant.operationHour }</li>
            	</c:if>
         </ul>
     </div>

 </div>

<script type="text/javascript">
   var mapContainer = document.getElementById('review-detail-map'), // 지도를 표시할 div 
   mapOption = {
       center: new kakao.maps.LatLng(37.3216, 127.1268), // 지도의 중심좌표 - 단국대
       level: 3 // 지도의 확대 레벨
   };  
   
  // 지도를 생성합니다    
  var map = new kakao.maps.Map(mapContainer, mapOption); 

  // 주소-좌표 변환 객체를 생성합니다
  var geocoder = new kakao.maps.services.Geocoder();

  // 주소로 좌표를 검색합니다
  geocoder.addressSearch('${restaurant.address}', function(result, status) {

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
              content: '<div style="width:150px;text-align:center;padding:6px 0;">${restaurant.name}</div>'
          });
          infowindow.open(map, marker);

          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
          map.setCenter(coords);
      } 
  });    
</script>