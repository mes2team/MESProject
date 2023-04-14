<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<style>
  h5 {
    float: left;
  }

  table,
  tr,
  th,
  td {
    border: 1px solid black;
  }

  #btnGrp {
    float: right;
    padding: 20px 0 15px 0;
  }
  form {
    clear: both;
  }
</style>
<body>
  <div>
    <!-- ============================================================== -->
    <!-- pageheader -->
    <!-- ============================================================== -->
    <div class="row">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12"></div>
    </div>
    <!-- ============================================================== -->
    <!-- end pageheader -->
    <!-- ============================================================== -->
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">생산 지시 관리</h5>
        <!-- Multi Columns Form -->
        <form id="searchForm" class="row g-3">
          <div class="col-md-6">
            <label for="inputCode" class="form-label">생산계획명</label>
            <input type="text" class="form-control" id="inputCode" />
          </div>
          <div class="col-md-6">
            <label for="inputEmail5" class="form-label">생산계획일자</label>
            <div class="d-flex align-items-center">
              <input type="date" class="form-control mr-2" id="startDate" />
              <span class="mx-2">~</span>
              <input type="date" class="form-control ml-2" id="endDate" />
            </div>
            <div id="btnGrp">
              <button id="searchBtn" type="button" class="btn btn-primary">검색</button>
              <button type="button" class="btn btn-secondary">초기화</button>
            </div>
          </div>
          <div class="text-center"></div>
        </form>
        <!-- End Multi Columns Form -->
      </div>
    </div>
    <div class="row">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card">
          <p></p>
          <div class="card-body">
            <div id="btnGrp">
              <button type="button" class="btn btn-primary">저장</button>
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#insertModal">
                추가
              </button>
            </div>
            <div class="table-responsive" style="width: 100%; height: 300px; overflow: auto">
              <table class="table table-striped table-bordered first table-hover" >
                <thead>
                  <tr>
                    <th>생산지시코드</th>
                    <th>생산지시명</th>
                    <th>생산지시일자</th>
                    <th>작업자</th>
                    <th>비고</th>
                    <th>생산계획 명</th>
                    <th>제품코드</th>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card">
          <p></p>
          <div class="card-body">
            <div id="btnGrp">
              <button type="button" class="btn btn-primary">저장</button>
            </div>
            <div
              class="table-responsive"
              style="width: 100%; height: 300px; overflow: auto"
            >
              <table
                class="table table-striped table-bordered first table-hover"
              >
                <thead>
                  <tr>
                    <th>생산지시 코드</th>
                    <th>공정 코드</th>
                    <th>공정 명</th>
                    <th>순서</th>
                    <th>생산지시 일자</th>
                    <th>지시량</th>
                    <th>공정분류</th>
                    <th>비고</th>
                    <th>제품코드</th>
                    <th>계획량</th>
                    <th>미계획량</th>
                    <th>자재분류</th>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- 모달창 -->
  <!-- 생산계획 조회 -->
	<div class="modal fade" id="proPlanSearch" data-bs-backdrop="static" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">미완료생산계획 조회</h5>
				</div>
				<div class="modal-body">
					<table id="proPlanSearchTable" class="table table-hover">
						<thead id=aBox>
							<tr>
								<th scope="col"><input type="checkbox"></th>
								<th scope="col">생산계획명</th>
								<th scope="col">제품명</th>
								<th scope="col">우선순위</th>
								<th scope="col">생산계획량</th>
								<th scope="col">생산지시량</th>
								<th scope="col">생산예정일</th>
							</tr>
						</thead>
						<tbody id=proPlanSearchTbody>
						</tbody>
					</table>
					<!-- End Multi Columns Form -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary addOrderBtn">지시작성</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
  
  
  <!-- 작업 등록 -->
  <div
    class="modal fade"
    id="insertModal"
    tabindex="-1"
    data-bs-backdrop="static"
  >
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">소요할 자재 선택</h5>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <div class="modal-body">
          <form class="row g-3">
            <div class="col-md-6">
              <!-- <label for="inputCode" class="form-label">작업일자</label> -->
              <input type="text" class="form-control" readonly />
            </div>
            <div class="col-md-6">
              <!-- <label for="inputEmail5" class="form-label">작업자</label> -->
              <input type="text" class="form-control mr-2" readonly />
            </div>
          </form>
          <p style="margin-bottom: 30px"></p>
          <div class="row">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th scope="col">LOT.NO</th>
                  <th scope="col">입고량</th>
                  <th scope="col">출고량</th>
                  <th scope="col">재고량</th>
                </tr>
              </thead>
              <tbody id="productList"></tbody>
            </table>
          </div>
        </div>
        <div class="modal-footer">
          <button
            type="button"
            class="btn btn-secondary"
            data-bs-dismiss="modal"
          >
            닫기
          </button>
        </div>
      </div>
    </div>
  </div>
  
