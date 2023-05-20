// 통신사 버튼 누르면 border 디자인 바뀌도록
document.addEventListener("DOMContentLoaded", function () {
  var labels = document.querySelectorAll(".agency_select__items label");

  labels.forEach(function (label) {
    label.addEventListener("click", function () {
      // 현재 선택된 요소인지 확인
      var isSelected = this.style.border === "4px solid #FF3A4A";

      // 모든 라벨들의 스타일 초기화
      labels.forEach(function (prevLabel) {
        prevLabel.style.border = "1px solid #e1e1e1";
      });

      // 현재 선택된 요소의 스타일 적용
      if (!isSelected) {
        this.style.border = "4px solid #FF3A4A";
      }
    });
  });
});


// 체크박스 라벨 체크 되도록
document.addEventListener("DOMContentLoaded", function () {
  var labels = document.querySelectorAll(".checkbox label");
  var agreeAllCheckbox = document.getElementById("agree_all");

  agreeAllCheckbox.addEventListener("change", function () {
    var isChecked = agreeAllCheckbox.checked;

    labels.forEach(function (label) {
      if (isChecked) {
        label.classList.add("checked");
      } else {
        label.classList.remove("checked");
      }
    });
  });

  labels.forEach(function (label) {
    label.addEventListener("click", function () {
      if (label === agreeAllCheckbox.labels[0]) {
        return;
      }

      if (label.classList.contains("checked")) {
        label.classList.remove("checked");
      } else {
        label.classList.add("checked");
      }

      var allChecked = true;
      labels.forEach(function (label) {
        if (
          label !== agreeAllCheckbox.labels[0] &&
          !label.classList.contains("checked")
        ) {
          allChecked = false;
        }
      });

      agreeAllCheckbox.checked = allChecked;
    });
  });
});


// 통신사, 체크박스 체크 안되면 form submit 안되도록 검사
document.addEventListener("DOMContentLoaded", function () {
  var labels = document.querySelectorAll(".agency_select__items label");
  var isValidTelecom = false;
  var isValidAgreement = false;
  var selectedLabel = null;

  labels.forEach(function (label) {
    label.addEventListener("click", function () {
      if (selectedLabel) {
        selectedLabel.classList.remove("selected");
      }
      this.classList.add("selected");
      selectedLabel = this;

      isValidTelecom = selectedLabel !== null;
    });
  });

  document
    .getElementById("myForm")
    .addEventListener("submit", function (event) {
      event.preventDefault();

      var agreementLabels = document.querySelectorAll(
        ".agreelist.required label"
      );
      isValidAgreement = Array.from(agreementLabels).every(function (label) {
        return label.classList.contains("checked");
      });

      // 유효성 검사 실행
      if (isValidTelecom && isValidAgreement) {
        window.location.href = "phoneCheck_form.go";
      } else {
        if (!isValidTelecom) {
          alert("통신사를 선택해주세요.");
        } else if (!isValidAgreement) {
          alert("동의 사항에 모두 동의해주세요.");
        }
      }
    });
});





