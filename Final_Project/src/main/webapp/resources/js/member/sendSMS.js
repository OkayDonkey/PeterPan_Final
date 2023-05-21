// 클릭하면 넣은 번호로 인증번호 보내기
function sendPhone() {
  var memberName = document.getElementById("memberName").value;
  var memberPhone = document.getElementById("memberPhone").value;

  // 이름과 휴대폰 번호가 비어있는지 확인
  if (memberName === "") {
    alert("이름을 입력해주세요.");
    return;
  } else if (memberPhone === "") {
    alert("휴대폰 번호를 입력해주세요.");
    return;
  }

  // 휴대폰 번호의 길이 확인
  if (memberPhone.length !== 11) {
    alert("휴대폰 번호는 11자리여야 합니다.");
    return;
  }

  // 이름에 특수문자 또는 숫자가 포함되어 있는지 확인
  var nameRegex = /[!@#$%^&*(),.?":{}|<>0-9]/;
  if (nameRegex.test(memberName)) {
    alert("이름에 특수문자 또는 숫자를 포함할 수 없습니다.");
    return;
  }

  // 휴대폰 번호가 "010"으로 시작하는지 확인
  if (!memberPhone.startsWith("010")) {
    alert("휴대폰 번호는 '010'으로 시작해야 합니다.");
    return;
  }

  $.ajax({
    type: "POST",
    url: "send.go",
    data: { memberPhone: memberPhone },
    success: function (response) {
      if (response == 1) {
        alert("인증번호가 발송되었습니다.");
      } else {
        alert("인증번호 발송이 실패하였습니다.");
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      alert("인증번호 발송이 실패하였습니다.");
    },
  });
}

function check() {
  var okNo = document.getElementById("OkNo").value;

  // 인증번호 칸이 비어있는지 확인
  if (okNo === "") {
    alert("인증번호를 입력해주세요.");
    return false;
  }

  // 인증번호가 6자리가 되지 않는지 확인
  if (okNo.length !== 6) {
    alert("인증번호는 6자리입니다.");
    return false;
  }

  // 인증번호가 숫자로만 구성되어 있는지 확인
  if (!/^[0-9]+$/.test(okNo)) {
    alert("인증번호는 숫자로만 입력해주세요.");
    return false;
  }

  return true;
}


// 클릭하면 넣은 번호로 인증번호 보내기
function SNSsendPhone() {
  var memberName = document.getElementById("formJoin04").value;
  var memberPhone = document.getElementById("formJoin05").value;

  // 이름과 휴대폰 번호가 비어있는지 확인
  if (memberName === "") {
    f.memberName.focus();
    return;
  } else if (memberPhone === "") {
    alert("휴대폰 번호를 입력해주세요.");
    return;
  }

  // 휴대폰 번호의 길이 확인
  if (memberPhone.length !== 11) {
    alert("휴대폰 번호는 11자리여야 합니다.");
    return;
  }

  // 이름에 특수문자 또는 숫자가 포함되어 있는지 확인
  var nameRegex = /[!@#$%^&*(),.?":{}|<>0-9]/;
  if (nameRegex.test(memberName)) {
    alert("이름에 특수문자 또는 숫자를 포함할 수 없습니다.");
    return;
  }

  // 휴대폰 번호가 "010"으로 시작하는지 확인
  if (!memberPhone.startsWith("010")) {
    alert("휴대폰 번호는 '010'으로 시작해야 합니다.");
    return;
  }

  $.ajax({
    type: "POST",
    url: "send.go",
    data: { memberPhone: memberPhone },
    success: function (response) {
      if (response == 1) {
        alert("인증번호가 발송되었습니다.");
        insertVerificationCodeInput();
      } else {
        alert("인증번호 발송이 실패하였습니다.");
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      alert("인증번호 발송이 실패하였습니다.");
    },
  });
}

function insertVerificationCodeInput() {
  var div = document.createElement("div");
  div.classList.add("form_cont");

  var innerHTML = `
    <div class="input_btn_box">
      <input type="text" name="OkNo" class="form_ip" id="OkNo" placeholder="인증번호를 입력해주세요." maxlength="6">
      <button type="button" class="btn_ip btn_light_gray" onclick="snsphonecheck()">
        <span>확인</span>
      </button>
    </div>
    <span id="OkNocheck" class="validcheck" style="display: none;"></span>
  `;

  div.innerHTML = innerHTML;

  var existingDiv = document.querySelector(".snsphonecheck");
  existingDiv.parentNode.insertBefore(div, existingDiv.nextSibling);
}

function snsphonecheck() {
  var okNo = document.getElementById("OkNo").value;

  // 인증번호 칸이 비어있는지 확인
  if (okNo === "") {
    alert("인증번호를 입력해주세요.");
    return;
  }

  // 인증번호가 6자리가 되지 않는지 확인
  if (okNo.length !== 6) {
    alert("인증번호는 6자리입니다.");
    return;
  }

  // 인증번호가 숫자로만 구성되어 있는지 확인
  if (!/^[0-9]+$/.test(okNo)) {
    alert("인증번호는 숫자로만 입력해주세요.");
    return;
  }

  $.ajax({
    type: "POST",
    url: "snsJoin_phone_check.go",
    data: { okNo: okNo },
    success: function (response) {
      if (response == 1) {
        document.getElementById("OkNocheck").style.color = "green";
        document.getElementById("OkNocheck").style.display = "inline";
        document.getElementById("OkNocheck").innerHTML = "* 인증이 완료되었습니다.";

      } else {
        document.getElementById("OkNocheck").style.color = "red";
        document.getElementById("OkNocheck").style.display = "inline";
        document.getElementById("OkNocheck").innerHTML = "* 인증번호가 맞지 않습니다.";
        
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      alert("인증번호 체크에 실패했습니다.");

    },
  });
}
