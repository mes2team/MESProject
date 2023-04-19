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
        <form class="row g-3">
          <div id="btnGrp" class="card-top d-flex justify-content-end">
            <sec:authorize access="hasRole('ROLE_ADMIN')">
              <button type="button" class="btn btn-primary" id="insertBtn">
                등록
              </button>
            </sec:authorize>
          </div>
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
          <div class="col-md-6">
            <label class="form-label">규격</label>
            <input type="text" class="form-control" id="inputSpec" disabled />
          </div>
          <div class="col-md-6">
            <label class="form-label">단위</label>
            <input type="text" class="form-control" id="inputUnit" disabled />
          </div>
          <input
            type="text"
            class="form-control"
            id="inputBomCd"
            style="display: none"
          />
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
            <sec:authorize access="hasRole('ROLE_ADMIN')">
              <button type="button" class="btn btn-primary" id="saveBtn">
                저장
              </button>
              <button type="button" class="btn btn-primary" id="addBtn">
                추가
              </button>
              <button type="button" class="btn btn-danger" id="delBtn">
                삭제
              </button>
            </sec:authorize>
          </div>
          <div class="card-body">
            <h6>수정 할려면 더블클릭 하세요</h6>
            <div
              class="table-responsive"
              style="width: 100%; height: 300px; overflow: auto"
            >
              <table
                class="table table-striped table-bordered first table-hover"
              >
                <thead>
                  <tr>
                    <th scope="col">
                      <input type="checkbox" id="cbx_chkAll" />
                    </th>
                    <th scope="col">No.</th>
                    <th scope="col">자재코드</th>
                    <th scope="col">자재이름</th>
                    <th scope="col">사용량</th>
                    <th scope="col">단위</th>
                    <th scope="col">사용공정명</th>
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
            <tbody id="rscTbody">
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
    id="prcsModal"
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
                <th scope="col">공정 순서</th>
                <th scope="col">공정 코드</th>
                <th scope="col">공정 이름</th>
                <th scope="col">공정 분류</th>
                <th scope="col">공정 내용</th>
                <th scope="col">공정 날짜</th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody id="prcsFlowList"></tbody>
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
  <!-- bom 헤더 등록 -->
  <div
    class="modal fade"
    id="bomHeaderModal"
    tabindex="-1"
    data-bs-backdrop="static"
  >
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Bom 등록</h5>
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
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody id="bomHeaderPrdList"></tbody>
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

      $("#inputCode").val(edctsCd);
      $("#inputName").val(edctsName);
      $("#inputSpec").val(edctsSpec);
      $("#inputUnit").val(edctsUnit);
      $("#productSearch").modal("hide");

      $.ajax({
        url: "bomList",
        data: { edctsCd: edctsCd, standard: edctsSpec },
        success: function (result) {
          $("#bomList").empty();
          if (result.length == 0) {
            $("#inputBomCd").val("");
            if ($("#inputBomCd").val() == "") {
              $.ajax({
                url: "selectBomCd",
                data: { edctsCd: edctsCd, standard: edctsSpec },
                success: function (result) {
                  bomCd = $("#inputBomCd").val(result);
                },
                error: function (reject) {
                  console.log(reject);
                },
              });
            }
            return;
          }
          $("#inputBomCd").val(result[0].bomCd);
          $.each(result, function (idx, item) {
            makeTr(idx, item);
          });
        },
        error: function (reject) {
          console.log(reject);
        },
      }).then(function (result) {
        // 공정 흐름 조회 prcsFlowList
        $.ajax({
          url: "bomPrcsFlow",
          data: { edctsCd: $("#inputCode").val() },
          success: function (result) {
            $("#prcsFlowList").empty();
            $(result).each(function (idx, item) {
              let tr = $("<tr>");
              tr.append(
                $("<td>").attr("class", "changeValue").text(item.prcsNo)
              );
              tr.append("<td>" + item.prcsCd + "</td>");
              tr.append("<td>" + item.prcsNm + "</td>");
              tr.append("<td>" + item.prcsFg + "</td>");
              tr.append("<td>" + item.prcsCtnt + "</td>");
              tr.append("<td>" + item.prcsDt + "</td>");
              tr.append(
                $("<td>").append(
                  $("<button>")
                    .attr("id", "choicePrcs")
                    .attr("class", "btn btn-primary")
                    .text("선택")
                )
              );

              $("#prcsFlowList").append(tr);
            });
          },
          error: function (reject) {
            console.log(reject);
          },
        });
      });
    });

    function makeTr(idx, data) {
      let tr = $("<tr>")
        .attr("data-id", data.rscCd)
        .attr("class", "changeValue");

      tr.append(
        $("<td>").append(
          $("<input>")
            .attr("type", "checkbox")
            .attr("name", "chk")
            .attr("value", data.bomCd)
        )
      );
      tr.append("<td>" + (idx + 1) + "</td>");
      tr.append("<td>" + data.rscCd + "</td>");
      tr.append("<td>" + data.rscNm + "</td>");
      tr.append("<td class='changeValue my-td-class'>" + data.useCnt + "</td>");
      tr.append("<td my-td-class'>" + data.unit + "</td>");
      tr.append(
        $("<td>" + data.prcsNm + "</td>")
          .attr("data-prcsCd", data.prcsCd)
          .attr("class", "changeValue1")
      );

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
      if ($("#bomList").children().length == 0 && $("#inputCode").val() == "") {
        Swal.fire({
          icon: "warning",
          title: "상품 조회 해주세요.",
        });
        return;
      }

      let lastTr = $("#bomList tr:last").children();
      let idx = lastTr.eq(1).text();
      let bomCd = $("#inputBomCd").val();
      let edctsCd = $("#inputCode").val();
      let standard = $("#inputSpec").val();

      if ($("#bomList").children().length == 0 && $("#inputCode").val() != "") {
        let tr = $("<tr data-id>").attr("class", "table-danger");

        tr.append(
          $("<td>").append(
            $("<input>")
              .attr("type", "checkbox")
              .attr("name", "chk")
              .attr("value", bomCd)
              .prop("checked", true)
          )
        );
        tr.append("<td>" + 1 + "</td>");
        tr.append(
          $("<td>").append(
            $("<button>")
              .addClass("btn btn-primary my-td-class rscBtn")
              .attr({
                type: "button",
                "data-bs-toggle": "modal",
                "data-bs-target": "#rscModal",
              })
              .append($("<i>").addClass("bi bi-search my-td-class rscBtn"))
          )
        );

        tr.append("<td>");
        tr.append(
          $("<td class='my-td-class'>").append(
            $("<input class='my-td-class'>")
              .attr("type", "number")
              .css("width", "70px")
          )
        );
        tr.append("<td>");
        tr.append(
          $("<td data-prcscd>").append(
            $("<button>")
              .addClass("btn btn-primary my-td-class prcsBtn")
              .attr({
                type: "button",
                "data-bs-toggle": "modal",
                "data-bs-target": "#prcsModal",
              })
              .append($("<i>").addClass("bi bi-search my-td-class prcsBtn"))
          )
        );

        $("#bomList").append(tr);

        return;
      }
      console.log(bomCd);

      if (lastTr.length == 0) {
        Swal.fire({
          icon: "warning",
          title: "상품을 선택해주세요",
        });
        return;
      }

      let tr = $("<tr data-id>").attr("class", "table-danger");

      tr.append(
        $("<td>").append(
          $("<input>")
            .attr("type", "checkbox")
            .attr("name", "chk")
            .attr("value", bomCd)
            .prop("checked", true)
        )
      );
      tr.append("<td>" + (parseInt(idx) + 1) + "</td>");
      tr.append(
        $("<td>").append(
          $("<button>")
            .addClass("btn btn-primary my-td-class rscBtn")
            .attr({
              type: "button",
              "data-bs-toggle": "modal",
              "data-bs-target": "#rscModal",
            })
            .append($("<i>").addClass("bi bi-search my-td-class rscBtn"))
        )
      );

      tr.append("<td>");
      tr.append(
        $("<td class='my-td-class'>").append(
          $("<input class='my-td-class'>")
            .attr("type", "number")
            .css("width", "70px")
        )
      );
      tr.append("<td>");
      tr.append(
        $("<td data-prcscd>").append(
          $("<button>")
            .addClass("btn btn-primary my-td-class prcsBtn")
            .attr({
              type: "button",
              "data-bs-toggle": "modal",
              "data-bs-target": "#prcsModal",
            })
            .append($("<i>").addClass("bi bi-search my-td-class prcsBtn"))
        )
      );

      $("#bomList").append(tr);
    });

    //자재 선택하면 input에 넣기
    $(document).ready(function () {
      let inputRscCd;
      let inputRscNm;
      let inputRscSpec;
      $(document).on("click", ".rscBtn", function () {
        inputRscCd = $(this).closest("tr").children().eq(2);
        inputRscNm = $(this).closest("tr").children().eq(3);
        inputRscSpec = $(this).closest("tr").children().eq(5);
      });

      $(document).on("click", "#choiceRsc", function () {
        let isValid = true;
        let rscCd = $(this).closest("tr").children().eq(1).text();
        let rscNm = $(this).closest("tr").children().eq(2).text();
        let rscSpec = $(this).closest("tr").children().eq(3).text();

        $("#bomList")
          .children()
          .each(function (idx, item) {
            let check = $(item).children().eq(2).text();
            if (check == rscCd) {
              Swal.fire({
                icon: "warning",
                title: "같은 자재가 있습니다.",
              });
              isValid = false;
              return;
            }
          });

        if (isValid == false) {
          $("#rscModal").modal("hide");
          return isValid;
        }
        inputRscCd.text(rscCd);
        inputRscNm.text(rscNm);
        inputRscSpec.text(rscSpec);
        inputRscCd.closest("tr").attr("data-id", rscCd); // tr에 rscCd넣기

        $("#rscModal").modal("hide"); // 모달 닫기
      });
    });

    // 공정 선택하면 input에 넣기
    $(document).ready(function () {
      let inputPrcsNm;
      let inputprcsCd;
      $(document).on("click", ".prcsBtn", function () {
        inputPrcsNm = $(this).closest("tr").children().eq(6);
        inputprcsCd = inputPrcsNm.attr("data-prcscd");
        console.log(inputprcsCd);
      });

      $(document).on("click", "#choicePrcs", function () {
        let prcsNm = $(this).closest("tr").children().eq(2).text();
        let prcsCd = $(this).closest("tr").children().eq(1).text();
        inputPrcsNm.text(prcsNm); // input 업데이트
        inputPrcsNm.attr("data-prcscd", prcsCd);
        $("#prcsModal").modal("hide"); // 모달 닫기
      });
    });

    //삭제
    $(document).on("click", "#delBtn", function () {
      let valueArr = [];

      $('input[name="chk"]:checked').each(function (idx, items) {
        let rscCd = $(items).closest("tr").children().eq(2).text();
        let dataObj = {
          bomCd: items.value,
          rscCd: rscCd,
        };

        // 데이터 배열에 객체 추가
        valueArr.push(dataObj);
      });
      if (valueArr.length == 0) {
        Swal.fire({
          icon: "warning",
          title: "선택된 글이 없습니다.",
        });
      } else {
        Swal.fire({
          title: "삭제 하시겠습니까?",
          text: "복구 할 수 없습니다.",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "#d33",
          cancelButtonColor: "#3085d6",
          confirmButtonText: "삭제",
          cancelButtonText: "취소",
        }).then((result) => {
          if (result.value) {
            $.ajax({
              url: "deleteBom",
              method: "post",
              headers: { "Content-Type": "application/json" },
              data: JSON.stringify(valueArr),
              success: function (result) {
                if (result == "success") {
                  for (let i = 0; i < valueArr.length; i++) {
                    $('tr[data-id="' + valueArr[i].rscCd + '"]').remove();
                  }
                } else if (result == "error") {
                  Swal.fire({
                    icon: "error",
                    title: "오류가 발생했습니다.",
                  });
                }
                let Toast = Swal.mixin({
                  toast: true,
                  position: "top",
                  showConfirmButton: false,
                  timer: 1500,
                  timerProgressBar: true,
                  didOpen: (toast) => {
                    toast.addEventListener("mouseenter", Swal.stopTimer);
                    toast.addEventListener("mouseleave", Swal.resumeTimer);
                  },
                });
                Toast.fire({
                  icon: "success",
                  title: "삭제가 정상적으로 되었습니다.",
                });
              },
              error: function (reject) {
                console.log(reject);
              },
            });
          }
        });
      }
    });

    // 더블클릭하면 input나옴
    $(document).on("dblclick", "tr", function () {
      let currentRow = $(this);
      currentRow.attr("class", "table-danger");
      currentRow.children().eq(0).find("input").prop("checked", true);
      currentRow.find(".changeValue").each(function () {
        let currentValue = $(this).text().trim();
        let input = $("<input>")
          .attr("type", "number")
          .attr("class", "my-td-class")
          .css("width", "70px")
          .val(currentValue);
        $(this).empty().append(input);
      });

      // currentRow.find(".changeValue1").each(function () {
      //   let currentValue = $(this).text().trim();
      //   let td = $("<td>").attr("data-value", currentValue);
      //   td.append(
      //     $("<span>").text(currentValue),
      //     $("<button>")
      //       .addClass("btn btn-primary my-td-class prcsBtn")
      //       .attr({
      //         type: "button",
      //         "data-bs-toggle": "modal",
      //         "data-bs-target": "#prcsModal",
      //       })
      //       .append($("<i>").addClass("bi bi-search my-td-class prcsBtn"))
      //   );
      //   $(this).replaceWith(td);
      // });
    });

    // 저장
    $(document).on("click", "#saveBtn", function () {
      if ($("#bomList").children().length == 0 && $("#inputCode").val() == "") {
        Swal.fire({
          icon: "warning",
          title: "상품 조회 해주세요.",
        });
        return;
      }

      if ($("#bomList").children().length == 0 && $("#inputCode").val() != "") {
        Swal.fire({
          icon: "warning",
          title: "디테일 빈 값.",
        });
        return;
      }

      let isValid = true;
      if ($("#bomList input:not(:checkbox)").length == 0) {
        Swal.fire({
          icon: "warning",
          title: "바꾼 글이 없습니다.",
        });
        return;
      }
      let valueArr = [];

      $('input[name="chk"]:checked').each(function (idx, items) {
        let bomCd = $("#inputBomCd").val();
        let rscCd = $(items).closest("tr").children().eq(2).text();
        let useCnt = $(items)
          .closest("tr")
          .children()
          .eq(4)
          .find("input")
          .val();
        let unit = $(items).closest("tr").children().eq(5).text();
        let prcsCd = $(items)
          .closest("tr")
          .children()
          .eq(6)
          .attr("data-prcscd");

        console.log(rscCd);
        if (rscCd == "") {
          Swal.fire({
            icon: "warning",
            title: "자재코드가 입력되지 않았습니다.",
          });
          isValid = false;
          return;
        }
        if (useCnt == "") {
          Swal.fire({
            icon: "warning",
            title: "사용량이 입력되지 않았습니다.",
          });
          isValid = false;
          return;
        }
        if (unit == "") {
          Swal.fire({
            icon: "warning",
            title: "단위가 입력되지 않았습니다.",
          });
          isValid = false;
          return;
        }
        if (prcsCd == "") {
          Swal.fire({
            icon: "warning",
            title: "사용공정명이 입력되지 않았습니다.",
          });
          isValid = false;
          return;
        }

        let dataObj = {
          bomCd: bomCd,
          rscCd: rscCd,
          useCnt: parseInt(useCnt),
          unit: unit,
          prcsCd: prcsCd,
        };

        // 데이터 배열에 객체 추가
        valueArr.push(dataObj);
      });

      if (isValid == false) {
        return isValid;
      }

      console.log(valueArr);
      if (valueArr.length == 0) {
        Swal.fire({
          icon: "warning",
          title: "선택된 글이 없습니다.",
        });
      } else {
        Swal.fire({
          title: "저장 하시겠습니까?",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "저장",
          cancelButtonText: "취소",
        }).then((result) => {
          if (result.value) {
            $.ajax({
              url: "saveBom",
              method: "post",
              headers: { "Content-Type": "application/json" },
              data: JSON.stringify(valueArr),
              success: function (result) {
                if (result == "success") {
                  $('input[name="chk"]:checked').each(function (idx, items) {
                    let tdList = $(items).closest("tr").children();
                    $(items).prop("checked", false);
                    $(items).closest("tr").attr("class", "");
                    console.log(tdList);
                    let useCnt = tdList.eq(4).find("input").val();
                    let unit = tdList.eq(5).text();

                    tdList.eq(4).text(useCnt);
                    tdList.eq(5).text(unit);
                  });
                  let Toast = Swal.mixin({
                    toast: true,
                    position: "top",
                    showConfirmButton: false,
                    timer: 1500,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                      toast.addEventListener("mouseenter", Swal.stopTimer);
                      toast.addEventListener("mouseleave", Swal.resumeTimer);
                    },
                  });
                  Toast.fire({
                    icon: "success",
                    title: "저장이 정상적으로 되었습니다.",
                  });
                }
              },

              error: function (reject) {
                console.log(reject);
              },
            });
          }
        });
      }
    });

    // 자재 검색
    $(document).on("click", "#searchRscBtn", function () {
      console.log("클릭");
      let searchRscNm = $("#searchRscInput").val();

      $.ajax({
        url: "searchBom",
        method: "post",
        data: { RscNm: searchRscNm },
        success: function (result) {
          if (result.length > 0) {
            $("#rscTbody").empty();
            for (let i = 0; i < result.length; i++) {
              let item = result[i];
              let tr = $("<tr>");

              tr.append("<td>" + item.rscTyp + "</td>");
              tr.append("<td>" + item.rscCd + "</td>");
              tr.append("<td>" + item.rscNm + "</td>");
              tr.append("<td>" + item.rscSpec + "</td>");
              tr.append("<td>" + item.mngUnit + "</td>");
              tr.append("<td>" + item.vendNm + "</td>");
              tr.append(
                $("<td>").append(
                  $('<button class="btn btn-primary" id="choiceRsc">').text(
                    "선택"
                  )
                )
              );
              $("#rscTbody").append(tr);
            }
          } else {
            Swal.fire({
              icon: "warning",
              title: "검색 결과가 없습니다.",
            });
          }
          console.log(result);
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    });

    // 엔터키를 눌렀을 때 검색 버튼 클릭 이벤트 실행
    $(document).ready(function () {
      $("#searchRscInput").on("keypress", function (event) {
        if (event.which === 13) {
          event.preventDefault();
          $("#searchRscBtn").click();
        }
      });
    });

    // bom 헤더 등록
    $(document).on("click", "#insertBtn", function () {
      $("#bomHeaderModal").modal("show");

      $.ajax({
        url: "bomHeaderPrd",
        success: function (result) {
          console.log(result);
          $("bomHeaderPrdList").empty();
          $(result).each(function (idx, item) {
            let tr = $("<tr>");

            tr.append("<td>" + item.edctsCd + "</td>");
            tr.append("<td>" + item.prdtNm + "</td>");
            tr.append("<td>" + item.spec + "</td>");
            tr.append("<td>" + item.unit + "</td>");
            tr.append(
              $("<td>").append(
                $("<button>")
                  .attr("type", "button")
                  .attr("class", "btn btn-primary bomInsertBtn")
                  .text("선택")
              )
            );
            $("#bomHeaderPrdList").append(tr);
          });
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    });

    // bom 헤더 등록
    $(document).on("click", ".bomInsertBtn", function () {
      let edctsCd = $(this).closest("tr").children().eq(0).text();
      let spec = $(this).closest("tr").children().eq(2).text();

      console.log(edctsCd);
      console.log(spec);

      Swal.fire({
        title: "등록하시겠습니까?",
        icon: "question",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "등록",
        cancelButtonText: "취소",
      }).then((result) => {
        if (result.value) {
          $.ajax({
            url: "bomHeaderInsert",
            method: "post",
            data: { edctsCd: edctsCd, standard: spec },
            success: function (result) {
              location.reload();
            },
            error: function (reject) {},
          });
        }
      });
    });
  </script>
</body>
