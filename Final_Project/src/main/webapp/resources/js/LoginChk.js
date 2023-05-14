/**
 * 
 */

 
$(function () {
	
    $("#ImLogin").on("click", function () {
        let id = $("#signin-id").val();
        let pwd = $("#signin-password").val();
    
        let success_toast = $("#login_success");
        let fail_toast = $("#login_fail");
        let toast_success_div = $("#toast_success_div");
        
        
        $.ajax({
            url : "login.do",
            data : {
                id : id,
                pwd : pwd
            },
            dataType : "json",
            success : function(data){
                if(data.result == 1){
					fail_toast.toast("hide");
					toast_success_div.text(data.name+" 님 다시 오신걸 환영합니다.");
                    success_toast.toast("show");
                    setTimeout(function() {
    				location.reload();
					}, 2000);
                } else {
                    fail_toast.toast("show");
                }
            },
            error : function(jqXHR, textStatus, errorThrown) {
                alert("서버 오류: " + errorThrown);
            }
        });
    });
});