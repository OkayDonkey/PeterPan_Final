// 회원 관리
function blockMembershipModal(memberId, memberName) {
  var modalText = memberId + " 님의 커뮤니티 이용을 차단하시겠습니까?";
  document.querySelector(".first_write").textContent = modalText;
  document.querySelector(".allBlock").textContent = "차단";

  document.getElementById("insertPopup").removeAttribute("hidden");

  var blockButton = document.querySelector(".allBlock");
  blockButton.addEventListener("click", function () {
    blockMembership(memberId, memberName);
  });
}

function blockMembership(memberId, memberName) {
  $.ajax({
    type: "POST",
    url: "block_membership.go",
    data: { memberId: memberId, memberName: memberName },
    success: function (response) {
      if (response == "1") {
        alert(memberId + " 님의 커뮤니티 이용이 차단되었습니다.");
        location.href = "member_management.go";
      } else {
        alert(memberId + " 님 커뮤니티 이용 차단에 실패하였습니다.");
        return;
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      alert("통신 오류로 차단에 실패하였습니다.");
    },
  });
}

function unblockMembershipModal(memberId, memberName) {
  var modalText = memberId + " 님의 커뮤니티 이용 차단을 해제하시겠습니까?";
  document.querySelector(".first_write").textContent = modalText;
  document.querySelector(".allBlock").textContent = "차단 해제";

  document.getElementById("insertPopup").removeAttribute("hidden");

  var blockButton = document.querySelector(".allBlock");
  blockButton.addEventListener("click", function () {
    unblockMembership(memberId, memberName);
  });
}

function unblockMembership(memberId, memberName) {
  $.ajax({
    type: "POST",
    url: "unblock_membership.go",
    data: { memberId: memberId, memberName: memberName },
    success: function (response) {
      if (response == "1") {
        alert(memberId + " 님의 커뮤니티 이용 차단이 해제되었습니다.");
        location.href = "member_management.go";
      } else {
        alert(memberId + " 님 차단해제에 실패하였습니다.");
        return;
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      alert("통신 오류로 실패하였습니다.");
    },
  });
}
// 회원 관리 end

// 책 관리

function outOfPrintModal(bookNo, bookName) {
  var modalText = bookName + " 을(를) 절판처리 하시겠습니까?";
  document.querySelector(".first_write").textContent = modalText;
  document.querySelector(".allBlock").textContent = "확인";

  document.getElementById("insertPopup").removeAttribute("hidden");

  var blockButton = document.querySelector(".allBlock");
  blockButton.addEventListener("click", function () {
    outOfPrint(bookNo, bookName);
  });
}

function outOfPrint(bookNo, bookName) {
  $.ajax({
    type: "POST",
    url: "out_of_print.go",
    data: { bookNo: bookNo },
    success: function (response) {
      if (response == "1") {
        alert(bookName + " 은(는) 절판 처리 되었습니다.");
        location.href = "book_management.go";
      } else {
        alert(bookName + " 의 절판 처리가 실패하였습니다.");
        return;
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      alert("통신 오류로 실패하였습니다.");
    },
  });
}

function cancelOutOfPrintModal(bookNo, bookName) {
  var modalText = bookName + " 의 절판 처리를 취소 하시겠습니까?";
  document.querySelector(".first_write").textContent = modalText;
  document.querySelector(".allBlock").textContent = "확인";

  document.getElementById("insertPopup").removeAttribute("hidden");

  var blockButton = document.querySelector(".allBlock");
  blockButton.addEventListener("click", function () {
    cancelOutOfPrint(bookNo, bookName);
  });
}

function cancelOutOfPrint(bookNo, bookName) {
  $.ajax({
    type: "POST",
    url: "cancel_out_of_print.go",
    data: { bookNo: bookNo },
    success: function (response) {
      if (response == "1") {
        alert(bookName + " 의 절판 처리가 취소 되었습니다.");
        location.href = "book_management.go";
      } else {
        alert(bookName + " 의 절판 처리 취소가 실패하였습니다.");
        return;
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      alert("통신 오류로 실패하였습니다.");
    },
  });
}

// 책 관리 end

function closeModal() {
  document.getElementById("insertPopup").setAttribute("hidden", true);
}

// qna 답변 작성

function qnaAnswerModal(boardNo, content) {
  document.querySelector(".qna_first_write").textContent = content;

  document.getElementById("qnaInsertPopup").removeAttribute("hidden");

  var blockButton = document.querySelector(".qnaAnswer");
  blockButton.addEventListener("click", function () {
    qnaAnswer(boardNo);
  });
}

function qnaAnswer(boardNo) {
  var answerContent = document.querySelector(".answerContent").value;
  $.ajax({
    type: "POST",
    url: "qna_answer.go",
    data: { boardNO: boardNo, content: answerContent },
    success: function (response) {
      if (response == "1") {
        alert("답변 등록되었습니다.");
        location.href = "qna_management.go";
      } else {
        alert("답변 등록에 실패했습니다.");
        return;
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      alert("통신 오류로 실패하였습니다.");
    },
  });
}

function qnaCloseModal() {
  document.getElementById("qnaInsertPopup").setAttribute("hidden", true);
}

// qna 답변 작성 end


