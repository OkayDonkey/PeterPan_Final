// qna 답변 작성

function bookSearchModal(no) {

  document.getElementById("insertPopup").removeAttribute("hidden");
  console.log(no);
  var idNo = document.getElementById("idNo");
  idNo.value = no;
}

function closeModal(no) {
  document.getElementById("insertPopup").setAttribute("hidden", true);
}

$("#searchform").submit(function(event) {
  event.preventDefault(); // 폼 기본 제출 동작 막기
  serchalbum(); // serchalbum() 함수 호출
});


function serchalbum() {
  var keyword = document.getElementById("keyword").value;
  // var field = $("select[name='field']").val();
   var field = $("#field").val();
  // var field = $("select[name='field']").find(":selected").val();
  // var field = $("select[name='field'] option:selected").val();
  
console.log("keyword"+keyword);
console.log("field"+field);

  $.ajax({
    type: "GET",
    url: "modal_search.go",
    data: { keyword: keyword, field: field },
    success: function (response) {
      // 서버 응답 성공 시 처리할 내용
      console.log(response); // 응답 데이터 확인 또는 처리 로직 추가
     // 리스트 내용 변경
     if (response && response.length > 0) {
      var html = '';
      for (var i = 0; i < response.length; i++) {
        var dto = response[i];
        html += '<tr>';
        html += '<td>';
        html += '<div><img src="' + dto.bookCover + '" width="55px" id="albumserchCover"></div>';
        html += '</td>';
        html += '<td>';
        html += '<div><span id="albumserchName">' + dto.bookName + '</span></div>';
        html += '</td>';
        html += '<td>';
        html += '<input type="button" value="선택하기" onclick="selectAlbum(' + dto.bookNo +')">';
        html += '</td>';
        html += '</tr>';

      }
      // 리스트 테이블에 변경된 HTML 적용
      $('.bookWrap').html(html);
      
    }
  },
    error: function (jqXHR, textStatus, errorThrown) {
      // 서버 응답 실패 시 처리할 내용
      console.error(textStatus, errorThrown);
    },
  });
}

//// html += '<input type="button" value="선택하기" onclick="location.href = \'insertOk.go?bookNo=' + dto.bookNo + '\'">';


function selectAlbum(bookNo) {
  
  var no = document.getElementById("idNo").value;

  $.ajax({
    type: "GET",
    url: "insertBookOk.go",   //"insertBookOk.go"
    data: { bookNo: bookNo },
    success: function (response) {
      // 응답 데이터 확인
      console.log(response);

      // 응답 데이터를 span 태그에 넣어주기
      if (response) {
        $('#bookCover'+no).attr('src', response.bookCover);
        $('#bookTitle'+no).val(response.bookName);
        $('#bookWriter'+no).text(response.bookWriter);
        $('#bookGenre'+no).text(response.bookGenre);
        $('#bookPrice'+no).text(response.bookPrice);
        
        closeModal();
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      // 서버 응답 실패 시 처리할 내용
      console.error(textStatus, errorThrown);
    },
  });
}
