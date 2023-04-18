<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
h5 {
	float: left;
}

.btnGrp {
	float: right;
	padding: 20px 0 15px 0;
}

form {
	clear: both;
}

.addBtn {
	background-color: #0d6efd;
}

table {
	text-align: left;
}

td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.scrollable {
	max-height: 500px;
	overflow: auto;
}

#processList input[type="text"], #processList input[type="date"] {
	border: none;
	height: 47px;
	width: 100%;
	box-sizing: border-box;
}

tbody#processList input:not([readonly]) {
	border-bottom: 1px solid green;
}

#processList td {
	padding: 0;
	vertical-align: middle;
}

#processList select {
	border: none;
	height: 47px;
	width: 100%;
	box-sizing: border-box;
	padding: 0;
	margin: 0;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}
</style>
</head>
<body>
	<div class="card">
		<div class="card-body">

			<!-- Bordered Tabs Justified -->
			<ul class="nav nav-tabs nav-tabs-bordered d-flex"
				id="borderedTabJustified" role="tablist">
				<li class="nav-item flex-fill" role="presentation">
					<button class="nav-link w-100 active" id="home-tab"
						data-bs-toggle="tab" data-bs-target="#bordered-justified-home"
						type="button" role="tab" aria-controls="home" aria-selected="true">공정관리</button>
				</li>
				<li class="nav-item flex-fill" role="presentation">
					<button class="nav-link w-100" id="profile-tab"
						data-bs-toggle="tab" data-bs-target="#bordered-justified-profile"
						type="button" role="tab" aria-controls="profile"
						aria-selected="false" tabindex="-1">공정흐름관리</button>
				</li>
			</ul>
			<div class="tab-content pt-2" id="borderedTabJustifiedContent">
				<div class="tab-pane fade show active" id="bordered-justified-home"
					role="tabpanel" aria-labelledby="home-tab">
					<!-- 테이블 영역 -->
					<div class="card">
						<div class="card-body scrollable">
							<div class="btnGrp">
								<button id="addrow" type="button" class="btn btn-primary">추가</button>
								<button id="deleteList" type="button" class="btn btn-primary">삭제</button>
								<button id="saveList" type="button" class="btn btn-primary">저장</button>
							</div>
							<!-- Table with hoverable rows -->
							<table id="processTable" class="table table-hover">
								<thead>
									<tr>
										<th scope="col"><input type="checkbox"></th>
										<th scope="col">공정구분</th>
										<th scope="col">공정명</th>
										<th scope="col">공정코드</th>
										<th scope="col">공정등록일</th>
										<th scope="col">공정내용</th>
									</tr>
								</thead>
								<tbody id="processList">
									<c:forEach var="item" items="${prcsList}">
										<tr>
											<td><input type="checkbox" /></td>
											<td><select name="prcsFg" disabled>
													<option value="COM"
														${item.prcsFg == 'COM' ? 'selected' : ''}>COM</option>
													<option value="DRY"
														${item.prcsFg == 'DRY' ? 'selected' : ''}>DRY</option>
													<option value="MEN"
														${item.prcsFg == 'MEN' ? 'selected' : ''}>MEN</option>
													<option value="SHR"
														${item.prcsFg == 'SHR' ? 'selected' : ''}>SHR</option>
													<option value="WRA"
														${item.prcsFg == 'WRA' ? 'selected' : ''}>WRA</option>
											</select></td>
											<td><input type="text" value="${item.prcsNm}" readonly></td>
											<td><input type="text" value="${item.prcsCd}" readonly></td>
											<td><input type="date"
												value="<fmt:formatDate value="${item.prcsDt }"
          									pattern="yyyy-MM-dd" />"
												readonly></td>
											<td><input type="text" value="${item.prcsCtnt}" readonly></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- End Table with hoverable rows -->

						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="bordered-justified-profile"
					role="tabpanel" aria-labelledby="profile-tab">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Table with hoverable rows</h5>

							<!-- Table with hoverable rows -->
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">완제품 코드</th>
										<th scope="col">완제품 명</th>
										<th scope="col">규격</th>
										<th scope="col">단위</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${prdList}" var="prd">
										<tr ondblclick="prcsFlow('${prd.edctsCd}')">
											<td>${prd.edctsCd }</td>
											<td>${prd.prdtNm }</td>
											<td>${prd.spec }</td>
											<td>${prd.unit }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- End Table with hoverable rows -->

						</div>
					</div>
					<div class="row" id="prcsFlowBodyList" style="display: none;">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="card">
								<div class="card-body">
									<h5 class="card-title">Table with hoverable rows</h5>

									<!-- Table with hoverable rows -->
									<table class="table table-hover">
										<thead>
											<tr>
												<th scope="col"><input type="checkbox" /></th>
												<th scope="col">순서</th>
												<th scope="col">공정코드</th>
												<th scope="col">공정이름</th>
												<th scope="col">공정분류</th>
												<th scope="col">공정내용</th>
											</tr>
										</thead>
										<tbody id=prcsFlowList>
										</tbody>
									</table>
									<!-- End Table with hoverable rows -->
								</div>
							</div>
						</div>


					</div>
				</div>

			</div>
			<!-- End Bordered Tabs Justified -->

		</div>
	</div>



