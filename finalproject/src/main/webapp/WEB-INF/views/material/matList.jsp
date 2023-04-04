<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <script>
        jQuery(function($){
            $("#jaje").DataTable({"lengthChange": false,"searching": true });
        });
    </script>
<meta charset="UTF-8">
<title>Material List</title>
<style>
table, tr, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<div>
		        <sec:authorize access="hasRole('ROLE_ADMIN')">	
		        <!-- ROLE_ADMIN만 볼 수 있는 영역 -->							
				</sec:authorize>
<!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">

                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Tables</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Data Tables</li>
                                    </ol>
                                </nav>
                        
                           
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                
                    <!-- ============================================================== -->
                    <!-- basic table  -->
                    <!-- ============================================================== -->
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h2 class="card-header">자재관리</h2>
                            <div class="card-body">
                                <div class="table-responsive">		

		<table id="jaje"class="table table-striped table-bordered first" >
			<thead>
				<tr>
					<th>자재코드</th>
					<th>자재명</th>
					<th>자재규격</th>
					<th>관리단위</th>
					<th>자재유형</th>
					<th>안전재고</th>
					<th>사용여부</th>
					<th>거래처코드</th>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
		        	<th>수정</th>		
					</sec:authorize>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="mat" items="${matList }">
					<tr data-id="a">
						<td>${mat.rscCd }</td>
						<td>${mat.rscNm }</td>
						<td>${mat.rscSpec }</td>
						<td>${mat.mngUnit }</td>
						<td>${mat.rscTyp }</td>
						<td>${mat.safStc }</td>
						<td>${mat.useYn }</td>
						<td>${mat.vendCd }</td>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<td><button type="button"
								onclick="deleteInfo(${mat.rscCd}, event)">수정</button></td>
						</sec:authorize>
					</tr>
				</c:forEach>
			</tbody>
		</table>
				<!-- 6) 페이징 버튼 제작 -->
		<div class='pull-right'>
			<ul class="pagination">
				<c:if test="${pageMaker.prev }">
					<li class="paginate_button previous"><a
						href="${pageMaker.startPage -1}">Prev</a></li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }">
					<li class="paginate_button"
						${pageMaker.cri.pageNum == num ? "active":"" }><a
						href="${num }">${num }</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next }">
					<li class="paginate_button next"><a
						href="${pageMaker.endPage +1}">next</a></li>
				</c:if>
			</ul>
		</div>
		<!-- 해당 페이지 클릭시 페이지번호와 가져올 데이터 개수(default 10개) -->
		<form action="${pageContext.request.contextPath }/matList"
			id='actionForm' method='get'>
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amout" value="${pageMaker.cri.amount }">
		</form>
	</div>
		                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end basic table  -->
                    <!-- ============================================================== -->
                </div>
                
                
        <!-- Optional JavaScript -->     
    <script src="${pageContext.request.contextPath}/resources/static/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/assets/vendor/multi-select/js/jquery.multi-select.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/assets/libs/js/main-js.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/assets/vendor/datatables/js/data-table.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
    <script src="https://cdn.datatables.net/rowgroup/1.0.4/js/dataTables.rowGroup.min.js"></script>
    <script src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
    <script src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>	
	<script>	
	
	//페이징 이동
	$(document).ready(function() {
		var actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click", function(e) {
			//a 태그 클릭시 이벤트 방지
			e.preventDefault();
			//페이징 버튼의 속성값을 form태그의 input값에 입력
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			//페이징 이동 form 실행
			actionForm.submit();
		})
	})
	
	//등록 결과 알림
	function printAlert(message) {
		if(message == null || message == "") return	;		
		alert(message);
		
	}
	printAlert(`${result}`);
	
	//목록 삭제
	function deleteInfo(id,event) {
		$.ajax({
			url : 'matDelete',
			method : 'post',
			data : { employeeId : id},
			// dataType : 'json', (생략) // html, text, json, xml
			success : function(data) {
				/* if(data != null && data['결과'] =='Success') {
					alert('사원번호 : ' + data['사원번호'] + '의 정보가 삭제되었습니다.');
				} else {
					alert('해당 사원의 정보가 정상적으로 삭제되지 않았습니다.');
				} */
				console.log(data);
			},
			error : function(reject) {
				console.log(reject);
			}
		});
		//버블링 방지
		event.stopPropagation();
	}
	</script>

</body>
</html>