<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
/* .footer {
	margin: 0 auto;
	align-content: center;
	text-align: center;
	width: 100%;

}
.footer_log{
	
}

.footer_nav{align-content: center;
 }
 
 footer_box{
 } */
 
 /* Footer container */
.footer {
  background-color: #f8f8f8;
  padding: 20px;
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

/* Logo */
.footer_log img {
  max-width: 100px;
}

/* Navigation links */
.footer_nav ul {
  list-style-type: none;
  padding: 0;
}

.footer_nav li {
  display: inline-block;
  margin-right: 10px;
}

.footer_nav a {
  text-decoration: none;
  color: #333;
}

/* Location information */
.footer_box > div:not(.footer_Rbox) span {
  display: block;
  font-size: 14px;
  margin-bottom: 5px;
}

/* Right-aligned content */
.footer_Rbox {
  text-align: right;
}

.link_box img {
  max-width: 30px;
  top: 30px;
  position: absolute;
}

.footer_Rbox_span div span {
  display: block;
  font-size: 12px;
  color: #666;
}
 
</style>


	<footer class="footer" style="width: ">
		
		<div class="footer_box">
			<div class="footer_log">
 				<a href="#">
 					<img src="resources/css/s_img/logo.png">
				</a>
			</div>
	
			<div class="footer_nav">
				<ul>
					<li><a href="#">약관</a></li>
					<li><a href="#">정보방식</a></li>
					<li><a href="#">청년보호 정책</a></li>
					<li><a href="#">전화번호</a></li>
				</ul>
			</div>
			<div>
				<span>소재지 : 서울시 중구</span>
			</div>
			<div class="footer_Rbox">
				<div class="link_box">
					<a href="#"><img src="#"></a>
				</div>
				<div class="footer_Rbox_span">
					<div>
						<span>[인증범위] 온라인 교보문고 서비스 운영</span>
					</div>
					<div>
						<span>[유효기간] 2020.11.04 ~ 2023.11.03</span>
					</div>
				</div>
			</div>
		</div>

	</footer>
</body>
</html>