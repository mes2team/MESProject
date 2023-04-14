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
	      {
	        targets: [1], // 두 번째 컬럼 (0부터 시작하는 인덱스)
	        orderable: false, // 정렬 옵션을 비활성화합니다.
	      },
	    ],
	  });
	});
        
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">



<!-- jQuery and Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
				<button type="reset" class="btn btn-secondary">초기화</button>
				<button type="submit" class="btn btn-primary" id="checkBtn">검사조건</button>
			</div>
			<form class="row g-3" name="insertForm" action="matCheckInsert"
				method="post" onsubmit="return false"
				style="margin: 0px 5px 5px 5px;">

				<div class="col-md-2">
					<label for="country" class="form-label">발주번호</label>
					<div class="input-group">
						<input type="text" class="form-control" id="ordrCd" disabled />
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#ordrCdSearch">
							<i class="bi bi-search"></i>
						</button>
					</div>
				</div>

				<div class="col-md-2">
					<label for="country" class="form-label">자재명</label> <input
						type="text" class="form-control" id="rscNm" name="rscNm" disabled />
				</div>

				<div class="col-md-2">
					<label for="country" class="form-label">검수량</label> <input
						type="text" class="form-control" id="inspCnt" name="inspCnt" disabled />
				</div>


				<div class="col-md-2">
					<label for="country" class="form-label">검사일자</label> <input
						type="date" class="form-control" id="inspDt" name="inspDt"
						placeholder="">
				</div>

				<div class="col-md-2">
					<label for="country" class="form-label">검수자</label>
					<div class="input-group">
						<input type="text" class="form-control" id="inspTstr" name="inspTstr" disabled />
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#inspTstrSearch">
							<i class="bi bi-search"></i>
						</button>
					</div>
				</div>

				<div class="col-md-2">
					<label for="country" class="form-label">합격량</label> <input
						type="number" class="form-control" id="inspPassCnt" name="inspPassCnt"  min="0" />
				</div>

				<div class="col-md-1">
					<label for="country" class="form-label">오염</label> <input
						type="number" class="form-control" id="cont" name="cont" min="0" value=0>
				</div>

				<div class="col-md-1">
					<label for="country" class="form-label">부패</label> <input
						type="number" class="form-control" id="decay" name="decay" min="0" value=0>
				</div>

				<div class="col-md-1">
					<label for="country" class="form-label">포장불량</label> <input
						type="number" class="form-control" id="pack" name="pack" min="0" value=0>
				</div>

				<div class="col-md-1">
					<label for="country" class="form-label">중량미달</label> <input
						type="number" class="form-control" id="underWeight"
						name="UnderWeight" min="0" value=0>
				</div>

				<div class="col-md-1">
					<label for="country" class="form-label">기타</label> <input
						type="number" class="form-control" id="etc" name="etc" min="0" value=0>
				</div>

				<div class="col-md-7">
					<label for="country" class="form-label">기타설명</label> <input
						type="text" class="form-control" id="etcExplain" name="etcExplain">
				</div>
			</form>
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
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
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
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
	<!-- ============================================================== -->
	<!-- 자재검사목록 자재검사목록 자재검사목록 자재검사목록 자재검사목록 자재검사목록  -->

	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card">
				<div class="card-body d-flex justify-content-between">
					<h3>자재검사목록</h3>
					<div id="btnGrp">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<button type="button" class="btn btn-primary" id="updateBtn"
								onclick="updateBtn()">수정</button>
							<button type="button" class="btn btn-danger"
								onclick="deleteBtn()">삭제</button>
						</sec:authorize>
					</div>
				</div>
				<div class="table-responsive">
					<table id="check" class="table table-striped table-bordered first">
						<thead>
							<tr>
								<th data-orderable="false" class="no-sort"><input
									type="checkbox" id="cbx_chkAll" /></th>
								<th>No.</th>
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
							</tr>
						</thead>
						<tbody>
							<c:forEach var="Check" items="${matCheckList }" varStatus="loop">
								<tr data-id="${Check.rscInspCd }">
									<td><input type="checkbox" name="chk"
										value="${matReceipt.rscInspCd }" /></td>
									<td>${loop.count }</td>
									<td>${Check.rscInspCd }</td>
									<td>${Check.ordrCd }</td>
									<td>${Check.rscNm }</td>
									<td><fmt:formatDate value="${Check.inspDt }"
											pattern="yyyy-MM-dd" /></td>
									<td>${Check.inspTstr }</td>
									<td>${Check.ordrCnt }</td>
									<td>${Check.inspPassCnt }</td>
									<td>${Check.cont }</td>
									<td>${Check.decay }</td>
									<td>${Check.pack }</td>
									<td>${Check.underWeight }</td>
									<td>${Check.etc }</td>
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

	      $("#ordrCd").val(ordrCdModal);
	      $("#rscNm").val(rscNmModal);
	      $("#inspCnt").val(ordrCntModal);

	      $("#ordrCdSearch").modal("hide");
	      
	    });
	    
    <!-- 발주번호 검색 모달  발주번호 검색 모달  발주번호 검색 모달 발주번호 검색 모달 -->	    
	<!-- ============================================================== -->	
	<!--날짜 입력 input에 자동으로 오늘 날짜 입력 -->
	const today = new Date();
    const todayString = today.toISOString().slice(0,10);
    document.getElementById("inspDt").value = todayString;
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

	      $("#inspTstr").val(nameModal);

	      $("#inspTstrSearch").modal("hide");
	      
	    });
	    
    <!-- 검수자 검색 검수자 검색 검수자 검색 검수자 검색 검수자 검색 검수자 검색 검수자 검색  -->
    <!-- ============================================================== -->	
	<!-- 자재검사등록 자재검사등록 자재검사등록 자재검사등록 자재검사등록  -->
      
      function formOptionChk() {
          let ordrCd = document.getElementsByName('ordrCd');
          let rscNm = document.getElementsByName('rscNm');
          let inspCnt = document.getElementsByName('inspCnt');
          let inspDt = document.getElementsByName('inspDt');
          let inspTstr = document.getElementsByName('inspTstr');
          let inspPassCnt = document.getElementsByName('inspPassCnt');
          let cont = document.getElementsByName('cont');
          let decay = document.getElementsByName('decay');
          let pack = document.getElementsByName('pack');
          let underWeight = document.getElementsByName('underWeight');
          let etc = document.getElementsByName('etc');
          let etcExplain = document.getElementsByName('etcExplain');

          if (ordrCd.value == "") {
              alert("발주번호가 입력되지 않았습니다.");
              ordrCd.focus();
              return false; // 페이지 이동을 막기 위해 false를 반환합니다.
          }
          if (rscNm.value == "") {
              alert("자재명이 입력되지 않았습니다.");
              rscNm.focus();
              return false;
          }          
          if (inspCnt.value == "") {
              alert("검수량이 입력되지 않았습니다.");
              inspCnt.focus();
              return false;
          }
          if (inspDt.value == "") {
              alert("검사일자 입력되지 않았습니다.");
              inspDt.focus();
              return false;
          }
          if (inspTstr.value == "") {
              alert("검수자가 입력되지 않았습니다.");
              inspTstr.focus();
              return false;
          }
          if (inspPassCnt.value == "") {
              alert("합격량이 입력되지 않았습니다.");
              inspPassCnt.focus();
              return false;
          }
          if (cont.value == "") {
              alert("오염이 입력되지 않았습니다.");
              cont.focus();
              return false;
          }
          if (decay.value == "") {
              alert("부패가 입력되지 않았습니다.");
              decay.focus();
              return false;
          }
          if (pack.value == "") {
              alert("포장불량이 입력되지 않았습니다.");
              pack.focus();
              return false;
          }
          if (underWeight.value == "") {
              alert("중량미달이 입력되지 않았습니다.");
              underWeight.focus();
              return false;
          }
          if (etc.value == "") {
              alert("기타가 입력되지 않았습니다.");
              etc.focus();
              return false;
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
              if (result.value) {
                  insertForm.submit();
              }
          });

          return false;
      }

      $("#insertBtn").on("click", formOptionChk);

