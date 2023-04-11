<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<body>
	<h1>제품검사관리</h1>
	<div class="card">
		<div class="card-body">
			<div class="row g-3 align-items-center"
				style="margin-top: 20px; margin-bottom: 5px;">
				<div class="form-group row">
					<div class="col-auto">
						<label style="font-weight: bold;">주문번호*</label>
					</div>
					<div class="col-auto" style="margin-left: 15px;">
						<input type="text" disabled readonly name="orderNo" class="form-control">
					</div>
					<div class="col-auto">
						<button type="button" class="btn btn-success"
							data-bs-toggle="modal" data-bs-target="#modalDialogScrollable">
							조회</button>
					</div>
					<div class="col-auto">
						<label style="font-weight: bold;">완제품코드*</label>
					</div>
					<div class="col-auto">
						<input type="text" disabled name="edctsCd" class="form-control" readonly>
					</div>

					<div class="col-auto">
						<label style="font-weight: bold;">완제품명*</label>
					</div>
					<div class="col-auto">
						<input type="text" disabled name="prdtNm" class="form-control" />
					</div>
				</div>
			</div>
			<hr>
			<div class="row g-3 align-items-center"
				style="margin-top: 20px; margin-bottom: 5px;">
				<div class="form-group row">
					<div class="col-auto">
						<label style="font-weight: bold;">완제품LOT*</label>
					</div>
					<div class="col-auto">
						<input type="text" name="edctsLotNo" disabled readonly class="form-control">
					</div>
					<div class="col-auto"></div>
					<div class="col-auto" style="margin-left: 60px;">
						<label style="font-weight: bold;">검사수량*</label>
					</div>
					<div class="col-auto" style="margin-left: 15px;">
						<input type="text" disabled name="orderCnt" class="form-control" readonly>
					</div>
				</div>
			</div>
			<hr>
			<div class="row g-3 align-items-center"
				style="margin-top: 20px; margin-bottom: 5px;">
				<div class="form-group row">
					<div class="col-auto">
						<label style="font-weight: bold;">검사일자*</label>
					</div>
					<div class="col-auto" style="margin-left: 14px">
						<input type="date" name="" class="form-control">
					</div>

					<div class="col-auto" style="margin-left: 143px">
						<label style="font-weight: bold;">검사담당자*</label>
					</div>
					<div class="col-auto">
						<input type="text" name="" class="form-control">
					</div>

					<div class="col-auto">
						<label style="font-weight: bold;">최종판정*</label>
					</div>
					<div class="col-auto">
						<label><input type="radio" name="chckFg" value="적합">
							적합</label> <label><input type="radio" name="chckFg" value="부적합">
							부적합</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 첫번째 카드마무리 -->
	<div class="card">
		<div class="card-body">
			<table class="table table-striped table-hover"
				style="margin-top: 20px; margin-bottom: 5px;">
				<thead>
					<tr style="position: sticky; top: 0px; background-color: #E2E2E2">
						<th>검사코드</th>
						<th>검사명</th>
						<th>검사기준</th>
						<th>검사결과</th>
						<th>결과판정</th>
					</tr>
				</thead>
				<tbody id="">
					<tr onclick="">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- 모달창 -->
	<div class="modal fade" id="modalDialogScrollable" tabindex="-1"
		data-bs-backdrop="static">
		<div
			class="modal-dialog modal-dialog-scrollable modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">주문서 목록</h5>
					<button type="button" class="btn-close closeBtn"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="card-body" style="margin-top: 30px;">
							<div class="form-group row">
								<div class="col-auto">
									<label style="font-weight: bold;">주문서</label>
								</div>
								<div class="col-auto">
									<input type="text" id="searchInput" class="form-control">
								</div>
							</div>
							<p>
							<div style="width: 100%; height: 200px; overflow: auto;">
								<table class="table table-striped table-hover">
									<thead>
										<tr
											style="position: sticky; top: 0px; background-color: #E2E2E2">
											<th scope="col"></th>
											<th scope="col">주문번호</th>
											<th scope="col">거래처명</th>
											<th scope="col">제품코드</th>
											<th scope="col">제품명</th>
											<th scope="col">주문수량</th>
										</tr>
									</thead>
									<tbody id="modalTableBody">
										<c:forEach items="${orderList }" var="order">
											<tr
												onclick="modalInsertInput(this)">
												<td><input type="checkbox"></td>
												<td>${order.orderNo }</td>
												<td>${order.vendNm }</td>
												<td>${order.edctsCd }</td>
												<td>${order.prdtNm }</td>
												<td>${order.orderCnt }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary closeBtn"
						data-bs-dismiss="modal" onclick="modalReset()">닫기</button>
					<button type="button" class="btn btn-primary"
						onclick="modalOrderSelect()" data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
