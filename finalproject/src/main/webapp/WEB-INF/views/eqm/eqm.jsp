<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>eqm</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style>
</style>
</head>
<body>
	<h1>설비관리</h1>
	<div id="container">
		<div class="card">
			<div class="card-body">
				<div style="width: 100%; height: 200px; overflow: auto; margin-top: 20px; margin-bottom: 5px;">
					<table class="table table-striped table-hover">
						<thead>
							<tr style="position: sticky; top: 0px; background-color:#E2E2E2">
								<th scope="col">번호</th>
								<th scope="col">설비구분</th>
								<th scope="col">설비코드</th>
								<th scope="col">설비명</th>
								<th scope="col">사용여부</th>
								<th scope="col">점검주기(일)</th>
								<th scope="col">담당자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${eqmList }" var="eqm" varStatus="loop">
								<tr id="${eqm.eqmCd }" onclick="eqmDetail('${eqm.eqmCd }')">
									<th scope="row">${loop.count}</th>
									<td>${eqm.eqmFg }</td>
									<td>${eqm.eqmCd }</td>
									<td>${eqm.eqmNm }</td>
									<td>${eqm.useYn }</td>
									<td>${eqm.chckPerd }</td>
									<td>${eqm.eqmMng }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<hr>
		<div class="card">
			<div class="card-body">
				<form id="insertForm" name="insertForm" action="eqm" method="POST" enctype="multipart/form-data" style="margin-top: 20px; margin-bottom: 5px;">
					<input type="file" name="file" id="profile_pt"
						onchange="previewImage(this,'View_area')">
					<div id='View_area'
						style='position: relative; width: 200px; height: 200px; color: black; border: 0px solid black; dispaly: inline;'>
						<img id="preview_img"
							src="data:image/png;base64,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">
					</div>
					<div>
						<div class="row g-3 align-items-center">
							<div class="col-auto">
								<label for="inputPassword6" class="col-form-label">설비구분</label>
							</div>
							<div class="col-auto">
								<select name="eqmFg" class="form-select">
									<option>분쇄기</option>
									<option>계량기</option>
									<option>배합기</option>
									<option>건조기</option>
									<option>포장기</option>
								</select>
							</div>

							<div class="col-auto">
								<label for="inputPassword6" class="col-form-label">설비코드</label>
							</div>
							<div class="col-auto">
								<input type="text" name="eqmCd" attr="disabled"
									class="form-control" readonly>
							</div>
							<div class="col-auto">
								<label for="inputPassword6" class="col-form-label">설비명*</label>
							</div>
							<div class="col-auto">
								<input type="text" name="eqmNm" placeholder="필수입력"
									class="form-control">
							</div>
							<div class="col-auto">
								<label for="inputPassword6" class="col-form-label">입고일자</label>
							</div>
							<div class="col-auto">
								<input type="date" name="eqmIstDt" class="form-control">
							</div>
						</div>
						<hr>
						<div class="row g-3 align-items-center">
							<div class="col-auto">
								<label for="inputPassword6" class="col-form-label">점검주기</label>
							</div>
							<div class="col-auto">
								<input type="number" name="chckPerd" class="form-control">
							</div>
							<div class="col-auto">
								<label for="inputPassword6" class="col-form-label">온도</label>
							</div>
							<div class="col-auto">
								<input type="number"
									style="width: 100px; display: inline-block;" name="eqmMinTemp"
									class="form-control"> ~ <input type="number"
									style="width: 100px; display: inline-block;" name="eqmMaxTemp"
									class="form-control">
							</div>
							<div class="col-auto">
								<label for="inputPassword6" class="col-form-label">설비담당자*</label>
							</div>
							<div class="col-auto">
								<select name="eqmMng" class="form-select">
									<option value="" selected disabled hidden>담당자 선택<option>
								<c:forEach items="${empList }" var="emp">
									<option value="${emp.name }">${emp.name }</option>
								</c:forEach>
								</select>
							</div>
							<div class="col-auto">
								<label for="inputPassword6" class="col-form-label"></label>
							</div>
							<div class="col-auto">
								<input  type="radio" name="useYn" checked value="Y" hidden> <input
									type="radio" name="useYn" value="N" hidden> 
								<button type="button" onclick="formOptionChk()"
									class="btn btn-outline-info">저장</button>
								<button type="button" onclick="deleteEqm()"
									class="btn btn-outline-danger">삭제</button>
								<button type="button" onclick="cleanInput()"
									class="btn btn-outline-secondary">클린</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
	//수정
	function updateEqm(){
			
		Swal.fire({
			  title: '수정하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '수정',
			  cancelButtonText: '취소'
			}).then((result) => {
				inputEqmCd.disabled = false;
			  if (result.value) {
				  document
					$.ajax({
					      url: 'updateEqm', 
					      type: 'POST', 
					      data:	$('#insertForm').serialize(),
					      //dataType: 'json', 화면 받을 땐 없어도 됨
					      success: function(result) { 
					    	console.log("업데이트성공");
					    	inputEqmCd.disabled = true;
					    	location.reload();
					      },
					      error: function(reject) { 
					        console.log("업데이트실패");
					      }
					    });	
			  }
			})
	}
	
	//등록시 필수항목 체크
	function formOptionChk(){
		let updateCd = document.querySelector('[name="eqmCd"]').value //단건조회했을때 밑에 뿌려진 eqmCd가져옴
		if(eqmMng.value == '' || eqmNm.value == ''){
			alert("필수항목을 확인해주세요");
			return;
		//수정 설비코드eqmCd가 DB에있는 최대코드값보다 작거나 같으면 추가등록이 아닌 수정이므로 수정되게
		}else if(updateCd.substring(3,4) == '1' && updateCd.substring(3) <= ${maxCdList.firstMax}){
			updateEqm(); //EQM1000인경우 && 
			return;
		}
		else if(updateCd.substring(3,4) == '2' && updateCd.substring(3) <= ${maxCdList.secondMax}){
			updateEqm();
			return;
		}
		else if(updateCd.substring(3,4) == '3' && updateCd.substring(3) <= ${maxCdList.thirdMax}){
			updateEqm();
			return;
		}
		else if(updateCd.substring(3,4) == '4' && updateCd.substring(3) <= ${maxCdList.fourthMax}){
			updateEqm();
			return;
		}else if(updateCd.substring(3,4) == '5' && updateCd.substring(3) <= ${maxCdList.fifthMax}){
			updateEqm();
			return;
		}else {
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
						insertForm.submit();
				  }
				})
				
			}
		}
	
	
	//삭제 
	function deleteEqm(){
		//삭제시 alert
		Swal.fire({
			  title: '삭제하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.value) {
				  let eqmCd = document.querySelector('[name="eqmCd"]');
					$.ajax({
					      url: 'deleteEqm?eqmCd=' + eqmCd.value, 
					      type: 'POST', 
					      //dataType: 'json', 화면 받을 땐 없어도 됨
					      success: function(result) { 
					    	document.querySelector('#'+eqmCd.value).remove()
					    	location.reload();
					    	cleanInput();
					      },
					      error: function(reject) { 
					        console.log(reject);
					      }
					    });
			  }
			})
		
		
	}
	//날짜포맷변경
	function changeDateFormat(inputDate){
	       let date = new Date(inputDate);
	       let year = date.getFullYear();
	       let month = String(date.getMonth() + 1).padStart(2, '0');
	       let day = String(date.getDate()).padStart(2, '0');
	       let formattedDate = year +'-'+ month +'-'+ day;
	       return formattedDate;
	}
	
	//input모음
	const inputEqmCd = document.querySelector('[name="eqmCd"]');
	const eqmFg = document.querySelector('[name="eqmFg"]');
	const eqmNm = document.querySelector('[name="eqmNm"]');
	const eqmIstDt = document.querySelector('[name="eqmIstDt"]');
	const eqmMinTemp = document.querySelector('[name="eqmMinTemp"]');
	const eqmMaxTemp = document.querySelector('[name="eqmMaxTemp"]');
	const chckPerd = document.querySelector('[name="chckPerd"]');
	const useYn = document.querySelectorAll('[name="useYn"]');
	const eqmMng = document.querySelector('[name="eqmMng"]');
	const eqmImg = document.querySelector('[name="eqmImg"]');
	
	//단건조회
	function eqmDetail(eqmCd){
		$.ajax({
		      url: '/spring/eqmDetail?eqmCd=' + eqmCd, // 조회 API의 URL
		      type: 'GET', // HTTP 요청 방식
		      dataType: 'json', // 응답 데이터 타입
		      success: function(result) { // 요청이 성공했을 때
		       inputEqmCd.value = result.eqmCd;
		       eqmFg.value = result.eqmFg;
		       eqmNm.value = result.eqmNm;
		       eqmIstDt.value = changeDateFormat(result.eqmIstDt);
		       eqmMinTemp.value = result.eqmMinTemp;
		       eqmMaxTemp.value = result.eqmMaxTemp;
		       chckPerd.value = result.chckPerd;
		       eqmMng.value = result.eqmMng;
		       for(let i=0; i<useYn.length; i++){
					if(useYn[i].value == result.useYn){
						useYn[i].checked = true;
					}
				}
		      // document.querySelector("#preview_img").src ="img/"+result.eqmImg;
		      disabledEqmFg();
		      },
		      error: function(reject) { // 요청이 실패했을 때
		        console.log(reject);
		      }
		    });
	}
	
	
	
		//설비명 선택시 자동으로 설비코드
		const selects = document.getElementsByTagName('select');
		const disabled = document.querySelectorAll('[attr="disabled"]');
		
		if (selects[0].value == '분쇄기') {
			disabled[0].value = 'EQM'+${maxCdList.firstMax+1};
		};
		selects[0].addEventListener('change', function() {
			if (selects[0].value == '분쇄기') {
				disabled[0].value = 'EQM'+${maxCdList.firstMax+1};
			} else if (selects[0].value == '계량기') {
				disabled[0].value = 'EQM'+${maxCdList.secondMax+1};
			} else if (selects[0].value == '배합기') {
				disabled[0].value = 'EQM'+${maxCdList.thirdMax+1};
			} else if (selects[0].value == '건조기') {
				disabled[0].value = 'EQM'+${maxCdList.fourthMax+1};
			} else
				disabled[0].value = 'EQM'+${maxCdList.fifthMax+1};
		})
		//이미지그리기
		function previewImage(targetObj, View_area) {
			var img = document.querySelector("#preview_img")
			if (img) {
				img.parentNode.removeChild(img);
			}
			var preview = document.getElementById(View_area); //div id
			var ua = window.navigator.userAgent;

			//ie일때(IE8 이하에서만 작동)
			if (ua.indexOf("MSIE") > -1) {
				targetObj.select();
				try {
					var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
					var ie_preview_error = document
							.getElementById("ie_preview_error_" + View_area);

					if (ie_preview_error) {
						preview.removeChild(ie_preview_error); //error가 있으면 delete
					}

					var img = document.getElementById(View_area); //이미지가 뿌려질 곳

					//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
					img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
							+ src + "', sizingMethod='scale')";
				} catch (e) {
					if (!document.getElementById("ie_preview_error_"
							+ View_area)) {
						var info = document.createElement("<p>");
						info.id = "ie_preview_error_" + View_area;
						info.innerHTML = e.name;
						preview.insertBefore(info, null);
					}
				}
				//ie가 아닐때(크롬, 사파리, FF)
			} else {
				var files = targetObj.files;
				for (var i = 0; i < files.length; i++) {
					var file = files[i];
					var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
					if (!file.type.match(imageType))
						continue;
					var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
					if (prevImg) {
						preview.removeChild(prevImg);
					}
					var img = document.createElement("img");
					img.id = "prev_" + View_area;
					img.classList.add("obj");
					img.file = file;
					img.style.width = '220px';
					img.style.height = '200px';
					
					preview.appendChild(img);
					if (window.FileReader) { // FireFox, Chrome, Opera 확인.
						var reader = new FileReader();
						reader.onloadend = (function(aImg) {
							return function(e) {
								aImg.src = e.target.result;
							};
						})(img);
						reader.readAsDataURL(file);
					} else { // safari is not supported FileReader
						//alert('not supported FileReader');
						if (!document.getElementById("sfr_preview_error_"
								+ View_area)) {
							var info = document.createElement("p");
							info.id = "sfr_preview_error_" + View_area;
							info.innerHTML = "not supported FileReader";
							preview.insertBefore(info, null);
						}
					}
				}
			}
		}
		//단건 클릭시 수정시 설비구분 막기
		function disabledEqmFg(){
			document.querySelector('[name="eqmFg"]').setAttribute("disabled", true);
			document.querySelector('[name="eqmCd"]').setAttribute("disabled", true);
		}
		//clean버튼
		function cleanInput(){
			let inputs = document.querySelectorAll("input")
			document.querySelector('select').value = '분쇄기';
			inputs[1].value = 'EQM'+${maxCdList.firstMax + 1}; //설비코드
			for(let i=2 ; i<inputs.length ; i++){
				inputs[i].value = "";
			}
			document.querySelector('[name="eqmFg"]').removeAttribute("disabled");
			document.querySelector('[name="eqmCd"]').removeAttribute("disabled");
		}
		
		
	</script>
</body>
</html>