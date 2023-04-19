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
            $("#matOrderList").DataTable({
               lengthChange: false,
                info: false,
                aaSorting : []
            });
        });
    </script>
    
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">



<!-- jQuery and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->


<meta charset="UTF-8">
<title>Material List</title>
<style>
table, tr, th, td {
	border: 1px solid black;
}


.low-stock {
	background-color: #FF0000;
}

#matOrderList th:first-child::after {
	display: none;
}

#matOrderList th:first-child::before {
	display: none;
}
#btnGrp {
	display: inline-blcok;
	float: right;
	text-align: right;
}
</style>
</head>
<body>
	<!-- ============================================================== -->
	<!-- pageheader pageheader pageheader pageheader pageheader -->
	<div class="row">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#" class="breadcrumb-link">자재관리</a></li>
				<!-- <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Tables</a></li> -->
				<li class="breadcrumb-item active" aria-current="page">자재발주</li>
			</ol>
		</nav>
	</div>
	<!-- pageheader pageheader pageheader pageheader pageheader -->
	<!-- ============================================================== -->
	<!-- 자재재고현황 자재재고현황 자재재고현황 자재재고현황 자재재고현황 자재재고현황 -->
	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card">
				<div class="card-body">
				<h3 class="">자재재고현황</h3>
					<div class="table-responsive"
						style="width: 100%; height: 300px; overflow: auto">
						<table id="stock-table"
							class="table table-bordered first table-hover">
							<thead>
								<tr>
									<th>No.</th>
									<th>자재코드</th>
									<th>자재명</th>
									<th>자재유형</th>
									<th>자재규격</th>
									<th>입고재고</th>
									<th>출고재고</th>
									<th>현재재고</th>
									<th>미입고잔량</th>
									<th>안전재고</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="stock" items="${matStock }" varStatus="loop">
									<tr data-id="${stock.rscCd }">
										<td>${loop.count }</td>
										<td>${stock.rscCd }</td>
										<td>${stock.rscNm }</td>
										<td>${stock.rscTyp }</td>
										<td>${stock.rscSpec }</td>
										<td>${stock.istStc }</td>
										<td>${stock.oustStc }</td>
										<td>${stock.rscstc }</td>
										<td>${stock.noIstCnt }</td>
										<td>${stock.safStc }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 자재재고현황 자재재고현황 자재재고현황 자재재고현황 자재재고현황 자재재고현황 -->
	<!-- ============================================================== -->
	<!-- 자재발주 등록 자재발주 등록 자재발주 등록 자재발주 등록 자재발주 등록 자재발주 등록 -->
	<div class="card">
		<div class="card-body">
			<h3 class="insert">자재발주 등록</h3>
			<div id="btnGrp">
				<button type="submit" class="btn btn-primary" id="insertBtn">등록</button>
				<button type="reset" class="btn btn-secondary" id="resetBtn">초기화</button>
			</div>
			<br>
			<form class="row g-3" name="insertForm" id="insertForm" action="matOrderInsert"
				method="post" onsubmit="return false"
				style="margin: 0px 5px 5px 5px;">

				<div class="col-md-2">
					<label class="form-label">발주신청일</label> <input type="date"
						class="form-control" id="ordrReqDtInput" name="ordrReqDtInput">
				</div>
				
				<div class="col-md-2">
                     <label for="country" class="form-label">자재명</label>
                     <div class="input-group">
						<input type="text" class="form-control" id="rscNmInput"
							name="rscNmInput" readonly />
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#rscNmSearch">
							<i class="bi bi-search"></i>
						</button>
					</div>
                  </div>
                  
                  <div class="col-md-1">
                     <label for="country" class="form-label">자재코드</label> <input
                        type="text" class="form-control" id="rscCdInput" name="rscCdInput"
                        readonly />
                  </div>
				
				<div class="col-md-2">
                     <label for="country" class="form-label">거래처명</label>
						<input type="text" class="form-control" id="vendNmInput"
							name="vendNmInput" readonly />
                  </div>
                  
                  <div class="col-md-1">
                     <label for="country" class="form-label">거래처코드</label> <input
                        type="text" class="form-control" id="vendCdInput" name="vendCdInput"
                        readonly />
                  </div>

				<div class="col-md-1">
					<label class="form-label">발주량</label> <input type="number"
						class="form-control" id="ordrCntInput" name="ordrCntInput"
						min="0" />
				</div>
				<div class="col-md-2">
					<label class="form-label">납기요청일</label> <input type="date"
						class="form-control" id="paprdCmndDtInput" name="paprdCmndDtInput">
				</div>
				

				
			</form>
			<input type="text"
						class="form-control" id="ordrCdInput" name="ordrCdInput"
						 style="display: none"/>
		</div>
	</div>
	<!-- 자재발주 등록 자재발주 등록 자재발주 등록 자재발주 등록 자재발주 등록 자재발주 등록 -->
	<!-- ============================================================== -->
	<!-- 모달 자재+거래처목록 모달 자재+거래처목록 모달 자재+거래처목록 모달 자재+거래처목록  -->
	<div class="modal fade" id="rscNmSearch" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">자재 목록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">자재명</th>
								<th scope="col">자재코드</th>
								<th scope="col">거래처명</th>
								<th scope="col">거래처코드</th>
								<th scope="col">자재유형</th>
								<th scope="col" style="width: 80px"></th>
							</tr>
						</thead>
						<tbody id="matUseList"></tbody>
					</table>
					<!-- End Multi Columns Form -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 거래처목록 모달 거래처목록 모달 거래처목록 모달 거래처목록 모달 거래처목록 모달 거래처목록 --> 
      <!-- ============================================================== -->  
	<!-- 자재 발주 테이블 자재 발주 테이블 자재 발주 테이블 자재 발주 테이블  -->
	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card">
				<div class="card-body d-flex justify-content-between">
					<h3 class="">자재발주</h3>
					<div id="btnGrp">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<button type="button" class="btn btn-danger"
								onclick="deleteBtn()">삭제</button>
						</sec:authorize>
					</div>
				</div>
				<div class="table-responsive">
					<table id="matOrderList"
						class="table table-striped table-bordered first">
						<thead>
							<tr>
								<th><input type="checkbox" id="cbx_chkAll" /></th>
								<th>발주번호</th>
								<th>발주신청일</th>
								<th>거래처코드</th>
								<th>거래처명</th>
								<th>자재코드</th>
								<th>자재명</th>
								<th>발주량</th>
								<th>납기요청일</th>
								<th>진행상태</th>
								<sec:authorize access="hasRole('ROLE_ADMIN')">
                                 <th>수정</th>
                              </sec:authorize>
							</tr>
						</thead>
						<tbody id="matOrderTable">
							<c:forEach var="matOrder" items="${matOrderList }">
								<tr data-id="${matOrder.ordrCd }">
									<td><input type="checkbox" name="chk"
										value="${matOrder.ordrCd }" /></td>
									<td>${matOrder.ordrCd }</td>
									<td><fmt:formatDate value="${matOrder.ordrReqDt }"
											pattern="yyyy-MM-dd" /></td>
									<td>${matOrder.vendCd }</td>
									<td>${matOrder.vendNm }</td>
									<td>${matOrder.rscCd }</td>
									<td>${matOrder.rscNm }</td>
									<td>${matOrder.ordrCnt }</td>
									<td><fmt:formatDate value="${matOrder.paprdCmndDt }"
											pattern="yyyy-MM-dd" /></td>
									<td>${matOrder.ordrChk }</td>
									<sec:authorize access="hasRole('ROLE_ADMIN')">
                                    <td><button type="button"
                                          class="btn btn-primary updateBtn">
                                          수정</button></td>
                                 </sec:authorize>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 자재 발주 테이블 자재 발주 테이블 자재 발주 테이블 자재 발주 테이블 자재 발주 테이블  -->
	<!-- ============================================================== -->

	<script>
	
	//초기화
	$(document).on("click","#resetBtn", function () {
		console.log('클릭');
	 $('#insertForm input').val('');
	});
	
	//진행완료가 있는 tr은 클릭 안 되게
	$('tbody#matOrderTable tr').each(function() {
		  if ($(this).find('td:nth-child(10)').text() === '진행완료') {
		    $(this).css('pointer-events', 'none');
		   /*  $(this).css('opacity', '0.5'); */		   
		  }
		});
	
	<!-- ============================================================== -->
    <!-- 모달 자재+거래처목록 모달 자재+거래처목록 모달 자재+거래처목록 모달 자재+거래처목록 -->
	//url은 getMapping에 들어가는 주소
	 $.ajax({
	      url: "matUseModal",
	      success: function (result) {
	        $(result).each(function (idx, item) {
	          let vendNmModal = item.vendNm;
	          let vendCdModal = item.vendCd;
	          let rscNmModal = item.rscNm;
	          let rscCdModal = item.rscCd;
	          let rscTypModal = item.rscTyp;

	          let tr = $("<tr>");
	          tr.append("<td>" + rscNmModal + "</td>");
	          tr.append("<td>" + rscCdModal + "</td>");
	          tr.append("<td>" + vendNmModal + "</td>");
	          tr.append("<td>" + vendCdModal + "</td>");
	          tr.append("<td>" + rscTypModal + "</td>");
	          tr.append(
	            $("<td>").append(
	              $("<button>")
	                .attr("class", "btn btn-primary choice2Btn")
	                .text("선택")
	            )
	          );
			//tbody OrderList 에 위의 ajax를 붙인다.(OrderList는 여기jsp에서만 쓴다.)
	          $("#matUseList").append(tr);
	        });
	      },
	      error: function (reject) {
	        console.log(reject);
	      },
	    });

	    // 선택 버튼 클릭시 input에 전달
	    $(document).on("click", ".choice2Btn", function () {
	    	let rscNmModal = $(this).closest("tr").children().eq(0).text();
	        let rscCdModal = $(this).closest("tr").children().eq(1).text();
	    	let vendNmModal = $(this).closest("tr").children().eq(2).text();
	        let vendCdModal = $(this).closest("tr").children().eq(3).text();
	      
	      $("#rscNmInput").val(rscNmModal);
          $("#rscCdInput").val(rscCdModal);
	   	  $("#vendCdInput").val(vendCdModal);
	      $("#vendNmInput").val(vendNmModal);

	      $("#rscNmSearch").modal("hide");
	      
	    });
	    
	    <!-- 모달 거래처목록 모달 거래처목록 모달 거래처목록 모달 거래처목록 모달 거래처목록 모달 거래처목록 -->
    <!-- ============================================================== -->
	
	<!--날짜 입력 input에 자동으로 오늘 날짜 입력 -->
	const today = new Date();
    const todayString = today.toISOString().slice(0,10);
    document.getElementById("ordrReqDtInput").value = todayString;
    document.getElementById("paprdCmndDtInput").value = todayString;
    <!--날짜 입력 input에 자동으로 오늘 날짜 입력 -->
	
    <!--안전재고 현재재고 차이에 따른 색깔 -->
	  document.addEventListener('DOMContentLoaded', function() {
	        var stockTable = document.getElementById('stock-table');
	        var rows = stockTable.getElementsByTagName('tbody')[0].getElementsByTagName('tr');

	        for (var i = 0; i < rows.length; i++) {
	            var currentStockCell = rows[i].cells[7];
	            var safetyStockCell = rows[i].cells[9];

	            // 셀이 존재하는지 확인
	            if (currentStockCell && safetyStockCell) {
	                var currentStock = parseFloat(currentStockCell.innerText);
	                var safetyStock = parseFloat(safetyStockCell.innerText);

	                // 현재 재고가 안전 재고보다 작은 경우
	                if (currentStock < safetyStock) {
	                    // 배경색을 연한 빨간색으로 변경
	                    rows[i].classList.add('low-stock');
	                }
	            }
	        }
	    });
