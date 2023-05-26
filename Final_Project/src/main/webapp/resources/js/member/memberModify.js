// form 작성 후 필수 조건을 채우지 않으면 넘어가지 않게 하는 check 함수
//f는 form 태그 이름을 작성한 것으로
function check() {
  if (f.memberId.value == "") {
    document.getElementById("idcheck").style.display = "inline";
    document.getElementById("idcheck").innerHTML = "* 아이디를 입력하세요.";
    f.memberId.focus();
    return false;
  }

  var spanElement = document.getElementById("idcheck"); // 스팬 요소 가져오기
  var text = spanElement.innerText; // 스팬 요소의 텍스트 가져오기
  if (text === "* 이미 사용중인 아이디입니다.") {
    document.getElementById("idcheck").style.display = "inline";
    f.memberId.focus();
    return false;
  }

  if (
    !/[a-zA-Z]/.test($("#formJoin01").val()) ||
    /[^a-zA-Z0-9]/.test($("#formJoin01").val()) ||
    /[ㄱ-ㅎㅏ-ㅣ가-힣]/.test($("#formJoin01").val())
  ) {
    document.getElementById("idcheck").style.color = "red";
    document.getElementById("idcheck").style.display = "inline";
    document.getElementById("idcheck").innerHTML =
      "* 아이디 양식이 맞지 않습니다.";
    f.memberId.focus();
    return false;
  }

  if (f.memberPwd.value == "") {
    document.getElementById("pwdcheck").style.display = "inline";
    document.getElementById("pwdcheck").innerHTML = "* 비밀번호를 입력하세요.";
    f.memberPwd.focus();
    return false;
  }

  if (
    !/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(
      f.memberPwd.value
    )
  ) {
    f.memberPwd.focus();
    return false;
  }

  if (/(\w)\1\1/.test(f.memberPwd.value)) {
    f.memberPwd.focus();
    return false;
  }

  if (f.memberPwd.value.search(f.memberId.value) > -1) {
    f.memberPwd.focus();
    return false;
  }

  if (/\s/.test(f.memberPwd.value)) {
    f.memberPwd.focus();
    return false;
  }

  if (f.memberCheckPwd.value == "") {
    document.getElementById("chkpwdcheck").style.display = "inline";
    document.getElementById("chkpwdcheck").innerHTML =
      "* 비밀번호 확인을 입력하세요.";
    f.memberCheckPwd.focus();
    return false;
  }

  if (f.memberPwd.value !== f.memberCheckPwd.value) {
    document.getElementById("chkpwdcheck").style.display = "inline";
    document.getElementById("chkpwdcheck").innerHTML =
      "* 작성하신 비밀번호와 다릅니다.";
    f.memberCheckPwd.focus();
    return false;
  }

  if (f.memberName.value == "") {
    document.getElementById("namecheck").style.display = "inline";
    document.getElementById("namecheck").innerHTML = "* 이름을 입력하세요.";
    f.memberName.focus();
    return false;
  }

  if (/[^a-zA-Z0-9가-힣]/.test($("#formJoin04").val())) {
    document.getElementById("namecheck").style.display = "inline";
    document.getElementById("namecheck").innerHTML =
      "* 올바른 양식으로 입력해주세요.";
    f.memberName.focus();
    return false;
  }

  if (
    !/^(010)\d{8}$/.test(f.memberPhone.value) ||
    isNaN(f.memberPhone.value) ||
    f.memberPhone.value.length !== 11
  ) {
    document.getElementById("phonecheck").style.display = "inline";
    document.getElementById("phonecheck").innerHTML =
      "* 연락처는 010으로 시작하는 11자리의 숫자만 입력이 가능합니다.";
    f.memberPhone.focus();
    return false;
  }

  if (f.memberPhone.value == "") {
    document.getElementById("phonecheck").style.display = "inline";
    document.getElementById("phonecheck").innerHTML = "* 연락처를 입력하세요.";
    f.memberPhone.focus();
    return false;
  }

  if (f.memberEmail.value == "") {
    document.getElementById("emailcheck").style.display = "inline";
    document.getElementById("emailcheck").innerHTML = "* 이메일을 입력하세요.";
    f.memberEmail.focus();
    return false;
  }

  var spanElement = document.getElementById("emailcheck");
  var text = spanElement.innerText;
  if (text === "* 이미 사용중인 이메일입니다.") {
    document.getElementById("emailcheck").style.display = "inline";
    f.memberEmail.focus();
    return false;
  }

  if (
    !/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i.test(
      f.memberEmail.value
    )
  ) {
    document.getElementById("emailcheck").style.display = "inline";
    document.getElementById("emailcheck").innerHTML =
      "* 이메일 양식이 맞지 않습니다.";
    f.memberEmail.focus();
    return false;
  }

  if (f.memberBirth.value == "") {
    document.getElementById("birthcheck").style.display = "inline";
    document.getElementById("birthcheck").innerHTML =
      "* 생년월일을 입력하세요.";
    f.memberBirth.focus();
    return false;
  }

  if (isNaN(f.memberBirth.value) || !/^\d{8}$/.test(f.memberBirth.value)) {
    document.getElementById("birthcheck").style.display = "inline";
    document.getElementById("birthcheck").innerHTML =
      "* 생년월일은 8자리 숫자만 입력이 가능합니다.";
    f.memberBirth.focus();
    return false;
  }

  if (f.memberGender.value == "") {
    document.getElementById("gendercheck").style.display = "inline";
    document.getElementById("gendercheck").innerHTML =
      "* 성별을 선택해 주세요.";
    f.memberBirth.focus();
    return false;
  }

  if (f.addrPost.value == "") {
    document.getElementById("addrcheck").style.display = "inline";
    document.getElementById("addrcheck").innerHTML = "* 주소를 입력하세요.";
    f.addrPost.focus();
    return false;
  }
  if (f.addrMain.value == "") {
    document.getElementById("addrcheck").style.display = "inline";
    t.getElementById("addrcheck").innerHTML = "* 주소를 입력하세요.";
    f.addrMain.focus();
    return false;
  }

  if (f.addrDetail.value == "") {
    document.getElementById("addrcheck").style.display = "inline";
    document.getElementById("addrcheck").innerHTML = "* 주소를 입력하세요.";
    f.addrDetail.focus();
    return false;
  }
  var check1 = document.getElementById("peterpan");
  var check2 = document.getElementById("collectionUsage");
  var check3 = document.getElementById("consignment");

  if (check1.checked && check2.checked && check3.checked) {
    // 모든 필수 체크박스가 선택된 경우, 폼을 제출합니다.
    return true;
  } else {
    // 하나라도 선택되지 않은 체크박스가 있으면, 경고창을 표시하고 폼 제출을 방지합니다.
    alert("체크박스를 모두 체크해주세요.");
    return false;
  }
}

