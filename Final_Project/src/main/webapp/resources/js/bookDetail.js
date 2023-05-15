function changeImageSrc() {
  var imgElement = document.getElementById("pointIco");
  var currentSrc = imgElement.getAttribute("src");
  var popupElement = document.getElementById("popupBook");
  
  if (currentSrc === "resources/img/pointIco.png") {
    imgElement.setAttribute("src", "resources/img/pointIco_active.png");
     popupElement.removeAttribute("hidden");
    
  } else {
    imgElement.setAttribute("src", "resources/img/pointIco.png");
    popupElement.setAttribute("hidden", "");
  }
}

