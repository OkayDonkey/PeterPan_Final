$(function () {
	
  $('.reservation-btn').on('click', function(e) {
	  
		
		
		
    console.log("예약기능 Ajax호출");
    e.preventDefault(); // 기본 이벤트 방지

    let main_idx = $(this).parents('.modal-dialog').find("#detail_idx").val();
    let date = $("#resvation_date"+main_idx).val();
    let time = $("#resvation_time"+main_idx+" option:selected").val();
    let people_num = $("#people-num"+main_idx).val();
    let req_text = $("#request-text"+main_idx).val();
    let store_name = $(this).parents('.modal-content').find("#store_name").val();
    
	let res_modal = $("#reservation_result");
	let fail_modal = $("#reservation_fail");


    console.log(main_idx);
    console.log(store_name);

    $.ajax({
      type: "POST",
      url: "reservation_insert.do",
      dataType : "json",
      data: {
		store_name : store_name,
        date: date,
        time: time,
        people_num: people_num,
        req_text: req_text,
        main_idx: main_idx,
      },
      success: function (data) {
        if (data.result == 1) {
			fail_modal.modal("hide");
			$("#store-name").text(store_name);
			$("#mem-cnt").text(people_num);
			$("#date").text(date);
			$("#req").text(req_text);
			res_modal.modal("show");
        } else {
			res_modal.modal("hide");
			fail_modal.modal("show");
        }
      },
      error: function (request, status, error) {
        console.log(error); // 오류 발생시 콘솔에 출력
      },
    });
  });
});
