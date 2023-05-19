$(document).ready(function() {
  $("#termsAllChk").click(function() {
    if($("#termsAllChk").is(":checked")) {
      $("input[class=check1]").prop("checked", true);
      $("input[class=check2]").prop("checked", true);
      $("input[class=check3]").prop("checked", true);
      $("input[class=check4]").prop("checked", true);
    } else {
      $("input[class=check1]").prop("checked", false);
      $("input[class=check2]").prop("checked", false);
      $("input[class=check3]").prop("checked", false);
      $("input[class=check4]").prop("checked", false);
    }
  });
  
  $("input[class=check1], input[class=check2], input[class=check3], input[class=check4]").click(function() {
    var total = $("input[class=check1], input[class=check2], input[class=check3], input[class=check4]").length;
    var checked = $("input[class=check1]:checked, input[class=check2]:checked, input[class=check3]:checked, input[class=check4]:checked").length;
    
    if(total != checked) $("#termsAllChk").prop("checked", false);
    else $("#termsAllChk").prop("checked", true); 
  });
});

// 피터팬 마케팅 수신 동의 체크박스
$(document).ready(function() {
  $("#termsMarketingChk").click(function() {
    if($("#termsMarketingChk").is(":checked")) $("input[class=check2]").prop("checked", true);
    else $("input[class=check2]").prop("checked", false);
  });
  
  $("input[class=check2]").click(function() {
    var checked = $("input[class=check2]:checked").length;
    
    if(checked > 0) $("#termsMarketingChk").prop("checked", true);
    else $("#termsMarketingChk").prop("checked", false); 
  });
});