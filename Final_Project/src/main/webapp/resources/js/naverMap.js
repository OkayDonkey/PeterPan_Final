	 //지도 마커
	 		
	 const locations = [
	  { 
	    place: "피터팬-강남점",
	    address: "서울특별시 서초구 강남대로 465, 교보타워 지하 1~지하 2층",
	    lat: 37.5037,
	    lng: 127.0242,
	    operatingHours: "9:30 ~ 22:00",
	    holidays: "설(당일), 추석(당일)"
	  },
	  { 
	    place: "피터팬-광화문점",
	    address: "서울특별시 종로구 종로 1, 교보생명빌딩 지하 1층",
	    lat: 37.5709,
	    lng: 126.9778,
	    operatingHours: "9:30 ~ 22:00",
	    holidays: "설(당일), 추석(당일)"
	  },
	  { 
	    place: "피터팬-건대스타시티 바로드림센터",
	    address: "서울시 광진구 능동로 92 롯데백화점 스타시티점 지하1층",
	    lat: 37.5387,
	    lng: 127.0711,
	    operatingHours: "10:00 ~ 22:00",
	    holidays: "설(당일), 추석(당일)"
	  },
	  { 
	    place: "피터팬-동대문 바로드림센터",
	    address: "서울특별시 중구 장충단로13길 20, 현대시티아울렛 지하 1층",
	    lat: 37.5686,
	    lng: 127.0076,
	    operatingHours: "월~목 : 10:30~21:00 금~일,공휴일 : 10:30~21:30",
	    holidays: "설(당일), 추석(당일)"
	  },
	  { 
	    place: "피터팬-디큐브시티 바로드림센터",
	    address: "서울특별시 구로구 경인로 662, 현대백화점 지하 1층",
	    lat: 37.5084,
	    lng: 126.8887,
	    operatingHours: "코로나19로 인해 한시적으로 영업시간이 변경되었으니, 매장행사 공지사항을 참고바랍니다.",
	    holidays: "매 주 월요일 정기휴점"
	  },
	  { 
	    place: "피터팬-목동점",
	    address: "서울특별시 양천구 목동서로 159-1, CBS 지하 1층",
	    lat: 37.5282,
	    lng: 126.875,
	    operatingHours: "11:00 ~ 21:30",
	    holidays: "설(당일), 추석(당일)"
	  },
	  { 
	    place: "피터팬-서울대점",
	    address: "서울특별시 관악구 관악로 1, 서울대학교 학생회관 구내서점",
	    lat: 37.4593,
	    lng: 126.9506,
	    operatingHours: "평일 8:30~19:00 / 토요일 10:00 ~ 17:00",
	    holidays: "일요일, 공휴일"
	  },
	  { 
	    place: "피터팬-수유 바로드림센터",
	    address: "서울특별시 강북구 도봉로 348, 교보생명빌딩 지하 1층",
		lat: 37.6382,
		lng: 127.0265,
		operatingHours: "10:30 ~ 21:30",
		holidays: "설(당일), 추석(당일)"
		},
		{
		place: "피터팬-신논현역스토어",
		address: "서울 강남구 봉은사로 102 신논현역 지하1층",
		lat: 37.5046,
		lng: 127.025,
		operatingHours: "12:00 ~ 20:00 (월~일, 공휴일)",
		holidays: "설(당일), 추석(당일)"
		},
		{
		place: "피터팬-영등포점",
		address: "서울특별시 영등포구 영중로 15, 타임스퀘어 멀티플렉스 2층",
		lat: 37.517,
		lng: 126.9041,
		operatingHours: "10:30 ~ 22:00",
		holidays: "휴점일없음. 설날,추석당일(13:00~22:00)"
		},
		{
		place: "피터팬-은평 바로드림센터",
		address: "서울특별시 은평구 통일로 1050, 롯데몰 3층",
		lat: 37.637,
		lng: 126.9183,
		operatingHours: "10:30 ~ 22:00",
		holidays: "설(당일), 추석(당일)"
		},
		{
		place: "피터팬-이화여대점",
		address: "서울특별시 서대문구 이화여대길 52, 이화여자대학교 ECC센터 지하 4층",
		lat: 37.5614,
		lng: 126.9468,
		operatingHours: "평일 10:00 ~ 19:00 / 토요일 13:00 ~17:00",
		holidays: "일요일, 공휴일"
		},
		{
		place: "피터팬-잠실점",
		address: "서울특별시 송파구 올림픽로 269, 롯데 캐슬프라자 지하 1층",
		lat: 37.5142,
		lng: 127.1013,
		operatingHours: "9:00 ~ 22:00",
		holidays: "설(당일), 추석(당일)"
		},
		{
		place: "피터팬-천호점",
		address: "서울특별시 강동구 올림픽로 664, 대우한강베네시티 지하 1층",
		lat: 37.5405,
		lng: 127.125,
		operatingHours: "10:30 ~ 22:00",
		holidays: "설(당일), 추석(당일)"
		},
		{
		place: "피터팬-청량리 바로드림센터",
		address: "서울특별시 동대문구 왕산로 214, 롯데백화점 청량리점 지하 1층",
		lat: 37.5808,
		lng: 127.048,
		operatingHours: "월~목 - 10:30 ~ 20:00 / 금~일, 공휴일 - 10:30 ~ 20:30",
		holidays: "비정기휴무"
		},
		{
		place: "피터팬-합정점",
		address: "서울특별시 마포구 월드컵로3길 14 딜라이트스퀘어 2차(지하 1층), 1차(지하 2층)",
		lat: 37.5506,
		lng: 126.9119,
		operatingHours: "10:30 ~ 22:00",
		holidays: "설(당일), 추석(당일)"
		},
		];
	

