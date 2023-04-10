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
	text-align: center;
}

td input[type='text'] {
	width: 100%;
	box-sizing: border-box;
}

td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<!-- 검색폼 영역 -->
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">생산계획페이지</h5>
			<div class="btnGrp">
				<button id="orderSheetBtn" type="button" class="btn btn-primary"
					data-bs-toggle="modal" data-bs-target="#orderSheet">주문서</button>
				<button id="proPlanInsert" type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#createPlan">계획등록</button>
			</div>
			<!-- Multi Columns Form -->
			<form class="row g-3">
				<div class="col-md-6">
					<label for="inputEmail5" class="form-label">Email</label> <input
						type="email" class="form-control" id="inputEmail5">
				</div>
				<div class="col-md-6">
					<label for="inputPassword5" class="form-label">Password</label> <input
						type="password" class="form-control" id="inputPassword5">
				</div>
				<div class="col-md-6">
					<label for="inputEmail5" class="form-label">Email</label> <input
						type="email" class="form-control" id="inputEmail5">
				</div>
				<div class="col-md-6">
					<label for="inputPassword5" class="form-label">Password</label> <input
						type="password" class="form-control" id="inputPassword5">
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
		<div class="card-body">
			<h5 class="card-title">생산계획조회</h5>
			<div class="btnGrp">
				<button id="deleteList" type="button" class="btn btn-primary">계획취소</button>
				<button id="updateList" type="button" class="btn btn-primary">계획수정</button>
				<button id="updateComplete" type="button" class="btn btn-primary"
					style="display: none">수정완료</button>
			</div>
			<!-- Table with hoverable rows -->
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col"><input type="checkbox"></th>
						<th scope="col">생산계획일자</th>
						<th scope="col">생산계획명</th>
						<th scope="col">주문번호</th>
						<th scope="col">제품명</th>
						<th scope="col">주문수량</th>
						<th scope="col">현재상황</th>
						<th scope="col">납기일자</th>
						<th scope="col">생산시작예정일자</th>
						<th scope="col">생산종료일자</th>
					</tr>
				</thead>
				<tbody id="proPlanChk">
					<c:forEach var="item" items="${ProPlans}">
						<tr>
							<td id="hiddenPlanCd" hidden=true>${item.planCd }</td>
							<td hidden=true>${item.edctsCd }</td>
							<td><input type="checkbox"></td>
							<td><fmt:formatDate value="${item.planDt }"
									pattern="yyyy-MM-dd" /></td>
							<td>${item.planName }</td>
							<td>${item.orderNo }</td>
							<td>${item.prdtNm }</td>
							<td>${item.orderCnt }</td>
							<td>${item.nowSt }</td>
							<td><fmt:formatDate value="${item.paprdDt }"
									pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${item.wkToDt }"
									pattern="yyyy-MM-dd" /></td>
							<c:choose>
								<c:when test="${empty item.wkFrDt}">
									<td>-</td>
								</c:when>
								<c:otherwise>
									<td><fmt:formatDate value="${item.wkFrDt}"
											pattern="yyyy-MM-dd" /></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class='pull-right'>
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${pageMaker.prev }">
							<li class="page-item"><a class="page-link"
								href="${pageMaker.startPage -1}">Prev</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }">
							<li class="page-item"
								${pageMaker.cri.pageNum == num ? "active":"" }><a
								class="page-link" href="${num }">${num }</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="page-item"><a class="page-link"
								href="${pageMaker.endPage +1}">next</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<!-- 해당 페이지 클릭시 페이지번호와 가져올 데이터 개수(default 10개) -->
			<form action="${pageContext.request.contextPath }/productionPlan"
				id='actionForm' method='get'>
				<input type="hidden" name="pageNum"
					value="${pageMaker.cri.pageNum }"> <input type="hidden"
					name="amout" value="${pageMaker.cri.amount }">
			</form>
			<!-- End Table with hoverable rows -->

		</div>
	</div>

	<!-- 모달창 -->
	<!-- 주문서 조회 -->
	<div class="modal fade" id="orderSheet" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">미지시 주문서 조회</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">주문코드</th>
								<th scope="col">거래처</th>
								<th scope="col">제품명</th>
								<th scope="col">주문수량</th>
								<th scope="col">주문일자</th>
								<th scope="col">납기일자</th>
								<th scope="col">등록</th>
							</tr>
						</thead>
						<tbody id=ordSheetTable>
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

	<!-- 생산계획 작성 -->
	<div class="modal fade" id="createPlan" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">새로운 생산계획 작성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="planForm" name="newPlan" action="newPlanInsert"
						method="POST" onsubmit="return false" class="row g-3">
						<h5 class="modal-title">주문서 정보</h5>
						<div class="col-md-6">
							<label class="form-label">주문번호</label> <input type="text"
								class="form-control" id="orderNo" name="orderNo" value=""
								readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">거래처명</label> <input type="text"
								class="form-control" id="vendNm" value="" readonly> <input
								type="hidden" class="form-control" value="" readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">제품명*</label> <input type="hidden"
								class="form-control" id="edctsCd" name="edctsCd" readonly>
							<select id="prdtNm" name="prdtNm" class="form-select"
								aria-label="Default select example">
								<option value="">선택하세요</option>
								<c:forEach var="pinfo" items="${prdtInfo }">
									<option data-cd="${pinfo.edctsCd }" value="${pinfo.prdtNm }">${pinfo.prdtNm }/
										${pinfo.edctsCd }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-6">
							<label class="form-label">주문수량*</label> <input type="text"
								class="form-control" id="orderCnt" name="orderCnt" value="">
						</div>
						<div class="col-md-6">
							<label class="form-label">주문일자</label> <input type="date"
								class="form-control" id="orderDt" value="" readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">납기일자*</label> <input type="date"
								class="form-control" id="paprdDt" name="paprdDt" value="">
						</div>

						<hr>
						<h5 class="modal-title">생산계획</h5>
						<div class="col-md-6">
							<label class="form-label">생산계획코드</label> <input type="text"
								class="form-control" name="planCd" value="${nextPlanCd }"
								readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">생산계획명</label> <input type="text"
								name="planName" class="form-control">
						</div>
						<div class="col-md-6">
							<label class="form-label">생산계획일자</label> <input type="date"
								class="form-control" id="currentDate" readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">생산시작 예정일*</label> <input type="date"
								name="wkToDt" class="form-control">
						</div>
						<div class="col-md-6">
							<label class="form-label">BOM선택*</label> 
							<select id="bomSelect"
								name="bomCd" class="form-select"
								aria-label="Default select example">
								<option value="">선택하세요</option>
								<c:forEach var="item" items="${bomInfo}">
									<option data-cd="${item.edctsCd }" value="${item.bomCd}">${item.bomCd}/
										${item.standard}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-6">
							<label class="form-label">우선순위*</label> 
							<select name="prefRank"
								class="form-select" aria-label="Default select example">
								<option value="">선택하세요</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</div>
						<hr>
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col">자재명(단위)</th>
									<th scope="col">자재소모량</th>
									<th scope="col">자재유형</th>
									<th scope="col">투입공정</th>
								</tr>
							</thead>
							<tbody id="rscTable">

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
	<!-- End Modal Dialog Scrollable-->
