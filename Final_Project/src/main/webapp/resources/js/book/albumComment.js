function comment(){

	  var memberNo = document.getElementById("memberNo").value;
  	  var memberId = document.getElementById("memberId").value;
  	  var albumNo = document.getElementById("albumNo").value;
  	  var comment = document.getElementById("commentInput").value.trim();
  	  var commentBox = document.getElementById("commentInput"); 
  	  var commentDisplay1 = document.getElementById('commentDisplay1');
  	  var commentDisplay2 = document.getElementById('commentDisplay2');
		
		console.log("앨범 댓글  Ajax호출");
		console.log("회원번호:"+ memberNo); 
		console.log("회원아이디:"+ memberId);
		console.log("앨범번호:"+ albumNo);
		console.log("리뷰내용:"+ comment);
	
		if (comment === "") {
			alert("댓글 내용을 입력해주세요.");
			return; // 함수 종료
		}

	$.ajax({
		type: 'POST',
		url: 'commentInsert.go',
		dataType: "json",
		data: {
			albumNo: albumNo,
			memberId: memberId,
			memberNo: memberNo,
			comment: comment,
		},
		success: function (data) { 
			
			console.log("AJAX호출 성공");
			console.log("데이터 송신완료 값:");
			console.log(data);
			
		var commentContainer = document.getElementById("CommentInnerAjax"); 
			commentContainer.innerHTML = ""; // 기존 내용 지우기
			commentBox.value = ""; // 기존 내용 지우기
			
			commentDisplay1.innerText = data.length.toString();
			commentDisplay2.innerText = data.length.toString();




	if (data.length > 0) {
		data.forEach(function (obj) {
							
		console.log("commentInsert Success");
				
		commentContainer.innerHTML += `
	        <div class="reviewBlock pl-0">
				<p class="mb-3">${obj.memberId }</p>
				<p class="mb-2">${obj.comment }</p>
				<p class="mb-2 smallGrayText">${obj.commentDate }  |  신고  |  답글쓰기</p>
			</div>
	      `;
	    	
	   
	    });

  }
},

  error: function (request, status, error) {
    console.log(error); // 오류 발생시 콘솔에 출력
	alert("댓글 등록에 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
  }
});

}







// 앨범 장바구니

var cart = []; // 장바구니를 배열로 선언합니다.


function bookCheckCart() {
	
  var checkbox = event.target;
  var no = checkbox.getAttribute('data-bookNo');
  var id = checkbox.getAttribute('data-memberId');
	
  var existingItemIndex = cart.findIndex(item => item.bookNo === no); // 동일한 no 값을 가진 아이템의 인덱스를 찾습니다.

  if (existingItemIndex !== -1) {
  
    console.log("이미 장바구니에 해당 책이 존재합니다. 데이터를 삭제합니다.");
    cart.splice(existingItemIndex, 1); // 이미 있는 아이템을 장바구니에서 삭제합니다.
    
  } else {
  
    var newItem = { bookNo: no, bookId: id };
    cart.push(newItem); // 새로운 아이템을 장바구니에 추가합니다.
    console.log("새로운 책을 장바구니에 추가했습니다.");
    
  }

  console.log("장바구니 데이터:", cart);
}



function toggleCheckboxes() {

  var checkAll = document.getElementsByName('checkAll')[0];
  var checkboxes = document.getElementsByName('check');

 for (var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = checkAll.checked;
  }

  // 모든 체크박스 상태 변경 후 bookCheckCart 함수 호출
  if (checkAll.checked) {
    for (var i = 0; i < checkboxes.length; i++) {
      if (checkboxes[i].checked) {
       		
       		bookCheckCart();
       		
	 	 }
	   }
	}
 
}

// checkAll 체크박스 클릭 이벤트 핸들러 등록
var checkAllCheckbox = document.getElementsByName('checkAll')[0];
checkAllCheckbox.addEventListener('click', toggleCheckboxes);


