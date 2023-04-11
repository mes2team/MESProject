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
	<h1>비가동관리</h1>
	<div class="card">
		<div class="card-body">
			<div class="form-group row" style="margin-top: 20px; margin-bottom:;">
				<div class="col-auto">
					<label style="font-weight: bold;">검색</label>
				</div>
				<div class="col-auto">
					<input type="text" id="modalEqmNm" class="form-control">
				</div>
				<div class="col-auto">
					<button type="button" class="btn btn-primary" onclick="modalOpen()"
						data-bs-toggle="modal" data-bs-target="#modalDialogScrollable">
						등록</button>
				</div>
				<div class="col-auto">
					<button type="button" onclick="deleteCheck()"
						class="btn btn-danger">삭제</button>
				</div>
			</div>

			<div
				style="width: 100%; height: 230px; overflow: auto; margin-top: 20px; margin-bottom: 50px;">
				<table class="table table-striped table-hover">
					<thead>
						<tr style="position: sticky; top: 0px; background-color: #E2E2E2">
							<th scope="col"><input type="checkbox"
								onclick="allCheck(this)" /></th>
							<th scope="col">점검코드</th>
							<th scope="col">설비코드</th>
							<th scope="col">설비명</th>
							<th scope="col">시작일자</th>
							<th scope="col">종료일자</th>
						</tr>
					</thead>
					<tbody id="listTable">
						<c:forEach items="${OprList }" var="opr">
							<tr onclick="oprDetail(this)" data-bs-toggle="modal"
								data-bs-target="#modalDialogScrollable">
								<td scope="row"><input type="checkbox"></td>
								<td scope="row">${opr.noprCd}</td>
								<td scope="row">${opr.eqmCd}</td>
								<td scope="row">${opr.eqmNm}</td>
								<td scope="row"><fmt:formatDate value="${opr.frDt}"
										pattern="yyyy-MM-dd" /></td>
								<td scope="row"><fmt:formatDate value="${opr.toDt}"
										pattern="yyyy-MM-dd" /></td>
								<td hidden>${opr.opertCtnt}</td>
								<td hidden>${opr.eqmPsch}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
					<h5 class="modal-title" id="modalTitle">설비비가동 등록</h5>
					<button type="button" class="btn-close closeBtn"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form name="modalForm" action="insertOpr" method="post">
					<div class="modal-body">
						<div class="card">
							<div class="card-body" style="margin-top: 30px;">
								<hr>
								<div class="row g-3 align-items-center">
									<div class="col-auto" style="margin-left: 10px;">
										<label style="font-weight: bold;">설비명*</label>
									</div>
									<div class="col-auto">
										<select name="eqmCd" onchange="makeEqmCd()"
											class="form-select" style="width: 216px;">
											<option style="text-align: center;">===선택===</option>
											<c:forEach items="${YList }" var="Y">
												<option value="${Y.eqmCd }">${Y.eqmNm }</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-auto" style="margin-left: 10px;">
										<label style="font-weight: bold;">설비코드*</label>
									</div>
									<div class="col-auto">
										<input disabled type="text" id="eqmCd" class="form-control">
									</div>
								</div>
								<p>
								<div class="row g-3 align-items-center">
									<div class="col-auto" style="margin-left: 10px;">
										<label style="font-weight: bold;">비가동코드</label>
									</div>
									<div class="col-auto">
										<input type="text" readonly name="noprCd" class="form-control">
									</div>
									<div class="col-auto" style="margin-left: 10px;">
										<label style="font-weight: bold;">담당자*</label>
									</div>
									<div class="col-auto">
										<input type="text" name="eqmPsch" class="form-control">
									</div>
								</div>
								<hr>
								<div class="row g-3 align-items-center">
									<div class="col-auto" style="margin-left: 10px;">
										<label style="font-weight: bold;">시작일자*</label>
									</div>
									<div class="col-auto">
										<input type="date" name="frDt" class="form-control">
									</div>
									<div class="col-auto" style="margin-left: 10px;">
										<label style="font-weight: bold;">종료일자*</label>
									</div>
									<div class="col-auto">
										<input type="date" name="toDt" class="form-control">
									</div>
								</div>
								<hr>
								<div class="row g-3 align-items-center">
									<div class="col-auto" style="margin-left: 10px;">
										<label style="font-weight: bold;">작업내용*</label>
									</div>
									<div class="col-auto">
										<textarea rows="4" cols="60" name="opertCtnt"></textarea>
									</div>
								</div>
								<hr>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary closeBtn"
							data-bs-dismiss="modal" onclick="modalReset()">닫기</button>
						<button type="button" onclick="insertOpr()"
							class="btn btn-primary" data-bs-dismiss="modal">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
	//tr클릭시 모달열어서 상세보기
	function oprDetail(t){
		modalTitle.innerText = '비가동상세보기';		
		console.log(t);
		let option = document.querySelector('option'); //설비명
		let textarea = document.querySelector('textarea');
		let inputs = modalForm.querySelectorAll('input')//inputs 0설비코드 1비가동코드 2담당자 3시작일 4종료일
		let tds = t.querySelectorAll('td') //tds 1비가동코드 2설비코드 3설비명 4시작일 5종료일 6조치내용 7담당자 
		inputs[0].value = tds[2].innerText;
		inputs[1].value = tds[1].innerText;
		inputs[2].value = tds[7].innerText;
		inputs[3].value = tds[4].innerText;
		inputs[4].value = tds[5].innerText;
		option.innerText = tds[3].innerText;
		textarea.value = tds[6].innerText;
	}
	
	//모달폼 옵션체크
	function insertOptCheck(){
		let inputs = modalForm.querySelectorAll('input')
		let textarea = modalForm.querySelector('textarea')
		for(let i=0;i<inputs.length;i++){
			if(inputs[i].value == ''){
				alert("필수항목체크")
				return false;
			}
		}
		if(textarea.value == ''){
			alert("필수항목체크")
			return false;
		}
	}
	
	//등록
	function insertOpr(){
		if(insertOptCheck() == false){
			return;
		}
		modalForm.submit();
		resetModal();
			  }
	    
	//삭제 체크된것만 담기
	function deleteCheck(){
		let checkList = listTable.querySelectorAll('[type="checkbox"]');			
		let deleteList = [];
		for(let i=0; i<checkList.length; i++){
			if(checkList[i].checked){
				deleteList.push(checkList[i].closest('tr').children[1].innerText);
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
				  url: "/spring/deleteOpr",
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
				  },
				  error: function(error) {
					  console.log(error)
				  }
				});  
			  }
			})
	}
	
		

		function makeMaxNoprCd(cd) {
			let original = cd
			let number = parseInt(original.substring(3))
			let max = original.replace(number, number + 1);
			document.querySelector('[name="noprCd"]').value = max;
		}

		function makeEqmCd() {
			document.querySelector('#eqmCd').value = document
					.querySelector('select').value;
		}
		//모달리셋
		function modalReset(){
			let inputs = modalForm.querySelectorAll('input');
			for(let i=0 ; i<inputs.length; i++){
				if(i != 1){
			inputs[i].value = '';
				}
			}
			modalForm.querySelector('textArea').value = '';
		}
		//모달열면 설비리스트 다시 뿌리기
		function modalOpen(){
			$.ajax({
				  url: "oprModal", // 호출하고자 하는 URL
				  type: "GET", // HTTP 메소드 (GET, POST, PUT, DELETE 등)
				  dataType: "json", // 응답 데이터 타입 (json, xml, text 등)
				  success: function(res) {
				    let select = document.querySelector('select[name="eqmCd"]')
				    let options = select.querySelectorAll('option');
				    for(let j=1; j< options.length; j++){
				    	options[j].remove();
				    }
				    for(let i=0; i< res.YList.length; i++){
				    	let option = document.createElement('option');
				    	option.innerText = res.YList[i].eqmNm;
				    	option.value = res.YList[i].eqmCd;
				    	select.append(option);
				    }
				    makeMaxNoprCd(res.maxNoprCd.noprCd)
				  },
				  error: function(jqXHR, textStatus, errorThrown) {
				    console.error("AJAX 호출이 실패했습니다: " + textStatus, errorThrown);
				  }
				});
		}
	</script>
</body>
</html>