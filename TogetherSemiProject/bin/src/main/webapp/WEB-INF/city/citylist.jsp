<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
body, body * {
	font-family: 'Jua'
}
</style>
</head>
<body>
	<div
		style="border: 1px solid black; width: 100%; height: 100px; font-size: 50px">header</div>
	<br>
	<br>
	<br>
	<br>
	<h1>글이 총 ${totalCountCity }개 있습니다</h1>
	<span>지역선택</span>
	<select id="city">
		<option value="">시, 도 선택</option>
		<option value="서울">서울</option>
		<option value="부산">부산</option>
		<option value="대구">대구</option>
		<option value="인천">인천</option>
		<option value="광주">광주</option>
		<option value="대전">대전</option>
		<option value="울산">울산</option>
		<option value="세종">세종</option>
		<option value="경기">경기</option>
		<option value="강원">강원</option>
		<option value="충북">충북</option>
		<option value="충남">충남</option>
		<option value="전북">전북</option>
		<option value="전남">전남</option>
		<option value="경북">경북</option>
		<option value="경남">경남</option>
		<option value="제주">제주</option>
	</select>
	<select id="district" disabled>
		<option value="">시, 군, 구 선택</option>
	</select>

	<script>
    $(document).ready(function() {
      $('#city').change(function() {
        var city = $(this).val();
        if (city === '서울') {
          var districts = ['강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구'];
        } else if (city === '부산') {
        	var districts = ['강서구', '금정구', '기장군', '남구', '동구', '동래구', '부산진구', '북구', '사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구', '해운대구'];
        } else if (city === '대구') {
            var districts = ['남구', '달서구', '달성군', '동구', '북구', '서구', '수성구', '중구'];
      	} else if (city === '인천') {
            var districts = ['강화군', '계양구', '남구', '남동구', '동구', '미추홀구', '부평구', '서구', '연수구', '옹진군'];
      	} else if (city === '광주') {
            var districts = ['광산구', '남구', '동구', '북구', '서구'];
      	} else if (city === '대전') {
            var districts = ['대덕구', '동구', '서구', '유성구', '중구'];
      	} else if (city === '울산') {
            var districts = ['남구', '동구', '북구', '울주군'];      		
      	} else if (city === '세종') {
            var districts = ['세종특별자치시'];      		
      	} else if (city === '경기') {
            var districts = ['가평군', '고양시', '과천시', '광명시', '광주시', '구리시', '군포시', '김포시', '남양주시', '동두천시', '부천시', '성남시', '수원시', '시흥시', '안산시', '안성시', '안양시', '양주시', '양평군', '여주시', '연천군', '오산시', '용인시', '의왕시', '의정부시', '이천시', '파주시', '평택시', ' 포천시', '하남시', '화성시'];
      	} else if (city === '강원') {
            var districts = ['강릉시', '동해시', '속초시', '원주시', '춘천시', '태백시', '고성군', '양양군', '영월군', '인제군', '정선군', '철원군', '화천군', '횡성군'];
      	} else if (city === '충북') {
            var districts = ['청주시', '충주시', '제천시', '보은군', '옥천군', '영동군', '진천군', '괴산군', '음성군', '단양군'];
      	} else if (city === '충남') {
            var districts = ['천안시', '공주시', '보령시', '아산시', '서산시', '논산시', '계룡시', '당진시', '금산군', '부여군', '서천군', '청양군', '홍성군', '예산군', '태안군'];
      	} else if (city === '전북') {
            var districts = ['전주시 완산구', '전주시 덕진구', '군산시', '익산시', '정읍시', '남원시', '김제시', '완주군', '진안군', '무주군', '장수군', '임실군', '순창군', '고창군', '부안군'];
      	} else if (city === '전남') {
            var districts = ['광양시', '나주시', '목포시', '순천시', '여수시', '영광군', '영암군', '완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군'];
      	} else if (city === '경북') {
            var districts = ['경산시', '경주시', '고령군', '구미시', '군위군', '김천시', '문경시', '봉화군', '상주시', '성주군', '안동시', '영덕군', '영양군', '영주시', '영천시', '예천군', '울릉군', '울진군', '의성군', '청도군', '청송군', '칠곡군', '포항시'];
      	} else if (city === '경남') {
            var districts = ['창원시', '진주시', '통영시', '사천시', '김해시', '밀양시', '거제시', '양산시', '함안군', '창녕군', '고성군', '남해군', '하동군', '산청군', '함양군', '거창군', '합천군'];
      	} else if (city === '제주') {
            var districts = ['제주시', '서귀포시'];
      	} else {
          $('#district').empty().prop('disabled', true);
        }
        var districtSelect = $('#district');
        districtSelect.empty();
        districtSelect.append($('<option>', { value: '', text: '시, 군, 구 선택' }));
        $.each(districts, function(index, value) {
          districtSelect.append($('<option>', { value: value, text: value }));
        });
        districtSelect.prop('disabled', false);
      });
    });
  </script>
	<button>선택 지역 검색</button>
	<button style="float: right" onclick="location.href='cityform?unum=${dto.unum}'">글쓰기</button>
	<table class="table table-bordered" >
		<tr bgcolor="#f5f5dc">
			<th style="width: 100px">번호${dto.unum}111</th>
			<th style="width: 400px">제목</th>
			<th style="width: 200px">작성자</th>
			<th style="width: 150px">작성일</th>
			<th style="width: 100px">조회수</th>
			<th style="width: 100px">추천수</th>
		</tr>
		<c:forEach var="dto" items="${listcity}" varStatus="i">
			<tr>
				<td align="center">${i.count}</td>

				<td style="cursor: pointer" onclick="location.href='detail?cbnum=${dto.cbnum}'">
					<b>${dto.subject}</b>
				</td>
				<td>${dto.unum}</td>
				<td align="right" >
				<fmt:formatDate value="${dto.cbwriteday }" pattern="yyyy-MM-dd"/>
				</td>
				<td>${dto.readcount}</td>
				<td>${dto.cblike}</td>
			</tr>
		</c:forEach>
	</table>
	<div style="float: right">
		<input type="text" placeholder="">
		<button>검색</button>
	</div>

	<br>
	<hr>
	<!-- 페이징처리 -->
	<div style="width: 700px; text-align: center; font-size: 20px;">
		<!-- 이전 -->
		<c:if test="${startPage>1 }">
			<a style="color: green; text-decoration: none; cursor: pointer;"
				href="list?currentPage=${startPage-1 }">이전</a>
		</c:if>
		&nbsp;

		<!-- 페이지 번호 출력 -->
		<c:forEach var="pp" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage==pp }">
				<a style="color: green; text-decoration: none; cursor: pointer;"
					href="list?currentPage=${pp }">${pp }</a>
			</c:if>
			<c:if test="${currentPage!=pp }">
				<a style="color: black; text-decoration: none; cursor: pointer;"
					href="list?currentPage=${pp }">${pp }</a>
			</c:if>
        &nbsp;
    </c:forEach>

		<!-- 다음 -->
		<c:if test="${endPage<totalPage }">
			<a style="color: green; text-decoration: none; cursor: pointer;"
				href="list?currentPage=${endPage+1 }">다음</a>
		</c:if>

	</div>
</body>
</html>










