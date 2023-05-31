<%@ page session="true" pageEncoding="UTF-8" %>

<style>
html {
  scroll-behavior: smooth;
}
</style>



	<div class="floatingWrap">
		<div class="floating-img-wrap" onclick="sideBar()">
			<span class="floating-number-wrap" id="number-Display1">0</span>
		</div>
		<div class="pageUp-wrap">
			<span class="upIco"></span>
			<span><a href="#HOME" style="color: #878787;">TOP</a></span>
		</div>
	</div>
	
	<div class="sideBarBlackWrap"  id="sideBarBlackWrap" hidden>
		<div class="sideBarWrap mr-5">
			<div class="row m-0 justify-content-between" style="width: 100%">
				<div class="h5">최근 본 도서</div>
				<div class="ico_dialog_close float-right" onclick="popupToggle()"></div>
			</div>
			<div class="row m-0 justify-content-between" style="width: 100%; font-size: 18px; ">
				<div class="greenText"><b id="number-Display">0</b><span style="color:black">건</span></div>
				<div class="float-right" style="color:black; cursor: pointer;" onclick="localStorage.clear(), displayReset()">전체삭제</div>
			</div>
			  <div id="bookListContainer">
			  <!-- 책 리스트를 표시할 공간 -->
			  	최근 본 도서가 없습니다.
			  </div> 
		</div>
	</div>
	
	
  <script>
  
	    var recentlyViewedProducts = JSON.parse(localStorage.getItem('recentlyViewedProducts'));
  
	    var numCount = recentlyViewedProducts.length;
	  	
  		// 이미지 요소 선택
  		var selectBookImg = document.querySelector(".floating-img-wrap");
  		
  		// src 속성 변경
  		selectBookImg.style.backgroundImage = "url('" + recentlyViewedProducts[0].img + "')";
  		
		document.getElementById("number-Display").innerText = numCount;
		document.getElementById("number-Display1").innerText = numCount;
  
  		// TOP버튼 스무스이동
        window.addEventListener("scroll", function() {
            var pageUpButton = document.querySelector(".pageUp-wrap");
            var imgBox = document.querySelector(".floating-img-wrap");
            var scrollPosition = window.scrollY || document.documentElement.scrollTop;

            if (scrollPosition > 300) {
                pageUpButton.classList.add("show");
                imgBox.style.marginTop = "0px";
            } else {
                pageUpButton.classList.remove("show");
                imgBox.style.marginTop = "60px";
            }
        });
		
		  // 상품 클릭 시 최근 본 상품 정보를 localStorage에 저장
   function RecentlyViewedBook(name, img, writer, price) {
	    console.log("최근 본 책: " + name + ", 커버 경로: " + img + ", 글쓴이: " + writer + ", 가격: " + price);
	
	    var product = {
	        name: name,
	        price: price,
	        img: img,
	        writer: writer
	    };
	
	    
	
	    if (!recentlyViewedProducts) {
	        recentlyViewedProducts = [];
	    }
	
	    // 중복된 항목 제거
	    recentlyViewedProducts = recentlyViewedProducts.filter(function(item) {
	        return item.name !== name || item.img !== img || item.writer !== writer || item.price !== price;
	    });
	
	    recentlyViewedProducts.unshift(product); // 배열 앞에 추가
	    if (recentlyViewedProducts.length > 10) {
	        recentlyViewedProducts.pop(); // 배열 뒤에서 제거
	    }
	
	    localStorage.setItem('recentlyViewedProducts', JSON.stringify(recentlyViewedProducts));
	
	    var items = localStorage.getItem('recentlyViewedProducts');
	
	    console.log(items);
	    
	}
  		
   function displayReset() {
		    var bookListContainer = document.getElementById("bookListContainer");
		    bookListContainer.innerHTML = ""; // 이전에 표시된 목록을 초기화
   }  
		  
   function displayRecentlyViewedBooks(recentlyViewedProducts) {
	    var bookListContainer = document.getElementById("bookListContainer");
	    bookListContainer.innerHTML = ""; // 이전에 표시된 목록을 초기화
	    bookListContainer.style.overflow = "auto";
	    
	    recentlyViewedProducts.forEach(function(product) {
	        var bookItem = document.createElement("div");
	        bookItem.classList.add("bookItem");
	        bookItem.style.marginBottom = "30px";
	        bookItem.style.marginTop = "20px";
	        bookItem.style.width = "380px";
	        bookItem.style.fontWeight = "600";
	        bookItem.style.display = "flex";
	        bookItem.style.flexDirection = "row";
	        bookItem.style.alignItems = "center";
	        

	        var bookImg = document.createElement("img");
	        bookImg.src = product.img;
	        bookImg.style.width = "80px"; // 이미지 너비 설정
	        bookImg.style.height = "120px"; // 이미지 높이 설정
	        bookItem.appendChild(bookImg);

	        var bookInfoContainer = document.createElement("div");
	        bookInfoContainer.style.display = "flex";
	        bookInfoContainer.style.flexDirection = "column";
	        bookInfoContainer.style.marginLeft = "30px";

	        var bookName = document.createElement("div");
	        bookName.textContent = product.name;
	        bookName.style.fontSize = "18px"; // 글씨 크기 조절
	        bookName.style.marginBottom = "16px"; // 글씨 크기 조절
	        bookInfoContainer.appendChild(bookName);

	        var bookWriter = document.createElement("div");
	        bookWriter.textContent = product.writer;
	        bookWriter.style.fontSize = "14px"; // 글씨 크기 조절
	        bookWriter.style.marginBottom  = "7px"; // 글씨 크기 조절
	        bookInfoContainer.appendChild(bookWriter);

	        var bookPrice = document.createElement("div");
	        bookPrice.textContent = product.price+" 원";
	        bookPrice.style.fontSize = "14px"; // 글씨 크기 조절
	        bookInfoContainer.appendChild(bookPrice);

	        bookItem.appendChild(bookInfoContainer);

	        // 기타 스타일이나 이벤트 처리를 추가할 수 있습니다.

	        bookListContainer.appendChild(bookItem);
	    });
	}


  		
		
  		function popupToggle() {
  		    var popup = document.getElementById("sideBarBlackWrap");
  		    if (popup.hidden) {
  		        popup.hidden = false;
  		    } else {
  		        popup.hidden = true;
  		    }
  		}

  		function sideBar() {
  		    popupToggle();
  		  displayRecentlyViewedBooks(recentlyViewedProducts); // 최근 본 도서 목록을 표시하는 함수 호출
  		}


    </script>