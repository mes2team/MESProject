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
              <tbody id="edctsOustOrderBody">
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
          <div id="btnGrp">
            <sec:authorize access="hasRole('ROLE_ADMIN')">
              <button type="button" class="btn btn-danger" id="delBtn">
                삭제
              </button>
            </sec:authorize>
          </div>
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
                  <th scope="col">완제품 유통 기한</th>
                  <th scope="col">완제품 출고 수량</th>
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
                      <input
                        type="checkbox"
                        name="chk"
                        value="${eoust.edctsOustNo}"
                      />
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
                    <td>
                      <fmt:formatDate
                        value="${eoust.edctsExpire }"
                        pattern="yyyy-MM-dd"
                      />
                    </td>
                    <td>${eoust.edctsOustCnt }</td>
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
          <input type="text" id="orderNo" style="display: none" />
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
                <th scope="col">
                  <input type="checkbox" id="cbx_chkAll1" />
                </th>
                <th scope="col">완제품LOT 번호</th>
                <th scope="col">완제품 명</th>
                <th scope="col">완제품 수량</th>
                <th scope="col">출고량</th>
                <th scope="col">제조일자</th>
                <th scope="col">유통기한</th>
              </tr>
            </thead>
            <tbody id="productDetailList"></tbody>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="insertBtn">
            등록
          </button>
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
    // 등록
    $(document).on("click", "#insertBtn", function () {
      let ck = true;
      if ($('input[name="chk1"]:checked').length == 0) {
        Swal.fire({
          icon: "warning",
          title: "제품을 선택 해주세요.",
        });
        return;
      }

      let arrData = [];
      $('input[name="chk1"]:checked').each(function (idx, item) {
        let outCnt = $(item).closest("tr").children().eq(4).find("input").val();
        let edctsCd = $(item).closest("tr").children().eq(7).text();
        let edctsLotNo = $(item).closest("tr").children().eq(1).text();
        let orderNo = $("#orderNo").val();
        let inCnt = $(item).closest("tr").children().eq(3).text();
        let resultCnt = parseInt(inCnt) - parseInt(outCnt);
        let edctsExpire = $(item).closest("tr").children().eq(6).text();

        if (outCnt == "") {
          Swal.fire({
            icon: "warning",
            title: "출고량을 입력 해주세요.",
          });
          ck = false;
          return;
        }

        if (resultCnt < 0) {
          Swal.fire({
            icon: "warning",
            title: "완제품 수량이 부족합니다.",
          });
          ck = false;
          return;
        }

        let dataObj = {
          orderNo: orderNo,
          edctsCd: edctsCd,
          edctsLotNo: edctsLotNo,
          edctsOustCnt: parseInt(outCnt),
          resultCnt: resultCnt,
          edctsExpire: edctsExpire,
        };

        arrData.push(dataObj);
      });
      if (ck == false) {
        return;
      }

      Swal.fire({
        title: "등록 하시겠습니까?",
        icon: "question",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "등록",
        cancelButtonText: "취소",
      }).then((result) => {
        $.ajax({
          url: "insertUpdateedctsOust",
          method: "post",
          headers: { "Content-Type": "application/json" },
          data: JSON.stringify(arrData),
          success: function (result) {
            if (result == "success") {
              location.reload();
            }
          },
          error: function (reject) {
            console.log(reject);
          },
        });
      });
    });

    // 더블클릭하면 모달창
    function openModal(orderNo) {
      $("#orderNo").val(orderNo);
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

            let prdtObj = { edctsCd: item.edctsCd };

            prdtArr.push(prdtObj);
          });
        },
        error: function (reject) {
          console.log(reject);
        },
      }).then(function () {
        $.ajax({
          url: "edctsOustProduct",
          method: "post",
          headers: { "Content-Type": "application/json" },
          data: JSON.stringify(prdtArr),
          success: function (result) {
            console.log(result);
            $("#productDetailList").empty();
            if (result && result.length > 0) {
              $(result).each(function (idx, item) {
                let tr = $("<tr>");

                tr.append(
                  $("<td>").append(
                    $("<input>").attr("type", "checkbox").attr("name", "chk1")
                  )
                );
                tr.append("<td>" + item.edctsLotNo + "</td>");
                tr.append("<td>" + item.prdtNm + "</td>");
                tr.append("<td>" + item.edctsLotCnt + "</td>");
                tr.append(
                  $("<td>").append(
                    $("<input>")
                      .attr("type", "number")
                      .attr("min", 0)
                      .css("width", "70px")
                  )
                );
                tr.append("<td>" + dateChange(item.edctsIstDt) + "</td>");
                tr.append("<td>" + dateChange(item.edctsExpire) + "</td>");
                tr.append($("<td>").text(item.edctsCd).css("display", "none"));

                $("#productDetailList").append(tr);
              });
            } else {
              console.log("No results found.");
            }
          },
          error: function (reject) {
            console.log(reject);
          },
          complete: function () {
            $("#orderDetailModal").modal("show");
          },
        });
      });
    }

    //날짜 변환
    function dateChange(timestamp) {
      let date = new Date(timestamp);
      let year = date.getFullYear();
      let month = String(date.getMonth() + 1).padStart(2, "0");
      let day = String(date.getDate()).padStart(2, "0");
      let formattedDate = year + "-" + month + "-" + day;
      return formattedDate;
    }

    // 체크 모달꺼
    $(document).on("click", "#cbx_chkAll1", function () {
      if ($("#cbx_chkAll1").is(":checked")) {
        $("input[name=chk1]")
          .prop("checked", true)
          .closest("tr")
          .addClass("selected");
        $("input[name=chk1]").closest("tr").addClass("table-danger");
      } else {
        $("input[name=chk1]")
          .prop("checked", false)
          .closest("tr")
          .removeClass("selected");
        $("input[name=chk1]").closest("tr").removeClass("table-danger");
      }
    });

    //th 체크박스 on/off
    $(document).on("click", "input[name=chk1]", function () {
      var total = $("input[name=chk1]").length;
      var checked = $("input[name=chk1]:checked").length;

      if (total != checked) $("#cbx_chkAll1").prop("checked", false);
      else $("#cbx_chkAll1").prop("checked", true);
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

    // 체크 메인꺼
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

    // 삭제
    $(document).on("click", "#delBtn", function () {
      let dataArr = [];

      if ($('input[name="chk"]:checked').length == 0) {
        Swal.fire({
          icon: "warning",
          title: "체크해주세요",
        });
        return;
      }

      $('input[name="chk"]:checked').each(function (idx, item) {
        let edctsLotNo = $(item).closest("tr").children().eq(3).text();
        let edctsOustNo = $(item).val();
        let orderNo = $(item).closest("tr").children().eq(2).text();

        let dataObj = {
          edctsLotNo: edctsLotNo,
          edctsOustNo: edctsOustNo,
          orderNo: orderNo,
        };

        dataArr.push(dataObj);
      });

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
            url: "edctsOustDel",
            method: "post",
            headers: { "Content-Type": "application/json" },
            data: JSON.stringify(dataArr),
            success: function (result) {
              $("#edctsOustOrderBody").empty();
              $(result).each(function (idx, item) {
                let tr = $(
                  "<tr ondblclick=\"openModal('" + item.orderNo + "')\">"
                );

                tr.append("<td>" + (idx + 1) + "</td>");
                tr.append("<td>" + item.orderNo + "</td>");
                tr.append("<td>" + item.orderNm + "</td>");
                tr.append("<td>" + dateChange(item.orderDt) + "</td>");
                tr.append("<td>" + dateChange(item.paprdDt) + "</td>");
                tr.append("<td>" + item.vendNm + "</td>");

                $("#edctsOustOrderBody").append(tr);
              });

              $('input[name="chk"]:checked').each(function (idx, item) {
                let tr = $(item).closest("tr");

                tr.remove();
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
                title: "삭제가 정상적으로 되었습니다.",
              });
            },
            error: function (reject) {
              console.log(reject);
            },
          });
        }
      });
    });
  </script>
</body>
