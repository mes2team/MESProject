<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css" />
<script
	src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script>
        jQuery(function($){
            $("#jaje").DataTable({
                paging: false,
                info: false,
            });
        });
    </script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
				<h3 class="card-header" style="margin: 1px">자재등록</h3>
				<div clas
					<!-- Multi Columns Form -->
					<form class="row g-3" name="insertForm" action="matInsert"
						method="post" onsubmit="return false">
						<hr style="margin: 1px">


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
								<option value="none">=== 선택 ===</option>
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
								<option value="none">=== 선택 ===</option>
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
								<option value="none">=== 선택 ===</option>
								<option value="Yes">Yes</option>
								<option value="No">No</option>
							</select>
						</div>

						<div class="col-md-3">
							<label for="country" class="form-label">거래처코드</label> <select
								class="form-control" id="vendCd" name="vendCd" required="">
								<option value="none">=== 선택 ===</option>
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
					<h3 class="card-header" style="margin: 1px">자재목록</h3>
					<div class="card-body">
						<div class="table-responsive">
							<hr style="margin: 1px">
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
												<td><button type="button"
														onclick="openModal('${mat.rscCd}')">수정</button></td>
											</sec:authorize>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- 6) 페이징 버튼 제작 -->
							<div class='pull-right'>
								<ul class="pagination">
									<c:if test="${pageMaker.prev }">
										<li class="paginate_button previous"><a
											href="${pageMaker.startPage -1}">Prev</a></li>
									</c:if>
									<c:forEach var="num" begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }">
										<li class="paginate_button"
											${pageMaker.cri.pageNum == num ? "active":"" }><a
											href="${num }">${num }</a></li>
									</c:forEach>
									<c:if test="${pageMaker.next }">
										<li class="paginate_button next"><a
											href="${pageMaker.endPage +1}">next</a></li>
									</c:if>
								</ul>
							</div>
							<!-- 해당 페이지 클릭시 페이지번호와 가져올 데이터 개수(default 10개) -->
							<form action="${pageContext.request.contextPath }/matList"
								id='actionForm' method='get'>
								<input type="hidden" name="pageNum"
									value="${pageMaker.cri.pageNum }"> <input type="hidden"
									name="amout" value="${pageMaker.cri.amount }">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ============================================================== -->
		<!-- end basic table  -->
		<!-- ============================================================== -->


		<!-- Optional JavaScript -->
		<script
			src="${pageContext.request.contextPath}/resources/static/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/static/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/static/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/static/assets/vendor/multi-select/js/jquery.multi-select.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/static/assets/libs/js/main-js.js"></script>
		<script
			src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/static/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
		<script
			src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/static/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/static/assets/vendor/datatables/js/data-table.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
		<script
			src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
		<script
			src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
		<script
			src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
		<script
			src="https://cdn.datatables.net/rowgroup/1.0.4/js/dataTables.rowGroup.min.js"></script>
		<script
			src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
		<script
			src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
		<script>
		//페이징 이동
		$(document).ready(
				function() {
					var actionForm = $("#actionForm");

					$(".paginate_button a").on(
							"click",
							function(e) {
								//a 태그 클릭시 이벤트 방지
								e.preventDefault();
								//페이징 버튼의 속성값을 form태그의 input값에 입력
								actionForm.find("input[name='pageNum']").val(
										$(this).attr("href"));
								//페이징 이동 form 실행
								actionForm.submit();
							})
				})
		
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
	   
		function openModal(rscCd) {
	    // MatVO 객체 생성 및 값 세팅
	    var matVO = {
	        rscCd: rscCd
	    };
	
	    // 모달 창에 MatVO 객체 전달
	    $("#myModal").modal();
	    $("#myModal").on("shown.bs.modal", function () {
	        $("#modalBody").load("/matInfo?rscCd=" + rscCd);
	    });
	}
	</script>
</body>
</html>