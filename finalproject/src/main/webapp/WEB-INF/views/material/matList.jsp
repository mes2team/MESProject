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
            $("#jaje").DataTable({
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
               <li class="breadcrumb-item"><a href="#"
                  class="breadcrumb-link">자재관리</a></li>
               
               <li class="breadcrumb-item active" aria-current="page">자재정보</li>
            </ol>
         </nav>
      </div>
      <sec:authorize access="hasRole('ROLE_ADMIN')">
         <!-- ROLE_ADMIN만 볼 수 있는 영역 -->
         <!-- ============================================================== -->
         <!-- 자재 등록 -->
         <!-- ============================================================== -->
         <div class="card">
            <div class="card-body">
            
               <!-- Multi Columns Form -->
               <h3 class="insert">자재등록</h3>
				<div id="btnGrp">
                     <button type="submit" class="btn btn-primary" id="insertBtn">등록</button>
                     <button type="reset" class="btn btn-secondary" id="resetBtn">초기화</button>
                  </div>
               <form class="row g-3" name="insertForm" id="insertForm" action="matInsert"
                  method="post" onsubmit="return false"
                  style="margin: 0px 5px 5px 5px;">
				
                  <div class="col-md-3">
                     <label for="country" class="form-label">자재코드</label> RSC<input
                        type="text" class="form-control" id="rscCdInput" name="rscCdInput"
                        placeholder="숫자만 입력해주세요.">
                  </div>

                  <div class="col-md-3">
                     <label for="country" class="form-label">자재명</label> <input
                        type="text" class="form-control" id="rscNmInput" name="rscNmInput"
                        placeholder="">
                  </div>

                  <div class="col-md-3">
                     <label for="country" class="form-label">자재규격</label> <select
                        class="form-control" id="rscSpecInput" name="rscSpecInput" >
                        <option value="none" disabled selected>=== 선택 ===</option>
                        <option value="KG">kg(킬로그램)</option>
                        <option value="L">L(리터)</option>
                     </select>
                  </div>

                  <div class="col-md-3">
                     <label for="country" class="form-label">사용여부</label> <select
                        class="form-control" id="useYnInput" name="useYnInput">
                        <option value="none" disabled selected>=== 선택 ===</option>
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                     </select>
                  </div>

                  <div class="col-md-3">
                     <label for="country" class="form-label">자재유형</label> <select
                        class="form-control" id="rscTypInput" name="rscTypInput">
                        <option value="none" disabled selected>=== 선택 ===</option>
                        <option value="주원료">주원료</option>
                        <option value="첨가제">첨가제</option>
                        <option value="액상원료">액상원료</option>
                     </select>
                  </div>

                  <div class="col-md-3">
                     <label for="country" class="form-label">안전재고</label> <input
                        type="text" class="form-control" id="safStcInput" name="safStcInput"
                        placeholder="숫자를 입력하세요.">
                  </div>

                  <div class="col-md-3">
                     <label for="country" class="form-label">거래처명</label>
                     <div class="input-group">
						<input type="text" class="form-control" id="vendNmInput"
							name="vendNmInput" readonly />
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#vendCdSearch">
							<i class="bi bi-search"></i>
						</button>
					</div>
                  </div>
                  
                  <div class="col-md-3">
                     <label for="country" class="form-label">거래처코드</label> <input
                        type="text" class="form-control" id="vendCdInput" name="vendCdInput"
                        readonly />
                  </div>
               </form>
            </div>
         </div>
      </sec:authorize>
      
      <!-- ============================================================== -->
	<!-- 모달 거래처목록 모달 거래처목록 모달 거래처목록 모달 거래처목록 모달 거래처목록 모달 거래처목록 -->
	<div class="modal fade" id="vendCdSearch" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">거래처 목록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">거래처명</th>
								<th scope="col">거래처코드</th>
								<th scope="col">거래처유형</th>
								<th scope="col" style="width: 80px"></th>
							</tr>
						</thead>
						<tbody id="matVendList"></tbody>
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
      <!-- 자재정보 테이블 자재정보 테이블 자재정보 테이블 자재정보 테이블 자재정보 테이블 자재정보 테이블 -->
      <div class="row">
         <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="card">
               
               <div class="card-body">
               
                  <div class="table-responsive">
                  
                     <h3>자재정보</h3>
                     <table id="jaje" class="table table-striped table-bordered first">
                        <thead>
                           <tr>
                              <th>자재코드</th>
                              <th>자재명</th>
                              <th>자재규격</th>
                              <th>자재유형</th>
                              <th>안전재고</th>
                              <th>사용여부</th>
                              <th>거래처코드</th>
                              <th>거래처명</th>
                              <sec:authorize access="hasRole('ROLE_ADMIN')">
                                 <th>수정</th>
                              </sec:authorize>
                           </tr>
                        </thead>
                        <tbody id="checkBody">
                           <c:forEach var="mat" items="${matList }" >
                              <tr data-id="${mat.rscCd }">
                                 <td>${mat.rscCd }</td>
                                 <td>${mat.rscNm }</td>
                                 <td>${mat.rscSpec }</td>
                                 <td>${mat.rscTyp }</td>
                                 <td>${mat.safStc }</td>
                                 <td>${mat.useYn }</td>
                                 <td>${mat.vendCd }</td>
                                 <td>${mat.vendNm }</td>
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
      </div>

      <!-- ============================================================== -->
      <!-- end basic table  -->
      <!-- ============================================================== -->


      <script>
    //초기화
  	$(document).on("click","#resetBtn", function () {
  		console.log('클릭');
  	 $('#insertForm input').val('');
  	});
      <!-- ============================================================== -->
      <!-- 모달 거래처목록 모달 거래처목록 모달 거래처목록 모달 거래처목록 모달 거래처목록 모달 거래처목록 -->
  	//url은 getMapping에 들어가는 주소
  	 $.ajax({
  	      url: "VendModal",
  	      success: function (result) {
  	        $(result).each(function (idx, item) {
  	          let vendNmModal = item.vendNm;
  	          let vendCdModal = item.vendCd;
  	          let vendTypModal = item.vendTyp;

  	          let tr = $("<tr>");
  	          tr.append("<td>" + vendNmModal + "</td>");
  	          tr.append("<td>" + vendCdModal + "</td>");
  	          tr.append("<td>" + vendTypModal + "</td>");
  	          tr.append(
  	            $("<td>").append(
  	              $("<button>")
  	                .attr("class", "btn btn-primary choice2Btn")
  	                .text("선택")
  	            )
  	          );
  			//tbody OrderList 에 위의 ajax를 붙인다.(OrderList는 여기jsp에서만 쓴다.)
  	          $("#matVendList").append(tr);
  	        });
  	      },
  	      error: function (reject) {
  	        console.log(reject);
  	      },
  	    });

  	    // 선택 버튼 클릭시 input에 전달
  	    $(document).on("click", ".choice2Btn", function () {
  	      let vendNmModal = $(this).closest("tr").children().eq(0).text();
	      let vendCdModal = $(this).closest("tr").children().eq(1).text();

  	   	  $("#vendCdInput").val(vendCdModal);
  	      $("#vendNmInput").val(vendNmModal);

  	      $("#vendCdSearch").modal("hide");
  	      
  	    });
  	    
      
      <!-- ============================================================== -->
    <!-- 등록  등록  등록  등록  등록  등록  등록  등록  등록  등록  등록  등록  등록 -->
<!-- ============================================================== -->   
      
	$("#insertBtn").on("click", function () {
          let rscCdData = $("input[name='rscCdInput']").val();
          let rscNmData = $("input[name='rscNmInput']").val();
          let rscSpecData = $("#rscSpecInput option:selected").val();
          let rscTypData = $("#rscTypInput option:selected").val();
          let safStcData = $("input[name='safStcInput']").val();
          let useYnData = $("#useYnInput option:selected").val();
          let vendCdData = $("input[name='vendCdInput']").val();
          let vendNmData = $("input[name='vendNmInput']").val();

          if (rscCdData == "") {
			    Swal.fire({
			      icon: "warning",
			      title: "자재코드가 입력되지 않았습니다.",
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
          if (rscSpecData == "none") {
        	  Swal.fire({
			      icon: "warning",
			      title:"자재규격이 선택되지 않았습니다."});
			    return;
			  }
          if (useYnData == "none") {
			    Swal.fire({
			      icon: "warning",
			      title: "사용여부이 선택되지 않았습니다.",
			    });
			    return;
			  }
          if (rscTypData == "none") {
        	  Swal.fire({
			      icon: "warning",
			      title:"자재유형이 선택되지 않았습니다.",
			    });
			    return;
			  }
          if (safStcData == "") {
			    Swal.fire({
			      icon: "warning",
			      title: "안전재고가 입력되지 않았습니다.",
			    });
			    return;
			  }
          if (vendNmData == "") {
			    Swal.fire({
			      icon: "warning",
			      title: "거래처명 입력되지 않았습니다.",
			    });
			    return;
			  }
          if (vendCdData == "") {
        	  Swal.fire({
			      icon: "warning",
			      title:"거래처코드가 선택되지 않았습니다.",
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
                  url: "matInsert",
                  method: "post",
                  data: {rscCd: rscCdData,
                	  rscNm: rscNmData,
                	  rscSpec: rscSpecData,
                	  rscTyp: rscTypData,
                	  safStc: safStcData,
                	  useYn: useYnData,
                	  vendCd: vendCdData,
                	  vendNm: vendNmData},                	  
                  
                  success: function (result) {
                	  //테이블 데이터 지우기
                    $("#checkBody").empty();
                	  //input 내 데이터 지우기  
                    $("#rscCdData").val("");
                    $("#rscNmData").val("");
                    $("#rscSpecData").val("");
                    $("#rscTypData").val("");
                    $("#safStcData").val("");
                    $("#useYnData").val("");
                    $("#vendCdData").val("");
                    $("#vendNmData").val("");
                    //테이블 데이터 채우기
                    $(result).each(function (idx, item) {
                      let tr = $("<tr>").attr("data-id", item.rscCd);
                      tr.append("<td>" + item.rscCd + "</td>");
                      tr.append("<td>" + item.rscNm + "</td>");
                      tr.append("<td>" + item.rscSpec + "</td>");
                      tr.append("<td>" + item.rscTyp + "</td>");
                      tr.append("<td>" + item.safStc + "</td>");
                      tr.append("<td>" + item.useYn + "</td>");
                      tr.append("<td>" + item.vendCd + "</td>");
                      tr.append("<td>" + item.vendNm + "</td>");
                      tr.append('<td><button type=\'button\' class=\'btn btn-primary updateBtn\' id=\'updateBtn\' data-bs-toggle=\'modal\'>수정</button></td>');
                      
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
	
<!-- ============================================================== -->
<!-- 등록  등록  등록  등록  등록  등록  등록  등록  등록  등록  등록  등록  등록 -->
<!-- ============================================================== -->      

<!-- ============================================================== -->
<!-- 단건조회  단건조회  단건조회  단건조회  단건조회  단건조회  단건조회  단건조회 -->
<!-- ============================================================== -->   
      
  // 버튼 클릭 이벤트 리스너 함수
$(document).on('click', '.updateBtn', function() {
	// 수정완료 버튼 클릭 이벤트 핸들러 설정
	$("#insertBtn").text("수정완료");
    
    $("#insertBtn").removeAttr("onclick");
    $("#insertBtn").attr("onclick", "submitBtn();");
    $("#rscCdInput").prop("readonly", true);

  // 단건조회를 위한 rsc_cd 값을 추출합니다.
  var rscCd = $(this).closest('tr').find('td:eq(0)').text();
  
//서버로 보낼 데이터를 구성합니다.
  var data = {
    rscCd: rscCd
  };

  // Ajax 요청을 보냅니다.
  $.ajax({
       type: 'GET',
       url: 'matInfo',
       data: $.param(data), 
       dataType: 'json',
       success: function(response) {
         // 성공적으로 응답을 받았을 때 처리할 코드를 작성합니다.
        console.log(response);
        console.log(response.useYn);
                
        
        $("#rscCdInput").val(response.rscCd);
        $("#rscNmInput").val(response.rscNm);
        $("#rscSpecInput").val(response.rscSpec);       
        $("#rscTypInput").val(response.rscTyp);
        $("#safStcInput").val(response.safStc);
        $("#useYnInput").val(response.useYn);
        $("#vendCdInput").val(response.vendCd);
        $("#vendNmInput").val(response.vendNm);
        
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
	
    var rscCdData = $('#rscCdInput').val(); // 자재코드
    var rscNmData = $('#rscNmInput').val(); // 자재명
    var rscSpecData = $('#rscSpecInput').val(); // 자재규격
    var rscTypData = $("#rscTypInput").val();
    var safStcData = $('#safStcInput').val(); // 안전재고
    var useYnData = $('#useYnInput').val(); // 사용여부
    var vendCdData = $('#vendCdInput').val(); // 거래처코드
    var vendNmData = $("#vendNmInput").val(); //거래처명
	
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
    url: "matUpdate",
    method: "POST",
    data: {
        rscCd: rscCdData,
        rscNm: rscNmData,
        rscSpec: rscSpecData,        
        rscTyp: rscTypData,
        safStc: safStcData,
        useYn: useYnData,
        vendCd: vendCdData,
        vendNm: vendNmData
      },
      success: function (result) {
    	  console.log("결과" + result);
    	  //테이블 데이터 지우기
        $("#checkBody").empty();
    	  //input 내 데이터 지우기  
    	$('input').val('');  
        
        $(result).each(function (idx, item) {
        	let tr = $("<tr>").attr("data-id", item.rscCd);
            tr.append("<td>" + item.rscCd + "</td>");
            tr.append("<td>" + item.rscNm + "</td>");
            tr.append("<td>" + item.rscSpec + "</td>");
            tr.append("<td>" + item.rscTyp + "</td>");
            tr.append("<td>" + item.safStc + "</td>");
            tr.append("<td>" + item.useYn + "</td>");
            tr.append("<td>" + item.vendCd + "</td>");
            tr.append("<td>" + item.vendNm + "</td>");
            tr.append('<td><button type=\'button\' class=\'btn btn-primary updateBtn\' id=\'updateBtn\' data-bs-toggle=\'modal\'>수정</button></td>');

          $("#checkBody").append(tr);
        });
   
          $("#insertBtn").text("등록");
          $("#insertBtn").removeAttr("onclick");
          $("#insertBtn").attr("onclick", "insertBtn();");
          $("#rscCdInput").prop("readonly", false);

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

   

   
      
      </script>
</body>
</html>