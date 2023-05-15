<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ include file="../commonvar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<script src="https://cdn.ckeditor.com/ckeditor5/12.4.0/classic/ckeditor.js"></script>
<style>
        body, body * {
            font-family: 'Jua'
        }

        .container  {
            width: 700px;
            margin: 0 auto;
            margin-top: 40px;
            background-color: #ddd;
        }

        .layout > input, textarea {
            width: 100%;
            height: 600px;
            box-sizing: border-box;
            margin-top: 10px;

        }

        .layout > textarea{
            width: 100%;
            margin-top: 50px;
            min-height: 300px;
        }
        
        .ck.ck-editor {

		width: 90%;
		max-width: 800px;
		margin: 0 auto;
		}

		.ck-editor__editable {
			height: 80vh;
		}


    </style>
</head>
<body>
<h1>지역 게시판</h1>

<div style="float:left;">
	<%-- <c:choose>
		<c:when test="${dto.uphoto==null}">
			<!-- Result값이 있다면 실행할 로직 -->
			<img src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243" style="width:40px; border-radius:100px;">
		</c:when>
		<c:otherwise>
			<!-- 그렇지 않다면 실행할 로직 -->
			<img src="https://${imageUrl}/userprofile/${dto.uphoto}" style="width:40px;">    
		</c:otherwise>
	</c:choose> --%>
</div>
      <h4>${udto.uname}님이 작성 중입니다</h4>
<div class="container">
        <br>
        <input type="text" class="form-control" id="subject" name="subject" style="width: 100%" value="${cbdto.subject}">
        <br>
        <input type="hidden" id="unum" name="unum" value="${unum}">
        <input type="hidden" id="city1" name="city1" value="${cbdto.city1}">
        <input type="hidden" id="city2" name="city2" value="${cbdto.city2}">
        <input type="hidden" id="uname" name="uname" value="${uname}">
        <input type="hidden" id="cbnum" name="cbnum" value="${cbdto.cbnum}"> 
        <!-- 이미지 미리보기 -->
        <c:forEach var="pdto" items="${pdto}" varStatus="status">
        <img id="showimg${status.index}" name="photo_idx" value=${pdto.photo_idx} style="width:25%" src="https://kr.object.ncloudstorage.com/together-bucket-104/city/${pdto.photo_idx}">
        </c:forEach>
        <br>
        <br>
        <input type="button" id="delphoto" value="사진 삭제" class="form-controll">
        <input type="file" name="upload" id="myfile" multiple="multiple" class="form-controll">
        <br>
        <textarea id="cbcontent" name ="cbcontent">${cbdto.cbcontent}</textarea>
        <br>
        <hr>
            <button type="button" id="newCity" class="btn btn-success" style="margin-left: 260px">수정</button>
            <button type="button" class="btn btn-success" onclick="history.back()" style="margin-left: 50px">취소</button>
        <br>
        <br>
</div>
<script type="text/javascript">
	$("#delphoto").click(function(){
		let s=confirm("사진을 삭제하겠습니까?")
		if(s){
			$("#showimg0").attr("src","https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243");
			$("#showimg0").attr("value","");
			$("#showimg1").attr("src",null);
			$("#showimg2").attr("src",null);
		}
	});

	$("#myfile").change(function(){
		$("#showimg0").attr("src","https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243");
		$("#showimg1").attr("src",null);
		$("#showimg2").attr("src",null);
		
		console.log("1:"+$(this)[0].files.length);
		let cnt=$(this)[0].files.length;
		for(i=0;i<$(this)[0].files.length;i++){
		console.log("2"+i+":"+$(this)[0].files[i]);
		}
		//정규표현식
		var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
		for(i=0;i<$(this)[0].files.length;i++){
		var f=$(this)[0].files[i];//현재 선택한 파일
		//console.log(f)
		if(!f.type.match(reg)){
			alert("확장자가 이미지파일이 아닙니다");
			return;
			};
		};
		
		
		
		for(i=0;i<$(this)[0].files.length;i++){
			console.log("번호"+i)
			if($(this)[0].files[0]){
				if(i==2){
					var reader=new FileReader();
					reader.onload=function(e){
					$("#showimg2").attr("src",e.target.result);
					}
				}
				else if(i==1){
					var reader=new FileReader();
					reader.onload=function(e){
					$("#showimg1").attr("src",e.target.result);
					
					}
				}
				else if(i==0){
					var reader=new FileReader();
					reader.onload=function(e){
					$("#showimg0").attr("src",e.target.result);
					
					
					}
				}
				
			}
			if(cnt>3){
				alert("사진은 3장까지만 올릴 수 있습니다");
				$("#myfile").val(null);
				$("#showimg0").attr("src","https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243");
				$("#showimg1").attr("src",null);
				$("#showimg2").attr("src",null);
			}
			reader.readAsDataURL($(this)[0].files[i]);
		}
	});
	
	$(document).on("click","#newCity",function(){
		let uname=$("#uname").val();
		let cnt=$("#myfile")[0].files.length;
		let unum=$("#unum").val();
		let city1=$("#city1").val();
		let city2=$("#city2").val();
		let photo=$("#showimg0").attr("src");
		let cbnum=$("#cbnum").val();
		console.log("cbnum체크:"+cbnum)
		
		//alert(uname+","+subject+","+cnt+","+cbcontent+","+unum+","+city1+","+city2);
		console.log("벨류체크:"+photo)
		
		var form=new FormData();
		
		if(photo=="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243")
			{
			form.append("delcheck","1");
		}
		
		for(i=0;i<$("#myfile")[0].files.length;i++){
			form.append("upload",$("#myfile")[0].files[i]);
		}
		
		form.append("uname",uname);
		form.append("subject",subject);
		form.append("cbcontent",cbcontent);
		form.append("unum",unum);
		form.append("city1",city1);
		form.append("city2",city2);
		form.append("cbnum",cbnum)
		
		$.ajax({
			type:"get",
			dataType:"text",
			url:"./cityupdate",
			processData:false,
			contentType:false,
			data:form,
			success:function(res){
				location.href="/city/detail?cbnum="+cbnum;
			}
		})
		
		
		
	});

	
</script>
</body>

</html>