// input 태그 안에 값이 들어오면 입력하라는 span태그의 문구를 숨기는 기능
function checkInput(input, n) {
  if (n == "id") {
    if (input.value !== "") {
      document.getElementById("pwdcheck").style.display = "none";
      document.getElementById("idcheck").innerHTML = "";
    } else if (input.value === "") {
      document.getElementById("idcheck").style.display = "inline";
      document.getElementById("idcheck").innerHTML = "* 아이디를 입력하세요.";
    }
  } else if (n == "pwd") {
    if (input.value !== "") {
      document.getElementById("pwdcheck").style.display = "none";
      document.getElementById("pwdcheck").innerHTML = "";
    } else {
      document.getElementById("pwdcheck").style.display = "inline";
      document.getElementById("pwdcheck").innerHTML =
        "* 비밀번호를 입력하세요.";
    }
  } else if (n == "chkpwd") {
    var pwd = document.getElementById("formJoin02").value;
    var chkPwd = input.value;
    if (chkPwd !== "") {
      if (chkPwd !== pwd) {
        document.getElementById("chkpwdcheck").style.display = "inline";
        document.getElementById("chkpwdcheck").innerHTML =
          "* 작성하신 비밀번호와 다릅니다.";
      } else {
        document.getElementById("chkpwdcheck").style.display = "none";
        document.getElementById("chkpwdcheck").innerHTML = "";
      }
    } else {
      document.getElementById("chkpwdcheck").style.display = "inline";
      document.getElementById("chkpwdcheck").innerHTML =
        "* 비밀번호 확인을 입력하세요.";
    }
  } else if (n == "name") {
    if (input.value !== "") {
      document.getElementById("namecheck").style.display = "none";
      document.getElementById("namecheck").innerHTML = "";
    } else {
      document.getElementById("namecheck").style.display = "inline";
      document.getElementById("namecheck").innerHTML = "* 이름을 입력하세요.";
    }
  } else if (n == "phone") {
    if (input.value !== "") {
      if (
        !/^(010)\d{8}$/.test(f.memberPhone.value) ||
        isNaN(f.memberPhone.value) ||
        f.memberPhone.value.length !== 11
      ) {
        document.getElementById("phonecheck").style.display = "inline";
        document.getElementById("phonecheck").innerHTML =
          "* 연락처는 010으로 시작하는 11자리의 숫자를 입력해주세요.";
      } else {
        document.getElementById("phonecheck").style.display = "none";
        document.getElementById("phonecheck").innerHTML = "";
      }
    } else {
      document.getElementById("phonecheck").style.display = "inline";
      document.getElementById("phonecheck").innerHTML =
        "* 연락처를 입력하세요.";
    }
  } else if (n == "email") {
    if (input.value !== "") {
      if (
        !/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i.test(input.value)
      ) {
        document.getElementById("emailcheck").style.display = "inline";
        document.getElementById("emailcheck").innerHTML =
          "* 이메일 양식이 맞지 않습니다.";
      } else {
        document.getElementById("emailcheck").style.display = "none";
        document.getElementById("emailcheck").innerHTML = "";
      }
    } else {
      document.getElementById("emailcheck").style.display = "inline";
      document.getElementById("emailcheck").innerHTML =
        "* 이메일을 입력하세요.";
    }
  } else if (n == "birth") {
    if (input.value !== "") {
      if (!/^\d{8}$/.test(f.memberBirth.value)) {
        document.getElementById("birthcheck").style.display = "inline";
        document.getElementById("birthcheck").innerHTML =
          "* 생년월일은 8자리 숫자만 입력이 가능합니다.";
      } else {
        document.getElementById("birthcheck").style.display = "none";
        document.getElementById("birthcheck").innerHTML = "";
      }
    } else {
      document.getElementById("birthcheck").style.display = "inline";
      document.getElementById("birthcheck").innerHTML =
        "* 생년월일을 입력하세요.";
    }
  } else if (n == "addr") {
    if (input.value !== "") {
      document.getElementById("addrcheck").style.display = "none";
      document.getElementById("addrcheck").innerHTML = "";
    } else {
      document.getElementById("addrcheck").style.display = "inline";
      document.getElementById("addrcheck").innerHTML = "* 주소를 입력하세요.";
    }
  }
}

