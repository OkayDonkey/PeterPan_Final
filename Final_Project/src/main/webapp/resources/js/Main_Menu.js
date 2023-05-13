$(function(){
	
	$.ajaxSetup({
	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    type: "post"
	});
	
	function getData(){
		
		let main_idx = $(".main_idx").val() // hidden 태그의 값을 가져옴
		
		$.ajax({
			url : "menu_select.do",
			type: "POST",
    		data: {
        		main_idx : main_idx
    			},
			dataType : "xml",
			success : function(data){
				
				$("#listTable tr:gt(0)").remove();
				
				let table = $("#listTable").val();
				
				$(data).find("main_menu").each(function(){
				    table += "<tr>";
					/*table += "<td>"+$(this).find("rst_no").text()+"</td>";*/
					table += "<td width='30px'>"+$(this).find("menu_idx").text()+"</td>";
					table += "<td width='100px'>"+"<input type='text' class='menu_text' id='menu_name_"+$(this).find("menu_idx").text()+"' class='menu_name_txt' value='"+$(this).find("menu_name").text().replace(/&/g, '&amp;')+"'></td>";
					table += "<td width='60px'>"+"<input type='text' class='price_text' id='menu_price_"+$(this).find("menu_idx").text()+"' class='menu_name_txt' value="+$(this).find("menu_price").text()+"></td>";
					table += "<td width='150px'>";
					table += "<label for='menu_img_"+$(this).find("menu_idx").text()+"'>";
					table += "<img src='"+$(this).find("menu_img").text()+"' id='menu_img_preview_"+$(this).find("menu_idx").text()+"'></label>";
					table += "<input type='file' name='menu_img' id='menu_img_"+$(this).find("menu_idx").text()+"' style='display: none;' onchange='setMenupic(event, "+$(this).find("menu_idx").text()+");'>";
					table += "</td>";
					table += "<td width='70px'><input type='button' class='btn btn-secondary btn-sm' value='삭 제' id='del' num='"+$(this).find("menu_idx").text()+"'></td>";
					table += "<td width='70px'><input type='button' class='btn btn-secondary btn-sm' value='수 정' id='mod' num='"+$(this).find("menu_idx").text()+"'></td>";
					table += "<input type='hidden' value='"+$(this).find("rst_no").text()+"'>";
					table += "</tr>"; 
				});
				$("#listTable tr:eq(0)").after(table);
			},
			error : function(request,status,error){
				alert("error code : "+request.status + "message : " + request.responseText + "error : " + error)
			}
		});
		
	}// getData() 함수 end
	
	//DB에 저장하기
	$("#menubtn").on("click", function(){
		var form = $('#inForm')[0];
		let formData = new FormData(form);
		
  		formData.append('main_idx', $("#main_idx").val());
  		formData.append('menu_name', $("#menu_name").val());
  		formData.append('menu_price', $("#menu_price").val());
  		formData.append('menu_img', $('#menu_img').files);
  		
		
		$.ajax({
			url : "menu_insert.do",
		  	type : "POST",
		  	data : formData,
		  	datatype : "josn",
		  	contentType: false,
   			processData: false,
		  	success : function(data){
				  /*let a = data;
				 	alert(a)*/
				  if(data > 0){
					  alert("메뉴 추가 완료");
					  getData();
					  $("input[type=text]").each(function(){
						  $(this).val("");
					  });
				  }else{
					  alert("메뉴 추가 실패")
				  }
			  },
			  error:function(){
				  alert("데이터 통신 오류")
			  }
		})
	});

	$("table").on("click","#del",function(){
		  
		  var num = $(this).attr("num");
		$.ajax({
			url :"menu_delete.do",
			data: { num: num, rst_no: $(this).closest("tr").find("input[type='hidden']").val() },
			datatype : "text",
			success : function(data){
				if(data > 0){
					alert("메뉴가 삭제 완료.");
					
					getData();
				}else{
					alert("메뉴 삭제 실패");
				}
			},
			error:function(){
				alert("데이터 통신 오류 입니다.");
			}	
		});
	});
	
	$("table").on("click","#mod",function(){
		let num = $(this).attr("num");
		
		let form = $('#upForm')[0];
		let formData = new FormData(form);
		
  		formData.append('no',num);
  		formData.append('name', $('#menu_name_'+num).val());
  		formData.append('price', $('#menu_price_'+num).val());
  		formData.append('file', $('#menu_img_'+num)[0].files[0]);
		
		$.ajax({
			url : "menu_modifyOk.do",
			data : formData,
			datatype :"json",
			contentType: false,
   			processData: false,
			success : function(data){
				if(data > 0){
					alert("메뉴 수정 완료.");
					
					getData();
				}else{
					alert("메뉴 수정 실패.")
				}
			},
			error: function(){
				alert("데이터 통신 오류 입니다.")
			}
			
		});
		
	});
	
		getData();
	});


  
function setMenupic(event, idx) {
  var file = event.target.files[0];
  var reader = new FileReader();

  // 이미지 파일 읽기
  reader.readAsDataURL(file);

  // 파일 로드 완료 시
  reader.onload = function(e) {
    // 이미지 객체 만들기
    var image = new Image();
    image.src = e.target.result;

    // 미리보기 이미지 업데이트
    $("#menu_img_preview_"+idx).attr("src", image.src);
  };
}


function previewImage(event) {
		  var reader = new FileReader();
		  reader.onload = function(){
		    var preview = document.getElementById('menu_img_preview');
		    preview.src = reader.result;
		  };
		  reader.readAsDataURL(event.target.files[0]);
		}
