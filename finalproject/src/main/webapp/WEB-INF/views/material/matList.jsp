<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css">
<script
	src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script>
        jQuery(function($){
            $("#jaje").DataTable({
            	lengthChange: false,
                info: false,
            });
        });
    </script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">



<!-- jQuery and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>


<meta charset="UTF-8">
<title>Material List</title>
<style>
table, tr, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<div>
		<!-- ============================================================== -->
		<!-- pageheader -->
		<!-- ============================================================== -->
		<div class="row">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#"
						class="breadcrumb-link">자재관리</a></li>
					<!-- <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Tables</a></li> -->
					<li class="breadcrumb-item active" aria-current="page">자재정보</li>
				</ol>
			</nav>
		</div>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<!-- ROLE_ADMIN만 볼 수 있는 영역 -->
			<!-- ============================================================== -->
			<!-- 자재 등록 -->
			<!-- ============================================================== -->
			<div class="card">
				<h3 class="card-header">자재등록</h3>
				<div class>
					<!-- Multi Columns Form -->
					<form class="row g-3" name="insertForm" action="matInsert"
						method="post" onsubmit="return false" style="margin: 0px 5px 5px 5px;">


						<div class="col-md-3">
							<label for="country" class="form-label">자재코드</label> RSC<input
								type="text" class="form-control" id="rscCd" name="rscCd"
								placeholder="숫자만 입력해주세요." required="">
						</div>

						<div class="col-md-3">
							<label for="country" class="form-label">자재명</label> <input
								type="text" class="form-control" id="rscNm" name="rscNm"
								placeholder="" required="">
						</div>

						<div class="col-md-3">
							<label for="country" class="form-label">자재규격</label> <select
								class="form-control" id="rscSpec" name="rscSpec" required="">
								<option value="none" disabled>=== 선택 ===</option>
								<option value="KG">kg(킬로그램)</option>
								<option value="L">L(리터)</option>
							</select>
						</div>

						<div class="col-md-3">
							<label for="country" class="form-label">관리단위</label> <input
								type="text" class="form-control" id="mngUnit" name="mngUnit"
								value="BOX" readonly>
						</div>

						<div class="col-md-3">
							<label for="country" class="form-label">자재유형</label> <select
								class="form-control" id="rscTyp" name="rscTyp" required="">
								<option value="none" disabled>=== 선택 ===</option>
								<option value="주원료">주원료</option>
								<option value="첨가제">첨가제</option>
								<option value="액상원료">액상원료</option>
							</select>
						</div>

						<div class="col-md-3">
							<label for="country" class="form-label">안전재고</label> <input
								type="text" class="form-control" id="safStc" name="safStc"
								placeholder="숫자를 입력하세요." required="">
						</div>

						<div class="col-md-3">
							<label for="country" class="form-label">사용여부</label> <select
								class="form-control" id="useYn" name="useYn" required="">
								<option value="none" disabled>=== 선택 ===</option>
								<option value="Yes">Yes</option>
								<option value="No">No</option>
							</select>
						</div>

						<div class="col-md-3">
							<label for="country" class="form-label">거래처코드</label> <select
								class="form-control" id="vendCd" name="vendCd" required="">
								<option value="none" disabled>=== 선택 ===</option>
								<option value="VEI1000">VEI1000</option>
								<option value="VEI1001">VEI1001</option>
							</select>
						</div>

						<div class="text-center">
							<button type="reset" class="btn btn-secondary">초기화</button>
							<button type="submit" class="btn btn-primary" id="insertBtn">등록</button>
						</div>
					</form>
					<!-- End Multi Columns Form -->

				</div>
			</div>
		</sec:authorize>
		<!-- ============================================================== -->
		<!-- basic table  -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="card">
					<h3 class="card-header">자재목록</h3>
					<div class="card-body">
						<div class="table-responsive">
							<table id="jaje" class="table table-striped table-bordered first">
								<thead>
									<tr>
										<th>No.</th>
										<th>자재코드</th>
										<th>자재명</th>
										<th>자재규격</th>
										<th>관리단위</th>
										<th>자재유형</th>
										<th>안전재고</th>
										<th>사용여부</th>
										<th>거래처코드</th>
										<sec:authorize access="hasRole('ROLE_ADMIN')">
											<th>수정</th>
										</sec:authorize>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="mat" items="${matList }" varStatus="loop">
										<tr data-id="a">
											<td>${loop.count }</td>
											<td>${mat.rscCd }</td>
											<td>${mat.rscNm }</td>
											<td>${mat.rscSpec }</td>
											<td>${mat.mngUnit }</td>
											<td>${mat.rscTyp }</td>
											<td>${mat.safStc }</td>
											<td>${mat.useYn }</td>
											<td>${mat.vendCd }</td>
											<sec:authorize access="hasRole('ROLE_ADMIN')">
												<td><button type="button" class="btn btn-primary updateBtn"
														data-bs-toggle="modal" >
														수정</button></td>
											</sec:authorize>
										</tr>
									</c:forEach>
								</tbody>
							</table>

