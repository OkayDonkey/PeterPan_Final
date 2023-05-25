function check() {
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
}

function checkInput(input, n) {
  if (n == "pwd") {
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
  }
}

// 비밀번호 유효성 검사/ 안전도 구현
$("#formJoin02").on("keyup", function() {
  checkPassword($("#formJoin02").val());
});

function checkPassword(password) {
  const listep1 = document.querySelector("#validStep1");
  const listep2 = document.querySelector("#validStep2");
  const listep3 = document.querySelector("#validStep3");

  const liElem1 = document.querySelector("#pw_valid1");
  const liElem2 = document.querySelector("#pw_valid2");

  let countValid1 = 0;
  let countValid2 = 0;

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

  let totalvalid = countValid1 + countValid2;

  if (totalvalid == 0) {
    resetLi();
  }
  if (totalvalid == 1) {
    resetLi();
    listep1.style.backgroundColor = "orange";
    listep2.style.backgroundColor = "orange";
  }
  if (totalvalid == 2) {
    resetLi();
    listep1.style.backgroundColor = "green";
    listep2.style.backgroundColor = "green";
    listep3.style.backgroundColor = "green";
  }
  return isValid;
}