<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
h5 {
	float: left;
}

.btnGrp {
	float: right;
	padding: 20px 0 15px 0;
}

form {
	clear: both;
}

.addBtn {
	background-color: #0d6efd;
}

table {
	text-align: left;
}

td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.scrollable {
	max-height: 500px;
	overflow: auto;
}

#processList input[type="text"], #processList input[type="date"] {
	border: none;
	height: 47px;
	width: 100%;
	box-sizing: border-box;
}

tbody#processList input:not([readonly]) {
	border: 1px solid green;
}

#processList td {
	padding: 0;
	vertical-align: middle;
}

#processList select {
	border: none;
	height: 47px;
	width: 100%;
	box-sizing: border-box;
	padding: 0;
	margin: 0;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}
#rscTable input[type="text"], 
#rscTable input[type="date"] {
	border: none;
	height: 47px;
	width: 100%;
	box-sizing: border-box;
}

#rscTable tbody input:not([readonly]) {
	border: 1px solid green;
}

#rscTable td {
	padding: 0;
	vertical-align: middle;
}

#rscTable select {
	border: none;
	height: 47px;
	width: 100%;
	box-sizing: border-box;
	padding: 0;
	margin: 0;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}
</style>
</head>
<body>
	<!-- 검색폼 영역 -->
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">생산지시페이지</h5>
			<div class="btnGrp">
				<button id="proPlanBtn" type="button" class="btn btn-primary"
					data-bs-toggle="modal" data-bs-target="#proPlanList">생산계획조회</button>
			</div>
			<!-- Multi Columns Form -->
			<form class="row g-3">
				<div class="col-md-6">
					<label for="inputEmail5" class="form-label">Email</label> <input
						type="email" class="form-control" id="">
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary">Submit</button>
					<button type="reset" class="btn btn-secondary">Reset</button>
				</div>
			</form>
			<!-- End Multi Columns Form -->

		</div>
	</div>

	<!-- 테이블 영역 -->
	<div class="card">
		<div class="card-body scrollable">
			<div class="btnGrp">
				<button id="deleteList" type="button" class="btn btn-primary">삭제</button>
				<button id="saveList" type="button" class="btn btn-primary">저장</button>
			</div>
			<!-- Table with hoverable rows -->
			<table id="processTable" class="table table-hover">
				<thead>
					<tr>
						<th scope="col"><input type="checkbox"></th>
						<th scope="col">생산지시일자</th>
						<th scope="col">작업시작일</th>
						<th scope="col">작업우선순위</th>
						<th scope="col">현재상태</th>
						<th scope="col">생산계획코드</th>
						<th scope="col">완제품명</th>
						<th scope="col">생산지시수량</th>
					</tr>
				</thead>
				<tbody id="processList">
					<c:forEach var="item" items="${ProOrders}">
						<tr>
							<td><input type="checkbox"></td>
							<td><input type="date" value="<fmt:formatDate value="${item.indicaDt }"
          									pattern="yyyy-MM-dd" />"readonly></td>
          					<c:choose>
								<c:when test="${empty item.wkFrDt}">
									<td><input type="date" value="<fmt:formatDate value=""
          									pattern="yyyy-MM-dd" />"readonly></td>
								</c:when>
								<c:otherwise>
									<td><input type="date" value="<fmt:formatDate value="${item.wkToDt }"
          									pattern="yyyy-MM-dd" />"readonly></td>
								</c:otherwise>
							</c:choose>
							<td><input type="text" value="${item.prefRank}" readonly></td>
							<td><input type="text" value="${item.nowSt}" readonly></td>
							<td><input type="text" value="${item.planCd}" readonly></td>
							<td><input type="text" value="${item.edctsCd}" readonly></td>
							<td><input type="text" value="${item.indicaCnt}" readonly></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- End Table with hoverable rows -->

		</div>
	</div>
	
	<!-- 모달창 -->
	<!-- 주문서 조회 -->
	<div class="modal fade" id="proPlanList" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">미지시 생산계획 조회</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">생산계획코드</th>
								<th scope="col">작업우선순위</th>
								<th hidden="true" scope="col">제품코드</th>
								<th hidden="true" scope="col">BOM</th>
								<th scope="col">제품명</th>
								<th scope="col">생산계획수량</th>
								<th scope="col">잔여계획수량</th>
								<th scope="col">등록</th>
							</tr>
						</thead>
						<tbody id="proPlanTable">
						</tbody>
					</table>
					<!-- End Multi Columns Form -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 생산지시 작성 -->
	<div class="modal fade" id="createProOrder" tabindex="-1">
		<div class="modal-dialog modal-xl modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">새로운 생산지시 작성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="planForm" name="newPlan" action="newPlanInsert"
						method="POST" onsubmit="return false" class="row g-3">
						<h5 class="modal-title">생산지시 정보</h5>
						<div class="col-md-6">
							<label class="form-label">생산지시일*</label> <input type="date"
								name="indicaDt" class="form-control">
						</div>
						<div class="col-md-6">
							<label class="form-label">생산계획코드</label> <input type="text"
								class="form-control" id="planCd" name="planCd" value="" readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">제품명</label>
							<input type="text" class="form-control" id="prdtNm"  value="" readonly> 
							<input type="hidden" class="form-control" id="edctsCd" name="edctsCd" readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">BOM</label>
							<input type="text" class="form-control" id="bomCd"  value="" readonly> 
						</div>
						<div class="col-md-6">
							<label class="form-label">주문수량</label> 
							<input type="text" class="form-control" id="orderCnt" value="" readonly> 
						</div>
						<div class="col-md-6">
							<label class="form-label">생산지시수량</label> 
							<input type="text" class="form-control" id="indicaCnt" value="" > 
						</div>
						<div class="col-md-6">
							<label class="form-label">우선순위</label> <input type="text"
								class="form-control" id="prefRank" name="prefRank" value="">
						</div>
						<hr>
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col">자재LOT번호</th>
									<th scope="col">자재명</th>
									<th scope="col">자재유형</th>
									<th scope="col">재고수량</th>
									<th scope="col">투입공정명</th>
									<th scope="col">유통기간</th>
								</tr>
							</thead>
							<tbody id="rscTable">
								<tr>
									<th><input type="checkbox"></th>
									<td><input type="text" name="rscLotCd" value="" readonly></td>
									<td hidden="true"><input type="text" name="rscCd" value="" readonly></td>
									<td><input type="text" name="rscNm" value="" readonly></td>
									<td><input type="text" name="rscTyp" value="" readonly></td>
									<td><input type="text" name="lotRmnCnt" value="" readonly></td>
									<td><input type="text" name="prcsNm" value="" readonly></td>
									<td><input type="date" name="expDt" value="" readonly></td>
								</tr>
							</tbody>
						</table>
					</form>
					<div id="plansDiv" style="display:none;">
					<h5 class="modal-title">작성완료된 생산계획</h5>
							<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col"><input type="checkbox"></th>
									<th scope="col">주문번호</th>
									<th scope="col">생산계획명</th>
									<th scope="col">제품명</th>
									<th scope="col">수량</th>
									<th scope="col">납기일자</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody id="plansBefore">
							</tbody>
						</table>
					</div>
					<hr>
					<!-- End Multi Columns Form -->
				</div>
				<div class="modal-footer">
					<button id="morePlan" type="button" class="btn btn-primary">추가 등록하기</button>
					<button id="newPlanSubmit" type="button" class="btn btn-primary">등록</button>
					<button id="cancelPlan" type="button" class="btn btn-secondary">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<script>
	
	$(document).ready(function() {
		$('#proPlanBtn').on('click', getPlanToOrder);
		
		$(document).on("click", ".addBtn", function() {
		  // item.bomCd 값 가져오기
		   	  var tr = $(this).closest("tr"); 
			  var planCd = tr.find("td:eq(0)").text(); 
			  var prefRank = tr.find("td:eq(1)").text(); 
			  var edctsCd = tr.find("td:eq(2)").text(); 
			  var bomCd = tr.find("td:eq(3)").text(); 
			  var prdtNm = tr.find("td:eq(4)").text(); 
			  var orderCnt = tr.find("td:eq(5)").text(); 
			  var paprdDt = tr.find("td:eq(6)").text(); 
		  	  
			  $("#planCd").val(planCd);
			  $("#prdtNm").val(prdtNm);
			  $("#edctsCd").val(edctsCd);
			  $("#bomCd").val(bomCd);
			  $("#orderCnt").val(orderCnt);
			  $("#paprdDt").val(paprdDt);
			  $("#prefRank").val(prefRank);
		  // AJAX 요청
		  $.ajax({
		    url: "getBomInfo",
		    type: "GET",
		    data: {
		      bomCd: bomCd
		    },
		    success: function(response) {
		      console.log(response.result)
			    $("#rscTable tr").remove();
			
			    $.each(response.result, function(index, item) {
			      var tr = $("<tr>");
			      var checkbox = $("<input>").attr({
			        type: "checkbox",
			        name: "check[]"
			      });
			      var rscLotCd = $("<input>").attr({
			        type: "text",
			        name: "rscLotCd[]",
			        value: item.rscLotCd
			      }).prop("readonly", true);
			      var rscCd = $("<input>").attr({
			        type: "text",
			        name: "rscCd[]",
			        value: item.rscCd
			      }).prop("readonly", true).hide();
			      var rscNm = $("<input>").attr({
			        type: "text",
			        name: "rscNm[]",
			        value: item.rscNm
			      }).prop("readonly", true);
			      var rscTyp = $("<input>").attr({
			        type: "text",
			        name: "rscTyp[]",
			        value: item.rscTyp
			      }).prop("readonly", true);
			      var lotRmnCnt = $("<input>").attr({
			        type: "text",
			        name: "lotRmnCnt[]",
			        value: item.lotRmnCnt
			      }).prop("readonly", true);
			      var prcsNm = $("<input>").attr({
			        type: "text",
			        name: "prcsNm[]",
			        value: item.prcsNm
			      }).prop("readonly", true);
			      var expDt = $("<input>").attr({
			        type: "date",
			        name: "expDt[]",
			        value: ""
			      }).prop("readonly", true);
			
			      tr.append($("<th>").append(checkbox));
			      tr.append($("<td>").append(rscLotCd));
			      tr.append($("<td>").append($("<input>").attr("name", "rscCd").text(rscCd)).prop("hidden", true));
			      tr.append($("<td>").append(rscNm));
			      tr.append($("<td>").append(rscTyp));
			      tr.append($("<td>").append(lotRmnCnt));
			      tr.append($("<td>").append(prcsNm));
			      var expDt = formatDate(item.expDt)
			      tr.append($("<td>").append(expDt));
			
			      $("#rscTable").append(tr);
			    });
		      
		      $('#proPlanList').modal('hide');
		      $('#createProOrder').modal('show');
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		      // 요청 실패 시 처리할 코드
		    }
		  });
		});

	})
	
	
	
	function getPlanToOrder(){
		$.ajax({
			  url: 'getPlanToOrder', 
			  type: 'GET', 
			  dataType: 'json',
			  success: function(data) {
			    console.log(data);
			    localStorage.removeItem("proPlanResult");
			    localStorage.setItem("proPlanResult", JSON.stringify(data.result));
			    var tbody = $("#proPlanTable");
				  tbody.empty(); 
				  
				  $.each(data.result, function(index, item) {
				    var row = $("<tr>"); 

				    row.append($("<th scope='row'>").text(index + 1));
				    row.append($("<td>").text(item.planCd));
				    row.append($("<td>").text(item.prefRank));
				    row.append($("<td>").text(item.prdtNm));
				    row.append($("<td>").text(item.orderCnt));
				    var button = $("<button>", {
				        type: "button",
				        class: "btn btn-primary addBtn",
				        text: "등록",
				        style: "background-color: #0d6efd;"
				    });
				    row.append(button);
				    
				    tbody.append(row); 
				  })

			  },
			  error: function(error) {
			    console.error('요청 실패:', error);
			  }
			});
	}
	
	function formatDate(time) {
	    var date = new Date(time);
	    var year = date.getFullYear();
	    var month = ("0" + (date.getMonth() + 1)).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);
	    var formattedDate = year + "-" + month + "-" + day;
	    return formattedDate;
	}


	
	</script>
</body>
</html>