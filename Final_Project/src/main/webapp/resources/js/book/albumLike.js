var checkedLike = false;

// 좋아요 Ajax===============

var isLiked = false; // 좋아요 상태를 저장하는 변수
var heartIcon = document.getElementById("heartIcon");
var memberNo = document.getElementById("memberNo").value;
var albumNo = document.getElementById("albumNo").value;
var likeDisplay = document.getElementById("likeDisplay");

$(document).ready(function () {

  var memberNo = document.getElementById("memberNo").value;
  var albumNo = document.getElementById("albumNo").value;
  var heartIcon = document.getElementById("heartIcon"); // heartIcon 변수 정의 필요
  
  console.log("albumNo:"+albumNo);
  console.log("memberNo:"+memberNo);
  
  $.ajax({
    type: "POST",
    url: 'checkAlbumLike.go',
    data: {
      memberNo: memberNo,
      albumNo: albumNo
    },
    success: function (result) {
      console.log("Ajax반환 성공 데이터:" + result);
      if (result > 0) {
        heartIcon.setAttribute("src", "resources/img/heart_fill.png");
        isLiked = true;
      } else {
        heartIcon.setAttribute("src", "resources/img/heart.png");
        isLiked = false;
      }
    },
    error: function (request, status, error) {
      console.log(status + " : " + error); // 오류 발생시 콘솔에 출력
    }
  });
});

 function toggleLike() {
    console.log("ToggleLike ajax호출");
      console.log("albumNo:"+albumNo);
  console.log("memberNo:"+memberNo);
    $.ajax({
      type: 'POST',
      url: 'albumLike.go',
      data: {
        memberNo: memberNo,
        albumNo: albumNo,
      },
      success: function (result) {
      console.log(result);
      if (result > 0) {
        heartIcon.setAttribute("src", "resources/img/heart_fill.png");
        isLiked = true;
          var likeNum = parseInt(likeDisplay.innerText);
        likeNum += 1;
        likeDisplay.innerText = likeNum;
      } else {
        heartIcon.setAttribute("src", "resources/img/heart.png");
        isLiked = false;
          var likeNum = parseInt(likeDisplay.innerText);
        likeNum -= 1;
        likeDisplay.innerText = likeNum;
      }
    },
      error: function (request, status, error) {
        console.log(error); // 오류 발생시 콘솔에 출력
      }
    });
  }
  


function needLogin() {
  var popupElement = document.getElementById("needLoginPopup");

  // 팝업 토글
  if (popupElement.hidden === false) {
    popupElement.hidden = true;
  } else {
    popupElement.hidden = false;
  }
}

function reviewPopup() {
  var popupElement = document.getElementById("reviewPopup");

  // 팝업 토글
  if (popupElement.hidden === false) {
    popupElement.hidden = true;
  } else {
    popupElement.hidden = false;
  }
}


	function checkLike(defaultImgSrc, activeImgSrc) {
	
    var imgElement = document.getElementById("LikePng");
    var checkBox = document.getElementById("checkBox");
    var currentSrc = imgElement.getAttribute("src");

    if (currentSrc === defaultImgSrc) {
        // 이미지 소스를 변경할 이미지로 변경
        imgElement.setAttribute("src", activeImgSrc);
        checkBox.value = true;
        checkedLike = true;
        console.log("추천 체크됨");
    } else {
        // 이미지 소스를 기본 이미지로 변경
        imgElement.setAttribute("src", defaultImgSrc);
        checkBox.value = false;
        checkedLike = false;
        console.log("추천 체크해제됨");
    }
}
