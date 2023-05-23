const foldBoxHeaders = document.querySelectorAll(".fold_box_header");
foldBoxHeaders.forEach((header) => {
  header.addEventListener("click", function () {
    const foldBox = this.parentNode;
    foldBox.classList.toggle("expanded");

    const contents = foldBox.querySelector(".fold_box_contents");
    if (foldBox.classList.contains("expanded")) {
      contents.style.height = contents.scrollHeight + "px";
    } else {
      contents.style.height = "0";
    }
  });
});

var findIdTab = document.getElementById("tabContentFindId");
var findPwdTab = document.getElementById("tabContentFindpwd");
var findIdLink = document.getElementById("findIdLink");
var findPwdLink = document.getElementById("findPwdLink");

// 아이디 찾기 링크 클릭 시 이벤트 처리
findIdLink.addEventListener("click", function (event) {
  event.preventDefault(); // 링크의 기본 동작 방지

  // 아이디 찾기 탭 내용을 보여주는 코드
  findIdTab.style.display = "block";
  // 비밀번호 찾기 탭 내용 숨기기
  findPwdTab.style.display = "none";

  // 클래스명 추가
  findIdLink.parentNode.classList.add("ui-tabs-active", "ui-state-active");
  findPwdLink.parentNode.classList.remove("ui-tabs-active", "ui-state-active");
});

// 비밀번호 찾기 링크 클릭 시 이벤트 처리
findPwdLink.addEventListener("click", function (event) {
  event.preventDefault(); // 링크의 기본 동작 방지

  // 비밀번호 찾기 탭 내용을 보여주는 코드
  findPwdTab.style.display = "block";
  // 아이디 찾기 탭 내용 숨기기
  findIdTab.style.display = "none";

  // 클래스명 추가
  findPwdLink.parentNode.classList.add("ui-tabs-active", "ui-state-active");
  findIdLink.parentNode.classList.remove("ui-tabs-active", "ui-state-active");
});

window.addEventListener("load", function () {
  findIdTab.style.display = "block";
  findPwdTab.style.display = "none";

  // 초기 상태에서 아이디 찾기 탭에 클래스명 추가
  findIdLink.parentNode.classList.add("ui-tabs-active", "ui-state-active");
});


// 비밀번호 찾기 링크 클릭 시 이벤트 처리
document
  .getElementById("findPwdLink")
  .addEventListener("click", function (event) {
    event.preventDefault(); // 링크의 기본 동작 방지

    // 비밀번호 찾기 탭 내용을 보여주는 코드
    findPwdTab.style.display = "block";
    // 아이디 찾기 탭 내용 숨기기
    findIdTab.style.display = "none";

    // 클래스명 추가
    document
      .querySelector(".tab_item.ui-tabs-active.ui-state-active")
      .classList.remove("ui-tabs-active", "ui-state-active");
    this.parentNode.classList.add("ui-tabs-active", "ui-state-active");
  });

window.addEventListener("load", function () {
  findIdTab.style.display = "block";
  findPwdTab.style.display = "none";

  // 초기 상태에서 아이디 찾기 탭에 클래스명 추가
  document
    .querySelector(".tab_item.ui-tabs-active.ui-state-active")
    .classList.add("ui-tabs-active", "ui-state-active");
});

// 요소들을 가져옵니다
var nameInput = document.getElementById("phoneFormFindId01");
var dobInput = document.getElementById("phoneFormFindId02");
var phoneInput = document.getElementById("phoneFormFindId01");
var confirmButton = document.querySelector(".btn_lg.btn_light_gray");

// 확인 버튼 클릭 이벤트 처리
confirmButton.addEventListener("click", function (event) {
  event.preventDefault(); // 버튼의 기본 동작 방지

  phoneSearchGetId();

  // 입력 값 가져오기
  var name = nameInput.value;
  var dob = dobInput.value;
  var phone = phoneInput.value;
  
  function phoneSearchGetId() {
    $.ajax({
      type: "POST",
      url: "phone_search_getId.go",
      data: { memberName: name, memberBirth: dob, memberPhone: phone },
      success: function (response) {
      },
      error: function (jqXHR, textStatus, errorThrown) {
        // 서버 응답 실패 시 처리할 내용
      },
    });
  }
});