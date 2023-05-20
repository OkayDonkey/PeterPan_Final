var activePopup = null; // 활성화된 팝업을 저장하는 변수

function togglePopup(popupId, imgId, defaultImgSrc, activeImgSrc) {
  var popupElement = document.getElementById(popupId);
  var imgElement = document.getElementById(imgId);
  var currentSrc = imgElement.getAttribute("src");

  if (currentSrc === defaultImgSrc) {
    // 새로운 팝업을 열기 전에 기존 팝업을 닫기
    if (activePopup !== null && activePopup !== popupElement) {
      activePopup.setAttribute("hidden", "");
    }

    // 선택한 팝업 열기
    popupElement.removeAttribute("hidden");
    activePopup = popupElement;

    // 이미지 소스를 활성화된 이미지로 변경
    imgElement.setAttribute("src", activeImgSrc);
  } else {
    // 선택한 팝업을 닫기
    popupElement.setAttribute("hidden", "");
    activePopup = null;

    // 이미지 소스를 기본 이미지로 변경
    imgElement.setAttribute("src", defaultImgSrc);
  }
}

function resetActivePopup() {
  activePopup = null;
}




