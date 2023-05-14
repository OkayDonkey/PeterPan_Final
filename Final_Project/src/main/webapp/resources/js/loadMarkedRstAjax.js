function loadMark() {

  var id = '<%= session.getAttribute("id") %>';

  $.ajax({
    type: 'POST',
    url: 'memMarkLoad.do',
    dataType: "json",
    data: {
      id: id,
    },
    success: function (data) {
     // console.log("AJAX호출 성공");
    //  console.log("데이터 송신완료 값:" + data);
      var List = JSON.parse(data.List); // 문자열을 JavaScript 객체로 파싱
      var name = List.map(obj => obj.name);
      var info = List.map(obj => obj.info);
      var addr = List.map(obj => obj.addr);
      var detailAddr = List.map(obj => obj.detailAddr);
      var marked_storeidx = List.map(obj => obj.marked_storeidx);
      

      var markedListElem = document.querySelector('#marked-list');
      markedListElem.innerHTML = ''; // 기존 내용 지우기

      if (List.length > 0) {
        List.forEach(function (obj) {
          var elem = document.createElement('div');
          var hr = document.createElement('hr');
          var br = document.createElement('br');
          
	          elem.classList.add('media');
	          elem.classList.add('pt-3');
		         elem.innerHTML = `
				    <div class="featured-entry-thumb mr-3 ">
				      <a href="total_main_search.do?keyword=${obj.name}"><img src="${obj.main_img}" width="100px;" alt="${obj.name}" /></a>
				      <button type="button" onclick="DelSideMark(${obj.mem_id},${obj.marked_storeidx});" class="btn btn-pill btn-outline-warning" 
				      style="width:50px; height:20px; font-family:'GmarketSansLight'; font-size: 12px; 
				      position: absolute; right: -250px; top:-7px;"><p  style="position: absolute; right: 4px; top:1px;">찜 삭제</p></button>
				    </div>
				    <div class="media-body">
				      <h6 class="featured-entry-title">       
				        <a href="total_main_search.do?keyword=${obj.name}" style="font-family:'GmarketSansMedium'; font-size: 15px; ">${obj.name}</a>

				      </h6>
				      <p class="featured-entry-meta" style="font-family:'GmarketSansMedium'; font-size: 12px; ">
				        ${obj.addr}<br>${obj.detailAddr}		
				      </p>
				      <input type="hidden" name="main_idx" value="${obj.marked_storeidx}">
				    </div>
				    
				  </div>  
				`;					//detailAddr 데이터 없을 때 C:If해서 스페이스로 출력하기

          markedListElem.appendChild(elem);
          markedListElem.appendChild(hr);
          
			
        });
      }
    },
    error: function (request, status, error) {
      console.log(error); // 오류 발생시 콘솔에 출력
    }

  });
};

function DelSideMark(id, marked_storeidx) {
	
  $.ajax({
    type: 'POST',
    url: 'Marking_Delete.do',
    dataType: 'json',
    data: {
      id: id,
      main_idx: marked_storeidx
    },
    success: function (data) {
      console.log('AJAX 호출 성공');
      console.log('데이터 송신완료 값:' + data);
      loadMark(); // 삭제 후 마이페이지 즐겨찾기 목록을 다시 불러옴
      
    },
    error: function (request, status, error) {
      console.log(error); // 오류 발생시 콘솔에 출력
    }
  });
};