<!-- ============================================================== -->
<!-- 등록  등록  등록  등록  등록  등록  등록  등록  등록  등록  등록  등록  등록 -->
<!-- ============================================================== -->   
//날짜 변환
function productDate(timestamp) {
  let date = new Date(timestamp);
  let year = date.getFullYear();
  let month = String(date.getMonth() + 1).padStart(2, "0");
  let day = String(date.getDate()).padStart(2, "0");
  let formattedDate = year + "-" + month + "-" + day;
  return formattedDate;
}     
$("#insertBtn").on("click", function () {
          
          let ordrReqDtData = $("input[name='ordrReqDtInput']").val();
          let vendCdData = $("input[name='vendCdInput']").val();
          let vendNmData = $("input[name='vendNmInput']").val();
          let rscCdData = $("input[name='rscCdInput']").val();
          let rscNmData = $("input[name='rscNmInput']").val();
          let ordrCntData = $("input[name='ordrCntInput']").val();
          let paprdCmndDtData = $("input[name='paprdCmndDtInput']").val();
          

          if (ordrReqDtData == "") {
			    Swal.fire({
			      icon: "warning",
			      title: "발주신청일이 입력되지 않았습니다.",
			    });
			    return;
			  }
          if (rscNmData == "") {
			    Swal.fire({
			      icon: "warning",
			      title: "자재명이 입력되지 않았습니다.",
			    });
			    return;
			  }
          if (rscCdData == "") {
			    Swal.fire({
			      icon: "warning",
			      title: "자재코드가 입력되지 않았습니다.",
			    });
			    return;
			  }
        	if (vendNmData == "") {
			    Swal.fire({
			      icon: "warning",
			      title: "거래처명이 입력되지 않았습니다.",
			    });
			    return;
			  }
	        if (vendCdData == "") {
			    Swal.fire({
			      icon: "warning",
			      title: "거래처코드가 입력되지 않았습니다.",
			    });
			    return;
			  }
	      if (ordrCntData == "") {
			    Swal.fire({
			      icon: "warning",
			      title: "발주량이 입력되지 않았습니다.",
			    });
			    return;
			  }
	      if (paprdCmndDtData == "") {
			    Swal.fire({
			      icon: "warning",
			      title: "납기요청일이 선택되지 않았습니다.",
			    });
			    return;
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
        	  if(result.value){
        	  $.ajax({
        		  //MatController 의 @PostMapping("/matCheckInsert")
                  url: "matOrderInsert",
                  method: "post",
                  data: {ordrReqDt: ordrReqDtData,
                	  vendCd: vendCdData,
                	  vendNm: vendNmData,
                	  rscCd: rscCdData,
                	  rscNm: rscNmData,
                	  ordrCnt: ordrCntData,
                	  paprdCmndDt: paprdCmndDtData},
                  
                  success: function (result) {
                	  //테이블 데이터 지우기
                    $("#matOrderTable").empty();
                	  //input 내 데이터 지우기  
                    $('input').val('');
                    //테이블 데이터 채우기
                    $(result).each(function (idx, item) {
                      let tr = $("<tr>").attr("data-id", item.ordrCd);
                      tr.append(
                        $("<td>").append(
                          $("<input>").attr("type", "checkbox").attr("name", "chk")
                        )
                      );
                      tr.append("<td>" + item.ordrCd + "</td>");
                   	  tr.append("<td>" + productDate(item.ordrReqDt) + "</td>");
                      tr.append("<td>" + item.vendCd + "</td>");
                      tr.append("<td>" + item.vendNm + "</td>");
                      tr.append("<td>" + item.rscCd + "</td>");
                      tr.append("<td>" + item.rscNm + "</td>");
                      tr.append("<td>" + item.ordrCnt + "</td>");
                      tr.append("<td>" + productDate(item.paprdCmndDt) + "</td>");
                      tr.append("<td>" + item.ordrChk + "</td>");
                      tr.append('<td><button type=\'button\' class=\'btn btn-primary updateBtn\' id=\'updateBtn\'>수정</button></td>');

                      $("#matOrderTable").append(tr);
                    });
                  },
                  error: function (reject) {
                    console.log(reject);
                  },
                });
        	  }
              });
            });

      
       // 닫기버튼 시 초기화
      $(".btn-close").on("click", function () {
      $('form[name="insertForm"] input').val("");
      $('form[name="insertForm"] textarea').val("");
      $("#vendCd").val("none");
    });

