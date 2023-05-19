$(document).ready(function () {

 

  $.ajax({//찜하기 목록 불러오기
    type: 'POST',
    url: 'Marking_load.do',
    dataType: "json",
    success: function (data) {
 
   var MList = JSON.parse(data.MList); // 문자열을 JavaScript 객체로 파싱
    var markedStoreIdxValues = MList.map(obj => obj.marked_storeidx);
    console.log(markedStoreIdxValues);
	let count = markedStoreIdxValues.length;
      if (data != null) { // DB에서 삭제 성공시
      for(let i = 0; i < markedStoreIdxValues.length; i ++){
		   // 좋아요 활성
        $('#Heart' + markedStoreIdxValues[i]).find('svg').toggleClass('bi-suit-heart-fill');

        const color = $('#Heart' + markedStoreIdxValues[i]).find('svg.bi-suit-heart-fill');
        color.attr('fill', "red");
        const image = $('#Heart' + markedStoreIdxValues[i]).find('svg.bi-suit-heart-fill');
        const path = $('#Heart' + markedStoreIdxValues[i]).find('svg.bi-suit-heart-fill path');

        const fillHeart = "M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z";
        path.attr('d', fillHeart);
        image.html('<svg class="bi bi-suit-heart-fill" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path d="' + fillHeart + '"/></svg>');
        console.log("하트 색상 변경실행");
        
      	}
	  }
     
       CountMark(count);
       CountMark1(count);
    },
     error: function (request, status, error) {
        console.log(status+ " : " +error); // 오류 발생시 콘솔에 출력
      }
           
  });
  
  
  // 하트 아이콘을 클릭할 때마다 실행
  $('.product-wishlist-btn').on('click', function (e) {
    console.log("찜하기 기능 Ajax호출");
    e.preventDefault(); // 기본 이벤트 방지
    
 var main_idx = $(this).siblings('#main_idx').val(); // 가게 idx 가져오기 전역변수

    $.ajax({
      type: 'POST',
      url: 'Marking_Insert.do',
      data: {
        main_idx: main_idx,
      },
      success: function (data) {
        if (data == 1) { // DB에서 삭제 성공시
          // 좋아요 활성
          $('#Heart' + main_idx).find('svg').toggleClass('bi-suit-heart');
          const color = $('#Heart' + main_idx).find('svg.bi-suit-heart');
          color.attr('fill', "currentColor");
          const image = $('#Heart' + main_idx).find('svg.bi-suit-heart');
          const path = $('#Heart' + main_idx).find('svg.bi-suit-heart path');
          const delHeart = "M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z";
          path.attr('d', delHeart);
          image.html('<svg class="bi bi-suit-heart" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path d="' + delHeart + '"/></svg>');

          console.log("하트 색상 제거실행");
        } else if (data == 2) {//좋아요 비활성 상태일 경우

          $('#Heart' + main_idx).find('svg').toggleClass('bi-suit-heart-fill');

          const color = $('#Heart' + main_idx).find('svg.bi-suit-heart-fill');
          color.attr('fill', "red");
          const image = $('#Heart' + main_idx).find('svg.bi-suit-heart-fill');
          const path = $('#Heart' + main_idx).find('svg.bi-suit-heart-fill path');

          const fillHeart = "M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z";
          path.attr('d', fillHeart);
          image.html('<svg class="bi bi-suit-heart-fill" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path d="' + fillHeart + '"/></svg>');

          console.log("하트 색상 변경실행");

        }
      },
      error: function (request, status, error) {
        console.log(error); // 오류 발생시 콘솔에 출력
      }

    });
  });
});

function CountMark(count){//상단 찜하기 총 갯수
	   //찜한 가게 총 수
		const totalMark = document.getElementById('totalMarkCount');
		
		totalMark.textContent = count;
	
			
};	
function CountMark1(count){ //마이프로필
	   //찜한 가게 총 수
		const totalMark1 = document.getElementById('totalMarkCount1');
		
		totalMark1.textContent = count;
		
};


$('.LoadMenuImg').on('click', function (e) {
    console.log("메뉴사진 로드 Ajax호출");
    
    var main_idx = $(this).siblings('.main_menu_idx').val(); // 가게 idx 가져오기 전역변수
    
    console.log("가게번호 >"+main_idx);
    $.ajax({
        type: 'POST',
        url: 'Menu_Load.do',
        datatype: 'json',
        data: {
            main_idx: main_idx,
        },
        success: function (data) {
			console.log(data); 
            var img_Elm = $('.carouselMenu');
            var List = JSON.parse(data.List);
            var div_top = '<div class="owl-carousel carouselMenu" data-owl-carousel=\'{ "nav": true, "dots": false, "loop": true, "margin": 15 }\'>';
            var div_end = '</div>';
            var imgHtml = '';
            var textHtml = '<li class="pb-2" style="list-style: none;">==== 메뉴 ====</b>';
            
            if (List.length > 0) {
                List.forEach(function (obj) {
                    imgHtml += '<img src="' + obj.menu_img + '" alt="' + obj.menu_img + '">';
					textHtml += '<li>'+obj.menu_name+' : '+obj.menu_price+'원</li>';
					
					
                });
            }
            div_top += imgHtml;
            div_top += div_end;
             
            img_Elm.html(div_top);
    	    $('.Menu_Info_Text').html(textHtml);
                
            // Carousel 초기화
			var owl = $('.carouselMenu .owl-carousel');
            owl.owlCarousel({
			    nav: true,
			    dots: false,
			    loop: true,
			    margin: 15,
			    items: 1, // 추가
			    autoplay: true, // 추가
			    autoplayTimeout: 5000, // 추가
			});
			owl.trigger('refresh.owl.carousel');
			
            
        },
        error: function (request, status, error) {
            console.log(error); // 오류 발생시 콘솔에 출력
        }
    });
    
     console.log(main_idx);

    $.ajax({
      url: "starList.do",
      type: "get",
      dataType: "json",
      data: {
        idx: main_idx
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
    
});