// 성별 input 태그 안에 값이 들어오면 입력하라는 span태그의 문구를 숨기는 기능
function checkGender() {
  document.getElementById("gendercheck").innerHTML = "";
  document.getElementById("gendercheck").style.display = "none";
}

// 위 input 칸을 빈 상태로 다음 input 칸을 눌렀을 때 다시 위칸 아이디로 포인트 옮기고 안내문구 나오는 함수
$("#formJoin02").on("keyup", function () {
  if ($("#formJoin01").val() === "") {
    document.getElementById("pwdcheck").style.display = "inline";
    document.getElementById("pwdcheck").innerHTML =
      "* 아이디를 먼저 입력하세요.";
    $("#formJoin02").val("");
  }
});

// 비밀번호 유효성 검사/ 안전도 구현
$("#formJoin02").on("keyup", function () {
  checkPassword($("#formJoin02").val(), $("#formJoin01").val());
});

function checkPassword(password, id) {
  const listep1 = document.querySelector("#validStep1");
  const listep2 = document.querySelector("#validStep2");
  const listep3 = document.querySelector("#validStep3");

  const liElem1 = document.querySelector("#pw_valid1");
  const liElem2 = document.querySelector("#pw_valid2");
  const liElem3 = document.querySelector("#pw_valid3");

  let countValid1 = 0;
  let countValid2 = 0;
  let countValid3 = 0;

  let isValid = true;

  function resetLi() {
    listep1.style.backgroundColor = "#eaeaea";
    listep2.style.backgroundColor = "#eaeaea";
    listep3.style.backgroundColor = "#eaeaea";
  }

  if (password === "") {
    resetLi();
    liElem1.style.color = "";
    liElem2.style.color = "";
    liElem3.style.color = "";
    return false;
  }

  if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)) {
    countValid1 = 0;
    liElem1.style.color = "red";
    isValid = false;
  } else {
    countValid1 = 1;
    liElem1.style.color = "green";
  }

  if (/(\w)\1\1/.test(password) || /\s/.test(password)) {
    countValid2 = 0;
    liElem2.style.color = "red";
    isValid = false;
  } else {
    countValid2 = 1;
    liElem2.style.color = "green";
  }

  if (password.search(id) > -1) {
    countValid3 = 0;
    liElem3.style.color = "red";
    isValid = false;
  } else {
    countValid3 = 1;
    liElem3.style.color = "green";
  }

  let totalvalid = countValid1 + countValid2 + countValid3;

  if (totalvalid == 0) {
    resetLi();
  }
  if (totalvalid == 1) {
    resetLi();
    listep1.style.backgroundColor = "red";
  }
  if (totalvalid == 2) {
    resetLi();
    listep1.style.backgroundColor = "orange";
    listep2.style.backgroundColor = "orange";
  }
  if (totalvalid == 3) {
    resetLi();
    listep1.style.backgroundColor = "green";
    listep2.style.backgroundColor = "green";
    listep3.style.backgroundColor = "green";
  }

  return isValid;
}

