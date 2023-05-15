var val = 0; 

$(function () {
	
	
    $('.starRev span').click(function(){
    $(this).parent().children('span').removeClass('on');
    $(this).addClass('on').prevAll('span').addClass('on');
    
    return false;
    
  });

  $("#starInsert").on("click", function(e){
	e.preventDefault(); // 기본 이벤트 방지
	 console.log(123);
	/* var myElement = document.getElementById('myElement');
var textContent = myElement.textContent;
console.log(textContent); // "Hello, world!"*/
	 
	let main_idx = $(this).parents('.starInsert-idx').find("#detail_idx").val();
	console.log(main_idx);
    let star = $(this).siblings(".starRev .on").textContent;
    console.log(star);
    let review = $("#reviewContents"+main_idx).val();
    console.log(review);
	$.ajax({
      type: "post",
      url: "star_review.do",
      dataType: "json",
      data: {
    	  star : val,
    	  review : review,
    	  idx : main_idx
      },
      success: function(data){
		  	console.log("댓글 작성 완료.");
			starLoad(main_idx);
			$('.form-control').val('');
			console.log($('#starRev'));
			$('#starRev').find('.starR:gt(0)').attr('class','starR');
      }
    });
  });
});

 function starLoad(no) {
    console.log(main_idx);

    $.ajax({
      url: "starList.do",
      type: "get",
      dataType: "json",
      data: {
        idx: no
      },
      success: function (data) {
        var List = data.List;
        var div_top = '<blockquote class="blockquote comment border-top-0 border-left-0 border-right-0 px-0 pt-0">';
        var div_end = '</blockquote>';
        var imgHtml = '';
        var img_Elm = $('.starjs');

        if (List.length > 0) {
          List.forEach(function (obj) {
            imgHtml += `
              <div class="d-sm-flex align-items-center pb-2">
                <h6 class="mb-0 member_id_title">${obj.member_id}</h6>
                <span class="d-none d-sm-inline mx-2 text-muted opacity-50">|</span>
                <div class="starRev" id="starRev">
                  <span class="starR ${obj.star_count >= 1 ? 'on' : ''}">⭐</span>
                  <span class="starR ${obj.star_count >= 2 ? 'on' : ''}">⭐</span>
                  <span class="starR ${obj.star_count >= 3 ? 'on' : ''}">⭐</span>
                  <span class="starR ${obj.star_count >= 4 ? 'on' : ''}">⭐</span>
                  <span class="starR ${obj.star_count >= 5 ? 'on' : ''}">⭐</span>
                </div>
              </div>
              <p class="user_comment">${obj.review}</p>
            `;
          });
          div_top += imgHtml;
          div_top += div_end;
          img_Elm.html(div_top);
        }
      },
      error: function (xhr, status, error) {
        console.log(error);
      }
    });
}

function setStarRating(star_count) {
  $('.starR').each(function (index) {
    if (index < star_count) {
      $(this).addClass('on');
    } else {
      $(this).removeClass('on');
    }
  });
}

// 1. 별점 요소들을 선택합니다.
const stars = document.querySelectorAll('.starR');


// 2. 각 별점 요소에 클릭 이벤트를 추가합니다.
stars.forEach((star, index) => {
  star.addEventListener('click', function() {
    // 3. 클릭한 별 이하의 모든 별 요소에 on 클래스를 추가합니다.
    for (let i = 0; i <= index; i++) {
      stars[i].classList.add('on');
    }
    // 4. 클릭한 별 이하의 모든 별 요소에 on 클래스를 제거합니다.
    for (let i = index + 1; i < stars.length; i++) {
      stars[i].classList.remove('on');
    }
    // 5. 클릭한 별의 개수를 val 변수에 저장합니다.
    val = (index%5)+ 1;
    console.log('별점:', val);
  });
});


function setStarRating(star_count) {
  // 모든 별점 요소 선택
  var stars = document.querySelectorAll('.starR');
  
  // 별점에 on 클래스 제거
  stars.forEach(function(star) {
    star.classList.remove('on');
  });
  
  // 별점에 on 클래스 추가
  for (var i = 0; i < star_count; i++) {
    stars[i].classList.add('on');
  }
}
