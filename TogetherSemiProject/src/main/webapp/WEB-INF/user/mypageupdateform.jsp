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
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


<style>

	.myup_table tr{
		width:690px;
		height:50px
	}
	.myup_table td{
		vertical-align: middle;
	}
	.mytit {
		font-size: 30px;
		margin-bottom: 30px;
		font-weight: bold;
	}	
	
	.modu {
		width:690px;
		margin: 0 auto;
		margin-top:100px;
	}   
	.myinfofront {
		
		font-size:20px;
		width:150px;
		font-weight: bold;
	}
	.catego {
		width:695px;
	}
	
	.catego td {
       width : 150px;
       font-size:18px;
     }
       
  
	
	.bi {
       	cursor: pointer;
       	color : #FE9A2E
     }
    
    select {
    	height: 40px;
    	width: 140px;
        font-size: 15px;
        background: #fff;
        background-size: 20px 8px;
        border-radius:5px;
        -webkit-appearance: none;
        display: inline-block;
        text-align: start;
        border: solid 1px #dadada;
        cursor: default;
        padding-left: 5px;
    }
    
    .pickcate {
    	float:left;
    	font-size: 17px;
    	margin-left:5px;
    	margin-right: 10px;
    }
    
	.mainlayout .main{
		width: 100%;
		height: 1200px;
	}
	
	label {
		cursor: pointer;
	}
	
	.olmessagef {
		color: red; 
		font-size: 13px;
		float: left;
	}
	.olmessaget {
		color: green; 
		font-size: 13px;
		float: left; 	
	}
	
	#selcategory {
		margin-top:5px;
		font-size:15px;
	}
	
	.de {
		margin-top: 20px;
		margin-bottom: 10px;
	}
	
	.butt {
		margin-top: 15px;
		margin-bottom: 15px;
	}
	
	.makemo {
		margin-right: 30px;
		height: 36px;
    	width:100px;
    	background: #FE9A2E;
      	background-size: 200%;
        color:white;
        font-weight: 500;
        border:none;
        cursor:pointer;
        border-radius: 5px;
        transition: background-color 0.2s;
	}
	
	.makemo:hover {
		background: #FE642E;
	}
	
	.notmo {
		margin-right: 30px;
		height: 36px;
    	width:100px;
    	background: #A4A4A4;
      	background-size: 200%;
        color:white;
        font-weight: 500;
        border:none;
        cursor:pointer;
        border-radius: 5px;
        transition: background-color 0.2s;
	}
	
	.notmo:hover {
		background: #424242;
	}
	
	.outmo{
		height: 36px;
    	width:100px;
    	background: #DC3545;
      	background-size: 200%;
        color:white;
        font-weight: 500;
        border:none;
        cursor:pointer;
        border-radius: 5px;
        transition: background-color 0.2s;
	}
	.outmo:hover {
		background: #FF0000;
	}
	
	.bi {
       	cursor: pointer;
       	color : #FE9A2E
     }
     
	.la{
	 cursor:pointer;
	}
	
	
	.text {
	  width:1440px;
	  margin: 0 auto;
	  font-faily
	  font-size:20px;
	  margin-top: 50px;
	  padding: 20px;
	  flex : auto;
	}
	
	.tla {
		height: 20px;
		width: 160px;
	}
	
