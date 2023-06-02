function blockMembershipModal(memberId, memberName) {
  var modalText = memberId + " 님의 커뮤니티 이용을 차단하시겠습니까?";
  document.querySelector(".first_write").textContent = modalText;

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
  var modalText =
    memberId + " 님의 커뮤니티 이용 차단을 해제하시겠습니까?";
  document.querySelector(".first_write").textContent = modalText;

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
      alert("통신 오류로 차단에 실패하였습니다.");
    },
  });
}

function closeModal() {
  document.getElementById("insertPopup").setAttribute("hidden", true);
}

