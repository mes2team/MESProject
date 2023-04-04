<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h5 {
	float: left;
}

#btnGrp {
	float: right;
	padding: 20px 0 15px 0;
}

form {
	clear: both;
}
</style>
</head>
<body>
	<!-- 검색폼 영역 -->
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">생산계획페이지</h5>
			<div id="btnGrp">
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#orderSheet">주문서</button>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#createPlan">계획등록</button>
				<button type="button" class="btn btn-primary">삭제</button>
			</div>
			<!-- Multi Columns Form -->
			<form class="row g-3">
				<div class="col-md-6">
					<label for="inputEmail5" class="form-label">Email</label> <input
						type="email" class="form-control" id="inputEmail5">
				</div>
				<div class="col-md-6">
					<label for="inputPassword5" class="form-label">Password</label> <input
						type="password" class="form-control" id="inputPassword5">
				</div>
				<div class="col-md-6">
					<label for="inputEmail5" class="form-label">Email</label> <input
						type="email" class="form-control" id="inputEmail5">
				</div>
				<div class="col-md-6">
					<label for="inputPassword5" class="form-label">Password</label> <input
						type="password" class="form-control" id="inputPassword5">
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary">Submit</button>
					<button type="reset" class="btn btn-secondary">Reset</button>
				</div>
			</form>
			<!-- End Multi Columns Form -->

		</div>
	</div>

	<!-- 테이블 영역 -->
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">Table with hoverable rows</h5>

			<!-- Table with hoverable rows -->
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Name</th>
						<th scope="col">Position</th>
						<th scope="col">Age</th>
						<th scope="col">Start Date</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Brandon Jacob</td>
						<td>Designer</td>
						<td>28</td>
						<td>2016-05-25</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Bridie Kessler</td>
						<td>Developer</td>
						<td>35</td>
						<td>2014-12-05</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>Ashleigh Langosh</td>
						<td>Finance</td>
						<td>45</td>
						<td>2011-08-12</td>
					</tr>
					<tr>
						<th scope="row">4</th>
						<td>Angus Grady</td>
						<td>HR</td>
						<td>34</td>
						<td>2012-06-11</td>
					</tr>
					<tr>
						<th scope="row">5</th>
						<td>Raheem Lehner</td>
						<td>Dynamic Division Officer</td>
						<td>47</td>
						<td>2011-04-19</td>
					</tr>
				</tbody>
			</table>
			<!-- End Table with hoverable rows -->

		</div>
	</div>

	<!-- 모달창 -->
	<!-- 주문서 조회 -->
	<div class="modal fade" id="orderSheet" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">미지시 주문서 조회</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form class="row g-3">
						<div class="col-md-6">
							<label for="inputEmail5" class="form-label">Email</label> <input
								type="email" class="form-control" id="inputEmail5">
						</div>
						<div class="col-md-6">
							<label for="inputPassword5" class="form-label">Password</label> <input
								type="password" class="form-control" id="inputPassword5">
						</div>
					</form>
					<hr>
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col"><input type="checkbox" /></th>
								<th scope="col">주문코드</th>
								<th scope="col">거래처</th>
								<th scope="col">제품명</th>
								<th scope="col">주문일자</th>
								<th scope="col">납기일자</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row"><input type="checkbox" /></th>
								<td>Brandon Jacob</td>
								<td>Designer</td>
								<td>2016-05-25</td>
								<td>2016-05-25</td>
								<td>2016-05-25</td>
							</tr>
						</tbody>
					</table>
					<!-- End Multi Columns Form -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 생산계획 작성 -->
	<div class="modal fade" id="createPlan" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">새로운 생산계획 작성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form name="newPlan" action="newPlanInsert" method="POST" onsubmit="return false" class="row g-3">
						<h5 class="modal-title">주문서 정보</h5>
						<div class="col-md-6">
							<label class="form-label">주문번호</label> <input type="text"
								class="form-control" name="orderNo" value="ORD1000" readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">제품명</label> <input type="text"
								class="form-control" value="로얄캐닌 인도어" > <input
								type="hidden" class="form-control" name="edctsCd" value="EDC1000" placeholder="완제품코드" readonly>
						</div>
						<div class="col-md-12">
							<label class="form-label">거래처명</label> <input type="text"
								class="form-control" value="판매회사" readonly>
								<input type="hidden"
								class="form-control" value="VEO1000" readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">주문일자</label> <input type="date"
								class="form-control" value="2023-04-04" readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">납기일자</label> <input type="date"
								class="form-control" name="paprdDt" value="2023-04-11" readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">주문수량</label> <input type="number"
								class="form-control" name="orderCnt" value="100" readonly>
						</div>
						<hr>
						<h5 class="modal-title">생산계획</h5>
						<input type="hidden" class="form-control" name="nowSt" value="미진행" readonly>
						<div class="col-md-6">
							<label class="form-label">생산계획코드</label> <input type="text"
								class="form-control" name="planCd" value="PLN1000" readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">생산계획명</label> <input type="text"
								name="planName" class="form-control">
						</div>
						<div class="col-md-6">
							<label class="form-label">생산계획일자</label> <input type="date"
								class="form-control" name="planDt" id="currentDate" readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">생산시작 예정일</label> <input type="date"
								name="wkToDt" class="form-control">
						</div>
						<div class="col-md-6">
							<label class="form-label">BOM선택</label> <select
								name="bomCd" class="form-select" aria-label="Default select example">
								<option value="BOM1000">BOM1000</option>
								<option value="BOM2000">BOM2000</option>
							</select>
						</div>
						<div class="col-md-6">
							<label class="form-label">우선순위</label> <select
								name="prefRank" class="form-select" aria-label="Default select example">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</div>
						<hr>
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col">자재명(단위)</th>
									<th scope="col">자재소모량</th>
									<th scope="col">재고량</th>
									<th scope="col">투입공정</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>자재명 (kg)</td>
									<td>자재소모량</td>
									<td>재고량</td>
									<td>투입공정<input type="hidden" class="form-control" value="공정코드" readonly/></td>
								</tr>
							</tbody>
						</table>
					</form>
					<hr>
					<!-- End Multi Columns Form -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button id="newPlanSubmit" type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End Modal Dialog Scrollable-->
</body>
<script>
	/* 생산계획일자 오늘 설정 */
	document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);

	function formOptionchk(){
		//input값 체크
/* 		let title = document.getElementsByName('title')[0];
		let writer = document.getElementsByName('writer')[0];
		let contents = document.getElementsByName('contents')[0];
		
		if(title.value == "") {
			alert("제목이 입력되지 않았습니다.");
			title.focus();
			return;
		}
		if(writer.value == "") {
			alert("내용이 입력되지 않았습니다.");
			writer.focus();
			return;
		} */
		//form의 name 속성을 사용
		newPlan.submit();
	}
	document.querySelector('#newPlanSubmit')
			.addEventListener('click', formOptionchk);
</script>
</html>