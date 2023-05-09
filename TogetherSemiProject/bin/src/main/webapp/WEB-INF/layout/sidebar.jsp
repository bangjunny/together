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
<style>
  #list_btn {
    font-size: 30px;
    position: relative;
    left: 10px;
    color: white;
  }
  
  #sidebar_wrap {
    width: 50px;
    height: 50px;
    background-color: gray;
    border-radius: 100px;
    position: fixed;
    left: 1700px;
    top: 100px;
  }
  #sidebar_wrap ul {
    list-style: none;
    visibility: hidden;
    position: relative;
    right: 25px;
    top: 15px;
  }
  #sidebar_wrap ul li{
  	margin-top: 5px;
  }
  #sidebar_wrap ul li .sidebar_imgs {
    width: 35px;
    height: 35px;
  }
  #sidebar_wrap:hover {
    cursor: pointer;
  }

</style>

<script type="text/javascript">
$(document).on("mouseover", "#list_btn, #sidebar_wrap", function() {
    if ($("#sidebar_wrap").height() === 50) {
        $("#sidebar_wrap").css({
            "height": "300px",
            "transition": "height 0.5s ease"
        });
        $("#sidebar_wrap ul li img").each(function(i) {
            $(this).delay(i * 100).css({
                "visibility": "visible",
                "display": "none"
            }).fadeIn(500);
        });
    }
});

$(document).on("mouseout", "#sidebar_wrap", function(event) {
    // Check if the mouse pointer has left the sidebar_wrap element
    if (!$(event.relatedTarget).closest("#sidebar_wrap").length) {
        $("#sidebar_wrap ul li").find("img").css({
            "visibility": "hidden",
            "display": "none"
        });
        $("#sidebar_wrap").css({
            "height": "50px",
            "transition": "height 0.5s ease"
        });
    }
});
</script>
</head>
<body>
<div id="sidebar_wrap">
	<i id="list_btn" class="bi bi-list"></i>
	<ul>
		<li>
			<a href="/">
			<img class="sidebar_imgs" src="../photo/black.png">
			</a>
		</li>
		<li>
			<a href="/user/login">
			<img class="sidebar_imgs" src="../photo/login.png">
			</a>
		</li>
		<li>
			<a href="/moim/moimlist">
			<img class="sidebar_imgs" src="../photo/moim.png">
			</a>
		</li>
		<li>
			<a href="/city/list"> 
			<img class="sidebar_imgs" src="../photo/local.png">
			</a>
		</li>
		<li>
			<a href="/mapcontact">
			<img class="sidebar_imgs" src="../photo/map.png">
			</a>
		</li>
	</ul>
</div>


	
</body>
</html>