</body>
<script>
	//취소 버튼 클릭시
	$(document).ready(function() {
		var actionForm = $("#actionForm");
		$("#cancelPlan").on("click", function(e) {
		if(!confirm('생산계획을 취소하시겠습니까?(작성중인 계획서 모두 사라집니다.)')){
			$('#createPlan').modal('hide');
		} else {
			$("#planForm :input:not([name='planCd'])").val("");
			$('#plansBefore').empty;
			$('#plansDiv').hide();
			$('#createPlan').modal('hide');
		}
		})
	})
	//계획 작성 버튼 클릭시
	$(document).ready(function() {
		$("#proPlanInsert").on("click", function(e) {
			/* 생산계획일자 오늘 설정 */
			document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
		})
	})
	
	//페이징 이동
	$(document).ready(function() {
		var actionForm = $("#actionForm");
		
		$(".page-item a").on("click", function(e) {
			//a 태그 클릭시 이벤트 방지
			e.preventDefault();
			//페이징 버튼의 속성값을 form태그의 input값에 입력
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			//페이징 이동 form 실행
			actionForm.submit();
		})
	})
	/* 메세지 체크 */
	function printAlert(message) {
		if(message == null || message == "") return	;		
		alert(message);
		
	}
	printAlert(`${message}`);


	function formOptionchk(){			
		//input값 체크
		let prdtNm = document.getElementById('prdtNm');
		let paprdDt = document.getElementById('paprdDt');
		let orderCnt = document.getElementById('orderCnt');
 		let planName = document.getElementsByName('planName')[0];
		let wkToDt = document.getElementsByName('wkToDt')[0];
		let bomSelect = document.getElementById('bomSelect');
		
		if(prdtNm.selectedOptions.length === 0 || prdtNm.selectedOptions[0].value === "") {
		  alert("제품명이 선택되지 않았습니다.");
		  prdtNm.focus();
		  return false;
		}
		if(paprdDt.value === "") {
		  alert("납기일자가 입력되지 않았습니다.");
		  paprdDt.focus();
		  return false;
		}
		if(orderCnt.value === "") {
		  alert("주문수량이 입력되지 않았습니다.");
		  orderCnt.focus();
		  return false;
		}
 		if(planName.value === "") {
		  alert("생산계획명이 입력되지 않았습니다.");
		  planName.focus();
		  return false;
		} 
		if(wkToDt.value === "") {
		  alert("생산시작 예정일이 입력되지 않았습니다.");
		  wkToDt.focus();
		  return false;
		}
		if(bomSelect.selectedOptions.length === 0 || bomSelect.selectedOptions[0].value === "") {
		  alert("BOM이 선택되지 않았습니다.");
		  bomSelect.focus();
		  return false;
		}
		//form의 name 속성을 사용

	}
	//등록버튼 클릭 이벤트
	document.querySelector('#newPlanSubmit')
			.addEventListener('click', submitPlanForm);
	
	function submitPlanForm() {
		//추가 사항 확인
		if ($("#plansDiv").is(":visible")) {
		  var selectedPlans = []; // 선택된 플랜을 담을 배열
		  $("#plansBefore tr").each(function() {
		    var $checkbox = $(this).find("td:first-child input[type='checkbox']");
		    var $status = $(this).find("td[data-id='status']");
		
		    if ($checkbox.is(":checked") && $status.text() === "작성완료") {
		      var plan = {}; // 플랜 정보를 담을 객체
		      $(this).find("td[data-id]").each(function() {
		        var key = $(this).attr("data-id");
		        var value = $(this).text();
		        plan[key] = value; // 객체에 data-id와 td 값 저장
		      });
		      selectedPlans.push(plan); // 선택된 플랜을 배열에 추가
		      
			  $.ajax({
				  type: "POST",
				  url: "addnewPlans",
				  data: JSON.stringify(selectedPlans), // 객체를 JSON 형태의 문자열로 변환하여 전송
				  contentType: "application/json; charset=utf-8",
				  dataType: "json",
				  success: function(response) {
				    console.log(response.result);
				    if(response.result == 'Success'){
				    	alert('등록이 완료되었습니다.')
				    	location.reload();
				    }
				  },
				  error: function(xhr, status, error) {
				    console.log(error);
				  }
				});

		    } else {
		    	alert('등록할 생산계획을 선택해주세요.');
		    	return;
		    }
		  });

		} else {
			if(formOptionchk() != false){
				newPlan.submit();
			} 
		}
	}
	
	
	
	function getOrderSheet(callback){
		$.ajax({
			  url: 'getOrderSheet', 
			  type: 'GET', 
			  dataType: 'json',
			  success: function(data) {
			    // 성공적으로 응답 받았을 때 처리할 로직
			    var tbody = $("#ordSheetTable"); // tbody 선택
				  tbody.empty(); // tbody 비우기
				  
				  // 데이터 반복문 처리
				  $.each(data.result, function(index, item) {
				    var row = $("<tr>"); 
				    
				    // td 생성		
				    row.append($("<td>").attr("hidden", true).text(item.edctsCd));
				    row.append($("<td>").attr("hidden", true).text(item.vendCd));
				    row.append($("<th scope='row'>").text(index + 1));
				    row.append($("<td>").text(item.orderNo));
				    row.append($("<td>").text(item.vendNm));
				    row.append($("<td>").text(item.prdtNm));
				    row.append($("<td>").text(item.orderCnt));
				    var orderDt = formatDate(item.orderDt)
				    row.append($("<td>").text(orderDt));
				    var paprdDt = formatDate(item.paprdDt)
				    row.append($("<td>").text(paprdDt));
				    var button = $("<button>", {
				        type: "button",
				        class: "btn btn-primary addBtn",
				        text: "등록",
				        style: "background-color: #0d6efd;"
				    });
				    row.append(button);
				    
				    tbody.append(row); 
				  })
				  // 모달 창 열기
				  $('#orderSheet').modal('show');
				  
				  callback();
			  },
			  error: function(xhr, status, error) {
			    // 요청이 실패했을 때 처리할 로직
			    console.error('요청 실패:', error);
			  }
			});
	}

	document.querySelector('#orderSheetBtn')
	.addEventListener('click', getOrderSheet);
	
	//주문서정보 배열로 저장할 변수
	var selectedProduct;
	
	/* 주문서정보 -> 생산계획작성 */
	$(document).on("click", ".addBtn", function() {
		/* 생산계획일자 오늘 설정 */
		document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
		
	    $(this).prop("disabled", true);
	    
	    // change background color
	    $(this).css("background-color", "gray");
	    
	    // change text
	    $(this).text("작성중");
		
		
	    var orderArray = [];
	    var row = $(this).closest("tr");    
	    row.find("td").each(function() {
	        orderArray.push($(this).text());
	    });
	    $("#orderNo").val(orderArray[2]); 
	    $("#prdtNm option").removeAttr("selected");
	    $("#prdtNm option[value='" + orderArray[4].trim() + "']").prop('selected', true);
	    $("#edctsCd").val(orderArray[0]); 
	    $("#vendNm").val(orderArray[3]); 
	    $("#orderDt").val(orderArray[6]);
	    $("#paprdDt").val(orderArray[7]); 
	    $("#orderCnt").val(orderArray[5]);
	    
	    getProductBOM(orderArray[0]);
	    

		      // 현재 모달창 닫기
		$('#orderSheet').modal('hide');
		      // 다른 모달창 열기
		$('#createPlan').modal('show');

	});
	
	// 날짜 포맷 변경 함수
	function formatDate(time) {
	    var date = new Date(time);
	    var year = date.getFullYear();
	    var month = ("0" + (date.getMonth() + 1)).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);
	    var formattedDate = year + "-" + month + "-" + day;
	    return formattedDate;
	}
	
	// bom선택시 이벤트
	$(document).ready(function() {
	  $("#bomSelect").change(function() {
	    // 선택된 옵션의 값을 가져와서 처리
	    var selectedBom = $(this).val();
	    console.log(selectedBom);
		$.ajax({
			  url: 'getBomRscInfo', 
			  type: 'GET', 
			  data: {
				  bomCd : selectedBom
			  },
			  dataType: 'json',
			  success: function(data) {
			    // 성공적으로 응답 받았을 때 처리할 로직
				console.log('요청 성공:', data.BomRscInfo);
			    var tbody = $("#rscTable"); // tbody 선택
				  tbody.empty(); // tbody 비우기
				  
				  // 데이터 반복문 처리
				  $.each(data.BomRscInfo, function(index, item) {
				    var row = $("<tr>"); 
				    
				    // td 생성		
				    row.append($("<th scope='row'>").text(index + 1));
				    row.append($("<td>").text(item.rscNm));
				    row.append($("<td>").text(item.useCnt+"("+item.unit+")"));
				    row.append($("<td>").text(item.rscTyp));
				    row.append($("<td>").text(item.prcsNm));
				    
				    tbody.append(row); 
				    });
				  
			  },
			  error: function(xhr, status, error) {
			    // 요청이 실패했을 때 처리할 로직
			    console.error('요청 실패:', error);
			  }
			});
	  });
	});

	/* 체크박스 연결 */
	// tbody의 체크박스
    const tbodyCheckbox = document.querySelectorAll('#proPlanChk input[type="checkbox"]');
    // thead의 체크박스
    const theadCheckbox = document.querySelector('th input[type="checkbox"]');

    // tbody의 체크박스의 상태를 모니터링하여 thead의 체크박스 상태를 변경
    function updateTheadCheckbox() {
        // tbody의 체크박스 중 하나라도 체크가 안되어 있으면 thead의 체크박스를 체크 해제
        if ([...tbodyCheckbox].some((checkbox) => !checkbox.checked)) {
            theadCheckbox.checked = false;
        } else {
            // tbody의 체크박스가 모두 체크 되어 있으면 thead의 체크박스를 체크
            theadCheckbox.checked = true;
        }
    }

    // tbody의 체크박스를 클릭할 때마다 thead의 체크박스 상태 업데이트
    tbodyCheckbox.forEach((checkbox) => {
        checkbox.addEventListener('click', () => {
            updateTheadCheckbox();
        });
    });

    // thead의 체크박스를 클릭할 때마다 tbody의 체크박스 상태 업데이트
    theadCheckbox.addEventListener('click', () => {
        tbodyCheckbox.forEach((checkbox) => {
            checkbox.checked = theadCheckbox.checked;
        });
    });
    
    //삭제버튼 
		$(document).ready(function() {
		  $("#deleteList").on("click", function() {
		    var checkboxes = document.querySelectorAll('#proPlanChk input[type="checkbox"]');
		
		    // 체크박스가 선택되었는지 확인합니다.
		    var isChecked = false;
		    checkboxes.forEach(function(checkbox) {
		      if (checkbox.checked) {
		        isChecked = true;
		        return;
		      }
		    });
		
		    // 체크박스가 선택되지 않았다면 함수를 종료합니다.
		    if (!isChecked) {
		      alert('삭제할 항목을 선택해주세요.');
		      return;
		    }
		
		    // nowSt가 '미지시'인지 확인합니다.
		    var isDeletable = true;
		    $("#proPlanChk input[type='checkbox']:checked").each(function() {
		      var nowSt = $(this).closest("tr").find("td:nth-child(9)").text();
		      if (nowSt === '미지시') {
		        isDeletable = false;
		        return;
		      }
		    });
		
		    // nowSt가 '미지시'인 경우 함수를 종료합니다.
		    if (!isDeletable) {
		      alert('진행 상태가 \'미지시\'인 계획은 삭제할 수 없습니다.');
		      return;
		    }
		
		    if (!confirm("선택한 항목을 삭제하시겠습니까?")){
		      return;
		    }
		    var planCdList = [];
		    $("#proPlanChk input[type='checkbox']:checked").each(function() {
		      var planCd = $(this).closest("tr").find("#hiddenPlanCd").text();
		      planCdList.push(planCd);
		    });
		
		    // 스프링 컨트롤러에 Ajax 요청을 보냅니다.
		    $.ajax({
		      url: "deletePlan",
		      type: "POST",
		      data: JSON.stringify(planCdList),
		      contentType: "application/json",
		      success: function(data) {
		        console.log(data);
		        if(data == "success"){
		          $("#proPlanChk input[type='checkbox']:checked").closest("tr").remove();
		        } else {
		          alert('통신결과를 받는데 실패');
		        }
		      },
		      error: function(jqXHR, textStatus, errorThrown) {
		        console.log(textStatus + ": " + errorThrown);
		      }
		    });
		  });
		});
    
    //수정 
    $(document).ready(function() { 	
    	
	  $("#updateList").on("click", function() {
			var checkboxes = document.querySelectorAll('#proPlanChk input[type="checkbox"]');
			  
			// 체크박스가 선택되었는지 확인합니다.
			var isChecked = false;
			checkboxes.forEach(function(checkbox) {
			  if (checkbox.checked) {
			    isChecked = true;
			    return;
			  }
			});

			// 체크박스가 선택되지 않았다면 함수를 종료합니다.
			if (!isChecked) {
			  alert('수정할 항목을 선택해주세요.')
			  return;
			}		
	    // 체크된 tr 태그의 td들을 input 태그로 변경
	    $("table").find("tr").each(function() {
	      if ($(this).find("td").eq(2).find("input[type='checkbox']").prop("checked")) {
	        $(this).find("td").eq(4).html("<input type='text' name='planName' value='" + $(this).find("td").eq(4).text() + "'>");
	        $(this).find("td").eq(6).html("<input type='text' name='prdtNm' value='" + $(this).find("td").eq(6).text() + "'>");
	        $(this).find("td").eq(7).html("<input type='text' style='width:90px;' name='orderCnt' value='" + $(this).find("td").eq(7).text() + "'>");
	        $(this).find("td").eq(10).html("<input type='date' name='wkToDt' value='" + $(this).find("td").eq(10).text() + "'>");
	      }	
	    });
	    $(this).hide();
	    $("#updateComplete").show();
	  });
	  
	  $("#updateComplete").on("click", function() {
			var checkboxes = document.querySelectorAll('#proPlanChk input[type="checkbox"]');
			  
			// 체크박스가 선택되었는지 확인합니다.
			var isChecked = false;
			checkboxes.forEach(function(checkbox) {
			  if (checkbox.checked) {
			    isChecked = true;
			    return;
			  }
			});

			// 체크박스가 선택되지 않았다면 함수를 종료합니다.
			if (!isChecked) {
			  alert('수정할 항목을 선택해주세요.')
			  return;
			}
		  // 데이터를 저장할 배열 선언
	      var dataArr = [];

	      // 체크된 체크박스의 개수만큼 반복하며 데이터 저장
		  $("table").find("tr").each(function() {
			  if ($(this).find("td").eq(2).find("input[type='checkbox']").prop("checked")) {
				var planCd =  $(this).find("td").eq(0).html(); 
				var planName =  $(this).find("td").eq(4).find("input").val().trim();
				var prdtNm =  $(this).find("td").eq(6).find("input").val().trim();
				var orderCnt =  $(this).find("td").eq(7).find("input").val().trim();
				var wkToDt =  $(this).find("td").eq(10).find("input").val().trim();
				
				// 객체 형식으로 데이터 저장
		        var dataObj = {
		        		planCd : planCd,
		        		planName : planName,
		        		prdtNm : prdtNm,
		        		orderCnt : orderCnt,
		        		wkToDt : wkToDt
		        }
		     // 데이터 배열에 객체 추가
		        dataArr.push(dataObj);
		      }
		  });
		/* 수정 통신 */
	  $.ajax({
	        url: "updateProPlan",
	        method: "POST",
	        headers: { "Content-Type": "application/json" },
	        data: JSON.stringify(dataArr),
	        success: function (data) {
	        	if (data.result == "success") {
	                $("#proPlanChk").find("tr").each(function() {
	                    if ($(this).find("td").eq(2).find("input[type='checkbox']").prop("checked")) {
	                        $(this).find("td").eq(4).html($(this).find("td").eq(4).find("input").val());
	                        $(this).find("td").eq(6).html($(this).find("td").eq(6).find("input").val());
	                        $(this).find("td").eq(7).html($(this).find("td").eq(7).find("input").val());
	                        $(this).find("td").eq(10).html($(this).find("td").eq(10).find("input").val());
	                    }
	                });
				    
	              $("table").find("input:not([type='checkbox']):checked").closest("tr").find("input").remove();
				  $("#updateList").show(); 	
				  $("#updateComplete").hide(); 
	        	}
	        },
	        error: function (reject) {
	          console.log(reject);
	        },
	      });
	  });
	});
    
    /* 제품 선택시 BOM 정보 들고 오기 */
    $(document).ready(function() {
	  $('#prdtNm').on('change', function() {
	    var edctsCd = $('option:selected', this).data('cd');
	    getProductBOM(edctsCd);
	  });
	});
    
    function getProductBOM(edctsCd) {
    	  $.ajax({
    	    type: 'GET',
    	    url: 'getPrdtBom',
    	    data: {
    	      edctsCd: edctsCd
    	    },
    	    success: function(response) {
    	      var select = $('#bomSelect');
    	      select.empty();

    	      select.append($('<option>').attr('disabled', true).attr('selected', true).text('BOM선택'));

    	      $.each(response.result, function(index, item) {
    	        if (item.standard !== null) {
    	          var option = $('<option>').attr('data-cd', item.edctsCd).attr('value', item.bomCd).text(item.bomCd + '/' + item.standard);
    	          select.append(option);
    	        }
    	      });
    	      $('#rscTable').empty();
    	    },
    	    error: function(xhr, status, error) {
    	      console.log(error);
    	    }
    	  });
    	}
    
    // 계획서 추가
    $('#morePlan').on('click', function() {
      if(formOptionchk() == false){
    	  return
      }
      drawPlans();	
	  if(confirm("주문서를 가져오시겠습니까?")) {
		  getOrderSheet(function() {
			    $('#createPlan').modal('hide');
			    //$('#orderSheet').modal('show');
			    $('#plansDiv').show();
			  });
	  } else {
	    $('#plansDiv').show();
	  }
	});
    
    
    
    function drawPlans() {
    	$('input[name="planCd"]').val("PLN"+(parseInt($('input[name="planCd"]').val().substring(3)) + 1));
    	// input과 select의 값을 가져와 변수에 저장
		  var orderNo = $("#orderNo").val().trim();
		  var edctsCd = $("#edctsCd").val().trim();
		  var prdtNm = $("#prdtNm").val();
		  var vendNm = $("#vendNm").val().trim();
		  var orderDt = $("#orderDt").val();
		  var paprdDt = $("#paprdDt").val();
		  var orderCnt = $("#orderCnt").val().trim();
		  var planCd = $("input[name=planCd]").val().trim();
		  var planName = $("input[name=planName]").val().trim();
		  var currentDate = $("#currentDate");
		  var wkToDt = $("input[name=wkToDt]").val();
		  var bomCd = $("#bomSelect").val();
		  var prefRank = $("select[name=prefRank]").val();
		
		  var tr = $("<tr>")
		    .append($("<td>").append($("<input>").attr("type", "checkbox")))
		    .append($("<td>").attr("data-id", "orderNo"))
		    .append($("<td>").attr("data-id", "planName"))
		    .append($("<td>").attr("data-id", "prdtNm"))
		    .append($("<td>").attr("data-id", "orderCnt"))
		    .append($("<td>").attr("data-id", "paprdDt"))
		    .append($("<td>").attr("data-id", "status"))
		    .append($("<td>").attr("data-id", "planCd").attr("hidden", true))
		    .append($("<td>").attr("data-id", "edctsCd").attr("hidden", true))
		    .append($("<td>").attr("data-id", "wkToDt").attr("hidden", true))
		    .append($("<td>").attr("data-id", "bomCd").attr("hidden", true))
		    .append($("<td>").attr("data-id", "prefRank").attr("hidden", true));

		// td 태그에 값을 넣어줍니다.
		tr.find("[data-id='planName']").text(planName);
		tr.find("[data-id='prdtNm']").text(prdtNm);
		tr.find("[data-id='orderCnt']").text(orderCnt);
		tr.find("[data-id='paprdDt']").text(paprdDt);
		tr.find("[data-id='status']").text('작성완료');
		tr.find("[data-id='orderNo']").text(orderNo);
		tr.find("[data-id='planCd']").text(planCd);
		tr.find("[data-id='edctsCd']").text(edctsCd);
		tr.find("[data-id='wkToDt']").text(wkToDt);
		tr.find("[data-id='bomCd']").text(bomCd);
		tr.find("[data-id='prefRank']").text(prefRank);

		// 테이블에 tr 태그를 추가합니다.
		$("#plansBefore").append(tr);		
	    
		$("#planForm :input:not([name='planCd'])").val("");
		/* 생산계획일자 오늘 설정 */
		document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
    }
</script>
</html>