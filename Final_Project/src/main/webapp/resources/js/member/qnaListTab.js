const tabs = document.querySelectorAll(".tab_item");
let activeTab = "all";

const tabContents = document.querySelectorAll(".tab_content");

tabs.forEach((tab) => {
  tab.addEventListener("click", () => {
    tabs.forEach((tab) => {
      tab.classList.remove("ui-state-active");
    });

    tab.classList.add("ui-state-active");

    activeTab = tab.querySelector(".tab_link").id;

    // 모든 탭 콘텐츠 숨기기
    tabContents.forEach((content) => {
      content.style.display = "none";
    });

    // 클릭된 탭에 해당하는 콘텐츠 보여주기
    if (activeTab === "all") {
      document.getElementById("total").style.display = "block";
      document.getElementById("progress").style.display = "none";
      document.getElementById("answercomplete").style.display = "none";
    } else if (activeTab === "noanswer") {
      document.getElementById("total").style.display = "none";
      document.getElementById("progress").style.display = "block";
      document.getElementById("answercomplete").style.display = "none";
    } else if (activeTab === "answerok") {
      document.getElementById("total").style.display = "none";
      document.getElementById("progress").style.display = "none";
      document.getElementById("answercomplete").style.display = "block";
    }
  });
});