</style> 
</head>
<body>
<div class="modu">
	<div class="container-fluid">
		<h5 class="mytit">내 정보 수정</h5>
			<form id="myForm" action="/user/updatemypage" method="post" enctype="multipart/form-data">
				<!-- hidden -->
				<input type="hidden" name="unum" value="${dto.unum}">
				<table class="table myup_table">
				<tr>
					<td class="myinfofront">이름</td>
					<td>
						${dto.uname}
					</td>
				</tr>
				<tr>	
					<td class="myinfofront">생년월일</td>
					<td>
						${dto.age}
					</td>
				</tr>
				<tr>		
					<td class="myinfofront">성별</td>
					<td>
						 ${dto.gender}
					</td>
				</tr>	
				</tr>
				<tr>
					<td class="myinfofront">이메일  </td>
					<td>${dto.email}</td>
				</tr>
				<tr>	
					<td class="myinfofront">hp </td>
					<td>	
						<input type="tel" class="form-control" id="hp" name="hp" value="${dto.hp}" required>
					</td>
				</tr>
				<tr>		
					<td class="myinfofront">
					
						  <!-- City -->
				           <div class="input-wrap">
				             <label for="user_city" class="la">활동 지역</label>
				     </td>
				     <td>        
				             	<div class="ps_box_city" style="left: 122px;">
				                     <select id = "city" name="city1" class="cit">
				                        <option hidden value="${dto.city1}">${dto.city1}</option>
				                        <option value="서울특별시">서울특별시</option>
				                        <option value="부산광역시">부산광역시</option>
				                        <option value="대구광역시">대구광역시</option>
				                        <option value="인천광역시">인천광역시</option>
				                        <option value="광주광역시">광주광역시</option>
				                        <option value="대전광역시">대전광역시</option>
				                        <option value="울산광역시">울산광역시</option>
				                        <option value="세종특별자치시">세종특별자치시</option>
				                        <option value="경기도">경기도</option>
				                        <option value="강원도">강원도</option>
				                        <option value="충청북도">충청북도</option>
				                        <option value="충청남도">충청남도</option>
				                        <option value="전라북도">전라북도</option>
				                        <option value="전라남도">전라남도</option>
				                        <option value="경상북도">경상북도</option>
				                        <option value="경상남도">경상남도</option>
				                        <option value="제주특별자치도">제주특별자치도</option>
				                     </select>
				                     
				                      <select id="district" name="city2" class="cit">
					                     <option>${dto.city2}</option>
					                  </select>
								</div>
							</div>
					</td>       
				</tr>		
	                  <script>
	                   $(document).ready(function() {
	                     $('#city').change(function() {
	                       var city = $(this).val();
	                       if (city === '서울특별시') {
	                         var districts = ['강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구'];
	                       } else if (city === '부산광역시') {
	                          var districts = ['강서구', '금정구', '기장군', '남구', '동구', '동래구', '부산진구', '북구', '사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구', '해운대구'];
	                       } else if (city === '대구광역시') {
	                           var districts = ['남구', '달서구', '달성군', '동구', '북구', '서구', '수성구', '중구'];
	                        } else if (city === '인천광역시') {
	                           var districts = ['강화군', '계양구', '남구', '남동구', '동구', '미추홀구', '부평구', '서구', '연수구', '옹진군'];
	                        } else if (city === '광주광역시') {
	                           var districts = ['광산구', '남구', '동구', '북구', '서구'];
	                        } else if (city === '대전광역시') {
	                           var districts = ['대덕구', '동구', '서구', '유성구', '중구'];
	                        } else if (city === '울산광역시') {
	                           var districts = ['남구', '동구', '북구', '울주군'];            
	                        } else if (city === '세종특별자치시') {
	                           var districts = ['가람동','고운동', '금남면', '나성동', '누리동', '다솜동', '다정동', '대평동', '도담동', '반곡동', '보람동', '부강면', '산울동', '새롬동', '세종동', '소담동', '소정면','아름동', '어진동', '연기면', '연동면', '연서면', '용호동', '장군면', '전동면', '전의면', '조치원읍', '종촌동', '집현동', '한별동', '한솔동', '합강동', '해밀동'];            
	                        } else if (city === '경기도') {
	                           var districts = ['가평군', '고양시', '과천시', '광명시', '광주시', '구리시', '군포시', '김포시', '남양주시', '동두천시', '부천시', '성남시', '수원시', '시흥시', '안산시', '안성시', '안양시', '양주시', '양평군', '여주시', '연천군', '오산시', '용인시', '의왕시', '의정부시', '이천시', '파주시', '평택시', ' 포천시', '하남시', '화성시'];
	                        } else if (city === '강원도') {
	                           var districts = ['강릉시', '동해시', '속초시', '원주시', '춘천시', '태백시', '고성군', '양양군', '영월군', '인제군', '정선군', '철원군', '화천군', '횡성군'];
	                        } else if (city === '충청북도') {
	                           var districts = ['청주시', '충주시', '제천시', '보은군', '옥천군', '영동군', '진천군', '괴산군', '음성군', '단양군'];
	                        } else if (city === '충청남도') {
	                           var districts = ['천안시', '공주시', '보령시', '아산시', '서산시', '논산시', '계룡시', '당진시', '금산군', '부여군', '서천군', '청양군', '홍성군', '예산군', '태안군'];
	                        } else if (city === '전라북도') {
	                           var districts = ['전주시 완산구', '전주시 덕진구', '군산시', '익산시', '정읍시', '남원시', '김제시', '완주군', '진안군', '무주군', '장수군', '임실군', '순창군', '고창군', '부안군'];
	                        } else if (city === '전라남도') {
	                           var districts = ['광양시', '나주시', '목포시', '순천시', '여수시', '영광군', '영암군', '완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군'];
	                        } else if (city === '경상북도') {
	                           var districts = ['경산시', '경주시', '고령군', '구미시', '군위군', '김천시', '문경시', '봉화군', '상주시', '성주군', '안동시', '영덕군', '영양군', '영주시', '영천시', '예천군', '울릉군', '울진군', '의성군', '청도군', '청송군', '칠곡군', '포항시'];
	                        } else if (city === '경상남도') {
	                           var districts = ['창원시', '진주시', '통영시', '사천시', '김해시', '밀양시', '거제시', '양산시', '함안군', '창녕군', '고성군', '남해군', '하동군', '산청군', '함양군', '거창군', '합천군'];
	                        } else if (city === '제주특별자치도') {
	                           var districts = ['제주시', '서귀포시'];
	                        } else {
	                         $('#district').empty().prop('disabled', true);
	                       }
	                       var districtSelect = $('#district');
	                       districtSelect.empty();
	                       districtSelect.append($('<option>', { value: '시, 군, 구 선택', text: '시, 군, 구 선택' }));
	                       $.each(districts, function(index, value) {
	                         districtSelect.append($('<option>', { value: value, text: value }));
	                       });
	                       districtSelect.prop('disabled', false);
	                     });
	                   });
	                 </script>	                	           
             <tr>
			<td colspan="4">
			<div style="margin-bottom: 10px;"> 
				<span class="tag">카테고리</span>
			</div>
			
			<div class="cat">
				<label data-bs-toggle="modal" data-bs-target="#mySportsModal">
				<table class=catego>
					<tr>
						<td>
							<i class="bi bi-dribbble"></i>
							<h7>운동/스포츠</h7>
							</label>
						</td>
						<td>
							<label data-bs-toggle="modal" data-bs-target="#myGameModal">
							<i class="bi bi-controller"></i>
							<h7>게임/오락</h7>
							</label>
						</td>
						<td>
							<label data-bs-toggle="modal" data-bs-target="#myTravelModal">
							<i class="bi bi-geo-alt"></i>
							<h7>여행/아웃도어</h7>
							</label>
						</td>
					</tr>
					
					<tr>
						<td>
							<label data-bs-toggle="modal" data-bs-target="#myBookModal">
							<i class="bi bi-book"></i>
							<h7>책/글</h7>
							</label>
						</td>
						<td>
							<label data-bs-toggle="modal" data-bs-target="#myWorkModal">
							<i class="bi bi-briefcase"></i>
							<h7>업종/직무</h7>
							</label>
						</td>
						<td>
							<label data-bs-toggle="modal" data-bs-target="#myLangModal">
							<i class="bi bi-translate"></i>
							<h7>외국/언어</h7>
							</label>
						</td>
					</tr>
				
					<tr>
					<td>
						<label data-bs-toggle="modal" data-bs-target="#myMusicModal">
						<i class="bi bi-music-note-beamed"></i>
						<h7>음악/악기</h7>
						</label>
					</td>
					<td>	
						<label data-bs-toggle="modal" data-bs-target="#mySocialModal">
						<i class="bi bi-cup-straw"></i>
						<h7>사교/인맥</h7>
						</label>
					</td>
					<td>
						<label data-bs-toggle="modal" data-bs-target="#myCraftsModal">
						<i class="bi bi-palette"></i>
						<h7>공예/만들기</h7>
						</label>
					</td>
				</tr>
				
			 </table>
			</div>		
		<tr>
			<td colspan="4">
				<div class="pickcate">
					<span class="tag">선택한 카테고리 :	</span>
				</div>
				<div type="text" id="selcategory"></div>
				<input type="hidden" class="selcategory" name="category" value="null">
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center">
	       		<div class="mybutt">	
					<button type="submit" class="makemo">수정</button>
					<button type="button" class="notmo"	onclick="history.back()">취소</button>
					<button type="button" class="outmo"	 data-bs-toggle="modal" data-bs-target="#outmo">회원탈퇴</button>
					<input type="hidden" id="talmo2" class="talmo" data-bs-toggle="modal" data-bs-target="#talmo">
				</div>
			</td>
		</tr>		
	</table>			
    </form>
  </div> 