<!-- 자재검사등록 자재검사등록 자재검사등록 자재검사등록 자재검사등록 자재검사등록   -->
<!-- ============================================================== -->  

<!-- ============================================================== -->	

<!-- ============================================================== -->   
<!-- 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 -->

//체크박스 전체 선택
$(document).ready(function () {

  $("#cbx_chkAll").click(function () {
    if ($(this).is(":checked"))
      $("input[name=chk]")
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
    var total = $("input[name=chk]").length;
    var checked = $("input[name=chk]:checked").length;

    if (total != checked) $("#cbx_chkAll").prop("checked", false);
    else $("#cbx_chkAll").prop("checked", true);
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
<!-- 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 -->

function updateBtn() {
    // 체크된 체크박스가 없으면 함수 종료
    if ($("input[name=chk]:checked").length === 0) {
      Swal.fire({
        icon: "warning",
        title: "선택된 글이 없습니다.",
      });
      return;
    }
    $("#cbx_chkAll").prop("disabled", true);
    disableCheckBoxes();

    // 수정 버튼의 텍스트를 "수정완료"로 변경
    $("#updateBtn").text("수정완료");

    // 수정완료 버튼 클릭 이벤트 핸들러 설정
    // $(".btn-info").off("click").on("click", submitBtn);
    $("#updateBtn").removeAttr("onclick");
    $("#updateBtn").attr("onclick", "submitBtn();");

    $('input[name="chk"]:checked').each(function () {
      var row = $(this).closest("tr");
      var rscLotCd = row.find("td:eq(2)").text().trim();
      var rscCd = row.find("td:eq(3)").text().trim();
      var ordrCd = row.find("td:eq(5)").text().trim();
      var rscInspCd = row.find("td:eq(7)").text().trim();      
      var istDt = row.find("td:eq(9)").text().trim();
           
      row
        .find("td:eq(2)")
        .html(
          '<input type="text" class="form-control" value="' + rscLotCd + '">'
        );
      row
        .find("td:eq(3)")
        .html(
          '<input type="text" class="form-control" value="' + rscCd + '">'
        );      
      row
        .find("td:eq(5)")
        .html(
          '<input type="text" class="form-control" value="' + ordrCd + '">'
        );
      row
        .find("td:eq(7)")
        .html(
          '<input type="text" class="form-control" value="' + rscInspCd + '">'
        );
      row
      .find("td:eq(9)")
      .html(
   		  '<input type="date" class="form-control" value="' + istDt + '">'
      );
    });
  }

  function submitBtn() {
    // 체크된 체크박스가 없으면 함수 종료
    if ($("input[name=chk]:checked").length === 0) return;

    // 데이터를 저장할 배열 선언
    var dataArr = [];

    // 체크된 체크박스의 개수만큼 반복하며 데이터 저장
    $('input[name="chk"]:checked').each(function () {
      var row = $(this).closest("tr");
      var rscLotCd = row.find("td:eq(2) input").val().trim();
      var rscCd = row.find("td:eq(3) input").val().trim();
      var ordrCd = row.find("td:eq(5) input").val().trim();
      var rscInspCd = row.find("td:eq(7) input").val().trim();
      var istDt = row.find("td:eq(9) input").val().trim();

      // 객체 형식으로 데이터 저장
      var dataObj = {
    		  rscLotCd: rscLotCd,
    		  rscCd: rscCd,
    		  ordrCd: ordrCd,
    		  rscInspCd: rscInspCd,
    		  istDt: istDt
      };

      // 데이터 배열에 객체 추가
      dataArr.push(dataObj);
    });

    $.ajax({
      url: "updateMatReceipt",
      method: "POST",
      headers: { "Content-Type": "application/json" },
      data: JSON.stringify(dataArr),
      success: function (result) {
        if (result.result == "success") {
          $("tbody").empty();
          $(result.data).each(function (idx, item) {
            var $row = $("<tr>").attr("data-id", item.rscLotCd);
            $row.append(
              $("<td>").html(
                '<input type="checkbox" name="chk" value="' +
                  item.rscLotCd +
                  '" />'
              )
            );
            $row.append($("<td>").text(idx + 1));
            $row.append($("<td>").text(item.rscLotCd));
            $row.append($("<td>").text(item.rscCd));
            $row.append($("<td>").text(item.rscNm));
            $row.append($("<td>").text(item.ordrCd));
            $row.append($("<td>").text(item.ordrCnt));
            $row.append($("<td>").text(item.rscInspCd));
            $row.append($("<td>").text(item.istCnt));
            $row.append($("<td>").text(new Date(item.istDt).toISOString().slice(0, 10)));
            $("tbody").append($row);
          });
          enableCheckBoxes();
          $("#updateBtn").text("수정");
          $("#updateBtn").removeAttr("onclick");
          $("#updateBtn").attr("onclick", "updateBtn();");
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
          title: "수정이 정상적으로 되었습니다.",
        });
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  }

  function disableCheckBoxes() {
    $('input[name="chk"]').prop("disabled", true);
  }

  function enableCheckBoxes() {
    $('input[name="chk"]').prop("disabled", false);
  }
      
  <!-- 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 -->
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
              url: "matReceiptDelete",
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