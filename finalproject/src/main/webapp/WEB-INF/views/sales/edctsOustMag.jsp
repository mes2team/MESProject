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
  <div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
      <div class="page-header">
        <h2 class="pageheader-title">제품출고 관리</h2>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
      <div class="card">
        <h5 class="card-header">주문 현황</h5>
        <div class="card-body">
          <div
            class="table-responsive"
            style="width: 100%; height: 300px; overflow: auto"
          >
            <table class="table table-striped table-bordered first table-hover">
              <!-- Multi Columns Form -->

              <thead>
                <tr>
                  <th scope="col">No.</th>
                  <th scope="col">주문 번호</th>
                  <th scope="col">주문 이름</th>
                  <th scope="col">주문일</th>
                  <th scope="col">납기일</th>
                  <th scope="col">거래처명</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${orderList }" var="order" varStatus="loop">
                  <tr ondblclick="openModal('${order.orderNo }')">
                    <td>${loop.count }</td>
                    <td>${order.orderNo }</td>
                    <td>${order.orderNm }</td>
                    <td>
                      <fmt:formatDate
                        value="${order.orderDt}"
                        pattern="yyyy-MM-dd"
                      />
                    </td>
                    <td>
                      <fmt:formatDate
                        value="${order.paprdDt}"
                        pattern="yyyy-MM-dd"
                      />
                    </td>
                    <td>${order.vendNm }</td>
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
        <h5 class="card-header">출고 현황</h5>
        <div class="card-body">
          <div
            class="table-responsive"
            style="width: 100%; height: 300px; overflow: auto"
          >
            <table class="table table-striped table-bordered first table-hover">
              <thead>
                <tr>
                  <th scope="col">
                    <input type="checkbox" id="cbx_chkAll" />
                  </th>
                  <th scope="col">No.</th>
                  <th scope="col">주문 번호</th>
                  <th scope="col">완제품 LOT 번호</th>
                  <th scope="col">완제품 이름</th>
                  <th scope="col">완제품 출고 일자</th>
                  <th scope="col">완제품 출고 수량</th>
                  <th scope="col">유통 기한</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach
                  items="${edctsOustList }"
                  var="eoust"
                  varStatus="loop"
                >
                  <tr>
                    <td scope="col">
                      <input type="checkbox" name="chk" />
                    </td>
                    <td>${loop.count }</td>
                    <td>${eoust.orderNo }</td>
                    <td>${eoust.edctsLotNo }</td>
                    <td>${eoust.prdtNm }</td>
                    <td>
                      <fmt:formatDate
                        value="${eoust.edctsOustDt }"
                        pattern="yyyy-MM-dd"
                      />
                    </td>
                    <td>${eoust.edctsOustCnt }</td>
                    <td>2026-04-14 테스트</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 모달창 -->
  <!-- 주문 상세 조회 -->
  <div
    class="modal fade"
    id="orderDetailModal"
    tabindex="-1"
    data-bs-backdrop="static"
  >
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">출고 등록</h5>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <div class="modal-body">
          <h5>주문 상세 조회</h5>
          <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col">제품 코드</th>
                <th scope="col">제품 이름</th>
                <th scope="col">제품 주문 수량</th>
              </tr>
            </thead>
            <tbody id="orderDetailList"></tbody>
          </table>
          <hr />
          <h5>완제품 상세 조회</h5>
          <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col">완제품LOT 번호</th>
                <th scope="col">완제품 명</th>
                <th scope="col">완제품 수량</th>
                <th scope="col">출고량</th>
                <th scope="col">제조일자</th>
                <th scope="col">유통기한</th>
              </tr>
            </thead>
            <tbody></tbody>
          </table>
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
    function openModal(orderNo) {
      let prdtArr = [];
      $.ajax({
        url: "edctsOustOrderDetail",
        data: { orderNo: orderNo },
        success: function (result) {
          $("#orderDetailList").empty();
          $(result).each(function (idx, item) {
            let tr = $("<tr>");

            tr.append("<td>" + item.edctsCd + "</td>");
            tr.append("<td>" + item.prdtNm + "</td>");
            tr.append("<td>" + item.orderCnt + "</td>");

            $("#orderDetailList").append(tr);

            let prdtObj = { prdtNm: item.prdtNm };

            prdtArr.push(prdtObj);
          });
        },
        error: function (reject) {
          console.log(reject);
        },
      });

      console.log(prdtArr);
      $("#orderDetailModal").modal("show");
    }
  </script>
</body>
