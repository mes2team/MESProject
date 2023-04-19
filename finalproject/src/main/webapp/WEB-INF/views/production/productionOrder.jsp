<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<style>

  #btnGrp {
    float: left;
    margin-top: 28px;
  }
  form {
    clear: both;
  }
#productOrderTable input[type="text"], #productOrderTable input[type="date"],#productOrderTable input[type="number"] {
	border: none;
	height: 47px;
	width: 100%;
	box-sizing: border-box;
}

#productOrderTable input:not([readonly]) {
	border-bottom: 1px solid green;
}

#productOrderTable td {
	padding: 0;
	vertical-align: middle;
}

#productOrderTable select {
	border: none;
	height: 47px;
	width: 100%;
	box-sizing: border-box;
	padding: 0;
	margin: 0;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
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
            <label for="inputEmail5" class="form-label">생산계획일자</label>
            <div class="d-flex align-items-center">
              <input type="date" class="form-control mr-2" id="startDate" />
              <span class="mx-2">~</span>
              <input type="date" class="form-control ml-2" id="endDate" />
            </div>
            </div>
            <div class="col-md-6">
	            <div id="btnGrp">
	              <button id="searchBtn" type="button" class="btn btn-primary">검색</button>
	              <button type="reset" class="btn btn-secondary">초기화</button>
	            </div>
            </div>
        </form>
        <!-- End Multi Columns Form -->
      </div>
    </div>
    <div class="row">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card">
          <p></p>
          <div class="card-body">
            <div id="btnGrp" style="float:right;">
              <button id="insertIndica" type="button" class="btn btn-primary">저장</button>
