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
.col-md-2 {
  display: flex;
  align-items: flex-end;
}
div#prcsInfo {
  border-left: 1px solid black;
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
			<form class="row g-3" id="searchOption" name="searchOption" action="searchProPlan" method="post" onsubmit="return false">
				<div class="col-md-6">
					<label for="inputEmail5" class="form-label">생산계획명</label> 
					<input type="text" class="form-control" name="planName" id="">
				</div>
				<div class="col-md-6">
					<label for="inputPassword5" class="form-label">생산계획상태</label> 
					<input type="text" class="form-control" name="nowSt" id="">
				</div>
				<div class="col-md-6">
					<label for="inputEmail5" class="form-label">제품명</label> 
					<input type="text" class="form-control" name="prdtNm" id="">
				</div>
				  <div class="col-md-6">
				    <label for="inputPassword5" class="form-label">생산계획일자</label>
				    <div class="d-flex">
				      <input type="date" class="form-control me-2" name="firstDate" placeholder="년-월-일">
				      <input type="date" class="form-control" name="lastDate" placeholder="년-월-일">
				    </div>
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
			<table id="selectPlanTable" class="table table-hover">
				<thead>
					<tr>
						<th scope="col"><input type="checkbox"></th>
						<th scope="col">생산계획일자</th>
						<th scope="col">생산계획명</th>
						<th scope="col">제품명</th>
						<th scope="col">주문수량</th>
						<th scope="col">현재상황</th>
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
							<td>${item.planName }(${item.planCd })</td>
							<td>${item.prdtNm }</td>
							<td>${item.orderCnt }</td>
							<td>${item.nowSt }</td>
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
	<div class="modal fade" id="orderSheet" data-bs-backdrop="static" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">미지시 주문서 조회</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table id="orderSheetTable" class="table table-hover">
						<thead id=aBox>
							<tr>
								<th scope="col"><input type="checkbox"></th>
								<th scope="col">주문코드</th>
								<th scope="col">거래처</th>
								<th scope="col">제품명</th>
								<!-- <th scope="col">주문수량</th> -->
								<!-- <th scope="col">주문일자</th> -->
								<th scope="col">납기일자</th>
							</tr>
						</thead>
						<tbody id=ordSheetTable>
						</tbody>
					</table>
					<!-- End Multi Columns Form -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary addBtn">등록</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 생산계획 작성 -->
	<div class="modal fade" id="createPlan" data-bs-backdrop="static" tabindex="-1">
		<div class="modal-dialog modal-xl modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">새로운 생산계획 작성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="planForm" name="newPlan" action="newPlanInsert"
						method="POST" onsubmit="return false" class="row g-3">
						<h5 class="modal-title">생산계획</h5>
						<div class="col-md-5">
							<label class="form-label">제품명*</label> <input type="hidden"
								class="form-control" id="edctsCd"  readonly>
							<select id="prdtNm"  class="form-select"
								aria-label="Default select example">
							</select>
						</div>
						<div class="col-md-5">
							<label class="form-label">생산수량*</label> <input type="text"
								class="form-control" id="orderCnt"  value="">
						</div>
						<div class="col-md-2">
							<button id="addProduct" type="button" class="btn btn-primary">제품추가</button>
						</div>
						<div class="col-md-12">
							<div class="col-sm-10">
			                    <select id="multiPro" class="form-select" multiple="" aria-label="multiple select example">
			                    </select>
			                </div>
						</div>
						<div class="col-md-6">
							<label class="form-label">생산계획명</label> <input id="planNameInput" type="text"
								name="planName" class="form-control">
						</div>
						<div class="col-md-6">
							<label class="form-label">생산계획일자</label> <input type="date"
								class="form-control" id="currentDate" readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">생산시작 예정일*</label> <input type="date"
								name="wkToDt"  id="myDate" class="form-control">
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
						<div class="row col-md-12">
							<div class="col-md-8">
								<h5 class="modal-title">자재정보</h5>
								<table class="table table-hover">
									<thead>
										<tr>
											<th scope="col">자재명</th>
											<th scope="col">단위</th>
											<th scope="col">자재유형</th>
											<th scope="col">현재재고량</th>
											<th scope="col">예정자재소모량</th>
										</tr>
									</thead>
									<tbody id="rscTable">
		
									</tbody>
								</table>
							</div>
							<div id="prcsInfo" class="col-md-4">
								<h5 class="modal-title">공정정보</h5>
								<table class="table table-hover">
									<thead>
										<tr>
											<th scope="col">공정순서</th>
											<th scope="col">공정유형</th>
											<th scope="col">공정명</th>
										</tr>
									</thead>
									<tbody id="prcsFlowInfo">
		
									</tbody>
								</table>
							</div>
						</div>
					</form>
					<hr>
					<!-- End Multi Columns Form -->
				</div>
				<div class="modal-footer">
					<button id="newPlanSubmit" type="button" class="btn btn-primary">등록</button>
					<button id="cancelPlan" type="button" class="btn btn-secondary">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End Modal Dialog Scrollable-->
