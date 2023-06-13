function comment(){

	  var memberNo = document.getElementById("memberNo").value;
  	  var memberId = document.getElementById("memberId").value;
  	  var albumNo = document.getElementById("albumNo").value;
  	  var comment = document.getElementById("commentInput").value.trim();
  	  var commentBox = document.getElementById("commentInput"); 
  	  var commentDisplay1 = document.getElementById('commentDisplay1');
  	  var commentDisplay2 = document.getElementById('commentDisplay2');
		
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
	alert("댓글 등록에 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
  }
});

}

// 앨범 장바구니 

function addAlbumToCart() {
  var checkboxes = document.getElementsByName("check");
  var selectedAlbums = [];
  var sessionId = document.getElementById("sessionId").value;

  for (var i = 0; i < checkboxes.length; i++) {
    if (checkboxes[i].checked) {
      var bookNo = checkboxes[i].getAttribute("data-bookNo");
      var bookPrice = checkboxes[i].getAttribute("data-bookPrice");
      var album = {
        bookNo: bookNo,
        memberId: sessionId,
        bookPrice: bookPrice,
        cartCount: 1,
      };
      selectedAlbums.push(album);
    }
  }

  if (selectedAlbums.length > 0) {
    var currentIndex = 0;

    function processNextAlbum() {
      if (currentIndex < selectedAlbums.length) {
        var album = selectedAlbums[currentIndex];
        var url = "albumBookCart.go";

        $.ajax({
          type: "POST",
          url: url,
          data: {
            memberId: album.memberId,
            bookNo: album.bookNo,
            bookPrice: album.bookPrice,
            cartCount: album.cartCount,
          },
          success: function (result) {
            if (result == 1) {
              alert("로그인 후 장바구니 담기가 가능합니다.");
              window.location.href = "login.go";
            } else if (result == 2) {
              
            } else if (result == 3) {
              alert("기존 상품에 수량을 추가했습니다.");
            }
          },
          error: function (request, status, error) {
            console.log(status + " : " + error);
          },
          complete: function () {
            currentIndex++;
            processNextAlbum(); // 다음 앨범 처리
          },
        });
      } else {
        // 모든 앨범 처리가 완료된 경우
				alert("장바구니에 담았습니다.");
        window.location.href = "cartList.go"; // 장바구니 페이지로 이동
      }
    }

    processNextAlbum(); // 첫 번째 앨범 처리 시작
  }
}

function toggleCheckboxes(checkbox) {
  var checkboxes = document.getElementsByName("check");
  for (var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = checkbox.checked;
  }
}
