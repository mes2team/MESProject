<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style>
h5 {
	float: left;
}

table, tr, th, td {
	border: 1px solid black;
}

#btnGrp {
	display: flex;
	justify-content: flex-end;
	padding-right: 20px;
}

#btnGrp button {
	margin: 5px;
}

form {
	clear: both;
}
</style>
<body>
	<div class="modal fade" id="basicModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">거래처 검색</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th><input type="checkbox" id="cbx_chkAll" /></th>
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
								<tr data-id="${vend.vendCd }">
									<td><input type="checkbox" name="chk"
										value="${vend.vendCd }" /></td>
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
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">등록</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End Basic Modal-->
	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="page-header">
				<h2 class="pageheader-title">주문서 관리</h2>
			</div>
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">주문서 관리</h5>
			<form class="row g-3" id="check">
				<div class="col-md-4">
					<label for="inputEmail5" class="form-label">주문서 명</label> <input
						type="text" class="form-control" />
				</div>
				<div class="col-md-4">
					<label for="inputEmail5" class="form-label">주문 날짜</label>
					<div class="d-flex align-items-center">
						<input type="date" class="form-control mr-2" /> <span
							class="mx-2">~</span> <input type="date"
							class="form-control ml-2" />
					</div>
				</div>
				<div class="text-center">
					<button type="button" class="btn btn-primary" id="searchVend">
						조회</button>
					<button type="reset" class="btn btn-secondary">초기화</button>
				</div>
			</form>
		</div>
	</div>

	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card">
				<div id="btnGrp">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<div>
							<button type="button" class="btn btn-info" id="addBtn">
								추가</button>
							<button type="button" class="btn btn-success" id="insertBtn">
								등록</button>
							<button type="button" class="btn btn-danger" id="delBtn">
								삭제</button>
						</div>
					</sec:authorize>
				</div>
				<br />
				<div class="card-body">
					<div class="table-responsive"
						style="width: 100%; height: 300px; overflow: auto">
						<table class="table table-striped table-bordered first">
							<thead>
								<tr>
									<th><input type="checkbox" id="cbx_chkAll" /></th>
									<th>주문 번호</th>
									<th>거래처 코드</th>
									<th>거래처 이름</th>
									<th>주문 이름</th>
									<th>주문 날짜</th>
									<th>납기일</th>
									<th>진행도</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${orderList }" var="order">
									<tr data-id="${order.orderNo }">
										<td><input type="checkbox" id="cbx_chkAll"
											value="${order.orderNo }" /></td>
										<td>${order.orderNo }</td>
										<td>${order.vendCd }</td>
										<td>${order.vendNm }</td>
										<td>${order.orderNm }</td>
										<td><fmt:formatDate value="${order.orderDt }"
												pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${order.paprdDt }"
												pattern="yyyy-MM-dd" /></td>
										<td>${order.progAppe }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	$("#addBtn")
			.on(
					"click",
					function() {
						let tr = document.querySelectorAll("tr");
						let orderNo = tr[tr.length - 1].children[1].innerText;

						let tbody = $("table tbody");
						let newRow = $("<tr>");
						newRow.append($("<td>").html(
								'<input type="checkbox" name="chk" />'));
						newRow.append($("<td>").html(
								"ORD" + (parseInt(orderNo.substring(3)) + 1)));
						newRow
								.append($("<td>")
										.html(
												'<i class="bi bi-search" onclick="searchVendBtn()" data-bs-toggle="modal" data-bs-target="#basicModal"></i>'));
						newRow.append($("<td>").html(""));
						newRow.append($("<td>").html(""));
						newRow.append($("<td>").html(""));
						newRow.append($("<td>").html(""));
						newRow.append($("<td>").html("접수완료"));
						tbody.append(newRow);
					});

	function searchVendBtn() {
		console.log("클릭");
	}
</script>
