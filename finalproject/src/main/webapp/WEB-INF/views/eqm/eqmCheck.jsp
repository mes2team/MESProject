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
	<h1>설비점검내역</h1>
	<div class="card">
		<div class="card-body">
			<div class="row g-3 align-items-center"
				style="margin-top: 20px; margin-bottom: 5px;">

				<div class="col-auto">
					<label for="inputPassword6" class="col-form-label">설비명</label>
				</div>
				<div class="col-auto">
					<input type="text" name="eqmNm" class="form-control">
					<button type="" id="" class="btn btn-primary">조회</button>
				</div>

				<div class="col-auto">
					<label for="inputPassword6" class="col-form-label">설비코드</label>
				</div>
				<div class="col-auto">
					<input type="text" name="eqmCd" class="form-control" readonly>
				</div>

				<div class="col-auto">
					<label for="inputPassword6" class="col-form-label">점검일자</label>
				</div>
				<div class="col-auto">
					<input type="date" name="chckDt" class="form-control">
				</div>

			</div>
			<hr>

			<div class="row g-3 align-items-center">

				<div class="col-auto">
					<label for="inputPassword6" class="col-form-label">담당자</label>
				</div>
				<div class="col-auto">
					<input type="text" name="eqmNm" class="form-control">
				</div>

				<div class="col-auto">
					<label for="inputPassword6" class="col-form-label">점검구분</label>
				</div>
				<div class="col-auto">
					<input type="text" name="eqmCd" class="form-control" readonly>
				</div>

				<div class="col-auto">
					<label for="inputPassword6" class="col-form-label">판정</label>
				</div>
				<div class="col-auto">
					<input type="radio" name="jdgmnt" checked value="합격"> 합격 <input
						type="radio" name="jdgmnt" value="불합격"> 불합격
				</div>
				<hr>
			</div>

			<div class="row g-3 align-items-center" style="margin-bottom: 10px;">
				<div class="col-auto">
					<label for="inputPassword6" class="col-form-label">조치내역</label>
				</div>
				<textarea class="form-control col-sm-5" style="width: 500px;"
					rows="5"></textarea>
			</div>

		</div>
	</div>
	<div class="card">
		<div class="card-body">
			<div class="row g-3 align-items-center"
				style="margin-top: 20px; margin-bottom: 50px;">
				<div class="col-auto">
					<label for="" class="col-form-label">설비명</label>
				</div>
				<div class="col-auto">
					<input type="text" id="searchInput" name="eqmNm"
						class="form-control">
				</div>
				<div class="col-auto">
					<label for="" class="col-form-label">점검일자</label>
				</div>
				<div class="col-auto">
					<input type="date" style="width: 150px; display: inline-block;"
						id="start" name="start" class="form-control"> ~ <input
						name="end" type="date"
						style="width: 150px; display: inline-block;" id="end"
						class="form-control">
					<button type="submit" id="searchButton" class="btn btn-primary">조회</button>
				</div>
				<div style="width: 100%; height: 230px; overflow: auto;">
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th scope="col"><input type="checkbox" /></th>
								<th scope="col">점검일자</th>
								<th scope="col">점검코드</th>
								<th scope="col">설비코드</th>
								<th scope="col">설비명</th>
								<th scope="col">점검구분</th>
								<th scope="col">점검담당자</th>
								<th scope="col">판정</th>
							</tr>
						</thead>
						<tbody id="listTable">
							<c:forEach items="${list }" var="item">
								<tr onclick="">
									<td scope="row"><input type="checkbox"></td>
									<td scope="row"><fmt:formatDate value="${item.chckDt}"
											pattern="yyyy/MM/dd" /></td>
									<td scope="row">${item.checkCd}</td>
									<td scope="row">${item.eqmCd}</td>
									<td scope="row">${item.eqmNm}</td>
									<td scope="row">${item.chckFg}</td>
									<td scope="row">${item.chckPsch}</td>
									<td scope="row">${item.jdgmnt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script>
		/* ajax방식 
		var searchInput = document.getElementById("searchInput");
		var dataTable = document.getElementById("listTable");
		var start = document.querySelector("#start");
		var end = document.querySelector("#end");
		document.querySelector("#searchButton").addEventListener("click",function(){
			// Ajax 호출
			var searchKeywords = { eqmNm : searchInput.value, start : start.value, end : end.value }
			$.ajax({
			    url: "searchEqmCheck", // 컨트롤러의 URL
			    type: "POST", // POST 방식
			    dataType: "json", // 응답 데이터 타입
			    contentType: "application/json", // 요청 데이터 타입
			    data: JSON.stringify(searchKeywords), // JSON 객체를 JSON 문자열로 변환하여 전송
			    success: function(response) {
			        // 성공적으로 응답이 왔을 때 처리
			        console.log(response);
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        // 에러가 발생했을 때 처리
			        console.error(textStatus, errorThrown);
			    }
			});	
		}) */

		//script방식 
		// 검색어를 입력할 input 요소의 id를 'searchInput'으로 가정합니다.
		var searchInput = document.getElementById('searchInput');

		// 검색어 입력 시 이벤트 리스너를 등록합니다.
		searchInput.addEventListener('click', function() {
			var keyword = searchInput.value.trim(); // 검색어를 얻어옵니다.
			var table = document.getElementById('listTable'); // 테이블의 tbody 요소를 가져옵니다.
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
	</script>
</body>
</html>