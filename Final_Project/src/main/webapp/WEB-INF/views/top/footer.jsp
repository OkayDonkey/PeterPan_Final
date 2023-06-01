<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 폰트 어썸 cdm -->
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
  <!--  폰트 어썸 cdm end  -->

<style>

.footer {
 clear: both;
  background-color: #f8f8f8;
  text-align: center;
  bottom: 0;
  left: 0;
  width: 100%;
}

/* Horizontal line */
.footer hr {
  border: none;
  border-top: 1px solid #ccc;
  margin: 20px auto;
  width: 50%;
}

/* Location information */
.footer_box > div:not(.footer_Rbox) span {
  display: block;
  font-size: 14px;
  margin-bottom: 5px;
}

/* Right-aligned content */
.footer_Rbox {
  text-align: left;
    margin-top: 100px;
    margin-left: 550px;
}

.fa-instagram{
   background: linear-gradient(45deg, #FFDE83, #FFB241, #FF732C, #FF5834, #FF3138, #F91966, #D72188, #8828C8, #473DE9, #2A4EFB);
   background-clip: text;
   -webkit-background-clip: text;
   -webkit-text-fill-color: transparent;
}


.link_box img {
  max-width: 30px;
  top: 30px;
}

.footer_Rbox_span{
  	font-size: 13px;
	color: #666;
}
.fontA{
	font-size: 50px;
    margin-bottom: 30px;
}
.footer_wrap {
   display: flex;
   flex-direction: row;
}

.footer_box1 {
   margin-top: 18px;
   width: 300px;
}
.footer_box2 {
font-size:20px;
font-weight:bold;
    margin-left: 50px;
    margin-top: 100px;
}
.footer_box2 >.team{
text-align:left;
font-size: 15px;
color: gray;
}
.footer_box2 a{
color:gray;
border-inline-end: 2px solid gray;
text-decoration: none;

}


.footer_box2 span:last-of-type a[href^="tel:"] {
  border-inline-end: none;
}

.footer_box3{
	position: relative;
	margin-top:200px;
	margin-left:250px;
	
}

 
</style>

   <footer class="footer">
      <div class="footer_wrap">
      
         <div class="footer_box1">
        	<a href="#">
	 			<img src="resources/css/s_img/logo.png">
			</a>
         </div>

         <div class="footer_box2">
         
            <span>
       	    	<a href="terms.go" target="_blank">약관</a>
            </span>
            <span>
	            <a href="protect.go"target="_blank">정보방식 </a>  
            </span>
            <span>
	            <a href="kid.go"target="_blank">청년보호 정책 </a>   
            </span>
            <span>
	            <a href='tel:010-0000-0000'>전화번호 </a>   
            </span>
            
            <br>
         
            <div class="team">
	            <span>
	            	조장: 윤보감
	            </span>
	            <br>
	            <span>
	            	조원: 김동현 이상우 전지영
	            </span>
            </div>
         </div>

         
         <div class="footer_box3">
            <span>제작 : 2조</span>
            <address>E-Mail : kh학원@gmail.com</address>
         </div>
         
         <div class="footer_Rbox">
			<div class="fontA">
	         	<a href="https://www.instagram.com/kyobobook_online/">
		         	<i class="fa fa-instagram" aria-hidden="true" style=""></i>
	         	</a>
	         	<a href="https://www.youtube.com/c/kbooknews?reload=9">
	         		<i class="fa fa-youtube-play" aria-hidden="true" style="color:red;"></i>
	         	</a>
	         	<a href="https://www.facebook.com/kyobobookonline?orderClick=rwk">
	         		<i class="fa fa-facebook-square" aria-hidden="true" style="color:312ffe;"></i>
	         	</a>
			</div>

	        
	         <span class="footer_Rbox_span">
		        [인증범위]KH학원
	         </span>
	         <BR>
	         <span class="footer_Rbox_span">
				[유효기간] 2023.01.13 ~ 2023.06.15
	         </span>
         
         </div>
      </div>
   </footer>



</body>
</html>

