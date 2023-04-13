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
                  <tr>
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
              <tbody></tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
