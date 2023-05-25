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

// 아이디 찾기 / 휴대폰번호로 찾기

var phoneconfirmIdButton = document.getElementById("phoneFormFindIdBtn");
// 확인 버튼 클릭 이벤트 처리
phoneconfirmIdButton.addEventListener("click", function (event) {
  event.preventDefault(); // 버튼의 기본 동작 방지

  var nameInput = document.getElementById("phoneFormFindId01");
  var dobInput = document.getElementById("phoneFormFindId02");
  var phoneInput = document.getElementById("phoneFormFindId03");

  // 입력 값 가져오기
  var name = nameInput.value;
  var dob = dobInput.value;
  var phone = phoneInput.value;

  document.getElementById("phoneFormFindId01_valid").style.display = "none";
  document.getElementById("phoneFormFindId02_valid").style.display = "none";
  document.getElementById("phoneFormFindId03_valid").style.display = "none";

  // 빈 칸 검사
  if (name.trim() === "") {
    // 경고 표시
    document.getElementById("phoneFormFindId01_valid").style.color = "red";
    document.getElementById("phoneFormFindId01_valid").style.display = "inline";
    document.getElementById("phoneFormFindId01_valid").innerHTML =
      "* 이름을 입력하세요.";
    return;
  } else if (dob.trim() === "") {
    // 경고 표시 제거
    document.getElementById("phoneFormFindId02_valid").style.color = "red";
    document.getElementById("phoneFormFindId02_valid").style.display = "inline";
    document.getElementById("phoneFormFindId02_valid").innerHTML =
      "* 생년월일을 입력하세요.";
  } else if (phone.trim() === "") {
    document.getElementById("phoneFormFindId03_valid").style.color = "red";
    document.getElementById("phoneFormFindId03_valid").style.display = "inline";
    document.getElementById("phoneFormFindId03_valid").innerHTML =
      "* 번호를 입력하세요.";
  } else {
    phoneSearchGetId();
  }

  function phoneSearchGetId() {
    $.ajax({
      type: "GET",
      url: "phone_search_getId.go",
      data: { memberName: name, memberBirth: dob, memberPhone: phone },
      success: function (response) {
        if (response == 1) {
          location.href = "already_join.go";
        } else {
          alert("해당 정보로 가입된 내역이 없습니다.");
          return;
        }
      },
      error: function (jqXHR, textStatus, errorThrown) {
        // 서버 응답 실패 시 처리할 내용
      },
    });
  }
});


// 아이디 찾기 / 이메일로 찾기

var emailconfirmIdButton = document.getElementById("emailFormFindIdBtn");

// 확인 버튼 클릭 이벤트 처리
emailconfirmIdButton.addEventListener("click", function (event) {
  event.preventDefault(); // 버튼의 기본 동작 방지

  var nameInput = document.getElementById("emailFormFindId01");
  var dobInput = document.getElementById("emailFormFindId02");
  var emailInput = document.getElementById("emailFormFindId03");

  var name = nameInput.value;
  var dob = dobInput.value;
  var email = emailInput.value;

  document.getElementById("emailFormFindId01_valid").style.display = "none";
  document.getElementById("emailFormFindId02_valid").style.display = "none";
  document.getElementById("emailFormFindId03_valid").style.display = "none";

  if (name.trim() === "") {
    document.getElementById("emailFormFindId01_valid").style.color = "red";
    document.getElementById("emailFormFindId01_valid").style.display = "inline";
    document.getElementById("emailFormFindId01_valid").innerHTML =
      "* 이름을 입력하세요.";
    return;
  } else if (dob.trim() === "") {
    document.getElementById("emailFormFindId02_valid").style.color = "red";
    document.getElementById("emailFormFindId02_valid").style.display = "inline";
    document.getElementById("emailFormFindId02_valid").innerHTML =
      "* 생년월일을 입력하세요.";
  } else if (email.trim() === "") {
    document.getElementById("emailFormFindId03_valid").style.color = "red";
    document.getElementById("emailFormFindId03_valid").style.display = "inline";
    document.getElementById("emailFormFindId03_valid").innerHTML =
      "* 이메일을 입력하세요.";
  } else {
    emailSearchGetId();
  }

  function emailSearchGetId() {
    $.ajax({
      type: "GET",
      url: "email_search_getId.go",
      data: { memberName: name, memberBirth: dob, memberEmail: email },
      success: function (response) {
        if (response == 1) {
          location.href = "already_join.go";
        } else {
          alert("해당 정보로 가입된 내역이 없습니다.");
          return;
        }
      },
      error: function (jqXHR, textStatus, errorThrown) {
        // 서버 응답 실패 시 처리할 내용
      },
    });
  }
});

// 비밀번호 찾기 / 휴대폰번호로 찾기