<!-- ################Extra Large Modal################################## -->
							<div class="modal fade" id="modifyModal" tabindex="-1">
								<div class="modal-dialog modal-xl">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">자재수정</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<form class="row g-3" name="updateForm" action="updateMat"
						method="post" onsubmit="return false" style="margin: 0px 5px 5px 5px;">


						<div class="col-md-3">
							<label for="country" class="form-label">자재코드</label> RSC<input
								type="text" class="form-control" id="rscCdModal" name="rscCd"
								placeholder="숫자만 입력해주세요." value="">
						</div>

						<div class="col-md-3">
							<label for="country" class="form-label">자재명</label> <input
								type="text" class="form-control" id="rscNmModal" name="rscNm"
								placeholder="" value="${matvo.rscNm }">
						</div>

						<div class="col-md-3">
							<label for="country" class="form-label">자재규격</label>
							<% String RscSpec = (String)request.getAttribute("rscSpec"); %>
							<% System.out.println(RscSpec); %>              			
							<select class="form-control" id="rscSpecModal" name="rscSpec">
								<option value="KG" <%="KG".equals(RscSpec)?"selected":""%>>kg(킬로그램)</option>
								<option value="L" <%="L".equals(RscSpec)?"selected":""%>>L(리터)</option>
							</select>
						</div>

						<div class="col-md-3">
							<label for="country" class="form-label">관리단위</label> <input
								type="text" class="form-control" id="mngUnitModal" name="mngUnit"
								value="BOX" readonly>
						</div>

						<div class="col-md-3">
							<label for="country" class="form-label">자재유형</label> <select
								class="form-control" id="rscTypModal" name="rscTyp" required="">
								<option value="none" disabled>=== 선택 ===</option>
								<option value="주원료">주원료</option>
								<option value="첨가제">첨가제</option>
								<option value="액상원료">액상원료</option>
							</select>
						</div>

						<div class="col-md-3">
							<label for="country" class="form-label">안전재고</label> <input
								type="text" class="form-control" id="safStcModal" name="safStc"
								placeholder="숫자를 입력하세요." required="">
						</div>

						<div class="col-md-3">
							<label for="country" class="form-label">사용여부</label> <select
								class="form-control" id="useYnModal" name="useYn" required="">
								<option value="none" disabled>=== 선택 ===</option>
								<option value="Yes">Yes</option>
								<option value="No">No</option>
							</select>
						</div>

						<div class="col-md-3">
							<label for="country" class="form-label">거래처코드</label> <select
								class="form-control" id="vendCdModal" name="vendCd" required="">
								<option value="none" disabled>=== 선택 ===</option>
								<option value="VEI1000">VEI1000</option>
								<option value="VEI1001">VEI1001</option>
							</select>
						</div>
					</form>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary" id="modifyBtn">수정</button>
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">취소</button>
										</div>
									</div>
								</div>
							</div>
							<!-- End Extra Large Modal-->

						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ============================================================== -->
		<!-- end basic table  -->
		<!-- ============================================================== -->


		<script>
<!-- ============================================================== -->
<!-- 등록  등록  등록  등록  등록  등록  등록  등록  등록  등록  등록  등록  등록 -->
<!-- ============================================================== -->	
		
		function formOptionChk() {
		    let rscCd = document.getElementsByName('rscCd')[0];
		    let rscNm = document.getElementsByName('rscNm')[0];
		    let rscSpec = $("#rscSpec option:selected").val();
		    let rscTyp = $("#rscTyp option:selected").val();
		    let safStc = document.getElementsByName('safStc')[0];
		    let useYn = $("#useYn option:selected").val();
		    let vendCd = $("#vendCd option:selected").val();

		    if (rscCd.value == "") {
		        alert("자재코드가 입력되지 않았습니다.");
		        rscCd.focus();
		        return false; // 페이지 이동을 막기 위해 false를 반환합니다.
		    }
		    if (rscNm.value == "") {
		        alert("자재명이 입력되지 않았습니다.");
		        rscNm.focus();
		        return false;
		    }
		    if (rscSpec == "none") {
		        alert("자재규격이 선택되지 않았습니다.");
		        $("#rscSpec").focus();
		        return false;
		    }
		    if (rscTyp == "none") {
		        alert("자재유형이 선택되지 않았습니다.");
		        $("#rscTyp").focus();
		        return false;
		    }
		    if (safStc.value == "") {
		        alert("안전재고가 입력되지 않았습니다.");
		        safStc.focus();
		        return false;
		    }
		    if (useYn == "none") {
		        alert("사용여부가 선택되지 않았습니다.");
		        $("#useYn").focus();
		        return false;
		    }
		    if (vendCd == "none") {
		        alert("거래처코드가 선택되지 않았습니다.");
		        $("#vendCd").focus();
		        return false;
		    }
		    
		    // Swal.fire를 추가합니다.
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
		    });

		    return false; // 이벤트의 기본 동작인 페이지 이동을 막기 위해 false를 반환합니다.
		}

		$("#insertBtn").on("click", formOptionChk)