<script>
//메인화면 모든 input창
var orderNo = document.querySelector('[name="orderNo"]'); //주문번호
var edctsCd = document.querySelector('[name="edctsCd"]'); //완제품코드
var prdtNm = document.querySelector('[name="prdtNm"]'); //완제품이름
var orderCnt = document.querySelector('[name="orderCnt"]'); //주문수량
//모달
//주문서 선택 확인 
function modalOrderSelect(){
	let checkboxes = modalTableBody.querySelectorAll('[type="checkbox"]');
	let tr = ''
	for(let i=0; i<checkboxes.length; i++){
		if(checkboxes[i].checked){
			tr = checkboxes[i].closest('tr')
		}
	}
	let tds = tr.querySelectorAll('td');
	orderNo.value = tds[1].innerText;	 
	edctsCd.value = tds[3].innerText;	 
	prdtNm.value = tds[4].innerText;	 
	orderCnt.value = tds[5].innerText;	 
}
//주문서 선택시 체크 후 메인화면에 뿌리기
function modalInsertInput(t){
	//체크되게
	let checkboxes = modalTableBody.querySelectorAll('input[type="checkbox"]')
	for(let i=0; i<checkboxes.length; i++){
		checkboxes[i].checked = false;
	}
	t.querySelector('input[type="checkbox"]').checked = true;
	
}
//모달창 검색
// 검색어를 입력할 input 요소의 id를 'searchInput'으로 가정합니다.
var searchInput = document.getElementById('searchInput');

// 검색어 입력 시 이벤트 리스너를 등록합니다.
searchInput.addEventListener('input', function() {
	var keyword = searchInput.value.trim(); // 검색어를 얻어옵니다.
	var table = document.getElementById('modalTableBody'); // 테이블의 tbody 요소를 가져옵니다.
	var rows = table.getElementsByTagName('tr'); // 테이블의 모든 행(tr) 요소들을 가져옵니다.

	// 각 행(tr) 요소들에 대하여 검색어를 비교하고, 검색어를 포함하지 않는 행은 숨깁니다.
	for (var i = 0; i < rows.length; i++) {
		var row = rows[i];
		var cells = row.getElementsByTagName('td'); // 행(tr) 안의 모든 셀(td) 요소들을 가져옵니다.
		var rowVisible = false; // 행이 보이는지 여부를 나타내는 변수입니다.

		// 각 셀(td) 요소들의 텍스트를 비교하여 검색어를 포함하는지 확인합니다.
		for (var j = 0; j < cells.length; j++) {
			var cellText = cells[j].textContent.trim(); // 셀(td)의 텍스트를 얻어옵니다.

			// 검색어와 셀(td)의 텍스트를 숫자 형식으로 변환하여 비교합니다.
			// isNaN 함수를 사용하여 숫자가 아닌 경우에는 문자열 비교를 수행합니다.
			if (!isNaN(keyword) && !isNaN(cellText)) {
				if (parseFloat(cellText) === parseFloat(keyword)) {
					rowVisible = true;
					break;
				}
			} else if (cellText.includes(keyword)) {
				rowVisible = true;
				break;
			}
		}

		// 검색어를 포함하지 않는 행은 숨깁니다.
		if (rowVisible) {
			row.style.display = '';
		} else {
			row.style.display = 'none';
		}
	}
});
//최대LOT +1
function makeMaxLot(){
	let original = "${maxLot.edctsLotNo}" //EDCTS-L202304100
	let number = parseInt(original.substring(7)); //202304101
	let maxLot = original.replace(number,number+1); 
	document.querySelector('[name="edctsLotNo"]').value = maxLot 
}
makeMaxLot();
</script>
</body>
</html>