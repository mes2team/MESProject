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

  #btnGrp {
    float: right;
    padding: 10px;
  }
  #btnGrp button {
    margin: 3px;
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
            <label class="form-label">상품 이름</label>
            <input type="text" class="form-control" id="inputName" disabled />
          </div>
          <div class="col-md-4">
            <label class="form-label">규격</label>
            <input type="text" class="form-control" id="inputSpec" disabled />
          </div>
          <div class="col-md-4">
            <label class="form-label">단위</label>
            <input type="text" class="form-control" id="inputUnit" disabled />
          </div>
          <div class="col-md-4">
            <label class="form-label">안전 재고</label>
            <input type="text" class="form-control" id="inputSafStc" disabled />
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
          <div id="btnGrp" class="card-top d-flex justify-content-end">
            <button type="button" class="btn btn-primary" id="saveBtn">
              저장
            </button>
            <button type="button" class="btn btn-primary" id="addBtn">
              추가
            </button>
            <button type="button" class="btn btn-danger" id="delBtn">
              삭제
            </button>
          </div>
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
                    <th>자재코드</th>
                    <th>자재이름</th>
                    <th>사용량</th>
                    <th>단위</th>
                    <th>사용공정명</th>
                  </tr>
                </thead>
                <tbody id="bomList"></tbody>
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
                <th scope="col">규격</th>
                <th scope="col">단위</th>
                <th scope="col">안전 재고</th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${edctsList }" var="edcts">
                <tr>
                  <td>${edcts.edctsCd }</td>
                  <td>${edcts.prdtNm }</td>
                  <td>${edcts.spec }</td>
                  <td>${edcts.unit }</td>
                  <td>${edcts.safStc }</td>
                  <td>
                    <button class="btn btn-primary" id="choiceEdcts">
                      선택
                    </button>
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

  <!-- 모달창 -->
  <!-- 자재 조회 -->
  <div class="modal fade" id="rscModal" tabindex="-1" data-bs-backdrop="static">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">자재 조회</h5>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <div class="modal-body">
          <div class="col-md-6">
            <label for="inputCode" class="form-label">자재 이름</label>
            <div class="input-group">
              <input type="text" class="form-control" id="searchRscInput" />
              <button type="button" class="btn btn-info" id="searchRscBtn">
                <i class="bi bi-search">검색</i>
              </button>
            </div>
          </div>
          <hr />
          <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col">구분</th>
                <th scope="col">자재 코드</th>
                <th scope="col">자재 이름</th>
                <th scope="col">규격</th>
                <th scope="col">단위</th>
                <th scope="col">거래처명</th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${rscList }" var="rsc">
                <tr>
                  <td>${rsc.rscTyp }</td>
                  <td>${rsc.rscCd }</td>
                  <td>${rsc.rscNm }</td>
                  <td>${rsc.rscSpec }</td>
                  <td>${rsc.mngUnit }</td>
                  <td>${rsc.vendNm }</td>
                  <td>
                    <button class="btn btn-primary" id="choiceRsc">선택</button>
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

  <!-- 모달창 -->
  <!-- 공정 조회 -->
  <div
    class="modal fade"
    id="prscModal"
    tabindex="-1"
    data-bs-backdrop="static"
  >
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">공정 조회</h5>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <div class="modal-body">
          <!-- <div class="col-md-6">
            <label for="inputCode" class="form-label">공정 이름</label>
            <div class="input-group">
              <input type="text" class="form-control" id="SearchPrcs" />
              <button
                type="button"
                class="btn btn-info"
                data-bs-toggle="modal"
                data-bs-target="#productSearch"
              >
                <i class="bi bi-search">검색</i>
              </button>
            </div>
          </div>
          <hr /> -->
          <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col">공정 코드</th>
                <th scope="col">공정 이름</th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${prscList }" var="prsc">
                <tr>
                  <td>${prsc.prscCd }</td>
                  <td>${prsc.prscNm }</td>
                  <td>
                    <button class="btn btn-primary" id="choicePrsc">
                      선택
                    </button>
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
    $(document).on("click", "#choiceEdcts", function () {
      let edctsCd = $(this).closest("tr").children().eq(0).text();
      let edctsName = $(this).closest("tr").children().eq(1).text();
      let edctsSpec = $(this).closest("tr").children().eq(2).text();
      let edctsUnit = $(this).closest("tr").children().eq(3).text();
      let edctsSaf = $(this).closest("tr").children().eq(4).text();

      $("#inputCode").val(edctsCd);
      $("#inputName").val(edctsName);
      $("#inputSpec").val(edctsSpec);
      $("#inputUnit").val(edctsUnit);
      $("#inputSafStc").val(edctsSaf);
      $("#productSearch").modal("hide");

      $.ajax({
        url: "bomList",
        data: { edctsCd: edctsCd },
        success: function (result) {
          $("#bomList").empty();
          $.each(result, function (idx, item) {
            makeTr(idx, item);
          });
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    });

    function makeTr(idx, data) {
      let tr = $("<tr>");

      tr.append(
        $("<td>").append(
          $("<input>").attr("type", "checkbox").attr("name", "chk")
        )
      );
      tr.append("<td>" + (idx + 1) + "</td>");
      tr.append("<td>" + data.rscCd + "</td>");
      tr.append("<td>" + data.rscNm + "</td>");
      tr.append("<td>" + data.useCnt + "</td>");
      tr.append("<td>" + data.unit + "</td>");
      tr.append("<td>" + data.prcsNm + "</td>");

      $("#bomList").append(tr);
    }

    // 체크박스 선택 메인꺼
    $(document).on("click", "#cbx_chkAll", function () {
      if ($("#cbx_chkAll").is(":checked")) {
        $("input[name=chk]")
          .prop("checked", true)
          .closest("tr")
          .addClass("selected");
        $("input[name=chk]").closest("tr").addClass("table-danger");
      } else {
        $("input[name=chk]")
          .prop("checked", false)
          .closest("tr")
          .removeClass("selected");
        $("input[name=chk]").closest("tr").removeClass("table-danger");
      }
    });

    $(document).on("click", "input[name=chk]", function () {
      var total = $("input[name=chk]").length;
      var checked = $("input[name=chk]:checked").length;

      if (total != checked) $("#cbx_chkAll").prop("checked", false);
      else $("#cbx_chkAll").prop("checked", true);
    });

    //체크되면 빨간색으로 바뀜
    $(document).on("change", ":checkbox", function () {
      if ($(this).prop("checked")) {
        if (!$(this).closest("tr").children().eq(0).is("th")) {
          $(this).closest("tr").addClass("table-danger");
        }
      } else {
        $(this).closest("tr").removeClass("table-danger");
      }
    });

    // tr 선택해도 체크 됨
    $(document).on("click", "table tr", function (event) {
      if (event.target.type !== "checkbox") {
        const $checkbox = $(":checkbox", this);
        const td = $(".my-td-class", this);
        if (td.is(event.target)) {
          event.stopPropagation();
        } else {
          $checkbox.trigger("click");
        }
      }
    });

    // 추가 버튼
    $(document).on("click", "#addBtn", function () {
      let lastTr = $("#bomList tr:last").children();
      let idx = lastTr.eq(1).text();
      if (lastTr.length == 0) {
        Swal.fire({
          icon: "warning",
          title: "상품을 선택해주세요",
        });
        return;
      }

      let tr = $("<tr>");

      tr.append(
        $("<td>").append(
          $("<input>").attr("type", "checkbox").attr("name", "chk")
        )
      );
      tr.append("<td>" + (parseInt(idx) + 1) + "</td>");
      tr.append(
        $("<td>").append(
          $("<button>")
            .addClass("btn btn-primary my-td-class rscCdBtn")
            .attr({
              type: "button",
              "data-bs-toggle": "modal",
              "data-bs-target": "#rscModal",
            })
            .append($("<i>").addClass("bi bi-search my-td-class rscCdBtn"))
        )
      );

      tr.append("<td>");
      tr.append($("<td>").append($("<input>").css("width", "70px")));
      tr.append($("<td>").append($("<input>").css("width", "70px")));
      tr.append(
        $("<td>").append(
          $("<button>")
            .addClass("btn btn-primary my-td-class")
            .attr({
              type: "button",
              "data-bs-toggle": "modal",
              "data-bs-target": "#prscModal",
            })
            .append($("<i>").addClass("bi bi-search my-td-class rscNmBtn"))
        )
      );

      $("#bomList").append(tr);
    });

    //자재 선택하면 input에 넣기
    $(document).ready(function () {
      var inputRscCd;
      var inputRscNm;
      $(document).on("click", ".rscCdBtn", function () {
        inputRscCd = $(this).closest("tr").children().eq(2);
        inputRscNm = $(this).closest("tr").children().eq(3);
      });

      $(document).on("click", "#choiceRsc", function () {
        let rscCd = $(this).closest("tr").children().eq(1).text();
        let rscNm = $(this).closest("tr").children().eq(2).text();
        inputRscCd.text(rscCd); // input 업데이트
        inputRscNm.text(rscNm);

        $("#rscSearch").modal("hide"); // 모달 닫기
      });
    });
  </script>
</body>
