// qna 답변 작성

function bookSearchModal(no) {
  document.getElementById("insertPopup").removeAttribute("hidden");
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
  var field = $("#field").val();
  
  $.ajax({
    type: "GET",
    url: "modal_search.go",
    data: { keyword: keyword, field: field },
    success: function (response) {
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
      $('.bookWrap').html(html);
    }
  },
    error: function (jqXHR, textStatus, errorThrown) {
      console.error(textStatus, errorThrown);
    },
  });
}

function selectAlbum(bookNo) {
  
  var no = document.getElementById("idNo").value;

  $.ajax({
    type: "GET",
    url: "insertBookOk.go",   //"insertBookOk.go"
    data: { bookNo: bookNo },
    success: function (response) {
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