</div>

<!-- Modal -->
	<!-- The Modal -->
	<div class="modal" id="mySportsModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">운동/스포츠</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<table class="motable">
		      	<tr>
			      	<td><label class="tla"><input type="radio" name="categorys" value="축구">축구</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="농구">농구</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="야구">야구</label></td>    	
		      	</tr>
		      	
		      	<tr>
		      		<td><label class="tla"><input type="radio" name="categorys" value="테니스">테니스</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="배드민턴">배드민턴</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="자전거">자전거</label></td>
			      	
		      	</tr>
		      	
		      	<tr>
		      		<td><label class="tla"><input type="radio" name="categorys" value="클라이밍">클라이밍</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="탁구">탁구</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="러닝/마라톤">러닝/마라톤</label></td>
		      	</tr>
		      	
		      	<tr>
			      	<td><label class="tla"><input type="radio" name="categorys" value="골프">골프</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="볼링">볼링</label></td>
		      	</tr>
	      	</table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>

	
	<!-- The Modal -->
	<div class="modal" id="myGameModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">게임/오락</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<table class="motable">
		      	<tr>
			      	<td><label class="tla"><input type="radio" name="categorys" value="다트">다트</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="보드게임">보드게임</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="두뇌심리게임">두뇌심리게임</label></td>
		      	</tr>
		      	
		      	<tr>
			      	<td><label class="tla"><input type="radio" name="categorys" value="온라인게임">온라인게임</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="콘솔게임">콘솔게임</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="단체놀이">단체놀이</label></td>
		      	</tr>
		      	
		      	<tr>
			      	<td><label class="tla"><input type="radio" name="categorys" value="타로카드">타로카드</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="마술">마술</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="바둑">바둑</label></td>  
		      	</tr>
	      	</table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="myTravelModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">여행/아웃도어</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      
	      	<table class="motable">
		      	<tr>
			      	<td><label class="tla"><input type="radio" name="categorys" value="등산">등산</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="국내여행">국내여행</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="산책/트래킹">산책/트래킹</label></td>
		      	</tr>
		      	
		      	<tr>
		      		<td><label class="tla"><input type="radio" name="categorys" value="낚시">낚시</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="해외여행">해외여행</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="캠핑/백패킹">캠핑/백패킹</label></td>
		      	</tr>
		      	
		      	<tr>
		      		<td><label class="tla"><input type="radio" name="categorys" value="패러글라이딩">패러글라이딩</label></td>
		      	</tr>
	      	</table>     
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="myBookModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">책/글</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      
	      	<table class="motable">
		      	<tr>
			      	<td><label class="tla"><input type="radio" name="categorys" value="책/독서">책/독서</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="인문학">인문학</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="심리학">심리학</label></td>      	
		      	</tr>
		      	
		      	<tr>
		      		<td><label class="tla"><input type="radio" name="categorys" value="철학">철학</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="역사">역사</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="시사/경제">시사/경제</label></td>  	
		      	</tr>
		      	
		      	<tr>
		      		<td><label class="tla"><input type="radio" name="categorys" value="작문/글쓰기">작문/글쓰기</label></td>
		      	</tr>
		    </table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="myWorkModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">업족/직무</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<table class="motable">
		      	<tr>
			      	<td><label class="tla"><input type="radio" name="categorys" value="의료/건강/제약">의료/건강/제약</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="IT/포털/인터넷">IT/포털/인터넷</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="교육업">교육업</label></td> 	
		      	</tr>
		      	
		      	<tr>
		      		<td><label class="tla"><input type="radio" name="categorys" value="광고/마케팅업계">광고/마케팅업계</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="디자인업계  ">디자인업계</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="무역/상사">무역/상사</label></td>      	
		      	</tr>
		      	
		      	<tr>
		      		<td><label class="tla"><input type="radio" name="categorys" value="금융업">금융업</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="세무/회계">세무/회계</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="전자/기계/전기">전자/기계/전기</label></td>  	
		      	</tr>
		      	
		      	<tr>
		      		<td><label class="tla"><input type="radio" name="categorys" value="패션/의류/뷰티">패션/의류/뷰티</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="서비스업">서비스업</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="식음료/외식업">식음료/외식업</label></td>
		      	</tr>      	
	      	</table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="myLangModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">외국/언어</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<table class="motable">
		      	<tr>
			      	<td><label class="tla"><input type="radio" name="categorys" value="영어">영어</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="일본어">일본어</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="중국어">중국어</label></td>
			      	
		      	</tr>
		      	
		      	<tr>
		      		<td><label class="tla"><input type="radio" name="categorys" value="프랑스어">프랑스어</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="스페인어">스페인어</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="러시아어">러시아어</label></td>
		      	</tr>
	      	</table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="myMusicModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">음악/악기</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<table class="motable">
		      	<tr>
			      	<td><label class="tla"><input type="radio" name="categorys" value="노래/보컬">노래/보컬</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="기타/베이스">기타/베이스</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="드럼">드럼</label></td>   	
		      	</tr>
		      	
		      	<tr>
		      		<td><label class="tla"><input type="radio" name="categorys" value="피아노">피아노</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="바이올린">바이올린</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="밴드/합주">밴드/합주</label></td>	      	
		      	</tr>
		      	
		      	<tr>
		      		<td><label class="tla"><input type="radio" name="categorys" value="작사/작곡">작사/작곡</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="힙합">힙합</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="클래식">클래식</label></td>      	
		      	</tr>
		      	
		      	<tr>
		      		<td><label class="tla"><input type="radio" name="categorys" value="재즈">재즈</label></td>
		      	</tr>      	
	      	</table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="mySocialModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">사교/인맥</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<table class="motable">
		      	<tr>
			      	<td><label class="tla"><input type="radio" name="categorys" value="지역">지역</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="나이">나이</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="성별">성별</label></td>
		      	</tr>
		      	
		      	<tr>
		      		<td><label class="tla"><input type="radio" name="categorys" value="싱글/연애">싱글/연애</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="기혼/유부">기혼/유부</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="돌싱">돌싱</label></td> 	
		      	</tr>
		      	
		      	<tr>
		      		<td><label class="tla"><input type="radio" name="categorys" value="와인/커피/차">와인/커피/차</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="맛집/미식회">맛집/미식회</label></td>
		      	</tr>
	      	</table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="myCraftsModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">공예/만들기</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<table class="motable">
		      	<tr>
			      	<td><label class="tla"><input type="radio" name="categorys" value="미술/그림">미술/그림</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="캘리그라피">캘리그라피</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="천연비누/화장품">천연비누/화장품</label></td>
		      	</tr>
		      	
		      	<tr>
			      	<td><label class="tla"><input type="radio" name="categorys" value="가죽공예">가죽공예</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="가구/목공예">가구/목공예</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="도자/점토공예">도자/점토공예</label></td>
			      	
		      	</tr>
		      	
		      	<tr>
		      		<td><label class="tla"><input type="radio" name="categorys" value="자수/뜨개질">자수/뜨개질</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="키덜트/프라모델">키덜트/프라모델</label></td>
			      	<td><label class="tla"><input type="radio" name="categorys" value="메이크업/네일">메이크업/네일</label></td>
		      	</tr>
		      	
		      	<tr>
		      		<td><label class="tla"><input type="radio" name="categorys" value="캔들/디퓨저/석고 ">캔들/디퓨저/석고</label></td>
		      	</tr>	
	      	</table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
<script>
$(function() {
    // 체크박스 값이 변경될 때마다 실행되는 함수
    $('input[name="categorys"]').on('change', function() {
      // 모든 체크박스를 해제
      $('input[name="categorys"]').not(this).prop('checked', false);
      
      // 선택된 체크박스 값을 출력
      var selected = $(this).val();
      $('#selcategory').text(selected);
      $('.selcategory').val(selected);
    });
  }); 
  
document.getElementById('myForm').addEventListener('submit', function(event) {
    var selectedOption = document.getElementById('district').value;
    if (selectedOption === '시, 군, 구 선택') {
      event.preventDefault(); // 폼 제출 막기
      alert('시, 군, 구를 선택해주세요!');
    }
  });
$(document).on("click","#out1",function(){
	const unum=${unum};
	$.ajax({
		type:"get",
		url:"outmo",
		dataType:"text",
		data:{"unum":unum},
		success:function(res){
			if(res>0){
				var talmo=document.getElementById("talmo2");
				talmo.click();
			} else {
				location.href='talmo?unum='+unum
			}
			
		}
	});
})
</script>
</body>
</html>