// 아이디 중복 검사
let timerId; // 변수를 선언하여 타이머의 ID를 저장합니다.

$("#formJoin01").on("keyup", function () {
  // 입력창에 키 입력이 일어나면 타이머를 재설정합니다.
  clearTimeout(timerId);
  timerId = setTimeout(function () {
    idcheck($("#formJoin01").val());
  }, 150);
});

$("#formJoin01").on("blur", function () {
  // 입력창에서 포커스가 벗어나면 타이머를 취소하고 즉시 idcheck 함수를 호출합니다.
  clearTimeout(timerId);
  idcheck($("#formJoin01").val());
});

function idcheck(id) {
  $.ajax({
    type: "GET",
    url: "join_idcheck.go",
    data: { checkId: id },
    success: function (response) {
      if (parseInt(response) === 1) {
        document.getElementById("idcheck").style.color = "red";
        document.getElementById("idcheck").style.display = "inline";
        document.getElementById("idcheck").innerHTML =
          "* 이미 사용중인 아이디입니다.";
      } else if (parseInt(response) === 0) {
        document.getElementById("idcheck").style.color = "green";
        document.getElementById("idcheck").style.display = "inline";
        document.getElementById("idcheck").innerHTML =
          "* 사용 가능한 아이디입니다.";
      }

      if (!/[a-zA-Z]/.test(id)) {
        document.getElementById("idcheck").style.color = "red";
        document.getElementById("idcheck").style.display = "inline";
        document.getElementById("idcheck").innerHTML = "* 영문을 입력해주세요.";
      }

      if (/[^a-zA-Z0-9]/.test(id) || /[ㄱ-ㅎㅏ-ㅣ가-힣]/.test(id)) {
        document.getElementById("idcheck").style.color = "red";
        document.getElementById("idcheck").style.display = "inline";
        document.getElementById("idcheck").innerHTML =
          "* 특수문자나 한글은 사용할 수 없습니다.";
      }

      if (id == "") {
        document.getElementById("idcheck").style.color = "red";
        document.getElementById("idcheck").style.display = "inline";
        document.getElementById("idcheck").innerHTML = "* 아이디를 입력하세요.";
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      // 서버 응답 실패 시 처리할 내용
    },
  });
}

// 이메일 중복 검사
let timerEmail; // 변수를 선언하여 타이머의 ID를 저장합니다.

$("#formJoin06").on("keyup", function () {
  // 입력창에 키 입력이 일어나면 타이머를 재설정합니다.
  clearTimeout(timerEmail);
  timerEmail = setTimeout(function () {
    emailCheck($("#formJoin06").val());
  }, 150);
});

$("#formJoin06").on("blur", function () {
  // 입력창에서 포커스가 벗어나면 타이머를 취소하고 즉시 idcheck 함수를 호출합니다.
  clearTimeout(timerEmail);
  emailCheck($("#formJoin06").val());
});

function emailCheck(email) {
  $.ajax({
    type: "GET",
    url: "join_emailcheck.go",
    data: { checkEmail: email },
    success: function (response) {
      if (parseInt(response) === 1) {
        document.getElementById("emailcheck").style.color = "red";
        document.getElementById("emailcheck").style.display = "inline";
        document.getElementById("emailcheck").innerHTML =
          "* 이미 사용중인 이메일입니다.";
      }

      if (email == "") {
        document.getElementById("emailcheck").style.color = "red";
        document.getElementById("emailcheck").style.display = "inline";
        document.getElementById("emailcheck").innerHTML =
          "* 이메일을 입력하세요.";
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      // 서버 응답 실패 시 처리할 내용
    },
  });
}

