//지도 마커
const locations = [
    { place:"교보문고-강남점", lat: 37.497925, lng: 127.026550 },
    { place:"교보문고-종로점", lat: 37.570067, lng: 126.981678 },
    { place:"교보문고-가로수길점", lat: 37.518485, lng: 127.022345 },
    { place:"교보문고-분당점", lat: 37.384221, lng: 127.121390 },
    { place:"교보문고-일산점", lat: 37.671335, lng: 126.768993 },
    { place:"교보문고-수원점", lat: 37.265940, lng: 127.022660 },
];
 
 //지도 생성
 var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.53126239989712, 126.98236197200144), // 잠실 롯데월드를 중심으로 하는 지도
    zoom: 10
    
});

for (var i = 0; i < locations.length; i++) {
    var marker = new naver.maps.Marker({
        map: map,
        title: locations[i].place,
        position: new naver.maps.LatLng(locations[i].lat, locations[i].lng),
    });
}

//지도 마커
