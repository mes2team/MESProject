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
                data-bs-target="#prcsModal"
              >
                추가
              </button>
            </div>
            <div
              class="table-responsive"
              style="width: 100%; height: 300px; overflow: auto"
            >
            <h5 id="indicaCdText"></h5>
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th>공정 코드</th>
                    <th>공정명</th>
                    <th>지시량</th>
                    <th>불량량</th>
                    <th>작업량</th>
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
    id="prcsModal"
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
              <label class="form-label">작업일자</label>
              <input id="workDate" type="date" class="form-control" readonly />
            </div>
            <div class="col-md-6">
              <label for="" class="form-label">작업자</label>
              <input id="prcsWorker" type="text" class="form-control mr-2" />
            </div>
            <div class="col-md-6">
              <label for="" class="form-label">공정명</label>
              <select class="form-select" id="prcsSelect">
              </select>
            </div>
            <div class="col-md-6">
              <label for="" class="form-label">작업량 설정</label>
              <input id="workAmount" type="number" class="form-control mr-2"  min="1"/>
            </div>
            <div class="col-md-4">
              <label for="" class="form-label">사용가능한 설비</label>
              <select
                id="multiPro"
                class="form-select"
                multiple=""
                aria-label="multiple select example"
              ></select>
            </div>
            <div class="col-md-8">
              <label for="" class="form-label">투입자재</label>
              <table class="table table-hover">
                <thead>
                  <tr>
                  	<th scope="col">자재분류</th>
                    <th scope="col">자재명</th>
                    <th scope="col">예상소모량</th>
                    <th scope="col">실자재소모량</th>
                  </tr>
                </thead>
                <tbody id="modalInTbody"></tbody>
              </table>
            </div>

          <hr />
          <div>
          	<div class="form-inline">
			  <input id="startTime" class="form-control mr-2" type="text" style="width: 80px" readonly />
			  <button id="workStart" type="button" class="btn btn-success">작업시작</button>
			</div>
          	<div class="form-inline">
	            <input class="form-control mr-2" type="text" style="width: 80px" readonly />
	            <button type="button" class="btn btn-danger">작업종료</button>
          	</div>
          </div>
          </form>
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
  function getCurrentDate() {
	  var now = new Date();
	  var year = now.getFullYear();
	  var month = now.getMonth() + 1;
	  var day = now.getDate();

	  if (month < 10) {
	    month = '0' + month;
	  }

	  if (day < 10) {
	    day = '0' + day;
	  }

	  var formattedDate = year + '-' + month + '-' + day;
	  return formattedDate;
	}
  $(document).ready(function(){
	  $('#workStart').on('click', function() {	  
		  var now = new Date();
		  var hours = now.getHours();
		  var minutes = now.getMinutes();
		  var seconds = now.getSeconds();
		  hours = ('0' + hours).slice(-2);
		  minutes = ('0' + minutes).slice(-2);
		  seconds = ('0' + seconds).slice(-2);
		  var wkToTm = hours + ':' + minutes + ':' + seconds;
		  $('#startTime').val(wkToTm);
		  $(this).attr('disabled','disabled');
		  
		  var prcsPsch = $('#prcsWorker').val();
		  var prcsCd = $('#prcsSelect').val();
		  var prodCnt = $('#workAmount').val();
		  console.log(prcsPsch+"/"+prcsCd+"/"+prodCnt+"/"+wkToTm);
		  
		  var selectedValues = $('#multiPro').val();
		  var useEqm = ""; 

		  for (var i = 0; i < selectedValues.length; i++) {
			  useEqm += selectedValues[i]; 

		    if (i != selectedValues.length - 1) {
		    	useEqm += "/";
		    }
		  }
		  console.log(selectedValues);
		  
		  $.ajax({
			  url:'modifyPrcsStart',
			  type:'post',
			  data:{prcsPsch:prcsPsch,
				    prcsCd:prcsCd,
				    prodCnt:prodCnt,
				    useEqm:useEqm},
			  success:function(data){
				  console.log(data);
			  },
			  error:function(error){
				  console.log(error);
			  }
		  })
	  })
	 
	  
	  $('#workAmount').on('input', function() {
		  var workAmount = parseInt($(this).val(), 10);
		  
		  var $tableBody = $('#modalInTbody');
		  
		  $tableBody.find('tr').each(function() {
		    var $lastCell = $(this).find('td:nth-child(3)');
		    var useCnt = parseInt($lastCell.data('cnt'));
		    
		    var calculatedValue = useCnt * workAmount;
		    $lastCell.text(calculatedValue.toString());
		  });
		});
	  
	  
	  $('#workDate').val(getCurrentDate);
	  
	  $('#indicaList tr').click(function(){
		$('#prcsSelect').empty();  
		
		  
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
					 var select = $('#prcsSelect');
					 tbody.empty(); // 기존에 있던 tr과 td를 모두 제거

 				 // 데이터를 반복문으로 처리하여 tr과 td 생성
					 for (var i = 0; i < data.length; i++) {
					   var tr = $('<tr>').data('id',prdtNm);
					   tr.append('<td>' + data[i].prcsCd + '</td>');
					   
					   tr.append('<td>' + data[i].prcsNm + '</td>');
					   if(i==0){  
					   	   tr.append('<td>' + indicaCnt + '</td>');
					   } else {
						   tr.append('<td>' + "0" + '</td>');
					   }
					   tr.append('<td>' + data[i].inferCnt + '</td>');
					   tr.append('<td>' + data[i].prodCnt + '</td>');
					   if(data[i].prcsPsch == null){
						  tr.append('<td>' + '-' + '</td>');
					   } else {
					   	tr.append('<td>' + data[i].prcsPsch + '</td>');
					   }
					   if(data[i].wkToTm == null){
						   tr.append('<td>' + '-' + '</td>');
					   } else{
					   	tr.append('<td>' + data[i].wkToTm + '</td>');
					   }
					   if(data[i].wkFrTm == null){
						   tr.append('<td>' + '-' + '</td>');
					   }else{
					   	tr.append('<td>' + data[i].wkFrTm + '</td>');
					   }
					   tr.append('<td hidden="true">' + indicaCnt + '</td>');
					   tbody.append(tr);
					   var option = $('<option>').attr('value', data[i].prcsCd).text(data[i].prcsNm +' / '+ data[i].prcsCd);
					   select.append(option);
					 } 
					 

				 },
				 error: function(error) {
					 console.log(error);
				 }
				 
			 })
	    
	  });
	  $(document).on('click', '#prcsProgList tr', function() {
		  $('#modalInTbody').empty();
		  $('#multiPro').empty(); 
		  var prdtNm = $(this).data('id');
		  var prcsCd = $(this).find('td:first-child').text();
		  var prcsNm = $(this).find('td:nth-child(2)').text();
		  var indicaCnt = $(this).find('td:nth-child(3)').text();
		  console.log(indicaCnt);
		  $('#workAmount').val(indicaCnt);
		  $('#prcsSelect option').each(function() {
			  if ($(this).val() == prcsCd) {
			    $('#prcsSelect').val(prcsCd); 
			    $(this).siblings().prop('disabled', false); 
			  } else {
			    $(this).prop('disabled', true);
			  }
			});
		  
		  
		  $.ajax({
				 url:'getPrcsAndRsc',
				 type:'post',
				 data: {prcsCd : prcsCd,
					    prdtNm : prdtNm},
				 success: function(data) {
					 console.log(data.result);
					 console.log(prcsCd);
					 $.ajax({
						 url:'getEqmPrcs',
						 type:'post',
						 data:{prcsCd : prcsCd},
						 success:function(data){
							 console.log(data.result)
							 var multiPro = $('#multiPro');

							 $.each(data.result, function(index, obj) {
							   var eqmCd = obj.eqmCd;
							   var eqmFg = obj.eqmFg;
							   
							   var option = $('<option>').attr('value', eqmCd).text(eqmFg+' / '+eqmCd);
							   
							   multiPro.append(option);
							 });
						 },
						 error:function(error) {
							 console.log(error)
						 }
					 })
					 var tbody = $('#modalInTbody');
					 for (var i = 0; i < data.result.length; i++) {
					    var obj = data.result[i];
					    var tr = $('<tr>').appendTo(tbody);
					    tr.append($('<td>').text(obj.rscTyp));
					    tr.append($('<td>').text(obj.rscNm));
					    tr.append($('<td>').text(obj.useCnt).attr('data-cnt',obj.useCnt));
					    var input = $('<input>').attr({
											    	  type: 'number',
											    	  class: 'form-control mr-2'
											    	});
					    tr.append($('<td>').append(input));
					    
					 }
					 $('#prcsModal').modal('show');
				 },
				 error : function(error) {
					 console.log(error);
				 }
				 
		  })
		  
		    
	  });
	});
  </script>
</body>
