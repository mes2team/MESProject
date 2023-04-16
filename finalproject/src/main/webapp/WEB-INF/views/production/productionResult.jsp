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
  #btnGrp {
    float: right;
    padding: 20px 0 15px 0;
  }
  form {
    clear: both;
  }
  .active {
  background-color: #e1efff;
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
        <h5 class="card-title">공정 실적 관리</h5>
        <!-- Multi Columns Form -->
        <form class="row g-3">
          <div class="col-md-6">
            <label for="inputCode" class="form-label">생산 지시 명</label>
            <input type="text" class="form-control" id="inputCode" />
          </div>
          <div class="col-md-6">
            <label for="inputEmail5" class="form-label">지시 일자</label>
            <div class="d-flex align-items-center">
              <input type="date" class="form-control mr-2" id="startDate" />
              <span class="mx-2">~</span>
              <input type="date" class="form-control ml-2" id="endDate" />
            </div>
            <div id="btnGrp">
              <button type="button" class="btn btn-primary">검색</button>
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
            <div
              class="table-responsive"
              style="width: 100%; height: 300px; overflow: auto"
            >
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th>생산지시코드</th>
                    <th>생산지시명</th>
                    <th>제품명</th>
                    <th>작업일자</th>
                    <th>지시량</th>
                    <th>현재상태</th>
                  </tr>
                </thead>
                <tbody id="indicaList">
                <c:forEach var="item" items="${indicaList}">
                	<tr>
                		<td>${item.indicaCd }</td>
                		<td>${item.indicaName }</td>
                		<td>${item.prdtNm }</td>
                		<td><fmt:formatDate value="${item.indicaDt }" pattern="yyyy-MM-dd" /></td>
                		<td>${item.indicaCnt }</td>
                		<td>${item.nowSt }</td>
                	</tr>
                </c:forEach>
                </tbody>
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
              <button
                type="button"
                class="btn btn-primary"
                data-bs-toggle="modal"
                data-bs-target="#insertModal"
              >
                추가
              </button>
            </div>
            <div
              class="table-responsive"
              style="width: 100%; height: 300px; overflow: auto"
            >
            <h5 id="indicaCdText"></h5>
              <table
                class="table table-hover"
              >
                <thead>
                  <tr>
                    <th>공정 코드</th>
                    <th>작업량</th>
                    <th>물량량</th>
                    <th>미작업량</th>
                    <th>작업자</th>
                    <th>작업시작시간</th>
                    <th>작업종료시간</th>
                  </tr>
                </thead>
                <tbody id="prcsProgList"></tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- 모달창 -->
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
          <h5 class="modal-title">작업 등록</h5>
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
              <label for="inputCode" class="form-label">작업일자</label>
              <input type="text" class="form-control" readonly />
            </div>
            <div class="col-md-6">
              <label for="inputEmail5" class="form-label">작업자</label>
              <input type="text" class="form-control mr-2" readonly />
            </div>
            <div class="col-md-6">
              <label for="inputCode" class="form-label">설비</label>
              <input type="text" class="form-control" readonly />
            </div>
            <div class="col-md-6">
              <label for="inputEmail5" class="form-label">작업량 설정</label>
              <input type="text" class="form-control mr-2" />
            </div>
          </form>
          <p style="margin-bottom: 30px"></p>
          <div class="row">
            <div class="col-md-4">
              <select
                id="multiPro"
                class="form-select"
                multiple=""
                aria-label="multiple select example"
              ></select>
            </div>
            <div class="col-md-8">
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">공정 코드</th>
                    <th scope="col">공정 명</th>
                    <th scope="col">자재 명</th>
                    <th scope="col">자재 소요량</th>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>
            </div>
          </div>

          <hr />
          <div id="btnGrp">
            <input type="text" style="width: 80px" readonly />
            <button type="button" class="btn btn-success">작업시작</button>
            <input type="text" style="width: 80px" readonly />
            <button type="button" class="btn btn-danger">작업종료</button>
            <!-- <p></p>
            <input type="text" style="width: 80px" readonly />
            <button type="button" class="btn btn-danger">불량 (+)</button>
            <button type="button" class="btn btn-info">불량(-)</button> -->
          </div>
        </div>
        <div class="modal-footer">
          <!-- <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
            작업 등록
          </button> -->
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
  $(document).ready(function(){
	  $('#indicaList tr').click(function(){
		$(this).addClass('active').siblings().removeClass('active');
		
		 
	    var indicaCd = $(this).find('td:eq(0)').text(); 
	    var indicaName = $(this).find('td:eq(1)').text(); 
	    var prdtNm = $(this).find('td:eq(2)').text(); 
	    var indicaDt = $(this).find('td:eq(3)').text(); 
	    var indicaCnt = $(this).find('td:eq(4)').text(); 
	    var nowSt = $(this).find('td:eq(5)').text(); 
		
	    $('#indicaCdText').text(indicaName);
	    
		  $.ajax({
				 url:'getPrcsProg',
				 type:'post',
				 data: {indicaCd : indicaCd},
				 success: function(data) {
					 console.log(data.PrcsProg);
					 var data = data.PrcsProg;
					 var tbody = $('#prcsProgList');
					 tbody.empty(); // 기존에 있던 tr과 td를 모두 제거

 				 // 데이터를 반복문으로 처리하여 tr과 td 생성
					 for (var i = 0; i < data.length; i++) {
					   var tr = $('<tr>');
					   tr.append('<td>' + data[i].prcsCd + '</td>');
					   tr.append('<td>' + data[i].prodCnt + '</td>');
					   tr.append('<td>' + data[i].inferCnt + '</td>');
					   tr.append('<td>' + '0' + '</td>');
					   tr.append('<td>' + data[i].prcsPsch + '</td>');
					   tr.append('<td>' + data[i].wkToTm + '</td>');
					   tr.append('<td>' + data[i].wkFrTm + '</td>');
					   tbody.append(tr);
					 } 

				 },
				 error: function(error) {
					 console.log(error);
				 }
				 
			 })
	    
	  });
	});
  </script>
</body>
