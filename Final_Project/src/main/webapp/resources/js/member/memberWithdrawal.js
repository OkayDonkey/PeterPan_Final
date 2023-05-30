var agreeWithdrawalCheckbox = document.getElementById("agreeWithdrawal");
var agreeExpireCheckbox = document.getElementById("agreeExpire");
var withdrawalBtn = document.getElementById("withdrawalBtn");
var radioButtons = document.querySelectorAll(
  'input[type="radio"][name="mmbrWdrlRsnCode"]'
);
var isRadioButtonSelected = false; // 전역 변수로 선언

// 라디오 버튼 상태 변경 시 이벤트 처리
for (var i = 0; i < radioButtons.length; i++) {
  radioButtons[i].addEventListener("change", checkRadioButtons);
}

function checkRadioButtons() {
  // 라디오 버튼 중 하나라도 선택되었는지 확인
  isRadioButtonSelected = false; // 초기화
  for (var i = 0; i < radioButtons.length; i++) {
    if (radioButtons[i].checked) {
      isRadioButtonSelected = true;
      break;
    }
  }

  // 라디오 버튼이 선택되었으면 회원탈퇴 버튼 활성화, 그렇지 않으면 비활성화
  withdrawalBtn.disabled = !isRadioButtonSelected;
}

// 체크박스 상태 변경 시 이벤트 처리
agreeWithdrawalCheckbox.addEventListener("change", checkAllCheckboxes);
agreeExpireCheckbox.addEventListener("change", checkAllCheckboxes);

function checkAllCheckboxes() {
  // 두 개의 체크박스가 모두 선택되어 있는지 확인
  if (agreeWithdrawalCheckbox.checked && agreeExpireCheckbox.checked) {
    withdrawalBtn.disabled = false; // 회원탈퇴 버튼 활성화
  } else {
    withdrawalBtn.disabled = true; // 회원탈퇴 버튼 비활성화
  }
}

// 회원탈퇴 버튼 클릭 시 동작 처리
withdrawalBtn.addEventListener("click", function () {
  // 체크박스가 모두 선택되어 있는지 확인 후 동작 처리 로직 추가
  if (agreeWithdrawalCheckbox.checked && agreeExpireCheckbox.checked) {
    // 탈퇴 로직을 수행하는 함수 호출 또는 기타 동작 처리
    performWithdrawal();
  } else if(!isRadioButtonSelected) {
    checkRadioButtons();
  } else {
    alert("필수 체크 사항을 모두 체크해주셔야 탈퇴 가능합니다.");
  }

});

// 회원탈퇴 로직을 수행하는 함수
function performWithdrawal() {
  console.log("탈퇴");

  location.href = "member_delete.go";
}