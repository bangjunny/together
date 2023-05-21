<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Gowun+Dodum&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick-theme.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<style>
	html, body {
 		transition: scroll-behavior 0.5s ease-in-out;
		font-family: 'Gowun Dodum', sans-serif;
		overflow-x: hidden;
	}
	a:link,a:visited,a:hover {
		text-decoration: none;
	}

	#main_container{
		width: 100%;
		height: 100%;
	}
	#main_start {
  		display: flex;
 		justify-content: center;
 		align-items: center;
 		width: 100%;
 		height: 100vh;
 		overflow-x: hidden;
	}	
	#main_start img {
  		width: 100%;
  		height: 100%;
  		object-fit:cover;
  		animation: zoomIn 1s ease-in-out; /* referring directly to the animation's @keyframe declaration */
  		animation-delay: 0.75s; /* adding a 2-second delay before the animation starts */
	}

	@keyframes zoomIn {
  		0% {
    		transform: scale(0);
  		}
  		100% {
    		transform: scale(1);
  		}
	}
	
  
   	#main_side_btn{
   		width: 70px;
   		height: 300px;
   		display: flex;
   		flex-direction: column;
   		align-items: center;
   		justify-content: space-around;
   		position: fixed;
   		top: 300px;
   		z-index:1;
   	  	transform: translateX(-100px);
  		opacity: 0;
  		transition: transform 1s, opacity 0.5s;
	}
	#main_side_btn button{
		width: 15px;
		height: 15px;
		border-radius: 15px;
		border: 1px gray solid;
		background-color: rgb(252, 252, 240);
	}
	#main_side_btn button:hover{
		transition: all 0.5s;
		background-color: orange;
		box-shadow: 0 3px 5px gray;
	}	

	#main_side_btn.show {
  		transform: translateX(0);
  		opacity: 1;
  		
	}
	#main_header{
		width: 1140px;
		height: 500px;
		margin: 0 auto;
		display: flex;
		justify-content: space-around;
  
   	}
 	#main_header_left{
    	width: 45%;
    	height: 600px;
    	text-align: left;
    }
	#main_head_logo{
		
		margin-left: 40px;
		width: 150px;
		height: 75px;
	}
	
	#main_header_txt{
		width: 80%;
		height: 400px;
		font-size: 25px;
		margin-left: 100px;	
	}
	
	#main_header_pic{
		width: 45%;
		height: 350px;
		text-align: center;
		
	}
	#main_header_pic img{
		width: 100%;
		height: 100%;
		border-radius: 10px;
	}
	#rotate_photo{
		width: 700px;
		height: 500px;
	}
	#main_btn_wrap{
		width: 400px;
		
	}
	#main_list_go_txt{
		width:100%;
		height: 400px;
		text-align:center;
	}
	#main_list_go_txt img{
		width:90%;
		height: 400px;
		object-fit:cover;
	}
	#main_list_go{
		width: 1000px;
		height: 300px;
		display: flex;
		justify-content: center;
		justify-content: space-between;
		margin: 0 auto;
	}
	.list_a {
	  display: flex;
 	  flex-direction: column;
	  justify-content: center;
      align-items: center;
      width: 200px;
      height: 200px;
      text-align: center;
      
	}
	.list_a img {
 		 width: 200px;
 		 height: 200px;
 		 object-fit: cover;
  		 transition: transform 0.3s;
	}

	.list_a img:hover {
		cursor: pointer;
  		transform: scale(1.2); /* 이미지 크기 확대 */
  		
	}
	
	.list_a span{
		text-decoration: none;
		color: black;
		width: 150px;
		height: 30px;
		background-color:rgb(252, 252, 240);
		transition: 0.3s;
		position: absolute;
		top:200px;
	}
	.list_a div {
  		margin-top: 10px;
  		text-align: center;
	}

	.mainphoto{
		width: 200px;
		height: 200px;
		margin-right: 50px;
		margin-bottom: 50px;
	}
	#main_list_txt{
		margin: 0 auto;
		width: 800px;
		display: flex;
		justify-content: space-around;
		font-size: 20px;
		
	}
	.main_mid_pic{
		width: 100%;
		height: 800px;
	} 
	.main_mid_pic img{
		width: 100%;
		height: 800px;
		object-fit: cover;
	}
	.slide-item {
 		position: relative;
	}

	.slide-text {
  		position: absolute;
  		top: 50%;
  		left: 50%;
  		transform: translate(-50%, -50%);
  		text-align: center;
  		color: #fff;
	}
	#main_bot_title{
		margin: 70px 0px 30px 0px;
		text-align: center;
	}
	#main_bot{
		width: 1140px;
		height: 600px;
		margin: 0 auto;
		display: flex;
		justify-content: space-between;
	}
	#main_bot_txt {
 		width: 45%;
	}

	#main_bot_txt span {
  		position: relative;
  		top:50px;
  		
	}
	.main_bot_pic{
		width: 48%;
		height: 300px;
		
	}
	.main_bot_pic img{
		width: 100%;
		height: 100%;
		border-radius:10px;
	}
	
	.main_bot_imgs{
		width: 1200px;
		height: 300px;
		margin: 0 auto;

	}
	.main_bot_imgs img{
		width: 200px;
		height: 200px;	
		margin-right: 25px;
	}

