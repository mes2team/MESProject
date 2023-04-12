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
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
          <h2 class="pageheader-title">제품입고 관리</h2>
        </div>
      </div>
    </div>
    <!-- ============================================================== -->
    <!-- end pageheader -->
    <!-- ============================================================== -->
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">제품입고 관리</h5>
        <div id="btnGrp">
          <sec:authorize access="hasRole('ROLE_ADMIN')">
            <button type="button" class="btn btn-secondary">조회</button>
            <button type="button" class="btn btn-success">등록</button>
            <button type="button" class="btn btn-primary">초기화</button>
          </sec:authorize>
        </div>
        <!-- Multi Columns Form -->
        <form class="row g-3">
          <div class="col-md-4">
            <label for="inputCode" class="form-label">상품 코드</label>
            <div class="input-group">
              <input type="text" class="form-control" id="inputCode" disabled />
              <button
                type="button"
                class="btn btn-primary"
                data-bs-toggle="modal"
                data-bs-target="#completeModal"
              >
                <i class="bi bi-search"></i>
              </button>
            </div>
          </div>
          <div class="col-md-4">
            <label class="form-label">상품 이름</label>
            <input type="text" class="form-control" id="inputName" disabled />
          </div>
          <div class="col-md-4">
            <label class="form-label">제품 입고 수량</label>
            <input type="text" class="form-control" id="inputSpec" disabled />
          </div>
          <div class="col-md-4">
            <label for="inputEmail5" class="form-label">제품 입고 날짜</label>
            <div class="d-flex align-items-center">
              <input type="date" class="form-control mr-2" id="startDate" />
              <span class="mx-2">~</span>
              <input type="date" class="form-control ml-2" id="endDate" />
            </div>
          </div>
          <div class="text-center"></div>
        </form>
        <!-- End Multi Columns Form -->
      </div>
    </div>
    <div class="row">
      <!-- ============================================================== -->
      <!-- basic table  -->
      <!-- ============================================================== -->

      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card">
          <h5 class="card-header">Basic Table</h5>
          <div class="card-body">
            <div
              class="table-responsive"
              style="width: 100%; height: 300px; overflow: auto"
            >
              <table
                class="table table-striped table-bordered first table-hover"
              >
                <thead>
                  <tr>
                    <th>No.</th>
                    <th>제품 입고번호</th>
                    <th>제품 입고일자</th>
                    <th>제품 입고수량</th>
                    <th>제품 코드</th>
                    <th>완제품LOT번호</th>
                    <th>제품명</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach
                    items="${edctsistList }"
                    var="eist"
                    varStatus="loop"
                  >
                    <tr>
                      <td>${loop.count }</td>
                      <td>${eist.edctsIstNo}</td>
                      <td>
                        <fmt:formatDate
                          value="${eist.edctsIstDt}"
                          pattern="yyyy-MM-dd"
                        />
                      </td>
                      <td>${eist.edctsIstCnt}</td>
                      <td>${eist.edctsCd}</td>
                      <td>${eist.edctsLotNo}</td>
                      <td>${eist.prdtNm}</td>
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
  </div>

  <!-- 모달창 -->
  <!-- 포장 검사 완료 제품 조회 -->
  <div
    class="modal fade"
    id="completeModal"
    tabindex="-1"
    data-bs-backdrop="static"
  >
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">검사 완료 조회</h5>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <div class="modal-body">
          <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col">제품 코드</th>
                <th scope="col">제품 이름</th>
                <th scope="col">제품 입고수량</th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody id="productList"></tbody>
          </table>
          <!-- End Multi Columns Form -->
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
    $.ajax({
      url: "completePro",
      success: function (result) {
        console.log(result);
        $(result).each(function (idx, item) {
          console.log(item);
          let edctsCd = item.edctsCd;
          let prodCnt = item.prodCnt;
          let inferCnt = item.inferCnt;
          let prdtNm = item.prdtNm;
          let resultCnt = parseInt(prodCnt) - parseInt(inferCnt);

          let tr = $("<tr>");
          tr.append("<td>" + edctsCd + "</td>");
          tr.append("<td>" + prdtNm + "</td>");
          tr.append("<td>" + resultCnt + "</td>");
          tr.append(
            $("<td>").append(
              $("<button>")
                .attr("class", "btn btn-primary choiceBtn")
                .text("선택")
            )
          );

          $("#productList").append(tr);
        });
      },
      error: function (reject) {
        console.log(reject);
      },
    });

    function makeMaxLot() {
      let original = "${maxLot.edctsLotNo}"; //EDCTS-L202304100
      let number = parseInt(original.substring(7)); //202304101
      let maxLot = original.replace(number, number + 1);
      document.querySelector('[name="edctsLotNo"]').value = maxLot;
    }
  </script>
</body>