<!-- 등록 끝  등록 끝 등록 끝 등록 끝 등록 끝 등록 끝 등록 끝 등록 끝 등록 끝 -->
<!-- ============================================================== -->   
<!-- 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 -->

//체크박스 전체 선택
$(document).ready(function () {

  $("#cbx_chkAll").click(function () {
    if ($(this).is(":checked"))
      $("input[name=chk]")
        .not(':disabled') // 진행완료 상태인 체크박스는 선택되지 않도록
        .prop("checked", true)
        .closest("tr")
        .addClass("selected");
    else
      $("input[name=chk]")
        .prop("checked", false)
        .closest("tr")
        .removeClass("selected");
  });

  $(document).on("click", "input[name=chk]", function () {
    var total = $("input[name=chk]").not(':disabled').length; // 진행완료 상태인 체크박스는 제외
    var checked = $("input[name=chk]:checked").not(':disabled').length; // 진행완료 상태인 체크박스는 제외

    if (total != checked) $("#cbx_chkAll").prop("checked", false);
    else $("#cbx_chkAll").prop("checked", true);
  });

  $('tbody#matOrderTable tr').each(function() {
    if ($(this).find('td:nth-child(10)').text() === '진행완료') {
      $(this).find('input[type="checkbox"]').prop('disabled', true); // 체크박스를 disabled로 설정하여 선택되지 않도록
    }
  });
  
});