var phoneconfirmPwdButton = document.getElementById("phoneFormFindPwd_btn");
// 확인 버튼 클릭 이벤트 처리
phoneconfirmPwdButton.addEventListener("click", function (event) {
  event.preventDefault(); // 버튼의 기본 동작 방지

  var idInput = document.getElementById("phoneFormFindPwd01");
  var nameInput = document.getElementById("phoneFormFindPwd02");
  var dobInput = document.getElementById("phoneFormFindPwd03");
  var phoneInput = document.getElementById("phoneFormFindPwd04");

  // 입력 값 가져오기
  var id = idInput.value;
  var name = nameInput.value;
  var dob = dobInput.value;
  var phone = phoneInput.value;

  document.getElementById("phoneFormFindPwd01_valid").style.display = "none";
  document.getElementById("phoneFormFindPwd02_valid").style.display = "none";
  document.getElementById("phoneFormFindPwd03_valid").style.display = "none";
  document.getElementById("phoneFormFindPwd04_valid").style.display = "none";

  // 빈 칸 검사
  if (name.trim() === "") {
    document.getElementById("phoneFormFindPwd01_valid").style.color = "red";
    document.getElementById("phoneFormFindPwd01_valid").style.display = "inline";
    document.getElementById("phoneFormFindPwd01_valid").innerHTML = "* 아이디를 입력하세요.";
    return;
  } else if (dob.trim() === "") {
    document.getElementById("phoneFormFindPwd02_valid").style.color = "red";
    document.getElementById("phoneFormFindPwd02_valid").style.display = "inline";
    document.getElementById("phoneFormFindPwd02_valid").innerHTML =
      "* 이름을 입력하세요.";
  } else if (phone.trim() === "") {
    document.getElementById("phoneFormFindPwd03_valid").style.color = "red";
    document.getElementById("phoneFormFindPwd03_valid").style.display = "inline";
    document.getElementById("phoneFormFindPwd03_valid").innerHTML =
      "* 생년월일을 입력하세요.";
  } else if (phone.trim() === "") {
    document.getElementById("phoneFormFindPwd04_valid").style.color = "red";
    document.getElementById("phoneFormFindPwd04_valid").style.display = "inline";
    document.getElementById("phoneFormFindPwd04_valid").innerHTML = "* 번호를 입력하세요.";
  } else {
    phoneSearchGetPwd();
  }

  function phoneSearchGetPwd() {
    $.ajax({
      type: "GET",
      url: "phone_search_getPwd.go",
      data: { memberId: id, memberName: name, memberBirth: dob, memberPhone: phone },
      success: function (response) {
        if (response == 1) {
          location.href = "pwd_reset.go";
        } else {
          alert("해당 정보로 가입된 내역이 없습니다.");
          return;
        }
      },
      error: function (jqXHR, textStatus, errorThrown) {
        // 서버 응답 실패 시 처리할 내용
      },
    });
  }
});

// 비밀번호 찾기 / 이메일로 찾기

var emailconfirmPwdButton = document.getElementById("emailFormFindPwd_btn");
// 확인 버튼 클릭 이벤트 처리
emailconfirmPwdButton.addEventListener("click", function (event) {
  event.preventDefault(); // 버튼의 기본 동작 방지

  var idInput = document.getElementById("emailFormFindPwd01");
  var nameInput = document.getElementById("emailFormFindPwd02");
  var dobInput = document.getElementById("emailFormFindPwd03");
  var emailInput = document.getElementById("emailFormFindPwd04");

  // 입력 값 가져오기
  var id = idInput.value;
  var name = nameInput.value;
  var dob = dobInput.value;
  var email = emailInput.value;

  document.getElementById("emailFormFindPwd01_valid").style.display = "none";
  document.getElementById("emailFormFindPwd02_valid").style.display = "none";
  document.getElementById("emailFormFindPwd03_valid").style.display = "none";
  document.getElementById("emailFormFindPwd04_valid").style.display = "none";

  // 빈 칸 검사
  if (name.trim() === "") {
    document.getElementById("emailFormFindPwd01_valid").style.color = "red";
    document.getElementById("emailFormFindPwd01_valid").style.display =
      "inline";
    document.getElementById("emailFormFindPwd01_valid").innerHTML =
      "* 아이디를 입력하세요.";
    return;
  } else if (dob.trim() === "") {
    document.getElementById("emailFormFindPwd02_valid").style.color = "red";
    document.getElementById("emailFormFindPwd02_valid").style.display =
      "inline";
    document.getElementById("emailFormFindPwd02_valid").innerHTML =
      "* 이름을 입력하세요.";
  } else if (email.trim() === "") {
    document.getElementById("emailFormFindPwd03_valid").style.color = "red";
    document.getElementById("emailFormFindPwd03_valid").style.display =
      "inline";
    document.getElementById("emailFormFindPwd03_valid").innerHTML =
      "* 생년월일을 입력하세요.";
  } else if (email.trim() === "") {
    document.getElementById("emailFormFindPwd04_valid").style.color = "red";
    document.getElementById("emailFormFindPwd04_valid").style.display =
      "inline";
    document.getElementById("emailFormFindPwd04_valid").innerHTML =
      "* 번호를 입력하세요.";
  } else {
    emailSearchGetPwd();
  }

  function emailSearchGetPwd() {
    $.ajax({
      type: "GET",
      url: "email_search_getPwd.go",
      data: {
        memberId: id,
        memberName: name,
        memberBirth: dob,
        memberEmail: email,
      },
      success: function (response) {
        if (response == 1) {
          location.href = "pwd_reset.go";
        } else {
          alert("해당 정보로 가입된 내역이 없습니다.");
          return;
        }
      },
      error: function (jqXHR, textStatus, errorThrown) {
        // 서버 응답 실패 시 처리할 내용
      },
    });
  }
});