// 표 클릭 시 클래스 추가 해 주는 함수
const menuItems = document.querySelectorAll(".tab_item a");

function handleClick(event) {
    // 이전에 선택된 요소의 클래스를 제거합니다.
    const previousSelectedItem = document.querySelector(".tab_item a.clicked");
    if (previousSelectedItem) {
    previousSelectedItem.classList.remove("clicked");
    }
    
    // 현재 선택된 요소에 클래스를 추가합니다.
    this.classList.add("clicked");
}

// 각 메뉴 아이템에 클릭 이벤트를 등록합니다.
for (let i = 0; i < menuItems.length; i++) {
    menuItems[i].addEventListener("click", handleClick);
}

// 아코디언 리스트 가져오는 함수
$(document).ready(function() {

var accordionElement = $("#accordion");

// a 태그 클릭 이벤트 처리
$("a").on("click", function() {
// 클릭된 요소의 내용 가져오기
var clickedText = $(this).text();

// 아코디언 내용 초기화
accordionElement.empty();

// Ajax 요청
getbest10(clickedText);
});
});

function getbest10(category) {
    $.ajax({
    type: "GET",
    url: "getCategoryList.go",
    dataType: "json",
    data: { category: category },
    success: function(response) {
        const accordionElement = $("#accordion");

        response.forEach(function(dto) {
        const card = $("<div>").addClass("card");
        const cardHeader = $("<div>").addClass("card-header").attr("id", "heading" + dto.boardNO);
        const cardTitle = $("<h5>").addClass("mb-0");
        const collapseButton = $("<button>").addClass("btn btn-link").attr("data-toggle", "collapse")
            .attr("data-target", "#collapse" + dto.boardNO).attr("aria-expanded", "true")
            .attr("aria-controls", "collapse" + dto.boardNO).text("Q");
        const cardBody = $("<div>").addClass("collapse").attr("id", "collapse" + dto.boardNO)
            .attr("aria-labelledby", "heading" + dto.id).attr("data-parent", "#accordion");
        const cardContent = $("<div>").addClass("card-body");
        const titleSpan = $("<span>").addClass("title").text(dto.boardTitle);
        const contentSpan = $("<span>").addClass("cont").text(dto.boardContent);

        cardTitle.append(collapseButton).append(titleSpan);
        cardContent.append(contentSpan);
        cardHeader.append(cardTitle);
        cardBody.append(cardContent);
        card.append(cardHeader).append(cardBody);
        accordionElement.append(card);
        });
    },
    error: function(jqXHR, textStatus, errorThrown) {
        // 에러 처리
    }
    });
}