<script>
//날짜 포맷 변경 함수
function formatDate(time) {
    var date = new Date(time);
    var year = date.getFullYear();
    var month = ("0" + (date.getMonth() + 1)).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);
    var formattedDate = year + "-" + month + "-" + day;
    return formattedDate;
}

$(document).ready(function() {
	$(document).ready(function() {
		  // thead checkbox가 클릭될 때
		  $('#proPlanSearchTable thead input[type="checkbox"]').click(function() {
		    var checked = $(this).prop("checked");
		    $('#proPlanSearchTable tbody input[type="checkbox"]').prop("checked", checked);
		  });

		  // tbody checkbox가 변경될 때
		  $('#proPlanSearchTable tbody input[type="checkbox"]').change(function() {
		    var allChecked = true;
		    $('#proPlanSearchTable tbody input[type="checkbox"]').each(function() {
		      if (!$(this).prop("checked")) {
		        allChecked = false;
		      }
		    });
		    $('#proPlanSearchTable thead input[type="checkbox"]').prop("checked", allChecked);
		  });
	});
	//검색 이벤트
	  $("#searchBtn").on("click", function() {
	    var inputCode = $("#inputCode").val().trim();
	    var startDate = $("#startDate").val();
	    var endDate = $("#endDate").val();

	    if (inputCode === "" && startDate === "" && endDate === "") {
	      // 모두 비어 있다면 ajax 통신
	      $.ajax({
	        url: "getPlanToOrder",
	        type: "GET",
	        success: function(data) {
	        	console.log(data.result);
	            var tbody = $("#proPlanSearchTbody");
	            tbody.empty(); // 기존에 있던 tr 삭제

	            // data.result에 있는 객체들의 배열을 순회하면서 tr 생성
	            data.result.forEach(function(obj) {
	              var tr = $("<tr>");

	              var checkBoxTd = $("<td>");
	              var checkBox = $("<input>").attr("type", "checkbox");
	              checkBoxTd.append(checkBox);

	              var planNameTd = $("<td>").text(obj.planName);
	              var prdtNmTd = $("<td>").text(obj.prdtNm);
	              var prefRankTd = $("<td>").text(obj.prefRank);
	              var orderCntTd = $("<td>").text(obj.orderCnt);
	              var indicaCntTd = $("<td>").text(obj.indicaCnt);
	              var paprdDt = formatDate(obj.wkToDt)
	              var wkToDtTd = $("<td>").text(paprdDt);

	              tr.append(checkBoxTd, planNameTd, prdtNmTd, prefRankTd, orderCntTd, indicaCntTd, wkToDtTd);
	              tbody.append(tr);
	            });
	            
	        	$('#proPlanSearch').modal('show');
	        },
	        error: function(error) {
	        	console.log(error)
	        }
	      });
	    } else {
	      // 하나라도 비어있지 않으면 검색 조건에 따라 ajax 통신
	      //...
	    }
	  });
	});

</script>
</body>
