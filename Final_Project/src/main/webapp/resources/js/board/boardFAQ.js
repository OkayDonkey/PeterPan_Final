// category 값 가져오기
var category = document.getElementById("category").value;
var accordionElement = $("#accordion");

if(category === "자주 묻는 질문") {
    category = "BEST 10";
}

function handleClick(element) {
  // 모든 탭 초기화
  var tabs = document.querySelectorAll(".tab_a");
  tabs.forEach(function (tab) {
    if (tab.classList.contains("clicked")) {
      tab.classList.remove("clicked");
    }
  });

  // 클릭한 탭에 clicked 클래스 추가
  element.classList.add("clicked");

  // 클릭한 카테고리 가져오기
  var category = element.innerText;

  // 아코디언 내용 초기화
  accordionElement.empty();

  // Ajax 요청
  getbest10(category);
}

accordionElement.empty();

getbest10(category);

// 초기 실행: category에 해당하는 탭에 clicked 클래스 추가
var tabs = document.querySelectorAll(".tab_a");
tabs.forEach(function (tab) {

  if (tab.classList.contains("clicked")) {
    tab.classList.remove("clicked");
  }

  if (tab.innerText === category) {
    tab.classList.add("clicked");
  }
  
});

// 각 탭에 클릭 이벤트 등록
tabs.forEach(function (tab) {
  tab.addEventListener("click", function () {
    handleClick(this);
  });
});

function getbest10(category) {
  $.ajax({
    type: "GET",
    url: "getCategoryList.go",
    dataType: "json",
    data: { category: category },
    success: function (response) {
      const accordionElement = $("#accordion");
      var bestTitle = response.category;
      let list = response.list;

      list.forEach(function (dto) {
        $(".category_title").text(bestTitle);

        const card = $("<div>").addClass("card");
        const cardHeader = $("<button>")
          .addClass("card-header")
          .attr("id", "heading" + dto.boardNO)
          .attr("data-toggle", "collapse")
          .attr("data-target", "#collapse" + dto.boardNO)
          .attr("aria-expanded", "true")
          .attr("aria-controls", "collapse" + dto.boardNO)
          .css("outline", "none")
          .css("width", "100%");

        const collapseOne = $("<div>")
          .addClass("collapse")
          .attr("id", "collapse" + dto.boardNO)
          .attr("aria-labelledby", "heading" + dto.boardNO)
          .attr("data-parent", "#accordion")
          .css("padding", "0px 10px 30px 10px");

        const cardBody = $("<div>")
          .addClass("card-body")
          .text(dto.boardContent);

        cardHeader.append($("<span>").addClass("Q").text("Q"));
        cardHeader.append(
          $("<span>").addClass("acodianCategoryTitle").text(dto.boardTitle)
        );

        collapseOne.append(cardBody);
        card.append(cardHeader).append(collapseOne);
        accordionElement.append(card);
      });
    },
    error: function (jqXHR, textStatus, errorThrown) {
      // 에러 처리
    },
  });
}