const contentString = [
  '<div class="markerContent">',
  '  <div class="btn-light p-4" style="border-radius:0.5em; border:none;">',
  '    <p style="font-size:1.2em; margin-bottom:8px;">{place}</p>',
  '    <p style="font-size:0.9em; margin-bottom:-10px; " >주소 : {address}<br>',
  '      영업시간 : {operatingHours}<br>',
  '      휴무 : {holidays}</p>',
  '  </div>',
  '</div>'
].join('');

var markerIcon = {
  url: 'resources/img/hatLogo1.png',
  size: new naver.maps.Size(32, 32),
  origin: new naver.maps.Point(0, 0),
  anchor: new naver.maps.Point(16, 32)
};

var map = new naver.maps.Map('map', {
  center: new naver.maps.LatLng(37.53126239989712, 126.98236197200144),
  zoom: 11
});

// 클릭한 마커로 지도 확대 및 이동
function zoomToMarker(marker) {
  map.setZoom(17); // 지도 확대 레벨 설정
  map.panTo(marker.getPosition()); // 마커 위치로 지도 이동
  
}

var infowindow = new naver.maps.InfoWindow({
  content: contentString,
  maxWidth: 400,
  backgroundColor: "none",
  borderColor: "none",
  borderWidth: 0,
  anchorSize: new naver.maps.Size(0, 0),
  anchorSkew: true,
  anchorColor: "none",
  pixelOffset: new naver.maps.Point(20, -20)
});



var innerInfo = document.getElementById("innerStoreInfo");

var markers = []; // 마커 배열 추가

for (var i = 0; i < locations.length; i++) {
  var marker = new naver.maps.Marker({
    map: map,
    title: locations[i].place,
    position: new naver.maps.LatLng(locations[i].lat, locations[i].lng),
    icon: markerIcon
  });

  markers.push(marker); // 마커를 배열에 추가

  (function (marker, place, address, operatingHours, holidays) {
    naver.maps.Event.addListener(marker, 'mouseover', function () {
      var content = contentString
        .replace('{address}', address)
        .replace('{operatingHours}', operatingHours)
        .replace('{place}', place)
        .replace('{holidays}', holidays);
      infowindow.setContent(content);
      infowindow.open(map, marker);
    });

    naver.maps.Event.addListener(marker, 'mouseout', function () {
      infowindow.close();
    });

    naver.maps.Event.addListener(marker, 'click', function () {
      zoomToMarker(marker); // 클릭한 마커로 지도 확대 및 이동
    });

    var content = contentString
      .replace('{address}', locations[i].address)
      .replace('{operatingHours}', locations[i].operatingHours)
      .replace('{place}', locations[i].place)
      .replace('{holidays}', locations[i].holidays);

    innerInfo.innerHTML += content;
  })(marker, locations[i].place, locations[i].address, locations[i].operatingHours, locations[i].holidays);
}

// 리스트 항목 클릭 시 해당 마커로 이동
var listItems = document.querySelectorAll('.markerContent');
listItems.forEach(function (item, index) {
  item.addEventListener('click', function () {
    zoomToMarker(markers[index]);
  });
});
//setOptions 메서드를 이용해 옵션을 조정할 수도 있습니다.
map.setOptions("mapTypeControl", true); //지도 유형 컨트롤의 표시 여부
map.setOptions("tileTransitionl", true);
map.setOptions("zoomControl", true);
map.setOptions("mapDataControl", true);