</body>
<script>
	/* 메세지 체크 */
	$(document)
			.ready(
					function() {
						//추가버튼
						$('#addrow')
								.click(
										function() {
											var newRow = $('<tr class="addTr">');
											newRow
													.append('<td><input class="addchk" type="checkbox"></td>');
											newRow
													.append('<td><select name="prcsFg" >'
															+ '<option value="COM">COM</option>'
															+ '<option value="DRY">DRY</option>'
															+ '<option value="MEN">MEN</option>'
															+ '<option value="SHR">SHR</option>'
															+ '<option value="WRA">WRA</option>'
															+ '</select></td>');
											newRow
													.append('<td><input type="text" name="prcsNm" value=""></td>');
											newRow
													.append('<td><input type="text" name="prcsCd" value=""></td>');
											newRow
													.append('<td><input type="date" name="prcsDt" value="'
															+ new Date()
																	.toISOString()
																	.slice(0,
																			10)
															+ '" readonly></td>');
											newRow
													.append('<td><input type="text" name="prcsCtnt" value=""></td>');
											$('#processList').prepend(newRow);
										});

						//저장버튼
						$('#saveList')
								.click(
										function() {
											var addArr = []; // 데이터 배열 초기화
											// 테이블 내의 각각의 행(tr)에 대해 반복문 실행
											$('#processList tr.addTr')
													.each(
															function() {
																var prcsFg = $(
																		this)
																		.find(
																				'select[name="prcsFg"]')
																		.val();
																var prcsNm = $(
																		this)
																		.find(
																				'input[name="prcsNm"]')
																		.val();
																var prcsCd = $(
																		this)
																		.find(
																				'input[name="prcsCd"]')
																		.val();
																var prcsDt = $(
																		this)
																		.find(
																				'input[name="prcsDt"]')
																		.val();
																var prcsCtnt = $(
																		this)
																		.find(
																				'input[name="prcsCtnt"]')
																		.val();
																addArr
																		.push({
																			"prcsFg" : prcsFg,
																			"prcsNm" : prcsNm,
																			"prcsCd" : prcsCd,
																			"prcsDt" : prcsDt,
																			"prcsCtnt" : prcsCtnt
																		});
															});

											// AJAX 호출
											$
													.ajax({
														type : 'POST',
														url : 'addPrcs',
														data : JSON
																.stringify(addArr),
														contentType : 'application/json; charset=utf-8',
														dataType : 'json',
														success : function(
																result) {
															// 성공적으로 처리된 경우
															console.log(result);
															$(
																	'#processList input:not([readonly])')
																	.attr(
																			'readonly',
																			true)
																	.css(
																			'border',
																			'none');
														},
														error : function(error) {
															// 오류 발생한 경우
															console.log(error);
														}
													});

										});

						$('#deleteList')
								.click(
										function() {
											var checkedBoxes = $('#processList input[type=checkbox]:checked');
											if (checkedBoxes.length === 0) {
												alert('삭제할 데이터를 선택하세요.');
												return;
											}
											if (confirm('삭제하시겠습니까?')) {
												var prcsCdList = [];
												checkedBoxes.each(function() {
													var tr = $(this).closest(
															'tr');
													prcsCdList.push(tr.find(
															'td:eq(3) input')
															.val());
												});
												$
														.ajax({
															url : 'removePrcs',
															type : 'POST',
															data : JSON
																	.stringify(prcsCdList),
															contentType : "application/json",
															success : function(
																	result) {
																checkedBoxes
																		.each(function() {
																			var tr = $(
																					this)
																					.closest(
																							'tr');
																			tr
																					.remove();
																		});
															},
															error : function(
																	xhr,
																	status,
																	error) {
																console
																		.error(error);
																alert('서버와의 통신 중 에러가 발생했습니다.');
															}
														});
											}
										});

						// 체크박스 연결
						$('#processTable')
								.on(
										'click',
										'thead input[type="checkbox"]',
										function() {
											var isChecked = $(this).prop(
													'checked');
											$(
													'#processTable tbody input[type="checkbox"]')
													.prop('checked', isChecked);
										});

						// tbody의 checkbox 중 하나가 체크 해제되었을 때, thead의 checkbox도 체크 해제한다.
						$('#processTable')
								.on(
										'click',
										'tbody input[type="checkbox"]',
										function() {
											var allChecked = true;
											$(
													'#processTable tbody input[type="checkbox"]')
													.each(
															function() {
																if (!$(this)
																		.prop(
																				'checked')) {
																	allChecked = false;
																}
															});
											$(
													'#processTable thead input[type="checkbox"]')
													.prop('checked', allChecked);
										});
					});

	// 공정흐름관리 tr 더블클릭하면 나옴
	function prcsFlow(edctsCd) {
		$("#prcsFlowBodyList").css('display', '');

		$.ajax({
			url : 'prcsFlowList',
			method : 'post',
			data : {edctsCd : edctsCd},
			success : function(result){

				$("#prcsFlowList").empty();
				$(result).each(function(idx, item){
				  let tr = $("<tr>");
					
						tr.append(
  						$("<td>").append(
    					$("<input>").attr("type", "checkbox").attr("name", "chkBox")
  					)
					);

				  tr.append("<td>" + item.prcsNo + "</td>")
				  tr.append("<td>" + item.prcsCd + "</td>")
				  tr.append("<td>" + item.prcsNm + "</td>")
				  tr.append("<td>" + item.prcsFg + "</td>")
				  tr.append("<td>" + item.prcsCtnt + "</td>")
									
				  $("#prcsFlowList").append(tr);
				

				});
			},
			error : function(reject){
				console.log(reject)
			}
			
		})
	}
</script>
</html>