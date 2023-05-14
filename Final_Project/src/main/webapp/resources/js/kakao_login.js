
$(function () {

  $("#kakaoAjax").on("click", function () {

    Kakao.init('fe3cf4492aa6c561d6c802d57d1418de'); //발급받은 키 중 javascript키를 사용해준다.
    console.log(Kakao.isInitialized()); // sdk초기화여부판단
    
     let success_toast = $("#login_success");
     let kakao_fail_toast = $("#login_fail_kakao");
    let fail_toast = $("#login_fail");
    let toast_success_div = $("#toast_success_div");
    let toast_fail_kakao_div = $("#toast_fail_kakao_div");
    
    //카카오로그인

    //1. 로그인 시도
    Kakao.Auth.login({
      success: function (response) {

        //2. 로그인 성공시, API 호출
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
            console.log(response)   //json형식 >> String 변환 후 벨류값을 변수에 넣어서 이걸 db로 넣어서 회원관리하기.


            var token = response.id;
            var nickname = response.properties.nickname;
            var email = response.kakao_account.email;
            var thumbnail = response.properties.profile_image;

            $.ajax({
              url: "member_KakaoLogin.do",
              data: {
                member_token: token,
                member_name: nickname,
                member_email : email, 
                thumbnail : thumbnail
              },
              dataType: "json",
              success: function (data) {
                if (data.result == 1) {
               console.log(data.name);
                  toast_success_div.text(data.name + " 님 다시 오신걸 환영합니다.")
                  success_toast.toast("show");
                  setTimeout(function () {
                    location.reload();
                  }, 2000);
                } else if(data.result == 0){
               console.log("result:"+data.result);
                  toast_fail_kakao_div.text(data.name + " 님 추가정보를 입력하여 회원가입을 진행해주세요!")
                 kakao_fail_toast.toast("show");
                  setTimeout(function () {
                  
                    $.ajax({
                          url: "member_join_chk.do",
                          method: "POST",
                          data: {
                            member_token: data.member_token,
                            member_name: data.member_name,
                            member_email: data.member_email,
                            member_thumnail: data.member_thumnail,
                            alert: data.alert
                          },
                          success: function() {
                            window.location = "member_kakao_join.jsp";
                          },
                          error: function (jqXHR, textStatus, errorThrown) {
                            alert("서버 오류: " + jqXHR);
                          }
                        });


                  }, 2000);
            }else{
                  fail_toast.toast("show");
                }
              },
              error: function (jqXHR, textStatus, errorThrown) {
                alert("서버 오류: " + jqXHR);
              }
            });


          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  });
});

