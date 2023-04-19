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
<style>
</style>
</head>
<body>
	<h1>비가동관리</h1>
	<div class="card">
		<div class="card-body">
			<div class="form-group row" style="margin-top: 20px; float: left;">
				<div class="col-auto">
					<label style="font-weight: bold;">Search</label>
				</div>
				<div class="col-auto">
					<input type="text" id="modalEqmNm" class="form-control">
				</div>
			</div>

			<div>
				<div class="col-auto" style="float: right; margin-top: 20px;">
					<button type="button" onclick="deleteCheck()"
						class="btn btn-danger">삭제</button>
				</div>
				<div style="float: right; margin-top: 20px;" class="col-auto"
					style="margin-left:;">
					<button type="button" class="btn btn-primary" onclick="modalOpen()"
						data-bs-toggle="modal" data-bs-target="#modalDialogScrollable">
						등록</button>
				</div>
			</div>

			<div
				style="width: 100%; height: 800px; overflow: auto; padding-top: 20px; margin-bottom: 50px;">
				<table class="table table-striped table-hover">
					<thead>
						<tr style="position: sticky; top: 0px; background-color: #E2E2E2">
							<th scope="col"><input type="checkbox"
								onclick="allCheck(this)" /></th>
							<th scope="col">비가동코드</th>
							<th scope="col">설비코드</th>
							<th scope="col">설비명</th>
							<th scope="col">시작일자 / 시작시간</th>
							<th scope="col">종료일자 / 종료시간</th>
						</tr>
					</thead>
					<tbody id="listTable">
						<c:forEach items="${OprList }" var="opr">
							<tr onclick="oprDetail(this,event)" data-bs-toggle=""
								data-bs-target="#modalDialogScrollable">
								<td scope="row" onclick="stopPropagation(event)"><input
									type="checkbox"></td>
								<td class="mainNoprCd" scope="row">${opr.noprCd}</td>
								<td scope="row">${opr.eqmCd}</td>
								<td scope="row">${opr.eqmNm}</td>
								<td scope="row"><fmt:formatDate value="${opr.frDt}"
										pattern="yyyy-MM-dd" /> / ${opr.frHm }</td>
								<td scope="row"><fmt:formatDate value="${opr.toDt}"
										pattern="yyyy-MM-dd" /> / ${opr.toHm }</td>
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
											<option id="defaultOpt" style="text-align: center;">===선택===</option>
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
										<input type="text" disabled name="noprCd" class="form-control">
									</div>
									<div class="col-auto" style="margin-left: 10px;">
										<label style="font-weight: bold;">담당자*</label>
									</div>
									<div class="col-auto">
										<select name="eqmPsch" class="form-select" id="managerSelect"
											style="width: 216px;">
											<option value="" selected disabled hidden>담당자 선택
											<option>
												<c:forEach items="${managers }" var="manager">
													<option value="${manager.name }">${manager.name }</option>
												</c:forEach>
										</select>
									</div>

								</div>
								<hr>
								<div class="row g-3 align-items-center">
									<div class="col-auto" style="margin-left: 10px;">
										<label style="font-weight: bold;">시작일자*</label>
									</div>
									<div class="col-auto">
										<input type="date" id="frDt" name="frDt" class="form-control">
									</div>
									<div class="col-auto" style="margin-left: 10px;">
										<label style="font-weight: bold;">종료일자*</label>
									</div>
									<div class="col-auto">
										<input type="date" name="toDt" class="form-control">
									</div>
								</div>
								<p>
								<div class="row g-3 align-items-center">
									<div class="col-auto" style="margin-left: 10px;">
										<label style="font-weight: bold;">시작시간*</label>
									</div>
									<div class="col-auto">
										<input type="time" id="" name="frHm" class="form-control">
									</div>
									<div class="col-auto" style="margin-left: 10px;">
										<label style="font-weight: bold;">종료시간*</label>
									</div>
									<div class="col-auto">
										<input type="time" name="toHm" class="form-control">
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
						<button type="button" id="modalCloseBtn" class="btn btn-secondary closeBtn"
							data-bs-dismiss="modal" onclick="modalReset()">닫기</button>
						<button type="button" id="insertBtn" onclick="insertOptCheck()"
							class="btn btn-primary">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
	//allCheck
	function allCheck(allCheck) {
		let checkes = listTable.querySelectorAll('[type="checkbox"]')
		for (let i = 0; i < checkes.length; i++) {
			checkes[i].checked = allCheck.checked;
		}
	}
	
	
	
	//체크박스 클릭시 tr클릭막기
	function stopPropagation(e){
		e.stopPropagation();
	}
	
	//tr클릭시 모달열어서 상세보기
	function oprDetail(t){
		t.setAttribute("data-bs-toggle","modal") //클릭시 모달속성이 없던 tr에 모달속성줌 
		t.click(); //tr한 번 더 클릭하는 효과 이떈 모달효과가 있는 tr을 클릭하는거임
		insertBtn.innerText = '수정'
		modalTitle.innerText = '비가동상세보기';		
		let option = document.querySelector('option'); //설비명
		let textarea = document.querySelector('textarea');
		let inputs = modalForm.querySelectorAll('input')//inputs 0설비코드 1비가동코드 2시작일 3종료일 
		let select = modalForm.querySelector('#managerSelect')
		let tds = t.querySelectorAll('td') //tds 1비가동코드 2설비코드 3설비명 4시작일 5종료일 6조치내용 7담당자 
		inputs[0].value = tds[2].innerText;
		inputs[1].value = tds[1].innerText;
		select.value = tds[7].innerText;
		inputs[2].value = tds[4].innerText.split(' / ')[0];
		inputs[3].value = tds[4].innerText.split(' / ')[0];
		inputs[4].value = tds[5].innerText.split(' / ')[1];
		inputs[5].value = tds[5].innerText.split(' / ')[1];
		option.innerText = tds[3].innerText;
		textarea.value = tds[6].innerText;
		document.querySelector('select').setAttribute('disabled',true); //설비명막기
		document.querySelector('[name="noprCd"]').setAttribute('disabled',true);//비가동코드막기
	}
	
	//등록시 옵션체크
	function insertOptCheck(){
		let insertBtn = document.querySelector('#insertBtn')
		let inputs = modalForm.querySelectorAll('input')
		let textarea = modalForm.querySelector('textarea')
		for(let i=0;i<inputs.length;i++){
			if(inputs[i].value == ''){
				Swal.fire({
			          icon: "warning",
			          title: "필수항목체크",
			        });
				return;
			}
		}
		if(textarea.value == ''){
			Swal.fire({
		          icon: "warning",
		          title: "필수항목체크",
		        });
			return false;
		}
		let inputNoprCd = document.querySelector('input[name="noprCd"]')
		let mainNoprCd = document.querySelectorAll('.mainNoprCd')
		//수정 모달의비가동코드가 메인화면에 있다면 수정
		for(let j=0; j<mainNoprCd.length;j++){
			if(inputNoprCd.value == mainNoprCd[j].innerText){
				 document.querySelector('[name="noprCd"]').removeAttribute('disabled'); //비가동열기
				let oprVO = $('form[name="modalForm"]').serialize();//폼데이터 모으기
				console.log(oprVO);
				updateOpr(oprVO)
				return;
			}
		}
		Swal.fire({
			  title: '등록하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '등록',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.value) {
					insertOpr(); //등록
			  }
			})
	
	}
	//수정
	function updateOpr(oprVO){
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
				      url: 'updateOpr', 
				      type: 'POST', 
				      data:	oprVO,
				      //dataType: 'json', 화면 받을 땐 없어도 됨
				      success: function(result) { 
				    	afterUpdateOpr();
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
	//수정
	function afterUpdateOpr(){
		$.ajax({
			  url: "afterUpdateOpr",
			  type: "GET",
			  dataType: "json",
			  success: function(res) {
				  makeNewList(res);	
				  $('#modalCloseBtn').click();
			  },
			  error: function(error) {
				  console.log(error)
			  }
			}); 
	}
	
	
	//등록
	function insertOpr(){
		document.querySelector('[name="noprCd"]').removeAttribute('disabled'); //비가동열기
			modalForm.submit();
			resetModal();
			afterInsertOpr();
			Toast.fire({
                icon: "success",
                title: "등록이 정상적으로 되었습니다.",
              }); 
	}
	function afterInsertOpr(){
		$.ajax({
			  url: "afterInsertOpr",
			  type: "GET",
			  dataType: "json",
			  success: function(res) {
				  makeNewList(res);	
				  
			  },
			  error: function(error) {
				  console.log(error)
			  }
			}); 
	}
	
	function makeNewList(res){
		let listTable = $('#listTable') 
		listTable.empty();
		
		for(let i=0;i<res.length;i++){
			let fr = changeDateFormat(res[i].frDt);
			let to = changeDateFormat(res[i].toDt);
		  
			let tr = $('<tr onclick="oprDetail(this,event)" data-bs-toggle="" data-bs-target="#modalDialogScrollable">');
			tr.append('<td scope="row" onclick="stopPropagation(event)"><input type="checkbox"></td>');
    		tr.append('<td class="mainNoprCd">' + res[i].noprCd + '</td>'); 
    		tr.append('<td>' + res[i].eqmCd + '</td>'); 
   			tr.append('<td>' + res[i].eqmNm + '</td>'); 
    		tr.append('<td>' + fr +' / '+ res[i].frHm + '</td>'); 
    		tr.append('<td>' + to +' / '+ res[i].toHm +  '</td>'); 
    		tr.append('<td hidden>' + res[i].opertCtnt + '</td>'); 
    		tr.append('<td hidden>' + res[i].eqmPsch + '</td>'); 
    		
			listTable.append(tr);
		}
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
					  Toast.fire({
		                  icon: "success",
		                  title: "삭제가 정상적으로 되었습니다.",
		                });  					 
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
			insertBtn.innerText = '등록'
			let inputs = modalForm.querySelectorAll('input');
			for(let i=0 ; i<inputs.length; i++){
				if(i != 1){
				inputs[i].value = '';
				}
			}
			modalForm.querySelector('textArea').value = '';
			modalTitle.innerText = '설비비가동 등록';
			let trs = listTable.querySelectorAll('tr')
			for(j=0;j<trs.length;j++){
				trs[j].setAttribute('data-bs-toggle','')//다시 tr에 모달기능 뺏기
			}
			document.querySelector('select').removeAttribute('disabled'); //설비명열기
			document.querySelector('option').innerText='===선택===';
			
			
			
		}
		//모달열면 설비리스트 다시 뿌리기(등록버튼으로 모달열었을 때)
		function modalOpen(){
			document.getElementById('frDt').value = new Date().toISOString().substring(0, 10);;
			$.ajax({
				  url: "oprModal", // 호출하고자 하는 URL
				  type: "GET", // HTTP 메소드 (GET, POST, PUT, DELETE 등)
				  dataType: "json", // 응답 데이터 타입 (json, xml, text 등)
				  success: function(res) {
		  		let select = document.querySelector('select[name="eqmCd"]')
		  		let options = select.querySelectorAll('option');
				     for(let j=1; j< options.length; j++){
				    	if(options[j].id =='defaultOpt' != '===선택==='){
				    		options[j].remove();
				    	}
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
		//날짜포맷변경
		function changeDateFormat(inputDate) {
			let date = new Date(inputDate);
			let year = date.getFullYear();
			let month = String(date.getMonth() + 1).padStart(2, '0');
			let day = String(date.getDate()).padStart(2, '0');
			let formattedDate = year + '-' + month + '-' + day;
			return formattedDate;
		}
		
		// 검색어를 입력할 input 요소의 id를 'searchInput'으로 가정합니다.
		var searchInput = document.getElementById('modalEqmNm');

		// 검색어 입력 시 이벤트 리스너를 등록합니다.
		searchInput.addEventListener('input', function() {
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