<!--               <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#insertModal">
                추가
              </button> -->
            </div>
            <div class="table-responsive" style="width: 100%; overflow: auto">
              <table id="productOrderTable" class="table table-hover" >
                <thead>
                  <tr>
                    <th>생산지시명</th>
                    <th>생산지시일자</th>
                    <th>지시종료일자</th>
                    <th>생산계획명</th>
                    <th>제품명</th>
                    <th>계획량</th>
                    <th>미계획량</th>
                    <th>생산지시량</th>
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
      <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-3">
        <div class="card">
          <div class="card-body">
            <div id="btnGrp">
            </div>
            <div class="table-responsive" style="width: 100%; height: 350px; overflow: auto">
            <h5 id="prdtTitle" class="card-title">공정흐름</h5>
              <table class="table table-hover">
                <thead>
                  <tr>
                  	<th>공정순서</th>
                  	<th>공정분류</th>
                    <th>공정명</th>
                  </tr>
                </thead>
                <tbody id="leftTbody"></tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4">
        <div class="card">
          <div class="card-body">
            <div id="btnGrp">
            </div>
            <div class="table-responsive" style="width: 100%; height: 350px; overflow: auto">
            <h5 id='rscTitle' class="card-title">자재품목</h5>
              <table class="table table-hover">
                <thead>
                  <tr>
                  	<th>자재분류</th>
                  	<th>자재명</th>
                    <th>필요자재량</th>
                    <th>투입공정</th>
                  </tr>
                </thead>
                <tbody id="centerTbody"></tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div class="col-xl-5 col-lg-5 col-md-5 col-sm-4 col-5">
	      <div class="card" >
		      <div class="card-body">
			      <div class="table-responsive" style="width: 100%; height: 350px; overflow: auto">
		              <h5 id="rscLotStkAmount" class="card-title"></h5>
		              <table class="table table-hover">
		                <thead>
		                  <tr>
		                  	<th>LOT번호</th>
		                  	<th>재고량</th>
		                  </tr>
		                </thead>
		                <tbody id="rightTbody">
		                </tbody>
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
					<button id="addOrderBtn" type="button" class="btn btn-primary">지시작성</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
    <div id="localStorageDiv">
    	<table>
    		<tr>
    			<td></td>
    		</tr>
    	</table>
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
function getCurrentDate() {
	  var today = new Date();
	  var yyyy = today.getFullYear();
	  var mm = String(today.getMonth() + 1).padStart(2, '0');
	  var dd = String(today.getDate()+1).padStart(2, '0');
	  var formattedDate = yyyy + '-' + mm + '-' + dd;
	  return formattedDate;
	}
	$( '#insertIndica').on('click', function() {
		var arrProOrderVO = [];
		$('#productOrderTable tbody tr').each(function() {
		  var proOrderVO = {};
		  let edctsCd = $(this).data('edctscd');
		  proOrderVO['edctsCd'] = edctsCd; 
		  $(this).find('td').each(function() {
		    var key = $(this).closest('table').find('thead th').eq($(this).index()).text();
		    var value = $(this).find('input').val();
		    var name = $(this).find('input').attr('name');
		    if (name) {
		      key = name;
		      proOrderVO[key] = value;
		    }
		  });
		  if (!$.isEmptyObject(proOrderVO)) {
			  arrProOrderVO.push(proOrderVO);
		  }
		});
		console.log(arrProOrderVO);
     	$.ajax({
	        url: 'addProOrder', 
	        type: 'POST',
	        data: JSON.stringify(arrProOrderVO), 
	        contentType: 'application/json; charset=utf-8',
	        success: function(response) {
	            console.log(response); // 서버에서 반환한 응답을 콘솔에 출력합니다.
	            alert('생산지시 등록 성공');
	            location.reload();
	        },
	        error: function(error) {
	            console.log(error);
	        }
	    });   
	});
	

	$(document).ready(function() {
		$('#centerTbody').on('click', 'tr', function() {
			$('#rightTbody').empty();
		    var rscCd = $(this).find('td:first').text();
		    var rscNm = $(this).find('td:nth-child(4)').text();
		    
		    $('#rscLotStkAmount').html('<span style="color:red;font-size:1em;font-weight:bold">' + rscNm + '</span> LOT 재고량');
		    
		    $.ajax({
		      type: 'POST',
		      url: 'getLotStk',
		      data: {rscCd: rscCd},
		      success: function(response) {
		        console.log(response.result);
		        var tbody = $('#rightTbody');
		        var sum = 0;
		        $.each(response.result, function(index, obj) {
		       	  sum += parseInt(obj.rscNowStc);
		          var tr = $('<tr>');
		          var td = $("<td>").attr("hidden", true).text(obj.rscCd);
		          tr.append(td);
		          var tdRscLotCd = $('<td>').text(obj.rscLotCd);
		          tr.append(tdRscLotCd);
		          var tdRscNowStc = $('<td>').text(obj.rscNowStc);
		          tr.append(tdRscNowStc);
		          var tdSelect = $('<td>').attr("hidden", true);
		          tr.append(tdSelect);
		          tbody.append(tr);
		        });
		        var lastTr = $('<tr>').css('background','#87CEFA');
		        var td = $("<td>").text("총 재고수량");
		        lastTr.append(td);
		        var td = $("<td>").text(sum);
		        lastTr.append(td);
		        tbody.append(lastTr);
		      },
		      error: function(error) {
		        console.log(error);
		      }
		    });
		  });

		
		//선택한 지시에 대한 지시량 설정가능
		$(document).on('click', '#productOrderTable input', function() {
			  var prdtNmTitle = $('#productOrderTable tbody tr').find('td:nth-child(6) input').val();  
			  $('#prdtTitle').html('<span style="color:red;font-size:1em;font-weight:bold">' + prdtNmTitle + '</span> 공정흐름');
			  $('#rscTitle').html('<span style="color:red;font-size:1em;font-weight:bold">' + prdtNmTitle + '</span> 자재품목');
			  var parentTd = $(this).parent();
			  var closestTr = parentTd.closest('tr');
			  var lastTd = closestTr.find('td:last');
			  let Td2 = closestTr.find('td:nth-child(2)').find('input');
			  let td3 = closestTr.find('td:nth-child(3)').find('input');
			  let td4 = closestTr.find('td:nth-child(4)').find('input');
			  var lastInput = lastTd.find('input');
			  if (lastInput.is($(this))) {
			    lastInput.removeAttr('readonly');
			    Td2.removeAttr('readonly');
			    td3.removeAttr('readonly');
			    td4.removeAttr('readonly');
			  }

			  var allTrs = $(this).closest('tbody').find('tr');
			  allTrs.each(function() {
			    var td = $(this).find('td:last');
			    var input = td.find('input');
			    if (!td.is(lastTd)) {
			      input.attr('readonly', 'readonly');
			    }
			  });
			var inputValue = $(this).closest('tr').find("td:last-child input").val();
			 
			var edctsCd = $(this).closest('tr').data('edctscd');
			$.ajax({
		        url: "getIndicaDetail",
		        type: "post",
		        data: {edctsCd : edctsCd},
		        success: function(data) {
		        	console.log(data.result);
		        	  var result0 = data.result[0];
		        	  var result1 = data.result[1];
					  var $leftTbody = $("#leftTbody");
					  var $centerTbody = $("#centerTbody");
					
					  $leftTbody.empty(); 
					  for (var i = 0; i < result1.length; i++) {
					    var $tr = $("<tr>");
					    var $td1 = $("<td>").text(result1[i].prcsNo);
					    var $td2 = $("<td>").text(result1[i].prcsFg);
					    var $td3 = $("<td>").text(result1[i].prcsNm);

					    $tr.append($td1, $td2, $td3);
					    $leftTbody.append($tr);
					  }
					  var uniqueRscCd = []; 
					  var filteredData = []; 

					  result0.forEach(item => {
					    if (!uniqueRscCd.includes(item.rscCd)) {
					      uniqueRscCd.push(item.rscCd);
					      filteredData.push(item);
					    }
					  });
					  
					  var $centerTbody = $("#centerTbody");
					  $centerTbody.empty(); // tbody 초기화
	
					  filteredData.forEach(item => {
						var useCnt = item.useCnt;
						var calcUse = parseInt(useCnt) * parseInt(inputValue)
					    var $tr = $("<tr>");
						var $td = $("<td>").attr("hidden", true).text(item.rscCd);
						var $td0 = $("<td>").attr("hidden", true).text(item.useCnt);
					    var $td1 = $("<td>").text(item.rscTyp);
					    var $td2 = $("<td>").text(item.rscNm);
					    var $td3 = $("<td>").text(calcUse);
					    var $td4 = $("<td>").text(item.prcsNm);
					    $tr.append($td, $td0, $td1, $td2, $td3,$td4);
					    $centerTbody.append($tr);
					  });

					  
		        },
		        error: function(error) {
		        	console.log(error)
		        }
		      });
		});
		
		
		
		  $("#addOrderBtn").click(function() {
			  $("#productOrderTable tbody").empty();
			  var selectedRows = []; 
			  var selectedEdctsCd =[];
			  $("#proPlanSearchTbody tr").each(function() {
			    var checkbox = $(this).find("input[type='checkbox']"); 
			    if (checkbox.prop("checked")) { 
			    	  var edctsCd = $(this).data("edctscd");
				      var planName = $(this).find("td:eq(1)").text(); 
				      var prdtNm = $(this).find("td:eq(2)").text(); 
				      var orderCnt = parseInt($(this).find("td:eq(4)").text()); 
				      var indicaCnt = parseInt($(this).find("td:eq(5)").text());
				      var remainCnt = orderCnt-indicaCnt;
				      
				      var newRow = $("<tr>").attr("data-edctscd", edctsCd);
				      var checkbox = $("<td>").attr("hidden", true)
					  var input1 = $("<input>").attr({type: "text", name:'indicaName',value: "" ,readonly: "readonly"});
				      var input2 = $("<input>").attr({type: "date",  name:'indicaDt',value: getCurrentDate() ,readonly: "readonly"});
					  var input3 = $("<input>").attr({type: "date", name:'indicaDue', value: "" });
					  var planName = $("<input>").attr({type: "text", name:'planName',value: planName, readonly: "readonly"});
					  var prdtNm = $("<input>").attr({type: "text", name:'prdtNm', value: prdtNm, readonly: "readonly"});
					  var orderCnt = $("<input>").attr({type: "text", name:'orderCnt', max:orderCnt, value: orderCnt ,readonly: "readonly"});
					  var remainCnt = $("<input>").attr({type: "text", max:remainCnt, value: remainCnt ,readonly: "readonly"});
					  var indicaCnt = $("<input>").attr({type: "number", name:'indicaCnt', value:0 , max:remainCnt, min:1 ,readonly: "readonly" }).on('keyup', function() {
																						  var currentValue = parseInt($(this).val());
																						  var min = parseInt($(this).attr("min"));
																						  var max = parseInt($(this).attr("max"));
																						  if (currentValue < min) {
																							alert("0이하로는 입력할 수 없습니다.");
																						    $(this).val(min);
																						  } else if (currentValue > max) {
																							alert("남은 계획수량을 초과했습니다.");
																						    $(this).val(max);
																						  }
																						});;
					  var td1 = $("<td>").append(input1);
					  var td2 = $("<td>").append(input2);
					  var td3 = $("<td>").append(input3);
					  var td4 = $("<td>").append(planName);
					  var td5 = $("<td>").append(prdtNm);
					  var td6 = $("<td>").append(orderCnt);
					  var td7 = $("<td>").append(remainCnt);
					  var td8 = $("<td>").append(indicaCnt);
					  newRow.append(checkbox, td1, td2, td3, td4, td5, td6, td7, td8);
				      $("#productOrderTable tbody").append(newRow);
				    }
					
			  });
		      
			  
			  
			  
			  $('#proPlanSearch').modal('hide');
		  });		
  
			    

	  //검색 이벤트
	  $("#searchBtn").on("click", function() {
	    var startDate = $("#startDate").val();
	    var endDate = $("#endDate").val();

	    if (startDate === "" && endDate === "") {
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
	              var tr = $("<tr>").attr('data-plancd',obj.planCd).attr('data-edctscd',obj.edctsCd).attr('data-bomcd',obj.bomCd);

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
	    	$.ajax({
		        url: "getPlanToOrder",
		        type: "POST",
		        data:{startDate:startDate,
		        	  endDate:endDate},
		        success: function(data) {
		        	console.log(data.result);
		            var tbody = $("#proPlanSearchTbody");
		            tbody.empty(); // 기존에 있던 tr 삭제

		            // data.result에 있는 객체들의 배열을 순회하면서 tr 생성
		            data.result.forEach(function(obj) {
		              var tr = $("<tr>").attr('data-plancd',obj.planCd).attr('data-edctscd',obj.edctsCd).attr('data-bomcd',obj.bomCd);

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
	    }
	    
	    
	    //checkbox link
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
	})

</script>
</body>