//행 선택하면 체크
$(document).on("click", "table tr", function (event) {
  if (event.target.type !== "checkbox") {
    $(":checkbox", this).trigger("click");
  }
});

$(document).on("change", "table tr :checkbox", function (event) {
  $(this).closest("tr").toggleClass("selected", this.checked);
});
<!-- 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 -->
<!-- ============================================================== -->
<!-- 단건조회  단건조회  단건조회  단건조회  단건조회  단건조회  단건조회  단건조회 -->
// 버튼 클릭 이벤트 리스너 함수
$(document).on('click', '.updateBtn', function() {
	// 수정완료 버튼 클릭 이벤트 핸들러 설정
	$("#insertBtn").text("수정완료");
    
    $("#insertBtn").removeAttr("onclick");
    $("#insertBtn").attr("onclick", "submitBtn();");

    // 단건조회를 위한 rsc_cd 값을 추출합니다.
    var ordrCd = $(this).closest('tr').find('td:eq(1)').text();    
    
  //서버로 보낼 데이터를 구성합니다.
    var data = {
    		ordrCd: ordrCd
    };
  
 // Ajax 요청을 보냅니다.
    $.ajax({
         type: 'GET',
         url: 'ordrInfo',
         data: $.param(data), 
         dataType: 'json',
         success: function(response) {
           // 성공적으로 응답을 받았을 때 처리할 코드를 작성합니다.
          console.log("단건조회: " + response.ordrCd);
          function formatDate(date) {
    		  var year = date.getFullYear();
    		  var month = (date.getMonth() + 1).toString().padStart(2, '0');
    		  var day = date.getDate().toString().padStart(2, '0');
    		  return year + '-' + month + '-' + day;
    		}
          var ordrReqDt = new Date(response.ordrReqDt);
      	var formatordrReqDt = formatDate(ordrReqDt);
      	
      	var paprdCmndDt = new Date(response.paprdCmndDt);
      	var formatpaprdCmndDt = formatDate(paprdCmndDt);
          
          
          $("#ordrReqDtInput").val(formatordrReqDt);
          $("#rscNmInput").val(response.rscNm);
          $("#rscCdInput").val(response.rscCd);       
          $("#vendNmInput").val(response.vendNm);
          $("#vendCdInput").val(response.vendCd);
          $("#ordrCntInput").val(response.ordrCnt);
          $("#paprdCmndDtInput").val(formatpaprdCmndDt);
          $("#ordrCdInput").val(response.ordrCd);
         },
         error: function(jqXHR, textStatus, errorThrown) {
             alert('데이터를 불러올 수 없습니다.');
         }
       });
     });



