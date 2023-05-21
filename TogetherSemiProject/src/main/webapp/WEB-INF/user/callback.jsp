<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
</style>
</head>
<body>

   <script type="text/javascript">
      var naver_id_login = new naver_id_login("eeKSBaviQtr4I8frMTNN", "http://localhost:9000/user/callback");
      
      // 접근 토큰 값 출력
      //alert(naver_id_login.oauthParams.access_token);
      
      // 네이버 사용자 프로필 조회
      naver_id_login.get_naver_userprofile("naverSignInCallback()");
      
      // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
      function naverSignInCallback() {
         
         const email = naver_id_login.getProfileData('email');
         const name = naver_id_login.getProfileData('name');
         const gender = naver_id_login.getProfileData('gender');
         const birthday = naver_id_login.getProfileData('birthday');
         // var birthyear = naver_id_login.getProfileData('birthyear');
         // var mobile = naver_id_login.getProfileData('mobile');
         
         //alert(email);
         //alert(name);
         //alert(gender);
         //alert(birthday);
         //alert(birthyear);
         //alert(mobile);
         
         console.log(email);
         console.log(name);
         console.log(gender);
         console.log(birthday);
         // console.log(birthyear);
         // console.log(mobile);
         
      $.ajax({
            type: "get",
            async: false,
            url: "emailCheck",
            data:{email:email},
            success: function(data){
               if(data == 0 && email!=''){
                  
                  location.href= "./naverjoin?email=" + email 
                  + "&gender=" + gender
                  + "&birthday=" + birthday 
                  + "&name=" + name;
               }
               else{
                  
                  $.ajax({
                     type: "get",
                     url: "otherlogin",
                     dataType:"text",
                     data :{"email":email},
                     success: function(){
                        //alert("성공");
                        location.href="/";      
                     }
                  });
   
               }
            }
         });
      }
      
   </script>

</body>
</html>











