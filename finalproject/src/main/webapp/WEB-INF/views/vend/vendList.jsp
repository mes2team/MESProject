<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<head>
<meta charset="UTF-8">
<title>거래처관리조회</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
<style>
table, tr, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<!-- 모달창 -->
	<div class="modal fade" id="modalDialogScrollable" tabindex="-1"
		data-bs-backdrop="static">
		<div
			class="modal-dialog modal-dialog-scrollable modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">거래처 등록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<form class="row g-3" name="insertForm" action="vendInsert"
								method="post" onsubmit="return false">
								<div class="col-md-12">
									<label for="inputState" class="form-label">구분</label> <select
										id="vendType" class="form-select" name="vendTyp">
										<option value="none">=== 선택 ===</option>
										<option value="매입처">매입처</option>
										<option value="매출처">매출처</option>
									</select>
								</div>
								<div class="col-md-12">
									<label for="inputName5" class="form-label">거래처코드</label> <input
										type="text" class="form-control" id="vendCd" name="vendCd"
										readonly />
								</div>
								<div class="col-12">
									<label for="inputAddress5" class="form-label">거래처명</label> <input
										type="text" class="form-control" id="vendNm" name="vendNm">
								</div>
								<div class="col-12">
									<label for="inputAddress2" class="form-label">거래처 담당자</label> <input
										type="text" class="form-control" id="vendMag" name="vendMag">
								</div>
								<div class="col-12">
									<label for="inputAddress2" class="form-label">사업자 등록번호</label>
									<input type="text" class="form-control" id="brNum" name="brNum">
								</div>
								<div class="col-12">
									<label for="inputAddress2" class="form-label">전화번호</label> <input
										type="text" class="form-control" id="vendTel" name="vendTel">
								</div>
								<div class="col-12">
									<label for="inputAddress2" class="form-label">비고</label>
									<textarea class="form-control" id="remk" rows="10"
										style="resize: none;" name="remk"></textarea>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-primary" id="insertBtn">등록</button>
				</div>
			</div>
		</div>
	</div>
	<div>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div>
				<button type="button" onclick="location.href='empInsert'">등록</button>
			</div>
		</sec:authorize>
		<!-- ============================================================== -->
		<!-- pageheader -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="page-header">
					<h2 class="pageheader-title">거래처 관리</h2>
				</div>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- end pageheader -->
		<!-- ============================================================== -->
		<div class="card">
			<div class="card-body">
				<h5 class="card-title"></h5>

				<!-- Multi Columns Form -->
				<form class="row g-3">
					<!-- End Modal Dialog Scrollable-->
					<div class="col-md-1">
						<label for="inputEmail5" class="form-label">거래처 코드</label>
					</div>
					<div class="col-md-3">
						<input type="email" class="form-control" id="inputEmail5">
					</div>
					<div class="col-md-1">
						<label for="inputEmail5" class="form-label">거래처 명</label>
					</div>
					<div class="col-md-3">
						<input type="email" class="form-control" id="inputEmail5">
					</div>
					<div class="col-md-1">
						<label for="inputEmail5" class="form-label">거래처 담당자</label>
					</div>
					<div class="col-md-3">
						<input type="email" class="form-control" id="inputEmail5">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">조회</button>
						<button type="reset" class="btn btn-secondary">초기화</button>
						<button type="button" class="btn btn-info" data-bs-toggle="modal"
							data-bs-target="#modalDialogScrollable">등록</button>
					</div>
				</form>
				<!-- End Multi Columns Form -->

			</div>
		</div>
		<div class="row">
			<!-- ============================================================== -->
			<!-- basic table  -->
			<!-- ============================================================== -->

			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="card">
					<h5 class="card-header">Basic Table</h5>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-striped table-bordered first">
								<thead>
									<tr>
										<th><input type="checkbox"></th>
										<th>No.</th>
										<th>구분</th>
										<th>거래처코드</th>
										<th>거래처명</th>
										<th>거래처담당자</th>
										<th>사업자등록번호</th>
										<th>전화번호</th>
										<th>비고</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="vend" items="${vendList }" varStatus="loop">
										<tr>
											<td><input type="checkbox"></td>
											<td>${loop.count }</td>
											<td>${vend.vendTyp }</td>
											<td>${vend.vendCd }</td>
											<td>${vend.vendNm }</td>
											<td>${vend.vendMag }</td>
											<td>${vend.brNum }</td>
											<td>${vend.vendTel }</td>
											<td>${vend.remk }</td>
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
							<form action="${pageContext.request.contextPath }/vendList"
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
	</div>


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

		// 거래처 코드 조회
		$("#vendType").on("click", function() {
			let select = $("select option:selected").val();
			if (select == "매입처") {
				$("#vendCd").val('VEI${vendInCd}')
			} else if (select == "매출처") {
				$("#vendCd").val('VEO${vendOutCd}')
			} else {
				$("#vendCd").val('');
			}

			console.log($("select option:selected").val());
		});

		function formOptionChk() {
			let vendTyp = $("select option:selected").val();
			let vendCd = document.getElementsByName('vendCd')[0];
			let vendNm = document.getElementsByName('vendNm')[0];
			let vendMag = document.getElementsByName('vendMag')[0];
			let brNum = document.getElementsByName('brNum')[0];
			let vendTel = document.getElementsByName('vendTel')[0];

			if (vendTyp == "none") {
				alert("구분이 입력되지 않았습니다.");
				vendTyp.focus();
				return;
			}
			if (vendCd.value == "") {
				alert("거래처코드가 입력되지 않았습니다.");
				vendCd.focus();
				return;
			}
			if (vendNm.value == "") {
				alert("거래처명이 입력되지 않았습니다.");
				vendNm.focus();
				return;
			}
			if (vendMag.value == "") {
				alert("거래처 담당자가 입력되지 않았습니다.");
				vendMag.focus();
				return;
			}
			if (brNum.value == "") {
				alert("사업자 등록번호가 입력되지 않았습니다.");
				brNum.focus();
				return;
			}
			if (vendTel.value == "") {
				alert("전화번호가 입력되지 않았습니다.");
				vendTel.focus();
				return;
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
					insertForm.submit();
				  }
				})
			
		}

		$("#insertBtn").on("click", formOptionChk)
	</script>
</body>
</html>