</style>
<script>
    AOS.init();
</script>
<script type="text/javascript">
	//Define initial variables.
	var words = ["음악", "운동", "소셜", "예술", "게임", "여행"];
	var photos = ["/photo/main1.jpg", "/photo/main2.jpg", "/photo/main3.jpg", "/photo/main4.jpg", "/photo/main5.jpg", "/photo/main_6.jpg"]
	/* var words = ["communities", "skills", "networks", "passions", "careers", "friendships"]; */
	/* var photos = ["/photo/main_1.jpg", "/photo/main_2.jpg", "/photo/main_3.jpg", "/photo/main_7.jpg", "/photo/main_5.jpg", "/photo/main_6.jpg"] */
	var count = 0;

	// Call the changeWord function once to start the rotation immediately
	changeMain();

	// Call the changeMain function every 3 seconds
	setInterval(changeMain, 3000); 

	function changeMain() {
  	// Define the current word to be displayed
  	var current_word = words[count];
  	var current_photo = photos[count];

    // Fade out the old image
    $("#rotate_photo").fadeOut("2s", function() {
      // Change the word and photo in the HTML
      $("#rotate_photo").attr("src", current_photo);

      // Fade in the new image
      $("#rotate_photo").fadeIn("2s");
    });
	
    // Fade out the old image
    $("#rotate_word").fadeOut("2s", function() {
      // Change the word and photo in the HTML

      $("#rotate_word").html(current_word);

      // Fade in the new image
      $("#rotate_word").fadeIn("2s");
    });



  	// Get the index of the next word in the array
  	count++;

  // If we've reached the end of the word list, go back to the start
  if (count == words.length) {
    count = 0;
  }
}

</script>
<script type="text/javascript">
$(document).ready(function() {
	$("#bot_btn1").click(function() {
		$("#slide_btn1").trigger("click");
		
	});
	$("#bot_btn2").click(function() {
		$("#slide_btn2").trigger("click");
		
	});
	$("#bot_btn3").click(function() {
		$("#slide_btn3").trigger("click");
		
	});
	$("#bot_btn4").click(function() {
		$("#slide_btn4").trigger("click");
		
	});
});

</script>
</head>
<body>
<div id="main_container">
	<div id="main_start">
		<img src="../photo/main_back.gif">
	</div>
	
	<script type="text/javascript">
	$("#main_start img").click(function() {
		  var height = $("#main_start").height();

		  // 애니메이션 클래스 추가 및 애니메이션 효과 보여주기
		  $("#main_start").addClass("animate__animated animate__backOutDown");

		  // 일정 시간 후에 스크롤 이동
		  setTimeout(function() {
		    $("html, body").animate({ scrollTop: height - 100 }, 50);
		    
		    // 이미지 숨기기
		    $("#main_start img").css("display", "none");
		  }, 550); 
		});
	
	</script>

	<div id="main_side_btn">
  		<button onclick="scrollToPosition(880)"></button>
  		<button onclick="scrollToPosition(1940)"></button>
  		<button onclick="scrollToPosition(2900)"></button>
	</div>
	

	<div id="main_header">
		<div id="main_header_left" data-aos="fade-right" data-aos-duration="2000">
			<div id="main_head_logo">
				<img src="../photo/logo.png">
			</div>
			
			

			<div id="main_header_txt">
				<!-- Lorem ipsum dolor sit amet, consectetur adipisicing elited do eiusmod tempor incididunt ut labore e, st dolore magna aliqua. Ut enim ad <span id="rotate_word" style="color: red">communities</span> -->
				저희가 제공하는 다양한 모임 카테고리를 이용해, 다양한 분야의 다양한 사람들을 만나보세요! 예를 들어, <span id="rotate_word" style="color: red">음악</span>. 
				
				<p style="font-size: 18px;">새로운 모임을 개설하고, 같은 취미를 공유하는 친구들을 만들어 보세요. 모두 다 함께!</p>
		
			<div id="main_btn_wrap">
				<c:choose>
					<c:when test="${sessionScope.unum ne null }">
						<button type="button" class="btn btn-dark layout_a" onclick="location.href='/user/mypage?unum=${sessionScope.unum}'">마이페이지</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-dark" onclick="location.href='/user/login'">시작하기</button>
					</c:otherwise>
				</c:choose>
			</div>	
		</div>
	</div>
	
	<div id="main_header_pic" data-aos="zoom-in" data-aos-duration="2000">
		<img src="../photo/main1.jpg" id="rotate_photo">
	</div>
	
