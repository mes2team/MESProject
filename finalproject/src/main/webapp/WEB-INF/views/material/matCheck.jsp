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
	  $("#check").DataTable({
	    lengthChange: false,
	    info: false,
	    columnDefs: [
	        {targets: 13, orderable: false} // 14번째 칸(orderable: false로 정렬 없앰)
	      ]
	  });
	});
        
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">



<!-- jQuery and Bootstrap JS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- <script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->


<meta charset="UTF-8">
<title>Material List</title>
<style>
table, tr, th, td {
	border: 1px solid black;
}

.insert {
	display: inline-blcok;
	float: left;
}

form {
	clear: both;
}

#check th:first-child::after {
	display: none;
}

#check th:first-child::before {
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
	<!-- pageheader -->
	<!-- ============================================================== -->
	<div class="row">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#" class="breadcrumb-link">자재관리</a></li>
				<li class="breadcrumb-item active" aria-current="page">자재입고</li>
			</ol>
		</nav>
	</div>
	<!-- ============================================================== -->
	<!-- 자재 검사 자재 검사 자재 검사 자재 검사 자재 검사 자재 검사 자재 검사 자재 검사 -->
	<div class="card">
		<div class="card-body">
			<h3 class="insert">자재검사</h3>
			<div id="btnGrp">
				<button type="submit" class="btn btn-primary" id="insertBtn">등록</button>
				<button type="reset" class="btn btn-secondary" id="resetBtn">초기화</button>
				<button type="submit" class="btn btn-primary" id="checkBtn">검사조건</button>
			</div>
			<form class="row g-3" name="insertForm" id="insertForm" action="matCheckInsert"
				method="post" onsubmit="return false"
				style="margin: 0px 5px 5px 5px;">

				<div class="col-md-2">
					<label class="form-label">발주번호</label>
					<div class="input-group">
						<input type="text" class="form-control" id="ordrCdInput"
							name="ordrCdInput" readonly />
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#ordrCdSearch">
							<i class="bi bi-search"></i>
						</button>
					</div>
				</div>

				<div class="col-md-2">
					<label class="form-label">자재명</label> <input type="text"
						class="form-control" id="rscNmInput" name="rscNmInput" readonly />
				</div>

				<div class="col-md-2">
					<label class="form-label">검수량</label> <input type="text"
						class="form-control" id="inspCntInput" name="inspCntInput"
						readonly />
				</div>


				<div class="col-md-2">
					<label class="form-label">검사일자</label> <input type="date"
						class="form-control" id="inspDtInput" name="inspDtInput"
						placeholder="">
				</div>

				<div class="col-md-2">
					<label class="form-label">검수자</label>
					<div class="input-group">
						<input type="text" class="form-control" id="inspTstrInput"
							name="inspTstrInput" readonly />
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#inspTstrSearch">
							<i class="bi bi-search"></i>
						</button>
					</div>
				</div>

				<div class="col-md-2">
					<label class="form-label">합격량</label> <input type="number"
						class="form-control" id="inspPassCntInput" name="inspPassCntInput" />
				</div>

				<div class="col-md-1">
					<label class="form-label">오염</label> <input type="number"
						class="form-control" id="contInput" name="contInput" min="0"
						value=0>
				</div>

				<div class="col-md-1">
					<label class="form-label">부패</label> <input type="number"
						class="form-control" id="decayInput" name="decayInput" min="0"
						value=0>
				</div>

				<div class="col-md-1">
					<label class="form-label">포장불량</label> <input type="number"
						class="form-control" id="packInput" name="packInput" min="0"
						value=0>
				</div>

				<div class="col-md-1">
					<label class="form-label">중량미달</label> <input type="number"
						class="form-control" id="underWeightInput" name="UnderWeightInput"
						min="0" value=0>
				</div>

				<div class="col-md-1">
					<label class="form-label">기타</label> <input type="number"
						class="form-control" id="etcInput" name="etcInput" min="0" value=0>
				</div>

				<div class="col-md-7">
					<label class="form-label">기타설명</label> <input type="text"
						class="form-control" id="etcExplainInput" name="etcExplainInput">
				</div>
			</form>
			<input type="text" class="form-control" id="rscInspCdInput"
				name="rscInspCdInput" style="display: none" />
		</div>
	</div>
	<!-- 자재검사등록 자재검사등록 자재검사등록 자재검사등록 자재검사등록 자재검사등록  -->
	<!-- ============================================================== -->
	<!-- 모달 발주번호 모달 발주번호 모달 발주번호 모달 발주번호 모달 발주번호  -->
	<div class="modal fade" id="ordrCdSearch" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">발주번호 조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">발주번호</th>
								<th scope="col">거래처명</th>
								<th scope="col">자재명</th>
								<th scope="col">발주량</th>
								<th scope="col" style="width: 80px"></th>
							</tr>
						</thead>
						<tbody id="OrderList"></tbody>
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


	<!-- 모달 발주번호 모달 발주번호 모달 발주번호 모달 발주번호 모달 발주번호 모달 발주번호  -->
	<!-- ============================================================== -->
	<!-- 모달 검수자목록 모달 검수자목록 모달 검수자목록 모달 검수자목록 모달 검수자목록   -->
	<div class="modal fade" id="inspTstrSearch" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">검수자 목록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">이름</th>
								<th scope="col">아이디</th>
								<th scope="col">부서</th>
								<th scope="col" style="width: 80px"></th>
							</tr>
						</thead>
						<tbody id="checkerList"></tbody>
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
	<!-- ============================================================== -->
	<!-- 자재검사목록테이블 자재검사목록 자재검사목록 자재검사목록 자재검사목록 자재검사목록  -->

	<div class="row" style="padding: 0px; margin: 0px">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="padding: 0px; margin: 0px">
			<div class="card">
				<div class="card-body d-flex justify-content-between">
					<h3>자재검사목록</h3>
					<div id="btnGrp">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<button type="button" class="btn btn-danger" id="deleteBtn"
								onclick="deleteBtn()">삭제</button>
						</sec:authorize>
					</div>
				</div>
				<div class="table-responsive">
					<table id="check" class="table table-striped table-bordered first" style="width: 99%; margin: auto;" >
						<thead>
							<tr>
								<th data-orderable="false" class="no-sort"><input
									type="checkbox" id="cbx_chkAll" /></th>

								<th>검사코드</th>
								<th>발주번호</th>
								<th>자재명</th>
								<th>검사일자</th>
								<th>검수자</th>
								<th>검수량</th>
								<th>합격량</th>
								<th>오염</th>
								<th>부패</th>
								<th>포장불량</th>
								<th>중량미달</th>
								<th>기타</th>
								<th>수정</th>
								<th style="display: none">Lot번호</th>
							</tr>
						</thead>
						<tbody id="checkBody">
							<c:forEach var="check" items="${matCheckList }">
								<tr data-id="${check.rscInspCd }">
									<td><input type="checkbox" name="chk"
										value="${check.rscInspCd }" /></td>

									<td>${check.rscInspCd }</td>
									<td>${check.ordrCd }</td>
									<td>${check.rscNm }</td>
									<td><fmt:formatDate value="${check.inspDt }"
											pattern="yyyy-MM-dd" /></td>
									<td>${check.inspTstr }</td>
									<td>${check.inspCnt }</td>
									<td>${check.inspPassCnt }</td>
									<td>${check.cont }</td>
									<td>${check.decay }</td>
									<td>${check.pack }</td>
									<td>${check.underWeight }</td>
									<td>${check.etc }</td>
									<td><button type="button" class="btn btn-primary"
											id="updateBtn">수정</button></td>
									<td style="display: none">${check.rscLotCd }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 자재검사목록 자재검사목록 자재검사목록 자재검사목록 자재검사목록 자재검사목록  -->
	<!-- ============================================================== -->

	<script>
	//초기화
	$(document).on("click","#resetBtn", function () {
		console.log('클릭');
	 $('#insertForm input').val('');
	});
	
	//LOT번호가 부여된 검사코드 선택 불가
	$('tbody#checkBody tr').each(function() {
  if ($(this).find('td:nth-child(15)').text() !== '') {
    $(this).css('pointer-events', 'none');    
  }
});
	
	<!-- 발주번호 검색 모달  발주번호 검색 모달  발주번호 검색 모달 -->
	//url은 getMapping에 들어가는 주소
	 $.ajax({
	      url: "orderModal",
	      success: function (result) {
	        $(result).each(function (idx, item) {
	          let ordrCdModal = item.ordrCd;
	          let rscNmModal = item.rscNm;
	          let vendNmModal = item.vendNm;
	          let ordrCntModal = item.ordrCnt;

	          let tr = $("<tr>");
	          tr.append("<td>" + ordrCdModal + "</td>");
	          tr.append("<td>" + rscNmModal + "</td>");
	          tr.append("<td>" + vendNmModal + "</td>");
	          tr.append("<td>" + ordrCntModal + "</td>");
	          tr.append(
	            $("<td>").append(
	              $("<button>")
	                .attr("class", "btn btn-primary choiceBtn")
	                .text("선택")
	            )
	          );
			//tbody OrderList 에 위의 ajax를 붙인다.(OrderList는 여기jsp에서만 쓴다.)
	          $("#OrderList").append(tr);
	        });
	      },
	      error: function (reject) {
	        console.log(reject);
	      },
	    });

	    // 선택 버튼 클릭시 input에 전달
	    $(document).on("click", ".choiceBtn", function () {
	      let ordrCdModal = $(this).closest("tr").children().eq(0).text();
	      let rscNmModal = $(this).closest("tr").children().eq(1).text();
	      let ordrCntModal = $(this).closest("tr").children().eq(3).text();

	      $("#ordrCdInput").val(ordrCdModal);
	      $("#rscNmInput").val(rscNmModal);
	      $("#inspCntInput").val(ordrCntModal);
	      $("#inspPassCntInput").val(ordrCntModal);
	      $("#ordrCdSearch").modal("hide");
	      
	    });
	    
    <!-- 발주번호 검색 모달  발주번호 검색 모달  발주번호 검색 모달 발주번호 검색 모달 -->	    
	<!-- ============================================================== -->	
	<!--날짜 입력 input에 자동으로 오늘 날짜 입력 -->
	const today = new Date();
    const todayString = today.toISOString().slice(0,10);
    document.getElementById("inspDtInput").value = todayString;
    <!--날짜 입력 input에 자동으로 오늘 날짜 입력 -->
    <!-- ============================================================== -->
    <!-- 검수자 검색 검수자 검색 검수자 검색 검수자 검색 검수자 검색 검수자 검색 검수자 검색 -->
	//url은 getMapping에 들어가는 주소
	 $.ajax({
	      url: "checkerModal",
	      success: function (result) {
	        $(result).each(function (idx, item) {
	          let nameModal = item.name;
	          let idModal = item.id;
	          let jobModal = item.job;

	          let tr = $("<tr>");
	          tr.append("<td>" + nameModal + "</td>");
	          tr.append("<td>" + idModal + "</td>");
	          tr.append("<td>" + jobModal + "</td>");
	          tr.append(
	            $("<td>").append(
	              $("<button>")
	                .attr("class", "btn btn-primary choice2Btn")
	                .text("선택")
	            )
	          );
			//tbody OrderList 에 위의 ajax를 붙인다.(OrderList는 여기jsp에서만 쓴다.)
	          $("#checkerList").append(tr);
	        });
	      },
	      error: function (reject) {
	        console.log(reject);
	      },
	    });

	    // 선택 버튼 클릭시 input에 전달
	    $(document).on("click", ".choice2Btn", function () {
	      let nameModal = $(this).closest("tr").children().eq(0).text();

	      $("#inspTstrInput").val(nameModal);

	      $("#inspTstrSearch").modal("hide");
	      
	    });
	    
    <!-- 검수자 검색 검수자 검색 검수자 검색 검수자 검색 검수자 검색 검수자 검색 검수자 검색  -->
    <!-- ============================================================== -->	
    <!-- 합격량 자동 계산 합격량 자동 계산 합격량 자동 계산 합격량 자동 계산 합격량 자동 계산  -->
    
 // 검수량, 오염, 부패, 푸장불량, 중량미달, 기타 입력값이 변경되었을 때 호출되는 함수
     function updateInspPassCntInput() {
      // 검수량, 오염, 합격량, 기타 입력값 가져오기
      var inspCnt = Number($("#inspCntInput").val());
      var cont = Number($("#contInput").val());
      var decay = Number($("#decayInput").val());
      var pack = Number($("#packInput").val());
      var underWeight = Number($("#underWeightInput").val());
      var etc = Number($("#etcInput").val());

      // 기타설명에 대입할 값을 계산
      var inspPassCntValue = Number($("#inspPassCntInput").val()); 
     
      // 검수량, 오염, 부패, 푸장불량, 중량미달, 기타 값을 빼기
      inspPassCntValue = inspCnt - cont - decay - pack - underWeight - etc;

      // 계산 결과가 0보다 작을 경우, 0으로 처리
      if (inspPassCntValue < 0) {
        inspPassCntValue = 0;
      }

      // 합격량 입력란에 값을 대입
      $("#inspPassCntInput").val(inspPassCntValue);
    }

    // 검수량, 오염, 합격량, 기타 입력값이 변경될 때마다 updateInspPassCntInput 함수 호출
    $("#contInput, #decayInput, #packInput, #underWeightInput, #etcInput").on("input", function() {
      updateInspPassCntInput();
    });

    // 페이지 로딩 시 updateInspPassCntInput 함수 호출하여 합격량 초기값 설정
    $(document).ready(function() {
      updateInspPassCntInput();
    }); 
    <!-- 합격량 자동 계산 합격량 자동 계산 합격량 자동 계산 합격량 자동 계산 합격량 자동 계산  -->
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
    <!-- ============================================================== -->	
	<!-- 자재검사등록 자재검사등록 자재검사등록 자재검사등록 자재검사등록  -->
	
	$("#insertBtn").on("click", function () {
		  let ordrCdData = $("input[name='ordrCdInput']").val();
		  console.log(ordrCdData)
		  let rscNmData = $("input[name='rscNmInput']").val();
		  let inspCntData = $("input[name='inspCntInput']").val();
		  console.log(inspCntData)
		  let inspDtData = $("input[name='inspDtInput']").val();
		  let inspTstrData = $("input[name='inspTstrInput']").val();
		  let inspPassCntData = $("input[name='inspPassCntInput']").val();
		  let contData = $("input[name='contInput']").val();
		  let decayData = $("input[name='decayInput']").val();
		  let packData = $("input[name='packInput']").val();
		  let underWeightData = $("input[name='underWeightInput']").val();
		  let etcData = $("input[name='etcInput']").val();
		  let etcExplainData = $("input[name='etcExplainInput']").val();

		  if (ordrCdData == "") {
			    Swal.fire({
			      icon: "warning",
			      title: "발주번호가 입력되지 않았습니다.",
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
		  if (inspCntData == "") {
		    Swal.fire({
		      icon: "warning",
		      title: "검수량이 입력되지 않았습니다.",
		    });
		    return;
		  }
		  if (inspDtData == "") {
		    Swal.fire({
		      icon: "warning",
		      title: "검사일자가 입력되지 않았습니다.",
		    });
		    return;
		  }
		  if (inspTstrData == "") {
		    Swal.fire({
		      icon: "warning",
		      title: "검수자가 입력되지 않았습니다.",
		    });
		    return;
		  }
		  if (inspPassCntData == "") {
		    Swal.fire({
		      icon: "warning",
		      title: "합격량이 입력되지 않았습니다.",
		    });
		    return;
		  }
		  if (contData == "") {
		    Swal.fire({
		      icon: "warning",
		      title: "오염이 입력되지 않았습니다.",
		    });
		    return;
		  }
		  if (decayData == "") {
		    Swal.fire({
		      icon: "warning",
		      title: "부패가 입력되지 않았습니다.",
		    });
		    return;
		  }
		  if (packData == "") {
		    Swal.fire({
		      icon: "warning",
		      title: "포장불량이 입력되지 않았습니다.",
		    });
		    return;
		  }
		  if (underWeightData == "") {
		    Swal.fire({
		      icon: "warning",
		      title: "중량미달이 입력되지 않았습니다.",
		    });
		    return;
		  }
		  if (etcData == "") {
		    Swal.fire({
		      icon: "warning",
		      title: "기타가 입력되지 않았습니다.",
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
        	  $.ajax({
        		  //MatController 의 @PostMapping("/matCheckInsert")
                  url: "matCheckInsert",
                  method: "post",
                  data: {ordrCd: ordrCdData,
                	  rscNm: rscNmData,
                	  inspCnt: inspCntData,
                	  inspDt: inspDtData,
                	  inspTstr: inspTstrData,
                	  inspPassCnt: inspPassCntData,
                	  cont: contData,
                	  decay: decayData,
                	  pack: packData,
                	  underWeight: underWeightData,
                	  etc: etcData,
                	  etcExplain: etcExplainData},
                  
                  success: function (result) {
                	  //테이블 데이터 지우기
                    $("#checkBody").empty();
                	  //input 내 데이터 지우기  
                    $("#ordrCdData").val("");
                    $("#rscNmData").val("");
                    $("#inspCntData").val("");
                    $("#inspDtData").val("");
                    $("#inspTstrData").val("");
                    $("#inspPassCntData").val("");
                    $("#contData").val("");
                    $("#decayData").val("");
                    $("#packData").val("");
                    $("#underWeightData").val("");
                    $("#etcData").val("");
                    $("#etcExplainData").val("");
                    $('input').val('');
                    //테이블 데이터 채우기
                    $(result).each(function (idx, item) {
                      let tr = $("<tr>").attr("data-id", item.rscInspCd);
                      tr.append(
                        $("<td>").append(
                          $("<input>").attr("type", "checkbox").attr("name", "chk")
                        )
                      );
                      tr.append("<td>" + item.rscInspCd + "</td>");
                      tr.append("<td>" + item.ordrCd + "</td>");
                      tr.append("<td>" + item.rscNm + "</td>");
                   	  tr.append("<td>" + productDate(item.inspDt) + "</td>");
                      tr.append("<td>" + item.inspTstr + "</td>");
                      tr.append("<td>" + item.inspCnt + "</td>");
                      tr.append("<td>" + item.inspPassCnt + "</td>");
                      tr.append("<td>" + item.cont + "</td>");
                      tr.append("<td>" + item.decay + "</td>");
                      tr.append("<td>" + item.pack + "</td>");
                      tr.append("<td>" + item.underWeight + "</td>");
                      tr.append("<td>" + item.etc + "</td>");
                      tr.append('<td><button type=\'button\' class=\'btn btn-primary\' id=\'updateBtn\'>수정</button></td>');

                      $("#checkBody").append(tr);
                    });
                  },
                  error: function (reject) {
                    console.log(reject);
                  },
                });
              });
            });

<!-- 자재검사등록 자재검사등록 자재검사등록 자재검사등록 자재검사등록 자재검사등록   -->
<!-- ============================================================== -->   
<!-- 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 -->

//체크박스 전체 선택
$(document).ready(function () {
  // 전체 선택 체크박스 클릭 이벤트 처리
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

  // 개별 체크박스 클릭 이벤트 처리
  $(document).on("click", "input[name=chk]", function () {
    var total = $("input[name=chk]").not(':disabled').length; // 진행완료 상태인 체크박스는 제외
    var checked = $("input[name=chk]:checked").not(':disabled').length; // 진행완료 상태인 체크박스는 제외

    if (total != checked) $("#cbx_chkAll").prop("checked", false);
    else $("#cbx_chkAll").prop("checked", true);
  });

  // 진행완료 상태인 체크박스 처리
  $('tbody#checkBody tr').each(function() {
    if ($(this).find('td:nth-child(15)').text() !== '') {
      $(this).css('pointer-events', 'none');
      $(this).find('input[type="checkbox"]').prop('disabled', true); // 체크박스를 disabled로 설정하여 선택되지 않도록
    }
  });
});

//행 선택하면 체크
/* $(document).on("click", "table tr", function (event) {
  if (event.target.type !== "checkbox") {
    $(":checkbox", this).trigger("click");
  }
}); */

$(document).on("change", "table tr :checkbox", function (event) {
  $(this).closest("tr").toggleClass("selected", this.checked);
});
<!-- 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 -->
<!-- ============================================================== -->
<!-- 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 -->

	  // 버튼 클릭 이벤트 리스너 함수
$(document).on('click', '#updateBtn', function() {
				
	// 수정완료 버튼 클릭 이벤트 핸들러 설정
	$("#insertBtn").text("수정완료");
    
    $("#insertBtn").removeAttr("onclick");
    $("#insertBtn").attr("onclick", "submitBtn();");
	  // 단건조회를 위한 rscInspCd 값을 추출합니다.
	  var rscInspCd = $(this).closest('tr').find('td:eq(1)').text();
	  
	//서버로 보낼 데이터를 구성합니다.
	  var data = {
		  rscInspCd: rscInspCd
	  };
	// Ajax 요청을 보냅니다.
	  $.ajax({
	       type: 'GET',
	       url: 'selectMatCheck',
	       data: $.param(data), 
	       dataType: 'json',
	       success: function(response) {
	         // 성공적으로 응답을 받았을 때 처리할 코드를 작성합니다.
	        console.log(response);
	        function formatDate(date) {
	        	  var year = date.getFullYear();
	        	  var month = (date.getMonth() + 1).toString().padStart(2, '0');
	        	  var day = date.getDate().toString().padStart(2, '0');
	        	  return year + '-' + month + '-' + day;
	        	}
	        	
        	var inspDt = new Date(response.inspDt);
        	var formattedDate = formatDate(inspDt);
	        
	        $("#ordrCdInput").val(response.ordrCd);
	        $("#rscNmInput").val(response.rscNm);
	        $("#inspCntInput").val(response.inspCnt);       
	        $("#inspDtInput").val(formattedDate);
	        $("#inspTstrInput").val(response.inspTstr);
	        $("#inspPassCntInput").val(response.inspPassCnt);
	        $("#contInput").val(response.cont);
	        $("#decayInput").val(response.decay);
	        $("#packInput").val(response.pack);
	        $("#underWeightInput").val(response.underWeight);
	        $("#etcInput").val(response.etc);
	        $("#etcExplainInput").val(response.etcExplain);
	        $("#rscInspCdInput").val(response.rscInspCd);
	        
	       },
	       error: function(jqXHR, textStatus, errorThrown) {
	           alert('데이터를 불러올 수 없습니다.');
	       }
	     });
	   });


 function submitBtn() {
	
	 let ordrCdData = $("input[name='ordrCdInput']").val();
	 console.log("3"+ordrCdData);
	 let rscNmData = $("input[name='rscNmInput']").val();
	 let inspCntData = $("input[name='inspCntInput']").val();
	 console.log(inspCntData)
	 let inspDtData = $("input[name='inspDtInput']").val();
	 let inspTstrData = $("input[name='inspTstrInput']").val();
	 let inspPassCntData = $("input[name='inspPassCntInput']").val();
	 let contData = $("input[name='contInput']").val();
	 let decayData = $("input[name='decayInput']").val();
	 let packData = $("input[name='packInput']").val();
	 let underWeightData = $("input[name='underWeightInput']").val();
	 let etcData = $("input[name='etcInput']").val();
	 let etcExplainData = $("input[name='etcExplainInput']").val();
	 let rscInspCdData = $("input[name='rscInspCdInput']").val();
	 console.log("2" + rscInspCdData);
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
      url: "updateMatCheckInfo",
      method: "POST",
      
      //serialize를 쓰면 form 안의 데이터를 통째로 갖고 온다.
      data:	{rscInspCd: rscInspCdData,
    	  ordrCd: ordrCdData,
    	  rscNm: rscNmData,
    	  inspCnt: inspCntData,
    	  inspDt: inspDtData,
    	  inspTstr: inspTstrData,
    	  inspPassCnt: inspPassCntData,
    	  cont: contData,
    	  decay: decayData,
    	  pack: packData,
    	  underWeight: underWeightData,
    	  etc: etcData,
    	  etcExplain: etcExplainData},
    	  
      //dataType: 'json', 화면 받을 땐 없어도 됨
      success: function (result) {
    	  console.log("결과" + result);
    	  //테이블 데이터 지우기
        $("#checkBody").empty();
    	  //input 내 데이터 지우기  
    	$('input').val('');  
        
        $(result).each(function (idx, item) {
          let tr = $("<tr>").attr("data-id", item.rscInspCd);
          tr.append(
            $("<td>").append(
              $("<input>").attr("type", "checkbox").attr("name", "chk").attr("value", item.rscInspCd)
            )
          );
          tr.append("<td>" + item.rscInspCd + "</td>");
          tr.append("<td>" + item.ordrCd + "</td>");
          tr.append("<td>" + item.rscNm + "</td>");
       	  tr.append("<td>" + productDate(item.inspDt) + "</td>");
          tr.append("<td>" + item.inspTstr + "</td>");
          tr.append("<td>" + item.inspCnt + "</td>");
          tr.append("<td>" + item.inspPassCnt + "</td>");
          tr.append("<td>" + item.cont + "</td>");
          tr.append("<td>" + item.decay + "</td>");
          tr.append("<td>" + item.pack + "</td>");
          tr.append("<td>" + item.underWeight + "</td>");
          tr.append("<td>" + item.etc + "</td>");
          tr.append('<td><button type=\'button\' class=\'btn btn-primary\' id=\'updateBtn\'>수정</button></td>');

          $("#checkBody").append(tr);
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
 
      
  <!-- 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 -->
  <!-- ============================================================== -->
  <!-- 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 -->
  function deleteBtn() {
//       let valueArr = new Array();
//       let list = $("input[name=chk]");
//       let ordrCd = $(this).closest('tr').find('td:eq(2)').text();
//       for (let i = 0; i < list.length; i++) {
//         if (list[i].checked) {
//           valueArr.push(list[i].value);
//         }
//       }
//       console.log(valueArr);
      let valueArr = [];

      $('input[name="chk"]:checked').each(function (idx, items) {
        let rscInspCd = $(items).closest("tr").children().eq(1).text();
        let ordrCd =  $(items).closest("tr").children().eq(2).text();
        let dataObj = {
        	rscInspCd: rscInspCd,
          ordrCd: ordrCd,
        };

        // 데이터 배열에 객체 추가
        valueArr.push(dataObj);
     });
      console.log(valueArr);
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
              url: "removeMatatCheck",
              method: "post",
              headers: { "Content-Type": "application/json" },
              data: JSON.stringify(valueArr),
              success: function (result) {
                if (result == "success") {
                  for (let i = 0; i < valueArr.length; i++) {
                    $('tr[data-id="' + valueArr[i].rscInspCd + '"]').remove();
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