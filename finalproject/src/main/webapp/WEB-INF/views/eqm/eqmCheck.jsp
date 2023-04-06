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
	<h1>설비점검내역</h1>
	
	<div class="col-auto">
		<label for="" class="col-form-label">설비명</label>
	</div>
	<div class="col-auto">
		<input type="text" name="" class="form-control">
	</div>
	<div class="col-auto">
		<label for="" class="col-form-label">점검일자</label>
	</div>
	<div class="col-auto">
		<input type="date" style="width: 150px; display: inline-block;"
			name="eqmMinTemp" class="form-control"> ~ <input
			type="date" style="width: 150px; display: inline-block;"
			name="eqmMaxTemp" class="form-control">
			<button type="button" class="btn btn-primary" onclick="search(eqmNm,start,end)">검색</button>
	</div>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th scope="col"><input type="checkbox" /></th>
				<th scope="col">점검일자</th>
				<th scope="col">점검코드</th>
				<th scope="col">설비코드</th>
				<th scope="col">설비명</th>
				<th scope="col">점검구분</th>
				<th scope="col">점검담당자</th>
				<th scope="col">판정</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="item">
				<tr id="" onclick="">
					<th scope="row"><input type="checkbox"></th>
					<th scope="row"><fmt:formatDate value="${item.chckDt}"
							pattern="yyyy/MM/dd" /></th>
					<th scope="row">${item.checkCd}</th>
					<th scope="row">${item.eqmCd}</th>
					<th scope="row">${item.eqmNm}</th>
					<th scope="row">${item.chckFg}</th>
					<th scope="row">${item.chckPsch}</th>
					<th scope="row">${item.jdgmnt}</th>
				</tr>
			</c:forEach>

		</tbody>
	</table>
<script>
	function search(eqmNm,start,end){
		
	}
</script>
</body>
</html>