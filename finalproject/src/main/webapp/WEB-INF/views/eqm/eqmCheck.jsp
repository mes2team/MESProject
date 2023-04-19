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
	<h1>설비점검</h1>
	<div class="card">
		<form id="checkForm" action="insertCheck" method="post">
			<div class="card-body">
				<div class="row g-3 align-items-center"
					style="margin-top: 20px; margin-bottom: 5px;">
					<div class="form-group row">
						<div class="col-auto">
							<label style="font-weight: bold;">설비명*</label>
						</div>
						<div class="col-auto">
							<input type="text" hidden name="checkCd"> <input
								type="text" disabled readonly name="eqmNm" class="form-control">
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-success"
								data-bs-toggle="modal" data-bs-target="#modalDialogScrollable">
								조회</button>
						</div>
						<div class="col-auto">
							<label style="font-weight: bold;">설비코드*</label>
						</div>
						<div class="col-auto">
							<input type="text" disabled name="eqmCd" class="form-control"
								readonly>
						</div>

						<div class="col-auto">
							<label style="font-weight: bold;">점검일자*</label>
						</div>
						<div class="col-auto">
							<input type="date" value="" name="chckDt" class="form-control" />
						</div>
					</div>
				</div>
				<hr>

				<div class="row g-3 align-items-center">

					<div class="col-auto" style="margin-left: 10px;">
						<label style="font-weight: bold;">담당자*</label>
					</div>
					<div class="col-auto">
						<select name="chckPsch" class="form-select" style="width: 216px;">
							<option value="" selected disabled hidden>담당자 선택
							<option>
								<c:forEach items="${managers }" var="manager">
									<option value="${manager.name }">${manager.name }</option>
								</c:forEach>
						</select>
					</div>

					<div class="col-auto" style="margin-left: 90px;">
						<label style="font-weight: bold;">점검구분*</label>
					</div>
					<div class="col-auto">
						<label><input type="radio" name="chckFg" value="정기점검">
							정기점검</label> <label><input type="radio" name="chckFg" value="수리">
							수리</label>
					</div>

					<div class="col-auto" style="margin-left: 100px;">
						<label style="font-weight: bold;">판정*</label>
					</div>
					<div class="col-auto">
						<label><input type="radio" name="jdgmnt" value="합격">
							합격</label> <label><input type="radio" name="jdgmnt" value="불합격">
							불합격</label>
							<input type="text" hidden name="chckPerd">
					</div>
					<hr>
				</div>

				<div class="row g-3 align-items-center" style="margin-bottom: 10px;">
					<div class="col-auto">
						<label style="font-weight: bold;">조치내역</label>
					</div>
					<textarea class="form-control col-sm-5" name="dispoCtnt"
						style="width: 500px;" rows="5"></textarea>
					<div class="col-auto" style="margin-left: 50px; margin-top: 100px;">
						<button type="button" onclick="formOptionChk()"
							class="btn btn-primary">저장</button>
						<button type="button" onclick="inputClean()"
							class="btn btn-secondary">초기화</button>
					</div>

				</div>

			</div>
		</form>
	</div>
	<div class="card">
		<div class="card-body">
			<div class="row g-3 align-items-center"
				style="margin-top: 20px; margin-bottom: 50px;">
				<div class="col-auto">
					<label style="font-weight: bold;">설비명</label>
				</div>
				<div class="col-auto">
					<input type="text" id="searchInput" name="searchEqmNm"
						class="form-control">
				</div>
				<div class="col-auto">
					<label style="font-weight: bold;">점검일자</label>
				</div>
				<div class="col-auto">
					<input type="date" style="width: 150px; display: inline-block;"
						id="start" name="startDt" class="form-control"> ~ <input
						name="endDt" type="date"
						style="width: 150px; display: inline-block;" id="end"
						class="form-control">
					<button type="button" onclick="searchCheck()" id="searchButton"
						class="btn btn-success">조회</button>
					<button type="button" onclick="deleteCheck()"
						class="btn btn-danger">삭제</button>
				</div>
				<div style="width: 100%; height: 230px; overflow: auto;">
					<table class="table table-striped table-hover">
						<thead>
							<tr style="position: sticky; top: 0px; background-color: #E2E2E2">
								<th scope="col"><input type="checkbox" id="allCheck"
									onclick="allCheck(this)" /></th>
								<th scope="col">점검일자</th>
								<th scope="col">점검코드</th>
								<th scope="col">설비코드</th>
								<th scope="col">설비명</th>
								<th scope="col">점검구분</th>
								<th scope="col">점검담당자</th>
								<th scope="col">판정</th>
								<th scope="col">다음점검</th>
							</tr>
						</thead>
						<tbody id="listTable">
							<c:forEach items="${list }" var="item">
								<tr onclick="selectCheck('${item.checkCd}',this)">
									<td scope="row"><input type="checkbox"></td>
									<td scope="row"><fmt:formatDate value="${item.chckDt}"
											pattern="yyyy-MM-dd" /></td>
									<td scope="row">${item.checkCd}</td>
									<td scope="row">${item.eqmCd}</td>
									<td scope="row">${item.eqmNm}</td>
									<td scope="row">${item.chckFg}</td>
									<td scope="row">${item.chckPsch}</td>
									<td scope="row">${item.jdgmnt}</td>
									<td scope="row"><fmt:formatDate value="${item.nextChckDt}"
											pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


	<!-- 모달창 -->
	<div class="modal fade" id="modalDialogScrollable" tabindex="-1"
		data-bs-backdrop="static">
		<div
			class="modal-dialog modal-dialog-scrollable modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">설비명 검색</h5>
					<button type="button" class="btn-close closeBtn"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="card-body" style="margin-top: 30px;">
							<div class="form-group row">
								<div class="col-auto">
									<label style="font-weight: bold;">설비명</label>
								</div>
								<div class="col-auto">
									<input type="text" id="modalEqmNm" class="form-control">
									<input id="modalEqmCd" type="hidden">
								</div>
							</div>
							<p>
							<div style="width: 100%; height: 200px; overflow: auto;">
								<table class="table table-striped table-hover">
									<thead>
										<tr
											style="position: sticky; top: 0px; background-color: #E2E2E2">
											<th scope="col"></th>
											<th scope="col">설비구분</th>
											<th scope="col">설비코드</th>
											<th scope="col">설비명</th>
											<th scope="col">사용여부</th>
											<th scope="col">담당자</th>
										</tr>
									</thead>
									<tbody id="modalTableBody">
										<c:forEach items="${eqmList }" var="eqm">
											<tr
												onclick="modalInsertInput('${eqm.eqmNm}','${eqm.eqmCd }', this)">
												<td><input type="checkbox"></td>
												<td>${eqm.eqmFg }</td>
												<td>${eqm.eqmCd }</td>
												<td>${eqm.eqmNm }</td>
												<td>${eqm.useYn }</td>
												<td>${eqm.eqmMng }</td>
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
						onclick="modalEqmSelect()" data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>


	<script>
	
	//메인화면 입력칸 모두
	var checkCd = document.querySelector('[name="checkCd"]');
	var chckDt = document.querySelector('[name="chckDt"]');
	var chckFg = document.querySelectorAll('[name="chckFg"]');
	var chckPsch = document.querySelector('[name="chckPsch"]');
	var checkCd = document.querySelector('[name="checkCd"]');
	var dispoCtnt = document.querySelector('[name="dispoCtnt"]');
	var eqmCd = document.querySelector('[name="eqmCd"]');
	var eqmNm = document.querySelector('[name="eqmNm"]');
	var jdgmnt = document.querySelectorAll('[name="jdgmnt"]');
	var searchEqmNm = document.querySelector('[name="searchEqmNm"]');
	var startDt = document.querySelector('[name="startDt"]');
	var endDt = document.querySelector('[name="endDt"]');
	var chckPerd = document.querySelector('[name="chckPerd"]');
	
	function searchCheck(){
		if(startDt.value == '' && endDt.value != '' || startDt.value != '' && endDt.value == ''){
			Swal.fire({
		          icon: "warning",
		          title: "검색일자를 확인해주세요.",
		        });
			return;	
		}else sendSearch();
	}
	function sendSearch(){
		let sEqmNm = searchEqmNm.value;
		let start = startDt.value;
		let end = endDt.value;
		let dataList = {
			eqmNm : sEqmNm,
			startDt : start,
			endDt : end
		}
		console.log(dataList);
		
		 $.ajax({
			  type: "GET",
			  url: "searchEqmCheck",
			  contentType: "application/json; charset=utf-8",
			  data: dataList, //json.stringify(dataList)
			  dataType: "json",
			  success: function(res) {
			  	makeSearchList(res);	  
			  },
			  error: function(error) {
				  console.log(error)
			  }
			}); 
		
	}
	function makeSearchList(res){
		let listTable = $('#listTable') 
		listTable.empty();
		
		for(let i=0;i<res.length;i++){
			let tr = $('<tr onclick="selectCheck(\'' + res[i].checkCd + '\', this)">');
			tr.append('<td scope="row"><input type="checkbox"></td>');
			let date = changeDateFormat(res[i].chckDt);
			let nextDate = changeDateFormat(res[i].nextChckDt);
    		tr.append('<td>' + date + '</td>'); 
   			tr.append('<td>' + res[i].checkCd + '</td>'); 
    		tr.append('<td>' + res[i].eqmCd + '</td>'); 
   			tr.append('<td>' + res[i].eqmNm + '</td>'); 
    		tr.append('<td>' + res[i].chckFg + '</td>'); 
    		tr.append('<td>' + res[i].chckPsch + '</td>'); 
    		tr.append('<td>' + res[i].jdgmnt + '</td>'); 
    		tr.append('<td>' + nextDate + '</td>');
			listTable.append(tr);
		}
	}
	
	//수정
	function updateCheck(){
		Swal.fire({
			  title: '수정하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '수정',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.value) {
					$.ajax({
					      url: 'updateCheck', 
					      type: 'POST', 
					      data:	$('#checkForm').serialize(),
					      //dataType: 'json', 화면 받을 땐 없어도 됨
					      success: function(result) { 
							afterUpdate();
							inputClean();
							Toast.fire({
				                  icon: "success",
				                  title: "수정이 정상적으로 되었습니다.",
				                });  
					      },
					      error: function(reject) { 
					        console.log("업데이트실패");
					      }
					    });	
			  }
			})
	}
	function afterUpdate(){
		 $.ajax({
			  url: "afterUpdate",
			  type: "GET",
			  dataType: "json",
			  success: function(res) {
				  makeSearchList(res);	  
			  },
			  error: function(error) {
				  console.log(error)
			  }
			}); 	
	}
	
	function afterInsert(){
		 $.ajax({
			  url: "afterInsert",
			  type: "GET",
			  dataType: "json",
			  success: function(res) {
				  makeSearchList(res);	
			  },
			  error: function(error) {
				  console.log(error)
			  }
			}); 	
	}
	//수정시 tr새로 그리기
	function updateTr(){
	  let deleteTd = listTable.querySelectorAll('td')
	  for(let i=0; i<deleteTd.length; i++){
		  if(deleteTd[i].innerText == checkCd.value){
			  deleteTd[i].closest('tr').remove()
		  }
	  }
		 let tr = document.createElement("tr")
   	  tr.onclick = function(){
   		  let megeChkCd = this.children[2].innerText
   		  selectCheck(megeChkCd,this)
   	  }
   	  let checkbox = document.createElement("input");
   	  checkbox.type = "checkbox";
   	  
   	  let tds = [];
   	  for(let l=0; l<9; l++){
   		  let td = document.createElement("td");
   		  tds.push(td)
   	  }
   	  tds[0].appendChild(checkbox)
		  tds[1].innerText = chckDt.value;
   	  tds[2].innerText = checkCd.value;
   	  tds[3].innerText = eqmCd.value;
   	  tds[4].innerText = eqmNm.value;
   	  tds[5].innerText = chckFgVal();
   	  tds[6].innerText = chckPsch.value;
   	  tds[7].innerText = jdgmntVal();
   	  tds[8].innerText = nextDt(chckDt.value);
   	  
		  for(let m=0;m<tds.length;m++){
		  tr.appendChild(tds[m])
		  }
   	  listTable.append(tr);	
	}
		//등록시 빈칸체크 (저장버튼 눌렀을시 실행 됨)
		function formOptionChk(){
			let inputs = checkForm.querySelectorAll("input")
			let select = checkForm.querySelector('select')
			for(let i=1;i<4;i++){
				if(inputs[i].value == ''){
					Swal.fire({
				          icon: "warning",
				          title: "필수항목을 확인해주세요.",
				        });
					return;
				}
			}
			if(select.value == ''){
				Swal.fire({
			          icon: "warning",
			          title: "담당자를 확인해주세요.",
			        });	
			}else if(inputs[4].checked == false && inputs[5].checked == false){
				Swal.fire({
			          icon: "warning",
			          title: "점검구분을 확인해주세요.",
			        });
				return;
			}else if(inputs[6].checked == false && inputs[7].checked == false){
				Swal.fire({
			          icon: "warning",
			          title: "판정을 확인해주세요.",
			        });
				return;
			}
			
			if(checkCd.value != ''){//점검코드 비지 않았으면 수정
				updateCheck();	
			}else{
				//그렇지 않으면 새로운 등록
				//전송 보내기 전 disabled 풀기
				let disableds = document.querySelectorAll('input:disabled');
				for(j=0;j<disableds.length;j++){
					disableds[j].disabled = false;
				}
			Swal.fire({
				  title: '점검내역을 추가하시겠습니까?',
				  icon: 'question',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '추가',
				  cancelButtonText: '취소'
				}).then((result) => {
				  if (result.value) {
					  $.ajax({
					      url: '/spring/insertCheck', 
					      type: 'POST', 
					      data:	$('#checkForm').serialize(),//form안의 데이터 "eqmCd=EQM1000&checkCd=CHK1000" 요런식으로 만드는 과정
					      //dataType: 'json', 화면 받을 땐 없어도 됨
					      success: function(result) { 
					    	  console.log(result)
					    	  for(k=0;k<disableds.length;k++){
									disableds[k].disabled = false;
								}
					    	  inputClean();
					    	  for(let j=0;j<disableds.length;j++){
					  		    disableds[j].disabled = true;
					  			}
					    	  afterInsert();
					    	  Toast.fire({
				                  icon: "success",
				                  title: "추가가 정상적으로 되었습니다.",
				                });  
					    	  
					      },
					      error: function(reject) { 
					        console.log("안됨"+reject);
					      }
					    });	
		
				  }
				})}
		}
		//최대점검코드 구하는함수(tr그리기용)
		function maxCheckCd(){
			let max = 999;
			let trs = listTable.querySelectorAll("tr")
			let cds = [];
			
			for(let i=0; i<trs.length; i++){
				let number = parseInt(trs[i].children[2].innerText.substring(3))
				if(max < number){
					max = number //1000
				} 
			}
			return'CHK'+(max+1) ;
		} 
		//tr그리기용 점검구분, 판정 구하는 함수
		function chckFgVal(){
			for(let i=0 ; i<chckFg.length;i++){
				if(chckFg[i].checked){
					return chckFg[i].value;
				}
			}
		}
		function jdgmntVal(){
			for(let i=0 ; i<jdgmnt.length;i++){
				if(jdgmnt[i].checked){
					return jdgmnt[i].value;
				}
			}
		}
		
		//삭제 체크된것만 담기
		function deleteCheck(){
			let checkList = listTable.querySelectorAll('[type="checkbox"]');			
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
					  url: "/spring/deleteCheck",
					  data: JSON.stringify(deleteList),
					  contentType: "application/json; charset=utf-8",
					  //dataType: "json",
					  success: function(response) {
						  console.log("삭제완료")
						 
						  for(let j=0;j<checkList.length;j++){
							  if(checkList[j].checked){
							  checkList[j].closest('tr').remove();
							  }
						  }	
						  inputClean();
						  
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
	function checkCancel(tr){
		let checkes = listTable.querySelectorAll('[type="checkbox"]');
		let allCheck = document.querySelector('#allCheck');
		let checkTrue = true;
		for(let i=0;i<checkes.length;i++){
			if(checkes[i].checked == false){
				allCheck.checked = false;
				checkTrue = false;
				return;
			}
			if(checkTrue){
				allCheck.checked = true;
			}
		}
	}
		
		//tr클릭시 단건조회, check
		function selectCheck(chkCd, tr) {
			let checkbox = tr.querySelector('[type="checkbox"]')
			if (checkbox.checked) {
				checkbox.checked = false;
			} else
				checkbox.checked = true;
			checkCancel(tr);
			$.ajax({
				url : '/spring/selectCheck?checkCd=' + chkCd, // 조회 API의 URL
				type : 'GET', // HTTP 요청 방식
				dataType : 'json', // 응답 데이터 타입
				success : function(res) { // 요청이 성공했을 때
					chckDt.value = changeDateFormat(res.chckDt);
					chckPsch.value = res.chckPsch;
					dispoCtnt.value = res.dispoCtnt;
					eqmCd.value = res.eqmCd;
					eqmNm.value = res.eqmNm;
					checkCd.value = res.checkCd;
					chckPerd.value = res.chckPerd;
					for (let i = 0; i < jdgmnt.length; i++) {
						if (jdgmnt[i].value == res.jdgmnt) {
							jdgmnt[i].checked = true;
						}
						if (chckFg[i].value == res.chckFg) {
							chckFg[i].checked = true;
						}
					}
				},
				error : function(reject) { // 요청이 실패했을 때
					console.log(reject);
				}
			});
		}

		//모달 tr클릭시 검색어 들어가고 체크되게
		function modalInsertInput(eqmNm, eqmCd, tr) {
			let checkbox = tr.querySelector("input");
			let trs = document.querySelector("#modalTableBody")
					.querySelectorAll("tr");
			for (let i = 0; i < trs.length; i++) {
				trs[i].querySelector("input").checked = false;
			}
			checkbox.checked = true;
			document.querySelector('#modalEqmNm').value = eqmNm;
			document.querySelector('#modalEqmCd').value = eqmCd;

		}
		//모달 확인버튼시 메인화면에 설비정보 뿌려지게
		function modalEqmSelect() {
			inputClean();
			let eqmCd = document.querySelector('#modalEqmCd').value;
			$.ajax({
				url : '/spring/eqmDetail?eqmCd=' + eqmCd,
				type : 'GET',
				dataType : 'json',
				success : function(res) {
					document.querySelector('[name="eqmCd"]').value = res.eqmCd;
					eqmNm.value = res.eqmNm;
					modalReset();

				},
				error : function(reject) { // 요청이 실패했을 때
					console.log(reject);
				}
			});
		}

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

		//script방식 메인화면 검색 
		// 검색어를 입력할 input 요소의 id를 'searchInput'으로 가정합니다.
		var searchInput = document.getElementById('searchInput');

		// 검색어 입력 시 이벤트 리스너를 등록합니다.
		searchButton.addEventListener('click', function() {
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

		//모달창 검색
		// 검색어를 입력할 input 요소의 id를 'searchInput'으로 가정합니다.
		var searchInput = document.getElementById('modalEqmNm');

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

		//날짜포맷변경
		function changeDateFormat(inputDate) {
			let date = new Date(inputDate);
			let year = date.getFullYear();
			let month = String(date.getMonth() + 1).padStart(2, '0');
			let day = String(date.getDate()).padStart(2, '0');
			let formattedDate = year + '-' + month + '-' + day;
			return formattedDate;
		}
		//전체체크
		function allCheck(allCheck) {
			let checkes = listTable.querySelectorAll('[type="checkbox"]')
			for (let i = 0; i < checkes.length; i++) {
				checkes[i].checked = allCheck.checked;
			}
			
		}
		

		//클린버튼
		function inputClean() {
			checkCd.value = '';
			chckDt.value = '';
			chckPsch.value = '';
			dispoCtnt.value = '';
			eqmCd.value = '';
			eqmNm.value = '';
			for(let i=0;i<jdgmnt.length;i++){
			jdgmnt[i].checked = false;
			chckFg[i].checked = false;
			}
		}
		//checkbox직접클릭시 체크
		listTable.querySelectorAll('input[type="checkbox"]').forEach(function(checkbox) {
			  checkbox.addEventListener('click', function(event) {
			    // 이벤트 핸들러 내에서 이벤트 버블링 막기
			    event.stopPropagation();
			  });
			});

		//모달 창 닫으면 리셋
		function modalReset() {
			document.querySelector('#modalEqmNm').value = '';
			let trs = document.querySelector("#modalTableBody")
					.querySelectorAll("tr");
			for (let i = 0; i < trs.length; i++) {
				trs[i].querySelector("input").checked = false;
			}

		}
		function nextDt(dt){
			
		}
		
		
		
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