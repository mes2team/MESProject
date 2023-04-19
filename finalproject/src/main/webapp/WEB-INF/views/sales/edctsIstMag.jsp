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
            <button type="button" class="btn btn-success" id="insertBtn">
              등록
            </button>
            <button type="button" class="btn btn-danger" id="delBtn">
              삭제
            </button>
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
                id="selectEdctsBtn"
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
            <input type="text" class="form-control" id="inputCnt" disabled />
          </div>
          <div class="col-md-4" style="display: none">
            <label class="form-label">제품 유통기한</label>
            <input type="text" class="form-control" id="inputExpire" />
          </div>
          <div class="col-md-4" style="display: none">
            <label class="form-label">지시코드</label>
            <input type="text" class="form-control" id="inputIndicaCd" />
          </div>
          <p></p>
          <hr />
          <div class="col-md-12">
            <label for="inputEmail5" class="form-label">제품 입고 날짜</label>
            <div class="d-flex align-items-center">
              <input type="date" class="form-control mr-2" id="startDate" />
              <span class="mx-2">~</span>
              <input type="date" class="form-control ml-2" id="endDate" />
            </div>
            <div id="btnGrp"></div>
          </div>
          <div class="text-center">
            <button type="button" class="btn btn-secondary" id="searchBtn">
              검색
            </button>
            <button type="button" class="btn btn-primary" id="reset">
              초기화
            </button>
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
                    <th>
                      <input type="checkbox" id="cbx_chkAll" />
                    </th>
                    <th>No.</th>
                    <th>제품 입고번호</th>
                    <th>완제품LOT번호</th>
                    <th>제품 코드</th>
                    <th>제품명</th>
                    <th>제품 입고일자</th>
                    <th>제품 유통기한</th>
                    <th>제품 입고수량</th>
                  </tr>
                </thead>
                <tbody id="edctsIstBody">
                  <c:forEach
                    items="${edctsistList }"
                    var="eist"
                    varStatus="loop"
                  >
                    <tr data-id="${eist.edctsIstNo}">
                      <td><input type="checkbox" name="chk" /></td>
                      <td>${loop.count }</td>
                      <td>${eist.edctsIstNo}</td>
                      <td>${eist.edctsLotNo}</td>
                      <td>${eist.edctsCd}</td>
                      <td>${eist.prdtNm}</td>
                      <td>
                        <fmt:formatDate
                          value="${eist.edctsIstDt}"
                          pattern="yyyy-MM-dd"
                        />
                      </td>
                      <td>
                        <fmt:formatDate
                          value="${eist.edctsExpire}"
                          pattern="yyyy-MM-dd"
                        />
                      </td>
                      <td>${eist.edctsIstCnt}</td>
                      <td style="display: none">${eist.indicaCd}</td>
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
                <th scope="col">제품 유통기한</th>
                <th scope="col" style="width: 100px"></th>
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
    $(document).on("click", "#selectEdctsBtn", function () {
      $.ajax({
        url: "completePro",
        success: function (result) {
          $("#productList").empty();
          $(result).each(function (idx, item) {
            let edctsCd = item.edctsCd;
            let prodCnt = item.prodCnt;
            let inferCnt = item.inferCnt;
            let prdtNm = item.prdtNm;
            let edctsExpire = item.edctsExpire;
            let resultCnt = parseInt(prodCnt) - parseInt(inferCnt);
            let indicaCd = item.indicaCd;

            let tr = $("<tr>");
            tr.append("<td>" + edctsCd + "</td>");
            tr.append("<td>" + prdtNm + "</td>");
            tr.append("<td>" + prodCnt + "</td>");
            tr.append("<td>" + productDate(edctsExpire) + "</td>");
            tr.append("<td style='display: none'>" + indicaCd + "</td>");
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
    });

    // 선택 버튼 클릭시 input에 전달
    $(document).on("click", ".choiceBtn", function () {
      let edctsCd = $(this).closest("tr").children().eq(0).text();
      let edctsNm = $(this).closest("tr").children().eq(1).text();
      let cnt = $(this).closest("tr").children().eq(2).text();
      let expire = $(this).closest("tr").children().eq(3).text();
      let indicaCd = $(this).closest("tr").children().eq(4).text();

      $("#inputCode").val(edctsCd);
      $("#inputName").val(edctsNm);
      $("#inputCnt").val(cnt);
      $("#inputExpire").val(expire);
      $("#inputIndicaCd").val(indicaCd);

      $("#completeModal").modal("hide");
    });

    // 초기화 버튼
    $(document).on("click", "#reset", function () {
      $("#inputCode").val("");
      $("#inputName").val("");
      $("#inputCnt").val("");
      $("#startDate").val("");
      $("#endDate").val("");
    });

    // 등록버튼
    $(document).on("click", "#insertBtn", function () {
      let inputCode = $("#inputCode").val();
      let inputName = $("#inputName").val();
      let inputCnt = $("#inputCnt").val();
      let inputExpire = $("#inputExpire").val();
      let inputIndicaCd = $("#inputIndicaCd").val();

      if (inputCode == "" || inputName == "" || inputCnt == "") {
        Swal.fire({
          icon: "warning",
          title: "입고 상품을 선택해주세요.",
        });
        return;
      }
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
            url: "insertEdctsIst",
            method: "post",
            data: {
              edctsCd: inputCode,
              edctsIstCnt: inputCnt,
              edctsExpire: inputExpire,
              indicaCd: inputIndicaCd,
            },
            success: function (result) {
              $("#edctsIstBody").empty();
              $("#inputCode").val("");
              $("#inputName").val("");
              $("#inputCnt").val("");
              $("#startDate").val("");
              $("#endDate").val("");
              $(result).each(function (idx, item) {
                let tr = $("<tr>").attr("data-id", item.edctsIstNo);
                tr.append(
                  $("<td>").append(
                    $("<input>").attr("type", "checkbox").attr("name", "chk")
                  )
                );
                tr.append("<td>" + (idx + 1) + "</td>");
                tr.append("<td>" + item.edctsIstNo + "</td>");
                tr.append("<td>" + item.edctsLotNo + "</td>");
                tr.append("<td>" + item.edctsCd + "</td>");
                tr.append("<td>" + item.prdtNm + "</td>");
                tr.append("<td>" + productDate(item.edctsIstDt) + "</td>");
                tr.append("<td>" + productDate(item.edctsExpire) + "</td>");
                tr.append("<td>" + item.edctsIstCnt + "</td>");
                tr.append(
                  "<td style='display:none'>" + item.indicaCd + "</td>"
                );

                $("#edctsIstBody").append(tr);
              });
            },
            error: function (reject) {
              console.log(reject);
            },
          });
        }
      });
    });

    //날짜 변환
    function productDate(timestamp) {
      let date = new Date(timestamp);
      let year = date.getFullYear();
      let month = String(date.getMonth() + 1).padStart(2, "0");
      let day = String(date.getDate()).padStart(2, "0");
      let formattedDate = year + "-" + month + "-" + day;
      return formattedDate;
    }

    // 조회 버튼
    $(document).on("click", "#searchBtn", function () {
      let startDate = $("#startDate").val();
      let endDate = $("#endDate").val();

      if (startDate == "" || endDate == "") {
        Swal.fire({
          icon: "warning",
          title: "날짜를 입력해주세요",
        });
        return;
      }

      $.ajax({
        url: "searchEdctsIst",
        data: { edctsIstDt: startDate, edctsIstDtEnd: endDate },
        success: function (result) {
          if (result.length == 0) {
            Swal.fire({
              icon: "warning",
              title: "검색 결과가 없습니다.",
            });
            return;
          }
          $("#edctsIstBody").empty();
          $("#inputCode").val("");
          $("#inputName").val("");
          $("#inputCnt").val("");
          $("#startDate").val("");
          $("#endDate").val("");
          $(result).each(function (idx, item) {
            let tr = $("<tr>").attr("data-id", item.edctsIstNo);
            tr.append(
              $("<td>").append(
                $("<input>").attr("type", "checkbox").attr("name", "chk")
              )
            );
            tr.append("<td>" + (idx + 1) + "</td>");
            tr.append("<td>" + item.edctsIstNo + "</td>");
            tr.append("<td>" + item.edctsLotNo + "</td>");
            tr.append("<td>" + item.edctsCd + "</td>");
            tr.append("<td>" + item.prdtNm + "</td>");
            tr.append("<td>" + productDate(item.edctsIstDt) + "</td>");
            tr.append("<td>" + productDate(item.edctsExpire) + "</td>");
            tr.append("<td>" + item.edctsIstCnt + "</td>");
            tr.append("<td style='display:none'>" + item.indicaCd + "</td>");

            $("#edctsIstBody").append(tr);
          });
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    });

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

    // 삭제
    $(document).on("click", "#delBtn", function () {
      let valueArr = [];

      $('input[name="chk"]:checked').each(function (idx, items) {
        let eistNo = $(items).closest("tr").children().eq(2).text();
        let inputIndicaCd = $(items).closest("tr").children().eq(9).text();
        console.log(inputIndicaCd);
        let dataObj = {
          edctsIstNo: eistNo,
          indicaCd: inputIndicaCd,
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
              url: "deleteEdctsIst",
              method: "post",
              headers: { "Content-Type": "application/json" },
              data: JSON.stringify(valueArr),
              success: function (result) {
                if (result == "success") {
                  for (let i = 0; i < valueArr.length; i++) {
                    $('tr[data-id="' + valueArr[i].edctsIstNo + '"]').remove();
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

    // 엔터키를 눌렀을 때 검색 버튼 클릭 이벤트 실행
    $("#startDate, #endDate").on("keypress", function (event) {
      if (event.which === 13) {
        event.preventDefault();
        $("#searchBtn").click();
      }
    });
  </script>
</body>
