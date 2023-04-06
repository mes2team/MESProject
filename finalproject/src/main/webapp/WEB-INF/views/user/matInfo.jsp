<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal fade" id="ExtralargeModal" tabindex="-1"
		data-bs-backdrop="static">
		<div
			class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">자재정보 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<form class="row g-3" name="insertForm" action="vendInsert"
								method="post" onsubmit="return false">
								<div class="col-md-3">
									<label for="inputState" class="form-label">자재코드</label>
									<input type="text" class="form-control" id="rscCd" name="rscCd" readonly />
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
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" id="updateBtn">수정</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>