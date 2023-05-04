<?php
// MySQL 데이터베이스 연결 정보
$host = 'db-g92gp-kr.vpc-pub-cdb.ntruss.com'; // 호스트 이름
$user = 'together'; // 사용자 이름
$password = 'together123!@#'; // 비밀번호
$dbName = 'nc_mysql_together'; // 데이터베이스 이름

// MySQL 데이터베이스 연결
$conn = mysqli_connect($host, $user, $password, $dbName);
if (!$conn) {
  die('MySQL 연결 오류: ' . mysqli_connect_error());
}

// 선택한 시,도에 해당하는 시,군,구 데이터를 가져오는 SQL 쿼리
$sido = $_GET['sido'];
$sql = "SELECT sigungu FROM city WHERE sido = '$sido'";

// SQL 쿼리 실행
$result = mysqli_query($conn, $sql);
if (!$result) {
  die('SQL 쿼리 오류: ' . mysqli_error($conn));
}

// 시,군,구 데이터를 JSON 형식으로 변환하여 반환
$data = array();
while ($row = mysqli_fetch_assoc($result)) {
  $data[] = $row['sigungu'];
}
echo json_encode($data);

// MySQL 데이터베이스 연결 종료
mysqli_close($conn);
?>