</body>
<script>

	
	$(document).ready(function() {
		  $('#multiPro').on('click', 'option', function(e) {
			  console.log(e.target);
			  let edctsCd = e.target.value
			  console.log(edctsCd);
			  $.ajax({
					 url:'getPrcsFlow',
					 type:'post',
					 data: {edctsCd : edctsCd},
					 success: function(data) {
						 console.log(data);
						 $('#prcsFlowInfo').empty();

						 data.prcsFlow.forEach(function(item) {
						   let tr = $('<tr>');
						   let td1 = $('<td>').text(item.prcsNo);
						   let td2 = $('<td>').text(item.prcsFg);
						   let td3 = $('<td>').text(item.prcsNm);
						   tr.append(td1, td2, td3);
						   $('#prcsFlowInfo').append(tr);
						 });
					 },
					 error: function(error) {
						 console.log(error);
					 }
					 
				 })
		 })
		
		 $("#searchOption").submit(function(event) {
			    event.preventDefault(); 

			    var formData = $(this).serialize();

			    $.ajax({
			      url: $(this).attr("action"),
			      type: $(this).attr("method"),
			      data: formData,
			      success: function(data) {
			        console.log(data);
			      },
			      error: function(error) {
			        console.log(error);
			      }
			    });
			  });
		
		
		
		
		// thead의 checkbox 클릭 시, tbody의 모든 checkbox 선택/해제
		$("#aBox input[type='checkbox']").on("click", function() {
		  var checked = $(this).prop("checked");
		  $("#ordSheetTable input[type='checkbox']").prop("checked", checked);
		});

		// tbody의 checkbox 클릭 시, thead의 checkbox 업데이트
		$("#ordSheetTable").on("click", "input[type='checkbox']", function() {
		  var allChecked = $("#ordSheetTable input[type='checkbox']").length === $("#ordSheetTable input[type='checkbox']:checked").length;
		  $("#aBox input[type='checkbox']").prop("checked", allChecked);
		});
		//오늘 이전 날짜 선택 불가
		  var today = new Date().toISOString().split("T")[0];

		  // myDate 요소의 change 이벤트 핸들러 등록
		  $("#myDate").change(function() {
		    var selectedDate = $(this).val();
		    if (selectedDate < today) {
		      alert("오늘 이전의 날짜는 선택할 수 없습니다.");
		      $(this).val("");
		    }
		  });

		//계획수량 숫자만 가능
		$('#orderCnt').on('input', function() {
			var inputVal = this.value;
			if (!/^[0-9]*$/.test(inputVal)) {
				alert('숫자만 입력 가능합니다.');
				this.value = inputVal.replace(/[^0-9]/g, '');
			}
		});
		  
		  const headCheckbox = $('#allProductTable thead input[type="checkbox"]');
		  const bodyCheckboxes = $('#allProductTable tbody input[type="checkbox"]');
		  // thead의 체크박스 요소가 변경될 때
		  headCheckbox.on('change', function() {
		    // tbody의 모든 체크박스 요소의 상태를 thead의 체크박스 요소와 동기화합니다.
		    bodyCheckboxes.prop('checked', this.checked);
		  });
		

		  // tbody의 체크박스 요소 중 하나가 변경될 때
		  bodyCheckboxes.on('change', function() {
		    // 체크박스 요소가 모두 선택되어 있는지 확인합니다.
		    const allChecked = bodyCheckboxes.length === bodyCheckboxes.filter(':checked').length;
		    // thead의 체크박스 요소의 상태를 변경합니다.
		    headCheckbox.prop('checked', allChecked);
		  })
		//취소 버튼 클릭시
		var actionForm = $("#actionForm");
		$("#cancelPlan").on("click", function(e) {
		if(confirm('생산계획을 취소하시겠습니까?(작성중인 계획서 모두 사라집니다.)')){
  		    $('#planForm input[type=text], #planForm input[type=date]').val('');
		    $('#planForm select option:selected').prop('selected', false);
		    $("#orderNo").attr("readonly", false);
		    $("#vendNm").attr("readonly", false);
		    $("#prdtNm").attr("readonly", false);
		    $("#orderCnt").attr("readonly", false);
		    $("#orderDt").attr("readonly", false);
		    $("#paprdDt").attr("readonly", false);

		    $('#multiPro').empty();
			$('#createPlan').modal('hide');
		} 
		})
		

	})
	
	$(document).ready(function() {
		$('#multiPro').on('change', function() {
			$('#rscTable').empty();
			  var edctsCds = [];
			  $('#multiPro option:selected').each(function() {
				    edctsCds.push($(this).val());
			  });
			  console.log(edctsCds);
			  
			  $.ajax({
				  url: "getRscStock",
				  type: "POST",
				  data: JSON.stringify(edctsCds),
				  contentType: "application/json",
				  success: function(data) {
				    console.log(data);
					 const tbody = $('#rscTable');

					for (let result in data) {
					  $('#multiPro option').each(function() {
					  var optionEdctsCd = $(this).val();
					  var optionSum = parseInt($(this).data('sum'));
					  var resultEdctsCd = result;
					  if(optionEdctsCd == resultEdctsCd){
						  for (let i = 0; i < data[result].length; i++) {
						    const rsc = data[result][i];
						    console.log(rsc.rscCd, rsc.rscNm, rsc.rscSpec, rsc.rscStc, rsc.rscTyp, rsc.unit, rsc.useCnt);
						      var useCnt = parseInt(rsc.useCnt);
						      var sum = optionSum * rsc.useCnt;
							  const tr = $('<tr>'); // tr 생성
							  const tdName = $('<td>').text(rsc.rscNm); // 자재명(단위) 생성
							  const tdSepc = $('<td>').text(rsc.rscSpec);
							  const tdType = $('<td>').text(rsc.rscTyp); // 자재유형 생성
							  const tdAmount = $('<td>').text(rsc.rscStc); // 현재재고량 생성
							  const tdUsage = $('<td>').text(sum); // 예정자재소모량 생성
		
							  tr.append(tdName, tdSepc, tdType, tdAmount, tdUsage); // tr에 td 추가
							  tbody.append(tr); // tbody에 tr 추가
						    
						  }
					  }
					  });
					}
					
					$('#rscTable tr').each(function() {
						  const currentRow = $(this);
						  const currentName = currentRow.find('td:first-child').text();
						  $('#rscTable tr').each(function() {
						    const otherRow = $(this);
						    const otherName = otherRow.find('td:first-child').text();
						    const currentUsage = parseInt(currentRow.find('td:last-child').text());
						    const otherUsage = parseInt(otherRow.find('td:last-child').text());
						    if (currentName === otherName && currentRow[0] !== otherRow[0]) {
								let sum = currentUsage + otherUsage;
								otherRow.find('td:last-child').text(sum);
								currentRow.remove();
						    }
						  });
						});
					
					$('#rscTable tr').each(function() {
						  const thirdTd = $(this).find('td:nth-child(4)');
						  const fourthTd = $(this).find('td:nth-child(5)');
						  const thirdValue = parseInt(thirdTd.text());
						  const fourthValue = parseInt(fourthTd.text());
						  if (thirdValue < fourthValue) {
						    thirdTd.css('color', 'red');
						  }
						});
					
					
			 		/* // 현재 모달창 닫기
					$('#orderSheet').modal('hide');
					// 다른 모달창 열기
					$('#createPlan').modal('show'); */ 
				  },
				  error: function(xhr, status, error) {
				    // 요청이 실패한 경우 실행할 코드를 작성합니다.
				  }
				});
			  
			  
			  
			  
		});
		
		
		
		$.ajax({
			  url: '${pageContext.request.contextPath }/getPrdtInfo', 
			  type: 'GET', 
			  dataType: 'json',
			  success: function(data) {
				localStorage.setItem('prdtInfo', JSON.stringify(data.prdtInfo));
			    console.log(data.prdtInfo);
			    var prdtInfo = data.prdtInfo;
			 	// select 요소를 가져옴
			    var prdtSelect = $('#prdtNm');

			    // 기본값인 '선택하세요' 옵션을 추가
			    prdtSelect.append($('<option>', {
			      value: '',
			      text: '선택하세요'
			    }));
			    $.each(prdtInfo, function(index, item) {
			    	  prdtSelect.append($('<option>', {
			    	    value: item.edctsCd,
			    	    text: item.prdtNm,
			    	    "data-bomcd": item.bomCd
			    	  }));
			    	});
			  },
			  error: function(xhr, status, error) {
			    // 요청이 실패했을 때 처리할 로직
			    console.error('요청 실패:', error);
			  }
			});
		
		$('#addProduct').click(function() {
			  var selectedOption = $('#prdtNm option:selected');
			  var selectedOptionText = selectedOption.text();
			  var selectedOptionValue = selectedOption.val();
			  var selectedBomValue = $('#prdtNm option:selected').data("bomcd");
			  console.log(selectedBomValue);
			  var orderCntValue = $('#orderCnt').val();

			  if (selectedOptionValue && orderCntValue ) {
			    var isExist = false;
			    $('#multiPro option').each(function() {
			      if ($(this).data('nm') == selectedOptionText) {
			        var sum = parseInt($(this).data('sum')) + parseInt(orderCntValue);
			        $(this).data('sum', sum);
			        $(this).text(selectedOptionText + ' / ' + sum + ' / ' + selectedBomValue);
			        isExist = true;
			        return false; // loop를 멈추기 위해 false를 반환합니다.
			      }
			    });
			    if (!isExist) {
			      var newOption = $('<option>', {
			        value: selectedOptionValue,
			        text: selectedOptionText + ' / ' + orderCntValue + ' / ' + selectedBomValue,
			        'data-sum': orderCntValue,
			        'data-bom': selectedBomValue,
			        'data-nm': selectedOptionText
			      });
			      $('#multiPro').append(newOption);
			    }

			    $('#prdtNm option:selected').prop('selected', false);
			    $('#orderCnt').val('');
			  } else {
			    alert('제품정보를 입력해주세요.')
			  }
			});
		
		
		
		//계획 작성 버튼 클릭시
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
 		let planName = document.getElementById('planNameInput');
		let wkToDt = document.getElementsByName('wkToDt')[0];
		let multiPro = document.getElementById('multiPro');

		if(multiPro.selectedOptions.length === 0) {
		  alert("제품이 선택되지 않았습니다.");
		  multiPro.focus();
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


	}
	//등록버튼 클릭 이벤트
	document.querySelector('#newPlanSubmit')
			.addEventListener('click', submitPlanForm);
	
	function submitPlanForm() {
			if(formOptionchk() != false){
			var selectedValues = $('#multiPro').val();
			var productArray = [];
			
			const selectedOrders = localStorage.getItem('selectedOrders');
	    	console.log(selectedOrders);
			var orderArray = JSON.parse(selectedOrders);
	    	console.log(orderArray);
	    	
	    	// 결과 값을 저장할 변수
	    	var resultString = '';

	    	// orderArray 값이 null이거나 빈 배열인 경우
	    	if (orderArray == null || orderArray.length === 0) {
	    	  resultString = 'NOTORD';
	    	} else {
	    	  // 각 항목을 하나씩 꺼내서 문자열로 만들어 resultString에 추가
	    	  orderArray.forEach(function(order) {
	    	    resultString += order + '/';
	    	  });
	    	  
	    	  // 마지막에 추가된 ' / ' 문자열 제거
		      resultString = resultString.slice(0, -3);

		      // 결과 출력
		      console.log(resultString);
	    	}

	    	
			
			$('#multiPro option:selected').each(function() {
			  var value = $(this).val();
			  var sum = $(this).data('sum');
			  var bom = $(this).data('bom');
			  var productInfo = {
			    edctsCd: value,
			    orderCnt: sum,
			    BomCd: bom
			  };
			  productArray.push(productInfo);
			});

			console.log(productArray);
			
			var proPlanArray = [];
			for (var i = 0; i < productArray.length; i++) {
			    var proPlanVO = {};
			    $("#planForm [name]").each(function() {
			      proPlanVO[this.name] = $(this).val();
			    });
			    proPlanVO.orderNo = resultString;
			    proPlanVO.edctsCd = productArray[i].edctsCd;
			    proPlanVO.orderCnt = productArray[i].orderCnt;
			    proPlanVO.bomCd = productArray[i].BomCd;
			    proPlanArray.push(proPlanVO);
			    // 이후에 해당 배열을 서버로 보내는 ajax 코드 작성
			}
			console.log(proPlanArray);
			
			
			 $.ajax({
				    url: "${pageContext.request.contextPath }/addnewPlans",
				    type: "POST",
				    data: JSON.stringify(proPlanArray),
				    contentType: "application/json",
				    success: function(response) {
				      console.log(response.result);
				      if(response.result == 'Success'){
				    	  if (!orderArray == null) {
				    	  $.ajax({
				    		    url: "prcsOrderSheet",
				    		    type: "POST",
				    		    data: JSON.stringify(orderArray),
				    		    contentType: "application/json",
				    		    success: function(data){
				    		      localStorage.removeItem("selectedOrders");
				    			  console.log("주문서처리 "+data)
						    	  $('#planForm input[type=text], #planForm input[type=date]').val('');
					    		  $('#planForm select option:selected').prop('selected', false);
					  		      $("#orderNo").attr("readonly", false);
							      $("#vendNm").attr("readonly", false);
							      $("#prdtNm").attr("readonly", false);
							      $("#orderCnt").attr("readonly", false);
							      $("#orderDt").attr("readonly", false);
							      $("#paprdDt").attr("readonly", false);
					    		  $('#multiPro').empty();
						    	  if (confirm('생산계획이 등록되었습니다.\n계속해서 주문서를 등록하시겠습니까?')) {
						    		  getOrderSheet();
						    		  $('#createPlan').modal('hide');
						    		} else {
						    			$('#rscTable').empty();
						    		} 
						    	  
				    		  },
				    		  error: function(error){
				    			  console.log(error);
				    		  }
				    	  })
				    	  } else {
				    		  $('#planForm input[type=text], #planForm input[type=date]').val('');
				    		  $('#planForm select option:selected').prop('selected', false);
				  		      $("#orderNo").attr("readonly", false);
						      $("#vendNm").attr("readonly", false);
						      $("#prdtNm").attr("readonly", false);
						      $("#orderCnt").attr("readonly", false);
						      $("#orderDt").attr("readonly", false);
						      $("#paprdDt").attr("readonly", false);
				    		  $('#multiPro').empty();
					    	  if (confirm('생산계획이 등록되었습니다.\n계속해서 주문서를 등록하시겠습니까?')) {
					    		  getOrderSheet();
					    		  $('#createPlan').modal('hide');
					    		} else {
					    			$('#rscTable').empty();
					    		} 
				    		  
				    	  }
				      }
				    },
				    error: function(jqXHR, textStatus, error) {
				      console.error('요청 실패:', error);
				    }
				  });
				
			} 
		
	}
	
	
	function getOrderSheet(callback){
		$.ajax({
			  url: 'getOrderSheet', 
			  type: 'GET', 
			  dataType: 'json',
			  success: function(data) {

				  var bomCdArray = [];
				  $.each(data.result, function(index, obj) {
				    var newObj = {};
				    newObj.edctsCd = obj.edctsCd;
				    newObj.bomCd = obj.bomCd;
				    
				    var exists = false;
				    $.each(bomCdArray, function(i, existingObj) {
				      if (existingObj.edctsCd === newObj.edctsCd && existingObj.bomCd === newObj.bomCd) {
				        exists = true;
				        return false; // break out of the inner loop
				      }
				    });
				    
				    if (!exists) {
				      bomCdArray.push(newObj);
				    }
				  });
				console.log(bomCdArray)
				
				localStorage.setItem('bomCdArray', JSON.stringify(bomCdArray));
				localStorage.setItem('orderSheetData', JSON.stringify(data.result));
			    // 성공적으로 응답 받았을 때 처리할 로직
			    var tbody = $("#ordSheetTable"); // tbody 선택
				  tbody.empty(); // tbody 비우기
				  var orderNos = {};

				  $.each(data.result, function(index, item) {
				      var orderNo = item.orderNo;
				      var edctsCd = item.edctsCd;
				      
				      // 이미 orderNo가 등록된 경우, 해당 tr의 prdtNm 값을 수정
				      if (orderNos[orderNo]) {
						    var prdtNmTd = orderNos[orderNo].find("td.prdtNm");
						    var prevText = prdtNmTd.text();
						    var count = prevText.match(/외\s*\d*\s*개/);
						    if (count) {
						        var num = parseInt(count[0].match(/\d+/)[0]);
						        num++;
						        prevText = prevText.replace(count[0], "외 " + num + "개");
						    } else {
						        prevText = prevText + " 외 1개";
						    }
						    prdtNmTd.text(prevText);
						} else {
				          var row = $("<tr>");
				          var inputTd = $("<td>").append($("<input>").attr("type", "checkbox"));
				          row.append(inputTd);
				          row.append($("<td>").text(orderNo));
				          row.append($("<td>").text(item.vendNm));
				          row.append($("<td>").addClass("prdtNm").text(item.prdtNm));
				          var paprdDt = formatDate(item.paprdDt)
				          row.append($("<td>").text(paprdDt));
				          var orderDt = formatDate(item.orderDt)
				          tbody.append(row);
				          
				          // orderNo 등록
				          orderNos[orderNo] = row;
				      }
				  });
				  // 모달 창 열기
				  $('#orderSheet').modal('show');
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


	 	// orderSheetData를 가져와서 JSON 형식으로 파싱합니다.
		var orderSheetData = JSON.parse(localStorage.getItem('orderSheetData'));
		console.log(orderSheetData);
		
		var selectedOrders = [];
		$("#ordSheetTable input[type='checkbox']:checked").each(function() {
		  var item = $(this).closest("tr").find("td:eq(1)").text();
		  selectedOrders.push(item);
		});
		console.log(selectedOrders);
		localStorage.removeItem("selectedOrders");
		localStorage.setItem('selectedOrders', JSON.stringify(selectedOrders));
		// localStorage에서 선택된 항목만 필터링하기
		var orderSheetData = JSON.parse(localStorage.getItem("orderSheetData"));
		var filteredOrder = orderSheetData.filter(function(item) {
		  return selectedOrders.indexOf(item.orderNo) !== -1;
		});

		console.log(filteredOrder);
		
		//edctsCd값 구하기
		var edctsCds = Array.from(new Set($.map(filteredOrder, function(item) {
		  return item.edctsCd;
		})));
		
		console.log(edctsCds);

		// filteredOrder 배열을 edctsCd를 기준으로 그룹화
		const groupedOrders = {};
		for (const order of filteredOrder) {
		  if (groupedOrders[order.edctsCd]) {
		    groupedOrders[order.edctsCd].push(order);
		  } else {
		    groupedOrders[order.edctsCd] = [order];
		  }
		}
		
		console.log(groupedOrders);
		
		// 각 그룹의 orderCnt 합 구하기
		const orderCntSum = {};
		for (const edctsCd in groupedOrders) {
		  let sum = 0;
		  let prdtNm = '';
		  for (const order of groupedOrders[edctsCd]) {
		    sum += order.orderCnt;
		    prdtNm = order.prdtNm;
		  }
		  orderCntSum[edctsCd] = {sum, prdtNm};
		}
		
		console.log(orderCntSum);
		
		var bomCdArray = JSON.parse(localStorage.getItem("bomCdArray"));
		
		for (const i in bomCdArray) {
		    const edctsCd = bomCdArray[i].edctsCd;
		    const bomCd = bomCdArray[i].bomCd;
		    console.log(edctsCd);
		    console.log(bomCd);

		    if (orderCntSum.hasOwnProperty(edctsCd)) {
		        const select = $('#multiPro');

		        select.append($('<option>', {
		            value: edctsCd,
		            text: orderCntSum[edctsCd].prdtNm + " / " + orderCntSum[edctsCd].sum + " / " + bomCd,
		            "data-sum": orderCntSum[edctsCd].sum,
		            "data-nm": orderCntSum[edctsCd].prdtNm,
		            "data-bom": bomCd
		        }));

		        const tr = $('<tr>');
		        tr.append($('<td>').append($('<input>', { type: 'checkbox' })));
		        tr.append($('<td>', { text: orderCntSum[edctsCd].prdtNm }));
		        tr.append($('<td>', { text: orderCntSum[edctsCd].sum }));
		        tr.append($('<td>', { text: '-' }));
		        $('#allPrdc').append(tr);
		    }
		}
		
		$.ajax({
			  url: "getRscStock",
			  type: "POST",
			  data: JSON.stringify(edctsCds),
			  contentType: "application/json",
			  success: function(data) {
			    // 성공적으로 요청을 처리한 후에 실행할 코드를 작성합니다.
			    console.log(data);
			 	// tbody 선택
				const tbody = $('#rscTable');

				for (let result in data) {
				  $('#multiPro option').each(function() {
				  var optionEdctsCd = $(this).val();
				  var optionSum = parseInt($(this).data('sum'));
				  var resultEdctsCd = result;
				  if(optionEdctsCd == resultEdctsCd){
					  for (let i = 0; i < data[result].length; i++) {
					    const rsc = data[result][i];
					    console.log(rsc.rscCd, rsc.rscNm, rsc.rscSpec, rsc.rscStc, rsc.rscTyp, rsc.unit, rsc.useCnt);
					      var useCnt = parseInt(rsc.useCnt);
					      var sum = optionSum * rsc.useCnt;
						  const tr = $('<tr>'); // tr 생성
						  const tdName = $('<td>').text(rsc.rscNm); // 자재명(단위) 생성
						  const tdType = $('<td>').text(rsc.rscTyp); // 자재유형 생성
						  const tdAmount = $('<td>').text(rsc.rscStc); // 현재재고량 생성
						  const tdUsage = $('<td>').text(sum); // 예정자재소모량 생성
	
						  tr.append(tdName, tdType, tdAmount, tdUsage); // tr에 td 추가
						  tbody.append(tr); // tbody에 tr 추가
					    
					  }
				  }
				  });
				}
				
				$('#rscTable tr').each(function() {
					  const currentRow = $(this);
					  const currentName = currentRow.find('td:first-child').text();
					  $('#rscTable tr').each(function() {
					    const otherRow = $(this);
					    const otherName = otherRow.find('td:first-child').text();
					    const currentUsage = parseInt(currentRow.find('td:last-child').text());
					    const otherUsage = parseInt(otherRow.find('td:last-child').text());
					    if (currentName === otherName && currentRow[0] !== otherRow[0]) {
							let sum = currentUsage + otherUsage;
							otherRow.find('td:last-child').text(sum);
							currentRow.remove();
					    }
					  });
					});
				
				$('#rscTable tr').each(function() {
					  const thirdTd = $(this).find('td:nth-child(3)');
					  const fourthTd = $(this).find('td:nth-child(4)');
					  const thirdValue = parseInt(thirdTd.text());
					  const fourthValue = parseInt(fourthTd.text());
					  if (thirdValue < fourthValue) {
					    thirdTd.css('color', 'red');
					  }
					});
				
				
		 		// 현재 모달창 닫기
				$('#orderSheet').modal('hide');
				// 다른 모달창 열기
				$('#createPlan').modal('show');
			  },
			  error: function(xhr, status, error) {
			    // 요청이 실패한 경우 실행할 코드를 작성합니다.
			  }
			});
		

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
		
		    var isChecked = false;
		    checkboxes.forEach(function(checkbox) {
		      if (checkbox.checked) {
		        isChecked = true;
		        return;
		      }
		    });
		
		    if (!isChecked) {
		      alert('삭제할 항목을 선택해주세요.');
		      return;
		    }
		
		    var isDeletable = true;
		    $("#proPlanChk input[type='checkbox']:checked").each(function() {
		      var nowSt = $(this).closest("tr").find("td:nth-child(9)").text();
		      if (nowSt === '지시완료' || nowSt === '생산완료') {
		        isDeletable = false;
		        return;
		      }
		    });
		
		    // nowSt가 '미지시'인 경우 함수를 종료합니다.
		    if (!isDeletable) {
		      alert('진행 상태가 \'미지시\'인 계획만 취소할 수 있습니다..');
		      return;
		    }
		
		    if (!confirm("동일한 계획건 모두 취소됩니다.\n선택한 항목을 취소하시겠습니까?")){
		      return;
		    }
		    var planCdList = [];
		    $("#proPlanChk input[type='checkbox']:checked").each(function() {
		      var planCd = $(this).closest("tr").find("#hiddenPlanCd").text();
		      planCdList.push(planCd);
		    });
			console.log(planCdList);
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
    

    
</script>
</html>