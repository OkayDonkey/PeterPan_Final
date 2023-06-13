var activePopup = null; // 활성화된 팝업을 저장하는 변수
var checkedLike = false;

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

// 좋아요 Ajax===============

var isLiked = false; // 좋아요 상태를 저장하는 변수
var heartIcon = document.getElementById("heartIcon");
var memberNo = document.getElementById("memberNo").value;
var bookNo = document.getElementById("bookNo").value;

$(document).ready(function () {
  var memberNo = document.getElementById("memberNo").value;
  var bookNo = document.getElementById("bookNo").value;
  var heartIcon = document.getElementById("heartIcon"); // heartIcon 변수 정의 필요
  
  $.ajax({
    type: "POST",
    url: path+"checkDibs.go",
    data: {
      memberNo: memberNo,
      bookNo: bookNo
    },
    success: function (result) {
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


  function needLogin() {
    var popupElement = document.getElementById("needLoginPopup");

    // 팝업 토글
    if (popupElement.hidden === false) {
      popupElement.hidden = true;
    } else {
      popupElement.hidden = false;
    }
  }

 function toggleLike() {
    console.log("ToggleLike ajax호출");
    $.ajax({
      type: 'POST',
      url: 'dibs.go',
      data: {
        memberNo: memberNo,
        bookNo: bookNo,
      },
      success: function (result) {
      console.log(result);
      if (result > 0) {
        heartIcon.setAttribute("src", "resources/img/heart_fill.png");
        isLiked = true;
      } else {
        heartIcon.setAttribute("src", "resources/img/heart.png");
        isLiked = false;
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


function insertReview(){

	  var memberNo = document.getElementById("memberNo").value;
  	  var memberId = document.getElementById("memberId").value;
  	  var bookNo = document.getElementById("bookNo").value;
  	  var reviewTitle = document.getElementById("reviewTitle").value;
  	  var reviewCont = document.getElementById("reviewCont").value;
  	  var like = document.getElementById("checkBox").value;
		  	  
	$.ajax({
	  type: 'POST',
	  url: 'insertReview.go',
	  dataType: "json",
	  data: {
			    bookNo: bookNo,
			    memberId: memberId,
			    memberNo: memberNo,
			    reviewTitle: reviewTitle,
			    reviewCont: reviewCont,
			    recommend: checkedLike,
			  },
 	 success: function (data) {
		
	  var card_Elem_id = document.querySelector('#reviewInnerAjax');
	  var num = document.querySelector('#totalReviewNum');
	
	  card_Elem_id.innerHTML = ''; // 기존 내용 지우기
	
	  if (data.length > 0) {
	    data.forEach(function (obj) {
	    
	    if( obj.recommend == true ){
	    	
	    	card_Elem_id.innerHTML += `
	        <div class="reviewBlock">
	          <div class="container">
	            <p>
	              <span class="reviewBuyerBox">구매자</span>
	              <span class="smallTextGray mr-1">${obj.memberId}</span>
	              <span class="smallTextGray mr-1">${obj.reviewRegdate}</span>
	              <span class="smallTextGray mr-1">${obj.reviewTitle}</span>
	              <span class="recommend_img"></span>
	            </p>
	          </div>
	          <div class="container"><p class="TextGray">${obj.reviewCont}</p></div>
	        </div>
	      `;
	    	
	    } else {
	    
	      card_Elem_id.innerHTML += `
	        <div class="reviewBlock">
	          <div class="container">
	            <p>
	              <span class="reviewBuyerBox">구매자</span>
	              <span class="smallTextGray mr-1">${obj.memberId}</span>
	              <span class="smallTextGray mr-1">${obj.reviewRegdate}</span>
	              <span class="smallTextGray mr-1">${obj.reviewTitle}</span>
	              <span class="notRecommend_img"></span>
	            </p>
	          </div>
	          <div class="container"><p class="TextGray">${obj.reviewCont}</p></div>
	        </div>
	      `;
	      }
	    });

    num.innerText = parseInt(num.innerText) + 1;
  }

  reviewPopup();    // 팝업 닫아주기
},

  error: function (request, status, error) {
    console.log(error); // 오류 발생시 콘솔에 출력
  }
});

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
