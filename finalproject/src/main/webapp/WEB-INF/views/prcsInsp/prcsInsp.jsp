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
	<h1>공정검사관리</h1>
	<!-- ============================================ -->
	<div class="card">
		<div class="card-body">
			<!-- Bordered Tabs Justified -->
			<ul class="nav nav-tabs nav-tabs-bordered d-flex"
				id="borderedTabJustified" role="tablist">
				<li class="nav-item flex-fill" role="presentation">
					<button class="nav-link w-100 active" id="home-tab"
						data-bs-toggle="tab" data-bs-target="#bordered-justified-home"
						type="button" role="tab" aria-controls="home" aria-selected="true">공정검사등록</button>
				</li>
				<li class="nav-item flex-fill" role="presentation">
					<button onclick="completedList()" class="nav-link w-100"
						id="profile-tab" data-bs-toggle="tab"
						data-bs-target="#bordered-justified-profile" type="button"
						role="tab" aria-controls="profile" aria-selected="false"
						tabindex="-1">공정검사조회</button>
				</li>
			</ul>
			<div class="tab-content pt-2" id="borderedTabJustifiedContent">
				<div class="tab-pane fade active show" id="bordered-justified-home"
					role="tabpanel" aria-labelledby="home-tab">
					<!-- ========================================================================================================================= -->
					<form id="mainForm">
						<div class="card">
							<div class="card-body">

								<div class="row g-3 align-items-center"
									style="margin-top: 20px; margin-bottom: 5px;">
									<div class="form-group row">
										<div class="col-auto">
											<label style="font-weight: bold;">지시코드*</label>
										</div>
										<div class="col-auto" style="margin-left: 15px;">
											<input type="text" disabled readonly name="indicaCd"
												class="form-control">
										</div>
										<div class="col-auto">
											<button type="button" onclick="selectPrcsList()"
												class="btn btn-success" data-bs-toggle="modal"
												data-bs-target="#modalDialogScrollable">조회</button>
										</div>
										<div class="col-auto">
											<label style="font-weight: bold; margin-left: 35px">공정코드*</label>
										</div>
										<div class="col-auto" style="margin-left: 15px">
											<input type="text" disabled name="prcsCd"
												class="form-control" readonly>
										</div>
										<div class="col-auto">
											<label style="font-weight: bold; margin-left: 35px">공정명*</label>
										</div>
										<div class="col-auto" style="margin-left: 20px">
											<input type="text" disabled name="prcsNm"
												class="form-control" readonly>
										</div>
									</div>
								</div>
								<hr>
								<div class="row g-3 align-items-center"
									style="margin-top: 20px; margin-bottom: 5px;">
									<div class="form-group row">
										<div class="col-auto">
											<label style="font-weight: bold;">제품코드*</label>
										</div>
										<div class="col-auto" style="margin-left: 15px">
											<input type="text" name="edctsCd" disabled readonly
												class="form-control">
										</div>
										<div class="col-auto" style="margin-left: 120px">
											<label style="font-weight: bold;">제품명*</label>
										</div>
										<div class="col-auto" style="margin-left: 28px">
											<input type="text" name="prdtNm" disabled readonly
												class="form-control">
										</div>
										<div class="col-auto"></div>
										<div class="col-auto" style="margin-left: 10px;">
											<label style="font-weight: bold;">검사량*</label>
										</div>
										<div class="col-auto" style="margin-left: 5px;">
											<input type="text" disabled name="prodCnt"
												class="form-control" readonly>
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
										<div class="col-auto" style="margin-left: 15px;">
											<input box="mainInput" style="width: 214px" type="date"
												name="prcsInspDt" class="form-control">
										</div>

										<div class="col-auto" style="margin-left: 117px">
											<label style="font-weight: bold;">검사담당자*</label>
										</div>
										<div class="col-auto">
											<select box="mainInput" name="prcsInspMng"
												class="form-select" style="width: 216px;">
												<option value="" selected disabled hidden>담당자 선택
												<option>
													<c:forEach items="${empList }" var="emp">
														<option value="${emp.name }">${emp.name }</option>
													</c:forEach>
											</select> <input type="text" style="display: none" name="prcsChkCd"
												value="${maxChkCd.prcsChkCd }">
										</div>


										<div class="col-auto" style="margin-left: 35px" hidden>
											<label style="font-weight: bold;">최종판정*</label>
										</div>
										<div class="col-auto" style="margin-left: 15px" hidden>
											<label><input type="radio" name="chckFg" value="적합">
												적합</label> <label><input type="radio" name="chckFg"
												value="부적합"> 부적합</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 첫번째 카드마무리 -->
						<div class="card">
							<div class="card-body">
							<div style="width: 100%; height: 230px; overflow: auto;">
								<table class="table table-striped table-hover"
									style="margin-top: 20px; margin-bottom: 5px;">
									<thead>
										<tr
											style="position: sticky; top: 0px; background-color: #E2E2E2">
											<th></th>
											<th>검사코드</th>
											<th>검사명</th>
											<th>검사기준</th>
											<th>검사결과*</th>
											<th>결과판정*</th>
										</tr>
									</thead>
									<tbody id="mainBody">

									</tbody>
								</table>
								</div>
								<div id="inferInput" class="row g-3 align-items-center" hidden>
									<div class="col-auto" width="" style="margin-left: 815px">
										<label style="font-weight: bold;">총불량량*</label>
									</div>
									<div class="col-auto">
										<input box="mainInput" type="number" min=0 value=0
											name="inferCnt" class="form-control">
									</div>
									<div class="col-auto" style="margin-left: 220px;">
										<button type="button" onclick="formOptCheck()"
											class="btn btn-primary" style="">등 록</button>
									</div>
								</div>
							</div>
						</div>
					</form>
					<!-- ==========================위쪽은 검사등록창========================== -->
				</div>
				<div class="tab-pane fade" id="bordered-justified-profile"
					role="tabpanel" aria-labelledby="profile-tab">
					<!-- ===========================아래는검사완료조회창================================== -->
					<div class="card">
						<div class="card-body">
							<div class="row g-3 align-items-center"
								style="margin-top: 20px; margin-bottom: 5px;">
								<div class="col-auto">
									<label style="font-weight: bold;">검색</label>
								</div>
								<div class="col-auto" style="margin-left: 15px;">
									<input id="completedSearch" type="text" class="form-control">
								</div>
								<div class="col-auto" style="margin-left: 15px;">
									<button type="button" class="btn btn-danger"
										onclick="deleteCompleted()">삭제</button>
								</div>
							</div>
							<hr>
							<div class="row g-3 align-items-center"
								style="margin-bottom: 5px;">
								<table class="table table-striped table-hover"
									style="margin-top: 20px; margin-bottom: 5px;">
									<thead>
										<tr
											style="position: sticky; top: 0px; background-color: #E2E2E2">
											<th></th>
											<th>검사일</th>
											<th>검사코드</th>
											<th>공정명</th>
											<th>제품명</th>
											<th>검사량</th>
										</tr>
									</thead>
									<tbody id="completedBody">
									</tbody>
								</table>
							</div>

						</div>
					</div>
					<!-- =============================위쪽은검사조회창================================== -->
				</div>
				<!-- End Bordered Tabs Justified -->
			</div>
		</div>
	</div>



	<!-- ============================================ -->


	<!-- 모달창 -->
	<div class="modal fade" id="modalDialogScrollable" tabindex="-1"
		data-bs-backdrop="static">
		<div
			class="modal-dialog modal-dialog-scrollable modal-dialog modal-lg">
			<div id="insertModal" class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">검사 목록</h5>
					<button type="button" class="btn-close closeBtn"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="card-body" style="margin-top: 30px;">
							<div class="form-group row">
								<div class="col-auto">
									<label style="font-weight: bold;">검색</label>
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
											<th scope="col">지시코드</th>
											<th scope="col">공정코드</th>
											<!--공정별 검사기준 -->
											<th scope="col">공정명</th>
											<th scope="col">제품코드</th>
											<!-- 제품별 검사기준 -->
											<th scope="col">제품명</th>
											<th scope="col">검사량</th>
										</tr>
									</thead>
									<tbody id="modalTableBody">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary closeBtn"
						data-bs-dismiss="modal" onclick="">닫기</button>
					<button type="button" class="btn btn-primary"
						onclick="modalPrcsSelect()" data-bs-dismiss="modal">확인</button>
				</div>
			</div>
			<!-- 위로는 첫번째 등록시 모달창 아래로는 검사완료 상세보기 모달창-->
			<div id="selectModal" class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"></h5>
					<button type="button" class="btn-close closeBtn"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary closeBtn"
						data-bs-dismiss="modal" onclick="">닫기</button>
					<button type="button" class="btn btn-primary" onclick=""
						data-bs-dismiss="modal">확인</button>
				</div>
			</div>

		</div>
	</div>

	<button hidden type="button" id="detail" class="btn btn-primary"
		data-bs-toggle="modal" data-bs-target="#largeModal">Large
		Modal</button>

	<div class="modal fade" id="largeModal" tabindex="-1"
		style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">검사상세보기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="card-body" style="margin-top: 30px;">

							<p>
							<div style="width: 100%; height: 200px; overflow: auto;">
								<table class="table table-striped table-hover">
									<thead>
										<tr
											style="position: sticky; top: 0px; background-color: #E2E2E2">
											<th scope="col">No</th>
											<th scope="col">검사코드</th>
											<th scope="col">검사명</th>
											<th scope="col">검사기준</th>
											<th scope="col">검사결과</th>
											<th scope="col">결과판정</th>
										</tr>
									</thead>
									<tbody id="prcsDtlBody">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		//삭제 체크된것만 담기
		function deleteCompleted(){
			let checkList = completedBody.querySelectorAll('[type="checkbox"]');			
			let deleteList = [];
			for(let i=0; i<checkList.length; i++){
				if(checkList[i].checked){
					deleteList.push(checkList[i].closest('tr').children[2].innerText);
				}
			}
			Swal.fire({
				  title: '선택항목들을 삭제 하시겠습니까?',
				  icon: 'question',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '삭제',
				  cancelButtonText: '취소'
				}).then((result) => {
				  if (result.value) {
					//삭제
					   $.ajax({
					  type: "POST",
					  url: "/spring/deleteCompleted",
					  data: JSON.stringify(deleteList),
					  contentType: "application/json; charset=utf-8",
					  success: function(response) {
						  console.log(response)
						 
						   for(let j=0;j<checkList.length;j++){
							  if(checkList[j].checked){
							  checkList[j].closest('tr').remove();
							  }
						  }	 
						  Toast.fire({
			                  icon: "success",
			                  title: "삭제가 정상적으로 되었습니다.",
			                });   
						  
					  },
					  error: function(error) {
						  console.log(error)
					  }
					});  
				  }
				})
		}
		
			//검사완료 단건조회 tr클릭
			function seeInspDtl(t) {
				let selectModal = $('#selectModal'); //검사완료 상세보기 모달 안 보이게
				selectModal.attr('hidden', false);

				let insertModal = $('#insertModal'); //검사등록할 리스트모달 보이게
				insertModal.attr('hidden', true);

				let chkCd = t.children[2].innerText

				$.ajax({
					type : "GET",
					url : "/spring/inspDtl?prcsChkCd=" + chkCd,
					dataType : "json",
					success : function(res) {
						console.log(res);
						$('#prcsDtlBody').empty();
						for (let i = 0; i < res.length; i++) {
							let tr = $('<tr>')
							tr.append('<td>' + i + '</td>')
							tr.append('<td>' + res[i].prcsInspCd + '</td>')
							tr.append('<td>' + res[i].prcsInspNm + '</td>')
							tr.append('<td>' + res[i].prcsInspStd + '</td>')
							tr.append('<td>' + res[i].prcsInspRst + '</td>')
							tr.append('<td>' + res[i].prcsInspJdg + '</td>')
							$('#prcsDtlBody').append(tr);
						}
						document.querySelector('#detail').click();
						
					},
					error : function(error) {
						console.log(error)
					}
				});
			}

			//조회페이지이동시 검사완료리스트 호출
			function completedList() {
				$.ajax({
					type : "GET",
					url : "/spring/selectCompletedList",
					dataType : "json",
					success : function(res) {
						makeCompletedList(res);
					},
					error : function(error) {
						console.log(error)
					}
				});
			}
			
			//검사완료리스트 만들기
			function makeCompletedList(res) {
				let completedBody = $('#completedBody');
				completedBody.empty();
				for (let i = 0; i < res.length; i++) {
					let tr = $('<tr ondblclick="seeInspDtl(this)" >')
					tr.append('<td><input type="checkbox"></td>')
					let prcsInspDt = new Date(res[i].prcsInspDt);
					let formattedDate = prcsInspDt.toISOString().substring(0,
							10);
					tr.append('<td>' + formattedDate + '</td>')
					tr.append('<td>' + res[i].prcsChkCd + '</td>')
					tr.append('<td>' + res[i].prcsNm + '</td>')
					tr.append('<td>' + res[i].prdtNm + '</td>')
					tr.append('<td>' + res[i].prodCnt + '</td>')
					completedBody.append(tr);
				}
			}
			function formOptCheck(){
				let options = document.querySelectorAll('[box="mainInput"]');
				for(let i=0;i<options.length;i++){
					if(options[i].value == ''){
						Swal.fire({
					          icon: "warning",
					          title: "필수항목을 확인해주세요.",
					        });
						return;
					}else {
						Swal.fire({
							  title: '검사를 등록 하시겠습니까?',
							  icon: 'question',
							  showCancelButton: true,
							  confirmButtonColor: '#3085d6',
							  cancelButtonColor: '#d33',
							  confirmButtonText: '확인',
							  cancelButtonText: '취소'
							}).then((result) => {
							  if (result.value) {
								  insertInsp();
							  }
							})	
					}
				}
				
			}

			//검사완료 등록
			function insertInsp() {
				let dataList = [];
				var prcsInspCd = document
						.querySelectorAll('[name="prcsInspCd"]');//공정검사코드 
				var prcsInspNm = document
						.querySelectorAll('[name="prcsInspNm"]');//검사명 
				var prcsInspStd = document
						.querySelectorAll('[name="prcsInspStd"]');//기준 
				var prcsInspRst = document
						.querySelectorAll('[name="prcsInspRst"]');//검사결과 
				var prcsInspJdg = document
						.querySelectorAll('[name="prcsInspJdg"]');//결과판정 
				var inferCnt = document.querySelector('[name="inferCnt"]'); //불량량

				var DprcsChkCd = prcsChkCd.value;
				var DindicaCd = indicaCd.value;
				var DprcsCd = prcsCd.value;
				var DprcsNm = prcsNm.value;
				var DedctsCd = edctsCd.value;
				var DprdtNm = prdtNm.value;
				var DprodCnt = prodCnt.value - inferCnt.value;
				var DprcsInspDt = prcsInspDt.value;
				var DprcsInspMng = prcsInspMng.value;
				var DinferCnt = inferCnt.value; //불량량
				var DprcsNm = prcsNm.value; //공정명
				var DedctsExpire = makeExpireDate(prcsInspDt.value); //유통기한

				var stdTrs = mainBody.querySelectorAll('tr')
				for (let i = 0; i < stdTrs.length; i++) {

					let DprcsInspCd = prcsInspCd[i].innerText;
					let DprcsInspNm = prcsInspNm[i].innerText;
					let DprcsInspStd = prcsInspStd[i].innerText;
					let DprcsInspRst = prcsInspRst[i].value;
					let DprcsInspJdg = prcsInspJdg[i].value;

					//불량량을 제외한 모든 검사결과 ajax보낼 데이터담기
					let data = {
						prcsChkCd : DprcsChkCd,
						indicaCd : DindicaCd,
						prcsCd : DprcsCd,
						prcsNm : DprcsNm,
						edctsCd : DedctsCd,
						prdtNm : DprdtNm,
						prodCnt : DprodCnt,
						prcsInspDt : DprcsInspDt,
						prcsInspMng : DprcsInspMng,
						prcsInspCd : DprcsInspCd,
						prcsInspNm : DprcsInspNm,
						prcsInspStd : DprcsInspStd,
						prcsInspRst : DprcsInspRst,
						prcsInspJdg : DprcsInspJdg,
						edctsExpire : DedctsExpire
					}
					dataList.push(data);
					
				}
				//불량량,공정명 ajax보낼 배열에 담기

				let inferData = {
					prcsChkCd : DprcsChkCd,
					prcsCd : DprcsCd,
					indicaCd : DindicaCd,
					inferCnt : DinferCnt,
					prcsNm : DprcsNm,
					prodCnt : DprodCnt
					
				}
				dataList.push(inferData);
				console.log(dataList);

				$.ajax({
					type : "POST",
					url : "/spring/chkDone",
					data : JSON.stringify(dataList),
					contentType : "application/json; charset=utf-8",
					//dataType: "json",
					success : function(res) {
						location.reload();
						Toast.fire({
			                  icon: "success",
			                  title: "등록이 정상적으로 되었습니다.",
			                });  
					},
					error : function(error) {
						console.log(error);
					}
				});

			}
			//유통기한 만들기
			function makeExpireDate(inspDt) {
				// inspDt를 Date 객체로 변환
				const inspectionDate = new Date(inspDt);

				// 3년을 더하기 위해 연도에 3을 더함
				const expireYear = inspectionDate.getFullYear() + 3;

				// 연도에 3을 더한 날짜를 설정
				inspectionDate.setFullYear(expireYear);

				// 만료일자를 YYYY-MM-DD 형식으로 반환
				const expireDate = inspectionDate.toISOString().slice(0, 10);

				return expireDate;
			}

			//조회버튼 모달열면 검사리스트 뿌리기
			function selectPrcsList() {
				let insertModal = $('#insertModal'); //검사등록할 리스트모달 보이게
				insertModal.attr('hidden', false);

				let selectModal = $('#selectModal'); //검사완료 상세보기 모달 안 보이게
				selectModal.attr('hidden', true);

				$.ajax({
					url : "selectPrcsList", // 호출하고자 하는 URL
					type : "GET", // HTTP 메소드 (GET, POST, PUT, DELETE 등)
					dataType : "json", // 응답 데이터 타입 (json, xml, text 등)
					success : function(res) {
						let tbody = $("#modalTableBody"); // 테이블의 tbody 선택
						tbody.empty(); // tbody의 내용을 초기화

						for (let i = 0; i < res.length; i++) {
							let tr = $("<tr onclick='selectPrcs(\""
									+ res[i].prcsNm + "\", this)'>");
							tr.append("<td><input type='checkbox'></td>");
							tr.append("<td>" + res[i].indicaCd + "</td>");
							tr.append("<td>" + res[i].prcsCd + "</td>");
							tr.append("<td>" + res[i].prcsNm + "</td>");
							tr.append("<td>" + res[i].edctsCd + "</td>");
							tr.append("<td>" + res[i].prdtNm + "</td>");
							tr.append("<td>" + res[i].indicaCnt + "</td>");

							tbody.append(tr);
						}
					},
					error : function(reject) {
						console.log(reject);
					}
				});
			}
			//공정명 선택시 체크 후 검색창에 공정명 등록
			function selectPrcs(prcsNm, tr) {
				let checkbox = tr.querySelector("input");
				let trs = document.querySelector("#modalTableBody")
						.querySelectorAll("tr");
				for (let i = 0; i < trs.length; i++) {
					trs[i].querySelector("input").checked = false;
				}
				checkbox.checked = true;
				$('#searchInput').val(prcsNm)
			}

			//메인화면 모든 input창
			var indicaCd = document.querySelector('[name="indicaCd"]'); //지시코드
			var prcsCd = document.querySelector('[name="prcsCd"]'); //공정코드
			var prcsNm = document.querySelector('[name="prcsNm"]'); //공정명
			var edctsCd = document.querySelector('[name="edctsCd"]'); //제품코드
			var prdtNm = document.querySelector('[name="prdtNm"]'); //제품명
			var prodCnt = document.querySelector('[name="prodCnt"]'); //생산량==검사량
			var prcsInspDt = document.querySelector('[name="prcsInspDt"]'); //검사일자
			var prcsInspMng = document.querySelector('[name="prcsInspMng"]'); //검사담당자	    
			var prcsChkCd = document.querySelector('[name="prcsChkCd"]');//맥스검사완료코드

			//모달
			//검사할 공정 선택 확인버튼 
			function modalPrcsSelect() {
				let checkboxes = modalTableBody
						.querySelectorAll('[type="checkbox"]');
				let checkedTr = ''
				for (let i = 0; i < checkboxes.length; i++) {
					if (checkboxes[i].checked) {
						checkedTr = checkboxes[i].closest('tr')
					}
				}
				//모달에서 선택한 값들이 메인에 뿌려지게
				let tds = checkedTr.querySelectorAll('td');
				indicaCd.value = tds[1].innerText; //지시코드
				prcsCd.value = tds[2].innerText; //공정코드
				prcsNm.value = tds[3].innerText; //공정명
				edctsCd.value = tds[4].innerText; //제품코드
				prdtNm.value = tds[5].innerText; //제품명
				prodCnt.value = tds[6].innerText; //생산량==검사량
				let cd = tds[2].innerText;
				selectPrcsStd(cd); //공정별 검사기준 가져오기 

			}

			//공정별 검사기준 그리기 
			function selectPrcsStd(cd) {
				$
						.ajax({
							url : "selectPrcsStd?prcsCd=" + cd, // 호출하고자 하는 URL
							type : "GET", // HTTP 메소드 (GET, POST, PUT, DELETE 등)
							dataType : "json", // 응답 데이터 타입 (json, xml, text 등)
							success : function(res) {
								let mainBody = $('#mainBody');
								mainBody.empty();
								for (let i = 0; i < res.length; i++) {
									let tr = $('<tr>');
									tr.append('<td></td>')
									tr.append('<td name="prcsInspCd">'
											+ res[i].prcsInspCd + '</td>')
									tr
											.append('<td name="prcsInspNm" style="width: 200px">'
													+ res[i].prcsInspNm
													+ '</td>')
									tr
											.append('<td name="prcsInspStd" style="width: 500px">'
													+ res[i].prcsInspStd
													+ '</td>')
									//포장공정일 경우 input 다르게
									if (prcsCd.value == 'PRCS5000') {
										tr
												.append('<td><input box="mainInput" class="rstInputs" min=0 placeholder="불량갯수 직접입력" name="prcsInspRst" type="number"></td>')
										tr
												.append('<td><select disabled name="prcsInspJdg"><option value="적합">적합</option><option value="부적합">부적합</option></select></td>')
									} else {
										tr
												.append('<td><input class="" box="mainInput" name="prcsInspRst" type="text"></td>')
										tr
												.append('<td><select name="prcsInspJdg"><option value="적합">적합</option><option value="부적합">부적합</option></select></td>')
									}
									mainBody.append(tr);
								}
								showInferInput();//불량갯수 input 보이게
								inferSum(); //포장 불량량 자동계산되게
							},
							error : function(reject) {
								console.log(reject);
							}
						});
			}

			//포장일때 갯수 등록하면 자동계산
			function inferSum() {
				let rstInputs = document.querySelectorAll('.rstInputs');
				let inferCnt = document.querySelector('[name="inferCnt"]');
				for (var i = 0; i < rstInputs.length; i++) {
					rstInputs[i].addEventListener('input', function() {
						var sum = 0;
						// class가 rstInputs인 모든 input 태그의 값을 더함
						for (var i = 0; i < rstInputs.length; i++) {
							sum += parseInt(rstInputs[i].value) || 0;
						}
						inferCnt.value = sum;
					});
				}
			}

			//메인바디가 비지않았다면 불량갯수 input hidden해제
			function showInferInput() {
				if (mainBody.children.length != 0) {
					$('#inferInput').removeAttr("hidden");
				} else
					$('#inferInput').attr("hidden", true);
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

			//검사완료검색
			// 검색어를 입력할 input 요소의 id를 'searchInput'으로 가정합니다.
			var searchInput = document.getElementById('completedSearch');

			// 검색어 입력 시 이벤트 리스너를 등록합니다.
			searchInput.addEventListener('input', function() {
				var keyword = searchInput.value.trim(); // 검색어를 얻어옵니다.
				var table = document.getElementById('completedBody'); // 테이블의 tbody 요소를 가져옵니다.
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
			
			var Toast = Swal.mixin({
	            toast: true,
	            position: "top",
	            showConfirmButton: false,
	            timer: 1500,
	            timerProgressBar: true,
	            didOpen: (toast) => {
	              toast.addEventListener("mouseenter", Swal.stopTimer);
	              toast.addEventListener("mouseleave", Swal.resumeTimer);
	            },
	          });
		</script>
</body>
</html>