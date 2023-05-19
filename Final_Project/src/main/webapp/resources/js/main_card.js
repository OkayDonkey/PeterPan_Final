$(document).ready(function () {

  $.ajax({//찜하기 목록 불러오기
    type: 'POST',
    url: 'card_load.do',
    dataType: "json",
    success: function (data) {
    //  console.log("AJAX호출 성공");
    //  console.log("데이터 송신완료 값:" + data);
      var List = JSON.parse(data.List); // 문자열을 JavaScript 객체로 파싱
      var name = List.map(obj => obj.name);
      var info = List.map(obj => obj.info);
      var addr = List.map(obj => obj.addr);
      var detailAddr = List.map(obj => obj.detailAddr);
      var marked_storeidx = List.map(obj => obj.marked_storeidx);
      

      var card_Elem_id = document.querySelector('#CardLoad');
     card_Elem_id.innerHTML = ''; // 기존 내용 지우기

      if (List.length > 0) {
        List.forEach(function (obj) {
		       card_Elem_id.innerHTML += `
		       	
		       	<div class="col-md-3 col-sm-6">
							<div class="product-card mb-4">
								<div class="product-thumb">
									 <input type="hidden" id="main_idx" value="${obj.Main_idx }"> 
									 <img src="${obj.Main_img}" alt="${obj.Main_name}">
								</div>
								<div class="product-card-body text-center">
									<a class="product-meta" href="total_main_search.do?keyword=${obj.Main_name}"
										style="font-family: 'GmarketSansMedium';">${obj.Main_info }</a>
									<h3 class="product-card-title">
										<a href="total_main_search.do?keyword=${obj.Main_name}"
											style="font-family: 'GmarketSansMedium'; font-size: 18px;">${obj.Main_name}</a>
									</h3>
									<span class="text-primary-orange"
										style="font-family: 'GmarketSansMedium'; font-size: 13px;">${obj.Main_addr }</span>
								</div>
							</div>
						</div>
		       	
		       
				`;					//detailAddr 데이터 없을 때 C:If해서 스페이스로 출력하기

        });
      }
    }, 
  });
}); 