<!-- ============================================================== -->
<!-- 등록  등록  등록  등록  등록  등록  등록  등록  등록  등록  등록  등록  등록 -->
<!-- ============================================================== -->		

<!-- ============================================================== -->
<!-- 단건조회  단건조회  단건조회  단건조회  단건조회  단건조회  단건조회  단건조회 -->
<!-- ============================================================== -->	
		
$(document).on('click', '.updateBtn', function() {
  // 버튼 클릭 이벤트 리스너 함수

  // 단건조회를 위한 rsc_cd 값을 추출합니다.
  var rscCd = $(this).closest('tr').find('td:eq(1)').text();
  
//서버로 보낼 데이터를 구성합니다.
  var data = {
    rscCd: rscCd
  };

  // Ajax 요청을 보냅니다.
  $.ajax({
	    type: 'GET',
	    url: 'matInfo',
	    data: $.param(data), 
	    dataType: 'json',
	    success: function(response) {
	      // 성공적으로 응답을 받았을 때 처리할 코드를 작성합니다.
	     console.log(response);
	     console.log(response.useYn);
	     
	     $('#modifyModal').modal('show');
	     
	     $("#rscCdModal").val(response.rscCd);
	     $("#rscNmModal").val(response.rscNm);
	     $("#rscSpecModal").val(response.rscSpec);
	     $("#mngUnitModal").val(response.mngUnit);
	     $("#rscTypModal").val(response.rscTyp);
	     $("#safStcModal").val(response.safStc);
 	     $("#useYnModal").val(response.useYn);
	     $("#vendCdModal").val(response.vendCd);
	     
	     
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	    	 alert('데이터를 수정할 수 없습니다.');
	    }
	  });
	});
	
	function updateMatInfo(){
	//fetch는 함수 안에 안 들어가면 페이지 열면 의도치 않아도 바로 실행
	fetch('matUpdate', {
		method : 'post',
		headers : {
			'Content-Type' : 'application/json'
		},
		//데이터를 json으로 인코딩(자바스크립트 기본타입을 json으로)
		//parse: json타입을 일반 타입으로 바꾸는 것
		//
		body: JSON.stringify(serializeObject())
		/*'Content-Type': 'application/json'은
		서버에게 요청 본문이 JSON 형식으로 인코딩된 데이터임을 알리는 HTTP 요청 헤더이고,
		JSON.stringify은 자바스크립트 객체를 JSON 형식의 문자열로 변환하는 메서드*/
	})
	.then(response => response.json())
	//.then(data => console.log(data))
	//데이터가 넘어온 지 console.log로 확인 후 가리고 밑에 alert창으로 나오게 만듦.
	//동시에 두 개가 안 됨.
	.then(data => {
				if(data != null && data['결과'] == 'Success'){
					alert('자재코드 : ' + data['자재코드'] + '의 정보가 수정되었습니다.');
				}else{
					alert('자재의 정보가 정상적으로 수정되지 않았습니다.');
				}
			})
	.catch(reject => console.log(reject));
}

function serializeObject() {
	let formData = $('form').serializeArray();
	// [{ name : 'firstName', value : 'Steven'}, { name : 'lastName', value : ''}, ...]
	//form 태그 안의 각 열의 데이터를 따로 각각의 객체로 본다.
	let objectData = {}
	formData.forEach(function (obj, idx) {
		objectData[obj.name] = obj.value
	});
	//우리가 원하는 형태로 한 행을 하나의 객체로 만듦.

	return objectData;
}

document.querySelector('#modifyBtn')
.addEventListener('click', updateMatInfo);

	</script>
</body>
</html>