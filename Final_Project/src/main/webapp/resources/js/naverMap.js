 //지도 마커
 		
 const locations = [
  { 
    place: "교보문고-강남점",
    address: "서울특별시 서초구 강남대로 465, 교보타워 지하 1~지하 2층",
    lat: 37.497925,
    lng: 127.026550,
    operatingHours: "9:30 ~ 22:00",
    holidays: "설(당일), 추석(당일)"
  },
  { 
    place: "교보문고-광화문점",
    address: "서울특별시 종로구 종로 1, 교보생명빌딩 지하 1층",
    lat: 37.571292,
    lng: 126.976747,
    operatingHours: "9:30 ~ 22:00",
    holidays: "설(당일), 추석(당일)"
  },
  { 
    place: "교보문고-건대스타시티 바로드림센터",
    address: "서울시 광진구 능동로 92 롯데백화점 스타시티점 지하1층",
    lat: 37.539766,
    lng: 127.070678,
    operatingHours: "10:00 ~ 22:00",
    holidays: "설(당일), 추석(당일)"
  },
  { 
    place: "교보문고-동대문 바로드림센터",
    address: "서울특별시 중구 장충단로13길 20, 현대시티아울렛 지하 1층",
    lat: 37.565312,
    lng: 127.009509,
    operatingHours: "월~목 : 10:30~21:00 금~일,공휴일 : 10:30~21:30",
    holidays: "설(당일), 추석(당일)"
  },
  { 
    place: "교보문고-디큐브시티 바로드림센터",
    address: "서울특별시 구로구 경인로 662, 현대백화점 지하 1층",
    lat: 37.485639,
    lng: 126.901905,
    operatingHours: "코로나19로 인해 한시적으로 영업시간이 변경되었으니, 매장행사 공지사항을 참고바랍니다.",
    holidays: "매 주 월요일 정기휴점"
  },
  { 
    place: "교보문고-목동점",
    address: "서울특별시 양천구 목동서로 159-1, CBS 지하 1층",
    lat: 37.528845,
    lng: 126.875501,
    operatingHours: "11:00 ~ 21:30",
    holidays: "설(당일), 추석(당일)"
  },
  { 
    place: "교보문고-서울대점",
    address: "서울특별시 관악구 관악로 1, 서울대학교 학생회관 구내서점",
    lat: 37.466270,
    lng: 126.952572,
    operatingHours: "평일 8:30~19:00 / 토요일 10:00 ~ 17:00",
    holidays: "일요일, 공휴일"
  },
  { 
    place: "교보문고-수유 바로드림센터",
    address: "서울특별시 강북구 도봉로 348, 교보생명빌딩 지하 1층",
lat: 37.638394,
lng: 127.029733,
operatingHours: "10:30 ~ 21:30",
holidays: "설(당일), 추석(당일)"
},
{
place: "교보문고-신논현역스토어",
address: "서울 강남구 봉은사로 102 신논현역 지하1층",
lat: 37.504922,
lng: 127.025038,
operatingHours: "12:00 ~ 20:00 (월~일, 공휴일)",
holidays: "설(당일), 추석(당일)"
},
{
place: "교보문고-영등포점",
address: "서울특별시 영등포구 영중로 15, 타임스퀘어 멀티플렉스 2층",
lat: 37.515595,
lng: 126.903549,
operatingHours: "10:30 ~ 22:00",
holidays: "휴점일없음. 설날,추석당일(13:00~22:00)"
},
{
place: "교보문고-은평 바로드림센터",
address: "서울특별시 은평구 통일로 1050, 롯데몰 3층",
lat: 37.634806,
lng: 126.921818,
operatingHours: "10:30 ~ 22:00",
holidays: "설(당일), 추석(당일)"
},
{
place: "교보문고-이화여대점",
address: "서울특별시 서대문구 이화여대길 52, 이화여자대학교 ECC센터 지하 4층",
lat: 37.560153,
lng: 126.945767,
operatingHours: "평일 10:00 ~ 19:00 / 토요일 13:00 ~17:00",
holidays: "일요일, 공휴일"
},
{
place: "교보문고-잠실점",
address: "서울특별시 송파구 올림픽로 269, 롯데 캐슬프라자 지하 1층",
lat: 37.512529,
lng: 127.099243,
operatingHours: "9:00 ~ 22:00",
holidays: "설(당일), 추석(당일)"
},
{
place: "교보문고-천호점",
address: "서울특별시 강동구 올림픽로 664, 대우한강베네시티 지하 1층",
lat: 37.545932,
lng: 127.124942,
operatingHours: "10:30 ~ 22:00",
holidays: "설(당일), 추석(당일)"
},
{
place: "교보문고-청량리 바로드림센터",
address: "서울특별시 동대문구 왕산로 214, 롯데백화점 청량리점 지하 1층",
lat: 37.582043,
lng: 127.048315,
operatingHours: "월~목 - 10:30 ~ 20:00 / 금~일, 공휴일 - 10:30 ~ 20:30",
holidays: "비정기휴무"
},
{
place: "교보문고-합정점",
address: "서울특별시 마포구 월드컵로3길 14 딜라이트스퀘어 2차(지하 1층), 1차(지하 2층)",
lat: 37.550720,
lng: 126.913963,
operatingHours: "10:30 ~ 22:00",
holidays: "설(당일), 추석(당일)"
},
];

        // 장소 정보 팝업
        var contentString = [
            '<div class="btn-light p-4" style="border-radius:0.2em; border:none;">',
            '   <h3>{place}</h3>',
            '   <p style="font-size:13px">주소 : {address}<br>',
            '      영업시간 : {operatingHours}<br>',
            '      휴무 : {holidays}</p>',
            '</div>'
        ].join('');

        //지도 생성
        var map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(37.53126239989712, 126.98236197200144), // 잠실 롯데월드를 중심으로 하는 지도
            zoom: 11
        });

        for (var i = 0; i < locations.length; i++) {
            var marker = new naver.maps.Marker({
                map: map,
                title: locations[i].place,
                position: new naver.maps.LatLng(locations[i].lat, locations[i].lng),
            });

            // 마커에 이벤트 리스너 등록
            (function(marker, place, address, operatingHours, holidays) {
                naver.maps.Event.addListener(marker, 'mouseover', function(e) {
                    var content = contentString.replace('{address}', address).replace('{operatingHours}', operatingHours).replace('{place}', place).replace('{holidays}', holidays);
                    infowindow.setContent(content); // 정보창 내용 설정
                    infowindow.open(map, marker); // 정보창 열기
                });

                naver.maps.Event.addListener(marker, 'mouseout', function(e) {
                    infowindow.close(); // 정보창 닫기
                });
            })(marker, locations[i].place, locations[i].address, locations[i].operatingHours, locations[i].holidays);
        }

        var infowindow = new naver.maps.InfoWindow();