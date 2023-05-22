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

        #container  {
            width: 1140px;
            margin: 0 auto;
            margin-top: 40px;
            border-radius: 10px;
            background-color:#FCFCF5;
        }
		.footer{
			margin-top: 150px;
		}
        
        #cbcontent {
            width: 90%;
            height: 600px;
            margin-left: 57px;
        }

        #subject{
            width: 90%;
            margin: 0 auto;
            
        }
        
        .filebox .upload-name {
    		display: inline-block;
    		height: 40px;
    		padding: 0 10px;
    		vertical-align: middle;
    		border: 1px solid #dddddd;
    		width: 895px;
    		color: #999999;
		}
		
		.filebox label {
    		display: inline-block;
    		padding: 10px 20px;
    		color: #fff;
    		vertical-align: middle;
    		background-color: #FE9A2E;
    		cursor: pointer;
    		height: 40px;
    		margin-left: 57px;
    		margin-top: 5px;
		}
		
		.filebox input[type="file"] {
    		position: absolute;
    		width: 0;
    		height: 0;
    		padding: 0;
    		overflow: hidden;
    		border: 0;
		}
</style>
</head>
<body>
<br>
<br>
<div id="container">
	<c:choose>
		<c:when test="${mainPhoto!=null }">
			<img src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/${mainPhoto}" style="width: 30px;height: 30px;float:left; margin-top:5px;margin-left:57px; margin-right:5px; border-radius:100px;">
		</c:when>
		<c:otherwise>
			<img src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/together.png" style="width: 30px;height: 30px;float:left; margin-top:5px; margin-left:57px; margin-right:5px; border-radius:100px;">                               
		</c:otherwise>
	</c:choose>
	<h3 style="margin-top:10px">${uname } 님이 작성 중입니다</h3>
        <br>
        <input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력해주세요" maxlength="50" required>
        <br>
        <input type="hidden" id="unum" name="unum" value="${unum}">
        <input type="hidden" id="city1" name="city1" value="${city1}">
        <input type="hidden" id="city2" name="city2" value="${city2}">
        <input type="hidden" id="uname" name="uname" value="${uname}">
        <!-- 이미지 미리보기 -->
        <div style="text-align:center">
        	<img id="showimg0" style="width:25%;height:275px" src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/together.png">
        	&nbsp;
        	<img id="showimg1" style="width:25%;height:275px" src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/together.png">
        	&nbsp;
        	<img id="showimg2" style="width:25%;height:275px" src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/together.png">
        </div>
        
        <br>
        <div class="filebox">
        	<label for="myfile">파일 업로드</label> 
    		<input class="upload-name" value="첨부파일" placeholder="첨부파일">
    		<input type="file" id="myfile" multiple="multiple">
		</div>
        <br>
        <br>
        <textarea id="cbcontent" name ="cbcontent" placeholder="내용입력"  required="required"></textarea>
        <br>
        <br>
        <div style="text-align:center">
            <button type="button" id="newCity" class="btn btn-sm text-white" style="width:100px;background-color: #FE9A2E;">작성</button>
            <button type="button" onclick="history.back()" class="btn btn-sm text-white" style="margin-left:50px;width:100px;background-color: #FE9A2E;">취소</button>
        </div>
        <br>
        <br>
        
</div>
	<script type="text/javascript">
	
	$("#myfile").on('change',function(){
		var fileName = $("#myfile").val();
		let cnt=$(this)[0].files.length;
		if(cnt==1){
			$(".upload-name").val(fileName);
			}
		else if(cnt>1){
			$(".upload-name").val(cnt+"개의 파일 선택");
			}
		});
	
	$("#myfile").change(function(){
		$("#showimg0").attr("src","https://kr.object.ncloudstorage.com/together-bucket-104/moim/together.png");
		$("#showimg1").attr("src","https://kr.object.ncloudstorage.com/together-bucket-104/moim/together.png");
		$("#showimg2").attr("src","https://kr.object.ncloudstorage.com/together-bucket-104/moim/together.png");
		
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
				$("#showimg0").attr("src","https://kr.object.ncloudstorage.com/together-bucket-104/moim/together.png");
				$("#showimg1").attr("src","https://kr.object.ncloudstorage.com/together-bucket-104/moim/together.png");
				$("#showimg2").attr("src","https://kr.object.ncloudstorage.com/together-bucket-104/moim/together.png");
			}
			reader.readAsDataURL($(this)[0].files[i]);
		}
	});
	
	$(document).on("click","#newCity",function(){
		let uname=$("#uname").val();
		let cnt=$("#myfile")[0].files.length;
		let subject=$("#subject").val();
		let cbcontent=$("#cbcontent").val();
		let unum=$("#unum").val();
		let city1=$("#city1").val();
		let city2=$("#city2").val();
		
		//alert(uname+","+subject+","+cnt+","+cbcontent+","+unum+","+city1+","+city2);
		if(subject==''){
			alert("제목을 입력해 주세요")
		}
		else if (cbcontent==''){
			alert("내용을 입력해주세요")
		}
		else {
		var form=new FormData();
		for(i=0;i<$("#myfile")[0].files.length;i++){
			form.append("upload",$("#myfile")[0].files[i]);
		}
		
		form.append("uname",uname);
		form.append("subject",subject);
		form.append("cbcontent",cbcontent);
		form.append("unum",unum);
		form.append("city1",city1);
		form.append("city2",city2);
		
		$.ajax({
			type:"post",
			dataType:"text",
			url:"./cityinsert",
			processData:false,
			contentType:false,
			data:form,
			success:function(res){
				location.href="/city/list";
			}
		})
		}
	});

	
</script>
</body>

</html>