</div>
			
	<div id="main_list_go">
			<div class="list_a" data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="1000" onclick="location.href='/moim/moimlist'">
				<img src="../photo/moim.png">
				<div style="display: flex; justify-content: space-between;">
					<span></span><div>모임 게시판</div>
				</div>
			</div>
			<div class="list_a" data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="1000" onclick="location.href='/city/list'">
				<img src="../photo/local.png">
				<div style="display: flex; justify-content: space-between;">
					<span></span><div>지역 게시판</div>
				</div>
			</div>
			<div class="list_a" data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="1000" onclick="location.href='/mapcontact'">
				<img src="../photo/map.png">
				<div style="display: flex; justify-content: space-between;">
					<span></span><div>지도로 위치 검색</div>
				</div>
			</div>	
	</div>
	<div id="main_list_go_txt">
				<img src="../photo/main_list_go_txt.gif">
	</div>
	
	<div class="main_mid_pic">
  		<div class="slide-item">
   			<img src="../photo/mid_pic1.jpg">
    	<div class="slide-text">
      		<h2>Slide 1</h2>
      		<p>Text for Slide 1</p>
    	</div>
   </div>
  	<div class="slide-item">
    	<img src="../photo/mid_pic2.jpg">
    	<div class="slide-text">
      		<h2>Slide 2</h2>
      		<p>Text for Slide 2</p>
    	</div>
  	</div>
  	<div class="slide-item">
    	<img src="../photo/mid_pic3.jpg">
    <div class="slide-text">
      	<h2>Slide 3</h2>
      	<p>Text for Slide 3</p>
    </div>
  </div>
</div>
	
<div id="main_bot_title">
	<h2>다 함께!</h2>
</div>

<div id="main_bot">
	<div class="main_bot_pic"  data-aos="fade-up-right" data-aos-duration="1500">
      	<img src="../photo/bot_1.jpg" style="width: 500px; height: 500px;">		
    	<img src="../photo/bot_2.jpg" style="width: 500px; height: 500px;">
		<img src="../photo/bot_3.jpg" style="width: 500px; height: 500px;">
		<img src="../photo/bot_4.jpg" style="width: 500px; height: 500px;">		
	</div>
	
	<div id="main_bot_txt" data-aos="fade-up-left" data-aos-duration="1500">
		<span>
			동호회 모임을 통해 새로운 친구를 사귈 수 있고, 전문 지식을 공유하며 즐거운 경험을 나눌 수 있습니다. 우리 사이트에서는 다양한 사람들과 소통하고 자신의 취미를 더욱 풍부하게 만들어 보세요.

지금 바로 저희 사이트를 방문하여 원하는 동호회 모임을 찾아보세요. 새로운 사람들과 함께 즐거운 시간을 보내고 동료들과의 유익한 교류를 경험해보세요!
		</span>
	</div>
	
</div>
<div class="main_bot_imgs" data-aos="fade-up" data-aos-duration="2000">
		<img src="../photo/bot_1.jpg" id="bot_btn1" >
		<img src="../photo/bot_2.jpg" id="bot_btn2" >
		<img src="../photo/bot_3.jpg" id="bot_btn3" >
		<img src="../photo/bot_4.jpg" id="bot_btn4" >
</div>

</div>
<script type="text/javascript">

	  $(window).scroll(function() {
	  var scrollHeight = $(window).scrollTop() + $(window).height();
	  var targetHeight = 1500;

	  if (scrollHeight >= targetHeight) {
	    $("#main_side_btn").addClass("show");
	  } else {
	    $("#main_side_btn").removeClass("show");
	  }
	});
	  	
	  function scrollToPosition(position) {
		  $("html, body").animate({
		    scrollTop: position
		  }, 250);
		}
		
	  $('.main_mid_pic').slick({
		  autoplay: true,
		  autoplaySpeed: 2500
		  
	  });	

	  $('.main_bot_pic').slick({
		  slidesToShow: 1,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 3000,
		  arrows: true,
		  fade: true,
	    asNavFor: '.main_bot_imgs'
	  });
	  $('.main_bot_imgs').slick({
	    slidesToShow: 3,
	    slidesToScroll: 1,
	    asNavFor: '.main_bot_pic',
	    centerMode: true,
	    focusOnSelect: true
	  });
	  
	  
	  $(".list_a").mouseover(function() {
		  $(this).css({
		    "transition":"0.3s"
		  });
		  $(this).find("span").css({
			  "width":"0px"
		  });
		});

		$(".list_a").mouseleave(function() {
		  $(this).css({
		    "transition": "0.3s"
		  });
		  $(this).find("span").css({
		    "width": "150px",
		    "height": "30px",
		    "background-color":"rgb(252, 252, 240)",
		    "transition": "0.3s", // 
		    "position": "absolute", // 추가: 요소를 절대 위치로 설정
		    "top":"200px"
		    	/* rgb(245, 245, 220) */
		  });
		});
	
</script>
</body>
</html>
