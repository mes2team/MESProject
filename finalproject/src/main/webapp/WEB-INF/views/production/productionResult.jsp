<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<style>
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
.highlighted{
	background-color: #e1efff;
}
</style>
<body>
    <div class="card">
            <div class="card-body">
              <!-- Bordered Tabs Justified -->
              <ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist">
                <li class="nav-item flex-fill" role="presentation">
                  <button class="nav-link w-100 active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-home" type="button" role="tab" aria-controls="home" aria-selected="true">공정실적관리</button>
                </li>
                <li class="nav-item flex-fill" role="presentation">
                  <button class="nav-link w-100" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-profile" type="button" role="tab" aria-controls="profile" aria-selected="false" tabindex="-1">공정실적조회</button>
                </li>
              </ul>
              <div class="tab-content pt-2" id="borderedTabJustifiedContent">
                <div class="tab-pane fade show active" id="bordered-justified-home" role="tabpanel" aria-labelledby="home-tab">
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
                    <th>지시종료일자</th>
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
                		<td><fmt:formatDate value="${item.indicaDue }" pattern="yyyy-MM-dd" /></td>
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
          <div class="card-body">
            <div 
              class="table-responsive"
              style="width: 100%; height: 300px; overflow: auto"
            >
            <h3 class="card-title" id="indicaCdText"></h3>
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
                    <th>현재상태</th>
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
                </div>
                <div class="tab-pane fade" id="bordered-justified-profile" role="tabpanel" aria-labelledby="profile-tab">
                    <div class="card">
			      	<div class="card-body">
				        <h5 class="card-title">공정실적 조회</h5>
				        <!-- Multi Columns Form -->
				        <form id="searchForm" class="row g-3">
				          <div class="col-md-6">
				            <label for="inputEmail5" class="form-label">생산지시일자</label>
				            <div class="d-flex align-items-center">
				              <input type="date" class="form-control mr-2" id="" />
				              <span class="mx-2">~</span>
				              <input type="date" class="form-control ml-2" id="" />
				            </div>
				            </div>
				            <div class="col-md-6">
					            <div id="btnGrp">
					              <button id="searchPrcsBtn" type="button" class="btn btn-primary">검색</button>
					              <button type="reset" class="btn btn-secondary">초기화</button>
					            </div>
				            </div>
				        </form>
				        <!-- End Multi Columns Form -->
				      </div>
				    </div>
			            <div class="card">
			          <p></p>
			          <div class="card-body">
			            <div id="btnGrp" style="float:right;">
			            </div>
			            <div class="table-responsive" style="width: 100%; overflow: auto">
			              <table id="selectPrcsList" class="table table-hover" >
			                <thead>
			                  <tr>
			                    <th>생산지시명</th>
			                    <th>생산지시일자</th>
			                    <th>지시종료일자</th>
			                    <th>제품명</th>
			                    <th>지시량</th>
			                    <th>불량량</th>
			                    <th>작업량</th>
			                    <th>현재상태</th>
			                  </tr>
			                </thead>
			                <tbody></tbody>
			              </table>
			            </div>
			          </div>
			        </div>
                
                </div>
              </div><!-- End Bordered Tabs Justified -->

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
                    <th scope="col">자재소모량</th>
                  </tr>
                </thead>
                <tbody id="modalInTbody"></tbody>
              </table>
            </div>

          <hr />
          <div>
          	<div class="form-inline">
			  <input id="startTime" class="form-control mr-2" type="text"  readonly />
			  <button id="workStart" type="button" class="btn btn-success">작업시작</button>
			</div>
          	<div class="form-inline">
	            <input id="stopTime" class="form-control mr-2" type="text"  readonly />
	            <button id="workStop" type="button" class="btn btn-danger">작업종료</button>
          	</div>
          </div>
          </form>
        </div>
        <div class="modal-footer">
          <!-- <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
            작업 등록
          </button> -->
          <button
          	id="closeModal"
            type="button"
            class="btn btn-secondary"
          >
            닫기
          </button>
        </div>
      </div>
    </div>
  </div>
  
  <script>
  function validateForm() {
	  let isValid = true;
	  
	  // 작업일자 검사
	  if ($('#workDate').val() === '') {
	    alert('작업일자를 입력해주세요.');
	    isValid = false;
	  }
	  
	  // 작업자 검사
	  if ($('#prcsWorker').val() === '') {
	    alert('작업자를 입력해주세요.');
	    isValid = false;
	  }
	  
	  // 공정명 검사
	  if ($('#prcsSelect').val() === '') {
	    alert('공정명을 선택해주세요.');
	    isValid = false;
	  }
	  
	  // 작업량 설정 검사
	  if ($('#workAmount').val() === '') {
	    alert('작업량을 입력해주세요.');
	    isValid = false;
	  }
	  
	  // 사용가능한 설비 검사
	  if ($('#multiPro').val().length === 0) {
	    alert('사용 가능한 설비를 선택해주세요.');
	    isValid = false;
	  }
	  
	  return isValid;
	}
	function formatDate(time) {
	    var date = new Date(time);
	    var year = date.getFullYear();
	    var month = ("0" + (date.getMonth() + 1)).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);
	    var formattedDate = year + "-" + month + "-" + day;
	    return formattedDate;
	}
  
  function getCurrentTime() {
	  var currentDate = new Date();
	  var year = currentDate.getFullYear();
	  var month = currentDate.getMonth() + 1;
	  var day = currentDate.getDate();
	  var hours = currentDate.getHours();
	  var minutes = currentDate.getMinutes();
	  var seconds = currentDate.getSeconds();

	  // 월, 일, 시, 분, 초가 10보다 작을 경우 앞에 0 추가
	  if (month < 10) {
	    month = "0" + month;
	  }
	  if (day < 10) {
	    day = "0" + day;
	  }
	  if (hours < 10) {
	    hours = "0" + hours;
	  }
	  if (minutes < 10) {
	    minutes = "0" + minutes;
	  }
	  if (seconds < 10) {
	    seconds = "0" + seconds;
	  }

	  // yyyy-MM-dd hh:mm:ss 형식으로 출력
	  var formattedDate = year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
	  return formattedDate;
	}
  $(document).ready(function(){
	  $(document).on('click', '#selectPrcsList tbody tr', function() {
		  var indicaCd = $(this).find('td:first-child').text();
		  var selectedTr = $(this);
		  var isHighlighted = selectedTr.hasClass('highlighted');

		  if (!isHighlighted) {
		    selectedTr.addClass('highlighted');
		  } else {
		    selectedTr.removeClass('highlighted');
		  }
		  console.log(indicaCd);
		  $.ajax({
			  url:'getPrcsIndica',
			  type:'post',
			  data:{indicaCd:indicaCd},
			  success:function(data) {
				  console.log(data.PrcsIndica);

				  data.PrcsIndica.forEach(function(item) {
				    var tr = $('<tr>').attr('class',item.indicaCd);

				    var td1 = $('<td>').text(item.prcsNm);
				    var td2 = $('<td>').text(item.prcsPsch);
				    var td3 = $('<td>').text(item.indicaCnt);
				    var td4 = $('<td>').text(item.inferCnt);
				    var td5 = $('<td>').text(item.prodCnt);
				    var td6 = $('<td>').text(item.wkToTm);
				    var td7 = $('<td>').text(item.wkFrTm);
				    var td8 = $('<td>').text(item.useEqm);

				    tr.append(td1, td2, td3, td4, td5, td6, td7, td8);

				    selectedTr.after(tr);
				  });
			  },
			  error:function() {
				  
			  }
			  
		  })
	  });
 	  $('#searchPrcsBtn').click(function() {
		  $.ajax({
			  url:'getPrcsAndIndList',
			  type:'get',
			  success:function(data) {
				  console.log(data.prcsList);
				  console.log(data.prcsAmount);
				  var tbody = $('#selectPrcsList tbody');

				  data.prcsAmount.forEach(function(item) {
				    var tr = $('<tr>');

				    var td1 = $('<td>').attr('hidden', true).text(item.indicaCd);
				    var td2 = $('<td>');
				    var td3 = $('<td>');
				    var td4 = $('<td>');
				    var td5 = $('<td>');
				    var td6 = $('<td>');
				    var td7 = $('<td>');
				    var td8 = $('<td>');
				    var td9 = $('<td>');

				    data.prcsList.forEach(function(prcsItem) {
				      if (item.indicaCd === prcsItem.indicaCd) {
				        td2.text(prcsItem.indicaName);
				        td3.text(formatDate(prcsItem.indicaDt));
				        if(prcsItem.indicaFdt == null){
				        	td4.text('-');
				        }else {	
				        	td4.text(formatDate(prcsItem.indicaFdt));
				        }
				        td5.text(prcsItem.prdtNm);
				        td6.text(prcsItem.indicaCnt);
				        td7.text(prcsItem.inferCnt);
				        td8.text(prcsItem.prodCnt);
				        td9.text(prcsItem.prcsStatus);
				      }
				    });

				    tr.append(td1, td2, td3, td4, td5, td6, td7, td8, td9);

				    tbody.append(tr);
				  });

			  },
			  error:function(error) {
				  console.log(error)
			  }
		  })
	  }) 
	  
	  $('#closeModal').click(function() {
		  $('#prcsModal').find('button').prop('disabled',false);
		  $('#prcsModal').find('input').val('');
		  $('#prcsModal').modal('hide');
	  })

	  var time = getCurrentTime();
	  $('#workStop').click(function() {
		  //종료버튼
		  var wkFrTm = time.substr(time.length - 8);
		  $('#stopTime').val(wkFrTm);
		  $(this).attr('disabled','disabled'); 
		  
		  var indicaCd = $('tr.active').find('td:first-child').text()
		  console.log(indicaCd);
		  var prcsCd = $('#prcsSelect').val();
		  console.log(wkFrTm+'/'+indicaCd+'/'+prcsCd);
		  $.ajax({
			  url:'modifyPrcsStop',
			  type:'post',
			  data:{prcsCd:prcsCd,
				    indicaCd:indicaCd,
				    wkFrTm:wkFrTm},
			  success:function(data){
				  console.log(data.result);
				  location.reload();

			  },
			  error:function(error){
				  console.log(error);
			  }
		  })
		  
		  
		});
	  
	  $('#workStart').on('click', function() {	  
		  if(validateForm()){  
		  var trList = $('#modalInTbody tr');
		  //사용할 자재 배열
		  var rscArr = [];

		  trList.each(function(index, element) {
		    var $this = $(this);
		    var rscOut = {
		      oustCnt: $this.find('td:nth-child(3)').text(),
		      rscCd: $this.find('td:nth-child(4)').text()
		    };
		    rscArr.push(rscOut);
		  });

		  console.log(rscArr);
		  //시작버튼
		  var wkToTm = time.substr(time.length - 8);
		  $('#startTime').val(wkToTm);
		  $(this).attr('disabled','disabled');
		  
		  var indicaCd = $('tr.active').find('td:first-child').text();
		  console.log($('tr.active'));
		  console.log(indicaCd);
		  var prcsPsch = $('#prcsWorker').val();
		  var prcsCd = $('#prcsSelect').val();
		  var indicaCnt = $('#workAmount').val();
		  console.log(prcsPsch+"/"+prcsCd+"/"+indicaCnt+"/"+wkToTm);
		  
		  //사용할 설비 배열
		  var selectedEqm = $('#multiPro').val();
		  var useEqm = ""; 

		  for (var i = 0; i < selectedEqm.length; i++) {
			  useEqm += selectedEqm[i]; 

		    if (i != selectedEqm.length - 1) {
		    	useEqm += "/";
		    }
		  }
		  
		  $.ajax({
			  url:'modifyPrcsStart',
			  type:'post',
			  data:{prcsPsch:prcsPsch,
				    prcsCd:prcsCd,
				    useEqm:useEqm,
				    indicaCd:indicaCd,
				    wkToTm:wkToTm,
				    indicaCnt:indicaCnt},
			  success:function(data){
				  console.log(data);
				  //설비
				  $.ajax({
					  url: 'modifyUseEqm',
					  type: 'post',
					  data: JSON.stringify(selectedEqm),
					  contentType: "application/json",
					  success:function(data) {
						  console.log("설비"+data.result);
						  //자재
						  $.ajax({
							  url: 'modifyUseRsc',
							  type: 'post',
							  data: JSON.stringify(rscArr),
							  contentType: "application/json",
							  success:function(data) {
								  console.log("자재"+data);
								  location.reload();
							  },
							  error:function(error) {
								  console.log(error);
							  }
						  })
					  },
					  error:function(error) {
						  console.log(error);
					  }
				  })
				  
				  
			  },
			  error:function(error){
				  console.log(error);
			  }
		  })
		  }
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
	  
	  
	  $('#workDate').val(time.substr(0, time.length - 9));
	  
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
						   if(data[i-1].prodCnt != 0){
							  tr.append('<td>' + data[i-1].prodCnt + '</td>');
						   }else{
						   	  tr.append('<td>' + "0" + '</td>');
						   }
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
					   tr.append('<td>' + data[i].prcsStatus + '</td>');
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
		  var prcsPsch = $(this).find('td:nth-child(6)').text();
		  var wkToTm = $(this).find('td:nth-child(7)').text();
		  var wkFrTm = $(this).find('td:nth-child(8)').text();
		  console.log(wkToTm);
		  if(wkToTm != '-') {
			  $('#workStart').prop('disabled', true);
			  $('#startTime').val(wkToTm);
			  $('#prcsWorker').val(prcsPsch)
		  }
		  if(wkFrTm != '-') {
			  $('#workStop').prop('disabled', true);
			  $('#stopTime').val(wkFrTm);
		  }
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
							 if(wkToTm == '-'){	 
								 var multiPro = $('#multiPro');
								 $.each(data.result, function(index, obj) {
								   var eqmCd = obj.eqmCd;
								   var eqmFg = obj.eqmFg;
								   
								   var option = $('<option>').attr('value', eqmCd).text(eqmFg+' / '+eqmCd).data('fg', eqmFg);
								   
								   multiPro.append(option);
								 });
							 }
						 },
						 error:function(error) {
							 console.log(error)
						 }
					 })
					 let workAmount = parseInt($('#workAmount').val());
					 var tbody = $('#modalInTbody');
					 for (var i = 0; i < data.result.length; i++) {
					    var obj = data.result[i];
					    var tr = $('<tr>').appendTo(tbody);
					    var useCnt = parseInt(obj.useCnt);
					    var calcRsc = useCnt * workAmount;
					    tr.append($('<td>').text(obj.rscTyp));
					    tr.append($('<td>').text(obj.rscNm));
					    tr.append($('<td>').text(calcRsc).attr('data-cnt',obj.useCnt));
					    tr.append($('<td hidden="true">').text(obj.rscCd));
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