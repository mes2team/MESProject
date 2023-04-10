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
							<th scope="col">가동여부</th>
						</tr>
					</thead>
					<tbody id="listTable">
						<c:forEach items="${OprList }" var="opr">
							<tr onclick="">
								<td scope="row"><input type="checkbox"></td>
								<td scope="row">${opr.noprCd}</td>
								<td scope="row">${opr.eqmCd}</td>
								<td scope="row">${opr.eqmNm}</td>
								<td scope="row"><fmt:formatDate value="${opr.frDt}"
										pattern="yyyy-MM-dd" /></td>
								<td scope="row"><fmt:formatDate value="${opr.toDt}"
										pattern="yyyy-MM-dd" /></td>
								<td scope="row">${opr.eqmPsch}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button onclick="test()">test</button>
			</div>
		</div>
	</div>
	<script>
		function test() {
			console.log("${OprList}")
		}
	</script>
</body>
</html>