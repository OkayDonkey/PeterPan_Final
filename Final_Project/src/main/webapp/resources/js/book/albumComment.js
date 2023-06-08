function comment(){

	  var memberNo = document.getElementById("memberNo").value;
  	  var memberId = document.getElementById("memberId").value;
  	  var albumNo = document.getElementById("albumNo").value;
  	  var comment = document.getElementById("commentInput").value; 
		
		console.log("앨범 댓글  Ajax호출");
		console.log("회원번호:"+ memberNo); 
		console.log("회원아이디:"+ memberId);
		console.log("앨범번호:"+ albumNo);
		console.log("리뷰내용:"+ comment);
	
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
  }
});

}