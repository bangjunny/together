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
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
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
		font-family: 'NanumPenScript';
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
 		width: 300px;
  		height: 300px;
  		animation: zoomIn; /* referring directly to the animation's @keyframe declaration */
  		animation-duration: 3s; /* don't forget to set a duration! */
	}
  	#main_header{
		width: 1440px;
		height: 600px;
		margin: 0 auto;
		display: flex;
		justify-content: space-around;
  
   	}
   	#main_side_btn{
   		width: 100px;
   		height: 300px;
   		border: 1px black solid;
   		position: fixed;
   		top: 300px;
   		z-index:1;
   	  	opacity: 0;
  		transition: opacity 0.5s;
	}

	#main_side_btn.show {
  		opacity: 1;
  		transition: opacity 3s;
  		
	}
 	#main_header_left{
    	width: 45%;
    	height: 600px;
    	text-align: left;
    }
	#main_head_logo{
		margin-top: 25px;
		margin-left: 100px;
	}
	#main_head_logo img{
		width: 75px;
		height: 75px;
	}	
	
	#main_header_txt{
		width: 80%;
		height: 400px;
		font-size: 25px;
		margin-left: 100px;	
	}
	
	#main_header_pic{
		width: 50%;
		height: 550px;
		text-align: center;
	}
	#main_header_pic img{
		width: 100%;
		height: 100%;
	}
	#rotate_photo{
		width: 700px;
		height: 500px;
		
	}
	#main_btn_wrap{
		margin-top: 50px;
		width: 400px;
		display: flex;
		justify-content: flex-end;
		
	}
	#main_list_go{
		width: 1000px;
		height: 300px;
		display: flex;
		justify-content: center;
		justify-content: space-between;
		margin: 0 auto 100px auto;
	}
	.list_a {
	  display: flex;
 	  flex-direction: column;
	  justify-content: center;
      align-items: center;
      width: 300px;
      height: 300px;
      text-align: center;
      height: 250px;
	}

	.list_a:hover {
  	cursor: pointer;
	}

	.list_a img {
  		width: 200px;
  		height: 200px;
	}
	
	.list_a span{
		text-decoration: none;
		color: black;
		width: 150px;
		height: 30px;
		background-color:rgb(252, 252, 240);
		transition: 0.8s;
		position: absolute;
		top:220px;
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
		height: 900px;
	} 
	.main_mid_pic img{
		width: 100%;
		height: 900px;
		object-fit: cover;
	}
	#main_mid_txt{
		position: relative; 
		bottom: 300px; 
		color: white;		
	}
	#main_bot_title{
		margin: 20px 0px 50px 0px;
		text-align: center;
	}
	#main_bot{
		width: 65%;
		height: 600px;
		margin: 0 auto;
		display: flex;
		justify-content: space-between;
	}
	#main_bot_txt {
 		width: 45%;
  		position: relative; /* add this line to make sure the position of the <span> is relative to this container */
	}

	#main_bot_txt span {
  		position: absolute;
  		top: 80px; /* adjust this value as needed to move the <span> down */
	}
	.main_bot_pic{
		width: 45%;
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

	var words = ["communities", "skills", "networks", "passions", "careers", "friendships"];
	var photos = ["/photo/main_1.jpg", "/photo/main_2.jpg", "/photo/main_3.jpg", "/photo/main_7.jpg", "/photo/main_5.jpg", "/photo/main_6.jpg"]
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
		<img src="../photo/logo.png">
	</div>
	
	<script type="text/javascript">
	$("#main_start img").click(function() {
		  var height = $("#main_start").height();
		  $("html, body").animate({ scrollTop: height-100}, 500);
		});
	
	</script>

	<div id="main_side_btn">
  		<button onclick="scrollToPosition(880)">1</button>
  		<button onclick="scrollToPosition(1940)">2</button>
  		<button onclick="scrollToPosition(2930)">3</button>
	</div>
	

	<div id="main_header">
		<div id="main_header_left" data-aos="fade-right" data-aos-duration="2000">
			<div id="main_head_logo">
				<img src="../photo/logo.png"><b style="font-size: 25px;">다 함께!</b>
			</div>
			
			

			<div id="main_header_txt">
				Lorem ipsum dolor sit amet, consectetur adipisicing elited do eiusmod tempor incididunt ut labore e, st dolore magna aliqua. Ut enim ad <span id="rotate_word" style="color: red">communities</span>
	
		
			<div id="main_btn_wrap">
				<c:choose>
					<c:when test="${sessionScope.unum ne null }">
						<button type="button" class="btn btn-light layout_a" onclick="location.href='/user/mypage?unum=${sessionScope.unum}'">마이페이지</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-light" onclick="location.href='/user/login'">시작하기</button>
					</c:otherwise>
				</c:choose>
			</div>	
		</div>
	</div>
	
	<div id="main_header_pic" data-aos="zoom-in" data-aos-duration="2000">
		<img src="../photo/main_1.jpg" id="rotate_photo">
	</div>
	
</div>
	<div id="main_list_go">
			<div class="list_a" data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="1000" onclick="location.href='/moim/moimlist'">
				<img src="../photo/moim.png">
				<span></span><div>모임 게시판</div>
			</div>
			<div class="list_a" data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="1000" onclick="location.href='/city/list'">
				<img src="../photo/local.png">
				<span></span><div>지역 게시판</div>
			</div>
			<div class="list_a" data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="1000" onclick="location.href='/mapcontact'">
				<img src="../photo/map.png">
				<span></span><div>지도로 위치 검색</div>
			</div>	
	</div>
	
	<div class="main_mid_pic">
		<img src="../photo/mid_pic1.jpg">
		<img src="../photo/mid_pic2.jpg">
		<img src="../photo/mid_pic3.jpg">
	</div>
	
	<div id="main_mid_txt">
		<h1>대충 괜찮은 문장</h1>
		<h3>적당히 설명하는 문장의 행렬은 나에게 스타크래프트 1.16.1 립버전 철수는 말했다 공열안와자였다 몹시 무시무시한 죠나단 스타크래프트 1.16.1 립버전</h3>
	</div>
	
<div id="main_bot_title">
	<h2>Lorem ipsum</h2>
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
			Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
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
		    "transition":"0.5s"
		  });
		  $(this).find("span").css({
			  "width":"0px"
		  });
		});

		$(".list_a").mouseleave(function() {
		  $(this).css({
		    "transition": "0.5s"
		  });
		  $(this).find("span").css({
		    "width": "150px",
		    "height": "30px",
		    "background-color":"rgb(252, 252, 240)",
		    "transition": "0.8s", // 
		    "position": "absolute", // 추가: 요소를 절대 위치로 설정
		    "top":"220px"
		    	/* rgb(245, 245, 220) */
		  });
		});
	
</script>
</body>
</html>
