//const Items = document.querySelectorAll(".tab_item a");
//const snbItems  = document.querySelectorAll(".snb_btn a");

//const categoryInput = document.getElementById("category");
//const categoryValue = categoryInput.value;


//console.log(categoryValue); // 가져온 category 값 출력
let text;

function handleClick(aaa) {
    // 이전에 선택된 요소의 클래스를 제거합니다.
    text = $(aaa).text();
		
   alert("text >>> " + text);
    // const previousSelectedItem = document.querySelector(".tab_item a.clicked");
    // if (previousSelectedItem) {
    //     previousSelectedItem.classList.remove("clicked");
    // }
    
    // // 현재 선택된 요소에 클래스를 추가합니다.
    // if (categoryValue === clickedText) {
    //     this.classList.add("clicked");
    // }

    // console.log("clickedText >>" + clickedText);


}

// 아코디언 리스트 가져오는 함수
$(document).ready(function() {
    
    
    var accordionElement = $("#accordion");

    let items = document.getElementsByClassName("tab_a");
    
    for (let i = 0; i < items.length; i++) {
        if (text === items[i].textContent) {
            console.log(items[i].textContent)
        }
    }
    
    // if(text == ) {
    //     $(".snb_btn").attr("onclick","test();");
    // }

    // a 태그 클릭 이벤트 처리
    $("a").on("click", function() {
        // 클릭된 요소의 내용 가져오기
        var clickedText = $(this).text();
        console.log(clickedText);
        
        // 각 메뉴 아이템에 클릭 이벤트를 등록합니다.
        // for (let i = 0; i < Items.length; i++) {
           
        //         Items[i].addEventListener("click", handleClick(clickedText));
        //         snbItems[i].addEventListener("click", handleClick(clickedText));   
            
                                                                 
        // }

       //  console.log("배열 >>>"+ Items);
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
            var bestTitle = response.category;
            let list = response.list;
            
            list.forEach(function(dto) {

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

                const cardBody = $("<div>").addClass("card-body").text(dto.boardContent);

                cardHeader.append($("<span>").addClass("Q").text("Q"));
                cardHeader.append($("<span>").addClass("acodianCategoryTitle").text(dto.boardTitle));

                collapseOne.append(cardBody);
                card.append(cardHeader).append(collapseOne);
                accordionElement.append(card);

            });
        },
        error: function(jqXHR, textStatus, errorThrown) {
            // 에러 처리
        }
    });
}
