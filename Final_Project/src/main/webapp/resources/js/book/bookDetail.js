var activePopup = null; // 활성화된 팝업을 저장하는 변수

function togglePopup(popupId, imgId, defaultImgSrc, activeImgSrc) {
  var popupElement = document.getElementById(popupId);
  var imgElement = document.getElementById(imgId);
  var currentSrc = imgElement.getAttribute("src");

  if (currentSrc === defaultImgSrc) {
    // 새로운 팝업을 열기 전에 기존 팝업을 닫기
    if (activePopup !== null && activePopup !== popupElement) {
      activePopup.setAttribute("hidden", "");
    }

    // 선택한 팝업 열기
    popupElement.removeAttribute("hidden");
    activePopup = popupElement;

    // 이미지 소스를 활성화된 이미지로 변경
    imgElement.setAttribute("src", activeImgSrc);
  } else {
    // 선택한 팝업을 닫기
    popupElement.setAttribute("hidden", "");
    activePopup = null;

    // 이미지 소스를 기본 이미지로 변경
    imgElement.setAttribute("src", defaultImgSrc);
  }
}

function resetActivePopup() {
  activePopup = null;
}


//==============================================================


	var isLiked = false; // 좋아요 상태를 저장하는 변수
	
	function toggleLike(memNo, bookNo) {
	 
	 		alert("ajax호출");
		  $.ajax({
			    type: 'POST',
			    url: 'dibs.go',
			    data: {
			      memberNo: memNo,
			      bookNo: bookNo,
			    },
			    success: function (data) {
			      if (data == 1) { // DB에서 삭제 성공시
			        // 좋아요 활성
			      } else if (data == 2) {//좋아요 비활성 상태일 경우
			          
			      }
			    },
			    error: function (request, status, error) {
			      console.log(error); // 오류 발생시 콘솔에 출력
		   		 }
		      });
	 
	 
	  var heartIcon = document.getElementById("heartIcon");
	
	  if (isLiked) {
	    // 좋아요 상태에서 클릭하면 좋아요 취소
	    heartIcon.setAttribute("src", "resources/img/heart.png");
	    isLiked = false;
	    // 좋아요 취소를 처리할 추가적인 로직을 작성할 수 있습니다.
	  } else {
	    // 좋아요 상태가 아닐 때 클릭하면 좋아요
	    heartIcon.setAttribute("src", "resources/img/heart_fill.png");
	    isLiked = true;
	    // 좋아요를 처리할 추가적인 로직을 작성할 수 있습니다.
	  }
	  
	  
}


function needLogin(){
alert("로그인 후 이용할 수 있는 서비스입니다.");
}