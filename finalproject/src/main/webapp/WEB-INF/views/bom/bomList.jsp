<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%>
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
          <h2 class="pageheader-title">Bom 관리</h2>
        </div>
      </div>
    </div>
    <!-- ============================================================== -->
    <!-- end pageheader -->
    <!-- ============================================================== -->
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Bom 관리</h5>
        <form class="row g-3">
          <div class="col-md-6">
            <label for="inputCode" class="form-label">상품 코드</label>
            <div class="input-group">
              <input type="text" class="form-control" id="inputCode" disabled />
              <button
                type="button"
                class="btn btn-primary"
                data-bs-toggle="modal"
                data-bs-target="#productSearch"
              >
                <i class="bi bi-search"></i>
              </button>
            </div>
          </div>
          <div class="col-md-6">
            <label for="inputName" class="form-label">상품 이름</label>
            <input type="text" class="form-control" id="inputName" disabled />
          </div>
          <div class="text-center">
            <button type="button" class="btn btn-primary">조회</button>
            <button type="reset" class="btn btn-secondary">초기화</button>
          </div>
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
                    <th><input type="checkbox" id="cbx_chkAll" /></th>
                    <th>No.</th>
                    <th>구분</th>
                    <th>거래처코드</th>
                    <th>거래처명</th>
                    <th>거래처담당자</th>
                    <th>사업자등록번호</th>
                    <th>전화번호</th>
                    <th>비고</th>
                  </tr>
                </thead>
                <tbody></tbody>
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
  <!-- 상품 조회 -->
  <div
    class="modal fade"
    id="productSearch"
    tabindex="-1"
    data-bs-backdrop="static"
  >
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">상품 조회</h5>
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
                <th scope="col">상품 코드</th>
                <th scope="col">상품 이름</th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${proList }" var="pro">
                <tr>
                  <td>${pro.edctsCd }</td>
                  <td>${pro.prdtNm }</td>
                  <td>
                    <button class="btn btn-primary" id="choice">선택</button>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
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
    // 상품 선택하면 input에 넣기
    $(document).on("click", "#choice", function () {
      let proCd = $(this).closest("tr").children().eq(0).text();
      let proName = $(this).closest("tr").children().eq(1).text();

      $("#inputCode").val(proCd);
      $("#inputName").val(proName);

      $("#productSearch").modal("hide");
    });
  </script>
</body>