<!-- 단건조회  단건조회  단건조회  단건조회  단건조회  단건조회  단건조회  단건조회 -->
<!-- ============================================================== -->  
<!-- 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 -->
function submitBtn() {
	
	 let ordrReqDtData = $("input[name='ordrReqDtInput']").val();
	 let rscNmData = $("input[name='rscNmInput']").val();
	 let rscCdData = $("input[name='rscCdInput']").val();
	 let vendNmData = $("input[name='vendNmInput']").val();
	 let vendCdData = $("input[name='vendCdInput']").val();
	 let ordrCntData = $("input[name='ordrCntInput']").val();
	 let paprdCmndDtData = $("input[name='paprdCmndDtInput']").val();
	 let ordrCdData = $("input[name='ordrCdInput']").val();
	 console.log("3"+ordrCdData);
	 Swal.fire({
		  title: '수정하시겠습니까?',
		  icon: 'question',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '수정',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.value) {
   $.ajax({
     url: "updatematOrder",
     method: "POST",
    
     //serialize를 쓰면 form 안의 데이터를 통째로 갖고 온다.
     data:	{ordrReqDt: ordrReqDtData,
    		rscNm: rscNmData,
		   	rscCd: rscCdData,
		   	vendNm: vendNmData,
		   	vendCd: vendCdData,
		   	ordrCnt: ordrCntData,
		   	paprdCmndDt: paprdCmndDtData,
		   	ordrCd: ordrCdData},
		   	
   	  
     //dataType: 'json', 화면 받을 땐 없어도 됨
     success: function (result) {
   	  console.log("결과" + result);
   	  //테이블 데이터 지우기
       $("#matOrderTable").empty();
   	  //input 내 데이터 지우기  
   	$('input').val('');  
       
       $(result).each(function (idx, item) {
    	   let tr = $("<tr>").attr("data-id", item.ordrCd);
           tr.append(
             $("<td>").append(
               $("<input>").attr("type", "checkbox").attr("name", "chk").attr("value", item.ordrCd)
             )
           );
           tr.append("<td>" + item.ordrCd + "</td>");
        	  tr.append("<td>" + productDate(item.ordrReqDt) + "</td>");
           tr.append("<td>" + item.vendCd + "</td>");
           tr.append("<td>" + item.vendNm + "</td>");
           tr.append("<td>" + item.rscCd + "</td>");
           tr.append("<td>" + item.rscNm + "</td>");
           tr.append("<td>" + item.ordrCnt + "</td>");
           tr.append("<td>" + productDate(item.paprdCmndDt) + "</td>");
           tr.append("<td>" + item.ordrChk + "</td>");
           tr.append('<td><button type=\'button\' class=\'btn btn-primary updateBtn\' id=\'updateBtn\'>수정</button></td>');

           $("#matOrderTable").append(tr);
         });
       
  
         $("#insertBtn").text("등록");
         $("#insertBtn").removeAttr("onclick");
         $("#insertBtn").attr("onclick", "insertBtn();");
      

       let Toast = Swal.mixin({
         toast: true,
         position: "top",
         showConfirmButton: false,
         timer: 1500,
         timerProgressBar: true,
         didOpen: (toast) => {
           toast.addEventListener("mouseenter", Swal.stopTimer);
           toast.addEventListener("mouseleave", Swal.resumeTimer);
         },
       });

       Toast.fire({
           icon: "success",
           title: "수정이 정상적으로 되었습니다.",
       });
   },
   error: function (reject) {
       console.log(reject);
   },
   });
   }
   });
   }

      
  <!-- 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정  -->
  <!-- ============================================================== -->
  <!-- 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 -->
  function deleteBtn() {
      let valueArr = new Array();
      let list = $("input[name=chk]");
      for (let i = 0; i < list.length; i++) {
        if (list[i].checked) {
          valueArr.push(list[i].value);
        }
      }
      if (valueArr.length == 0) {
        Swal.fire({
          icon: "warning",
          title: "선택된 글이 없습니다.",
        });
      } else {
        Swal.fire({
          title: "삭제 하시겠습니까?",
          text: "복구 할 수 없습니다.",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "#d33",
          cancelButtonColor: "#3085d6",
          confirmButtonText: "삭제",
          cancelButtonText: "취소",
        }).then((result) => {
          if (result.value) {
            $.ajax({
              url: "matOrderDelete",
              method: "post",
              traditional: true,
              data: { valueArr: valueArr },
              success: function (result) {
                if (result == "success") {
                  for (let i = 0; i < valueArr.length; i++) {
                    $('tr[data-id="' + valueArr[i] + '"]').remove();
                  }
                } else if (result == "error") {
                  Swal.fire({
                    icon: "error",
                    title: "오류가 발생했습니다.",
                  });
                }

                let Toast = Swal.mixin({
                  toast: true,
                  position: "top",
                  showConfirmButton: false,
                  timer: 1500,
                  timerProgressBar: true,
                  didOpen: (toast) => {
                    toast.addEventListener("mouseenter", Swal.stopTimer);
                    toast.addEventListener("mouseleave", Swal.resumeTimer);
                  },
                });
                Toast.fire({
                  icon: "success",
                  title: "삭제가 정상적으로 되었습니다.",
                });
              },
              error: function (reject) {
                console.log(reject);
              },
            });
          }
        });
      }
    }
  <!-- 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 -->
  <!-- ============================================================== -->  
      
		</script>
</body>
</html>