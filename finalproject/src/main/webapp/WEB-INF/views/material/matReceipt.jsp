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
            $("#receipt").DataTable({
               lengthChange: false,
                info: false,
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

#btnGrp {
	display: inline-blcok;
	float: right;
	text-align: right;
}

#receipt th:first-child::after {
	display: none;
}

#receipt th:first-child::before {
	display: none;
}
</style>
</head>
<body>
	<!-- ============================================================== -->
	<!-- 페이지 헤더 -->
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
	<!-- 자재 입고 등록 자재 입고 등록 자재 입고 등록 자재 입고 등록 자재 입고 등록 자재 입고 등록 -->
	<div class="card">
		<div class="card-body">
			<h3 class="insert">자재입고등록</h3>
			<div id="btnGrp">
				<button type="submit" class="btn btn-primary" id="insertBtn">등록</button>
				<button type="reset" class="btn btn-secondary" id="resetBtn">초기화</button>
			</div>
			<form class="row g-3" name="insertForm" id="insertForm" action="matReceiptInsert"
				method="post" onsubmit="return false"
				style="margin: 0px 5px 5px 5px;">

				<div class="col-md-2">
					<label for="country" class="form-label">검사코드</label>
					<div class="input-group">
						<input type="text" class="form-control" id="rscInspCdInput"
							name="rscInspCdInput" readonly />
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#rscInspCdSearch">
							<i class="bi bi-search"></i>
						</button>
					</div>
				</div>

				<div class="col-md-2">
					<label for="country" class="form-label">자재명</label> <input
						type="text" class="form-control" id="rscNmInput" name="rscNmInput" readonly>
				</div>
				
				<div class="col-md-2">
					<label for="country" class="form-label">자재코드</label> <input
						type="text" class="form-control" id="rscCdInput" name="rscCdInput" readonly>
				</div>

				<div class="col-md-2">
					<label for="country" class="form-label">발주번호</label> <input
						type="text" class="form-control" id="ordrCdInput" name="ordrCdInput" readonly>
				</div>



				<div class="col-md-2">
					<label for="country" class="form-label">입고수량</label> <input
						type="text" class="form-control" id="istCntInput" name="istCntInput" readonly>
				</div>

				<div class="col-md-2">
					<label for="country" class="form-label">입고일</label> <input
						type="date" class="form-control" id="istDtInput" name="istDtInput" >
				</div>
			</form>
			
				<input type="text" class="form-control" id="rscLotCdInput" name="rscLotCdInput"
				style="display: none"/>
			
		</div>
	</div>
	<!-- 자재입고등록 자재입고등록 자재입고등록 자재입고등록 자재입고등록 자재입고등록  -->
	<!-- ============================================================== -->
	<!-- 모달 검사코드 모달 검사코드 모달 검사코드 모달 검사코드 모달 검사코드  -->
	<div class="modal fade" id="rscInspCdSearch" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">검사코드 조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">검사코드</th>
								<th scope="col">자재명</th>
								<th scope="col">자재코드</th>
								<th scope="col">발주번호</th>
								<th scope="col">입고수량</th>
								<th scope="col" style="width: 80px"></th>
							</tr>
						</thead>
						<tbody id="rscInspList"></tbody>
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


	<!-- 모달 검사코드 모달 검사코드 모달 검사코드 모달 검사코드 모달 검사코드 모달 검사코드  -->
	<!-- ============================================================== -->
	<!-- 자재입고현황테이블 자재입고현황테이블 자재입고현황테이블 자재입고현황테이블 자재입고현황테이블  -->

	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card">
				<div class="card-body d-flex justify-content-between">
					<h3>자재입고현황</h3>
					<div id="btnGrp">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<button type="button" class="btn btn-danger"
								onclick="deleteBtn()">삭제</button>
						</sec:authorize>
					</div>
				</div>
				<div class="table-responsive">
					<table id="receipt"
						class="table table-striped table-bordered first">
						<thead>
							<tr>
								<th><input type="checkbox" id="cbx_chkAll" /></th>
								<th>LOT번호</th>
								<th>자재코드</th>
								<th>자재명</th>
								<th>검사코드</th>
								<th>입고수량</th>
								<th>발주번호</th>
								<th>입고일</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody id="checkBody">
							<c:forEach var="matReceipt" items="${matReceiptList }">
								<tr data-id="${matReceipt.rscLotCd }">
									<td><input type="checkbox" name="chk" /></td>
									<td>${matReceipt.rscLotCd }</td>
									<td>${matReceipt.rscCd }</td>
									<td>${matReceipt.rscNm }</td>
									<td>${matReceipt.rscInspCd }</td>
									<td>${matReceipt.istCnt }</td>
									<td>${matReceipt.ordrCd }</td>
									<td><fmt:formatDate value="${matReceipt.istDt }"
											pattern="yyyy-MM-dd" /></td>
									<td><button type="button" class="btn btn-primary"
											id="updateBtn">수정</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


	<script>
	//초기화
	$(document).on("click","#resetBtn", function () {
		console.log('클릭');
	 $('#insertForm input').val('');
	});
	
	<!-- 검사코드 검색 모달  검사코드 검색 모달  검사코드 검색 모달 -->
	//url은 getMapping에 들어가는 주소
	 $.ajax({
	      url: "checkModal",
	      success: function (result) {
	        $(result).each(function (idx, item) {
	          let rscInspCdModal = item.rscInspCd;
	          let rscNmModal = item.rscNm;
	          let rscCdModal = item.rscCd;
	          let ordrCdModal = item.ordrCd;
	          let inspPassCntModal = item.inspPassCnt;

	          let tr = $("<tr>");
	          tr.append("<td>" + rscInspCdModal + "</td>");
	          tr.append("<td>" + rscNmModal + "</td>");
	          tr.append("<td>" + rscCdModal + "</td>");
	          tr.append("<td>" + ordrCdModal + "</td>");
	          tr.append("<td>" + inspPassCntModal + "</td>");
	          tr.append(
	            $("<td>").append(
	              $("<button>")
	                .attr("class", "btn btn-primary choiceBtn")
	                .text("선택")
	            )
	          );
			//tbody OrderList 에 위의 ajax를 붙인다.(OrderList는 여기jsp에서만 쓴다.)
	          $("#rscInspList").append(tr);
	        });
	      },
	      error: function (reject) {
	        console.log(reject);
	      },
	    });

	    // 선택 버튼 클릭시 input에 전달
	    $(document).on("click", ".choiceBtn", function () {
	      let rscInspCdModal = $(this).closest("tr").children().eq(0).text();
	      let rscNmModal = $(this).closest("tr").children().eq(1).text();
	      let rscCdModal = $(this).closest("tr").children().eq(2).text();
	      let ordrCdModal = $(this).closest("tr").children().eq(3).text();
	      let inspPassCntModal = $(this).closest("tr").children().eq(4).text();

	      $("#rscInspCdInput").val(rscInspCdModal);
	      $("#rscNmInput").val(rscNmModal);
	      $("#rscCdInput").val(rscCdModal);
	      $("#ordrCdInput").val(ordrCdModal);
	      $("#istCntInput").val(inspPassCntModal);
	      $("#rscInspCdSearch").modal("hide");
	      
	    });
	    
    <!-- 발주번호 검색 모달  발주번호 검색 모달  발주번호 검색 모달 발주번호 검색 모달 -->	
	<!-- ============================================================== -->
	<!-- 자재입고등록 자재입고등록 자재입고등록 자재입고등록 자재입고등록 자재입고등록  -->
	function productDate(timestamp) {
		  let date = new Date(timestamp);
		  let year = date.getFullYear();
		  let month = String(date.getMonth() + 1).padStart(2, "0");
		  let day = String(date.getDate()).padStart(2, "0");
		  let formattedDate = year + "-" + month + "-" + day;
		  return formattedDate;
	}
	$("#insertBtn").on("click", function () {
		  let rscInspCdData = $("input[name='rscInspCdInput']").val();
		  let rscNmData = $("input[name='rscNmInput']").val();
		  let rscCdData = $("input[name='rscCdInput']").val();
		  let ordrCdData = $("input[name='ordrCdInput']").val();
		  let istCntData = $("input[name='istCntInput']").val();
		  let istDtData = $("input[name='istDtInput']").val();
		  
		  if (rscInspCdData == "") {
			    Swal.fire({
			      icon: "warning",
			      title: "검사코드가 입력되지 않았습니다.",
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
		  if (ordrCdData == "") {
		    Swal.fire({
		      icon: "warning",
		      title: "발주번호가 입력되지 않았습니다.",
		    });
		    return;
		  }
		  if (istCntData == "") {
		    Swal.fire({
		      icon: "warning",
		      title: "입고수량이 입력되지 않았습니다.",
		    });
		    return;
		  }
		  if (istDtData == "") {
		    Swal.fire({
		      icon: "warning",
		      title: "입고일이 입력되지 않았습니다.",
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
                  url: "matReceiptInsert",
                  method: "post",
                  data: {ordrCd: ordrCdData,
                	  rscNm: rscNmData,
                	  rscCd: rscCdData,
                	  istCnt: istCntData,
                	  istDt: istDtData,
                	  rscInspCd: rscInspCdData},
                  
                  success: function (result) {
                	  //테이블 데이터 지우기
                    $("#checkBody").empty();
                	  //input 내 데이터 지우기  
                    $('input').val('');
                    //테이블 데이터 채우기
                    $(result).each(function (idx, item) {
                      let tr = $("<tr>").attr("data-id", item.rscLotCd);
                      tr.append(
                        $("<td>").append(
                          $("<input>").attr("type", "checkbox").attr("name", "chk")
                        )
                      );
                      tr.append("<td>" + item.rscLotCd + "</td>");
                      tr.append("<td>" + item.rscCd + "</td>");
                      tr.append("<td>" + item.rscNm + "</td>");
                      tr.append("<td>" + item.rscInspCd + "</td>");
                      tr.append("<td>" + item.istCnt + "</td>");
                      tr.append("<td>" + item.ordrCd + "</td>");
                   	  tr.append("<td>" + productDate(item.istDt) + "</td>");
                      tr.append('<td><button type=\'button\' class=\'btn btn-primary\' id=\'updateBtn\'>수정</button></td>');

                      $("#checkBody").append(tr);
                    });
                  },
                  error: function (reject) {
                    console.log(reject);
                  },
              });
        	  }
            });
          });

<!-- 자재입고등록 자재입고등록 자재입고등록 자재입고등록 자재입고등록 자재입고등록  -->
<!-- ============================================================== -->      
<!-- ============================================================== -->   
<!-- 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 -->

//체크박스 전체 선택
$(document).on("click", "#cbx_chkAll", function () {
      if ($("#cbx_chkAll").is(":checked")) {
        $("input[name=chk]")
          .prop("checked", true)
          .closest("tr")
          .addClass("selected");
        $("input[name=chk]").closest("tr").addClass("table-danger");
      } else {
        $("input[name=chk]")
          .prop("checked", false)
          .closest("tr")
          .removeClass("selected");
        $("input[name=chk]").closest("tr").removeClass("table-danger");
      }
    });

    $(document).on("click", "input[name=chk]", function () {
      var total = $("input[name=chk]").length;
      var checked = $("input[name=chk]:checked").length;

      if (total != checked) $("#cbx_chkAll").prop("checked", false);
      else $("#cbx_chkAll").prop("checked", true);
    });

    //체크되면 빨간색으로 바뀜
    $(document).on("change", ":checkbox", function () {
      if ($(this).prop("checked")) {
        if (!$(this).closest("tr").children().eq(0).is("th")) {
          $(this).closest("tr").addClass("table-danger");
        }
      } else {
        $(this).closest("tr").removeClass("table-danger");
      }
    });

    // tr 선택해도 체크 됨
    $(document).on("click", "table tr", function (event) {
      if (event.target.type !== "checkbox") {
        const $checkbox = $(":checkbox", this);
        const td = $(".my-td-class", this);
        if (td.is(event.target)) {
          event.stopPropagation();
        } else {
          $checkbox.trigger("click");
        }
      }
    });
<!-- 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 체크박스 -->
<!-- ============================================================== -->
<!-- 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 수정 -->

$(document).on('click', '#updateBtn', function() {
	
	// 수정완료 버튼 클릭 이벤트 핸들러 설정
	$("#insertBtn").text("수정완료");
    
    $("#insertBtn").removeAttr("onclick");
    $("#insertBtn").attr("onclick", "submitBtn();");
	  // 단건조회를 위한 rscInspCd 값을 추출합니다.
	  var rscLotCd = $(this).closest('tr').find('td:eq(1)').text();
	  
	//서버로 보낼 데이터를 구성합니다.
	  var data = {
		  rscLotCd: rscLotCd
	  };
	// Ajax 요청을 보냅니다.
	  $.ajax({
	       type: 'GET',
	       url: 'selectMatReceipt',
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
	        	
        	var istDt = new Date(response.istDt);
        	var formattedDate = formatDate(istDt);
	        
	        $("#rscInspCdInput").val(response.rscInspCd);
	        $("#rscNmInput").val(response.rscNm);
	        $("#rscCdInput").val(response.rscCd);       
	        $("#ordrCdInput").val(response.ordrCd);
	        $("#istCntInput").val(response.istCnt);
	        $("#istDtInput").val(formattedDate);
	        $("#rscLotCdInput").val(response.rscLotCd);
	        
	       },
	       error: function(jqXHR, textStatus, errorThrown) {
	           alert('데이터를 불러올 수 없습니다.');
	       }
	     });
	   });


 function submitBtn() {
	
	 let rscInspCdData = $("input[name='rscInspCdInput']").val();
	 let rscNmData = $("input[name='rscNmInput']").val();
	 let rscCdData = $("input[name='rscCdInput']").val();
	 let ordrCdData = $("input[name='ordrCdInput']").val();
	 let istCntData = $("input[name='istCntInput']").val();
	 let istDtData = $("input[name='istDtInput']").val();
	 let rscLotCdData = $("input[name='rscLotCdInput']").val();
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
      url: "updateMatReceipt",
      method: "POST",
      
      //serialize를 쓰면 form 안의 데이터를 통째로 갖고 온다.
      data:	{rscInspCd: rscInspCdData,
    	  rscNm: rscNmData,
    	  rscCd: rscCdData,
    	  ordrCd: ordrCdData,
    	  istCnt: istCntData,
    	  istDt: istDtData,
    	  rscLotCd: rscLotCdData},
    	  
      //dataType: 'json', 화면 받을 땐 없어도 됨
      success: function (result) {
    	  console.log("결과" + result);
    	  //테이블 데이터 지우기
        $("#checkBody").empty();
    	  //input 내 데이터 지우기  
    	$('input').val('');  
        
        $(result).each(function (idx, item) {
          let tr = $("<tr>").attr("data-id", item.rscLotCd);
          tr.append(
            $("<td>").append(
              $("<input>").attr("type", "checkbox").attr("name", "chk").attr("value", item.rscLotCd)
            )
          );
          tr.append("<td>" + item.rscLotCd + "</td>");
          tr.append("<td>" + item.rscCd + "</td>");
          tr.append("<td>" + item.rscNm + "</td>");
          tr.append("<td>" + item.rscInspCd + "</td>");
          tr.append("<td>" + item.istCnt + "</td>");
          tr.append("<td>" + item.ordrCd + "</td>");
       	  tr.append("<td>" + productDate(item.istDt) + "</td>");
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
	  let valueArr = [];

      $('input[name="chk"]:checked').each(function (idx, items) {
        let rscLotCd = $(items).closest("tr").children().eq(1).text();
        let rscInspCd =  $(items).closest("tr").children().eq(4).text();
        let dataObj = {
          rscLotCd: rscLotCd,
       	  rscInspCd: rscInspCd,
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
              url: "matReceiptDelete",
              method: "post",
              headers: { "Content-Type": "application/json" },
              data: JSON.stringify(valueArr),
              success: function (result) {
                if (result == "success") {
                  for (let i = 0; i < valueArr.length; i++) {
                    $('tr[data-id="' + valueArr[i].rscLotCd + '"]').remove();
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