<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    padding: 20px 20px 15px 0;
    text-align: right;
  }
  form {
    clear: both;
  }
</style>
<body>
  <div>
    <div class="row">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
          <h2 class="pageheader-title">주문서 관리</h2>
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">주문서 관리</h5>
        <form class="row g-3" id="check">
          <div class="col-md-4">
            <label for="inputEmail5" class="form-label">주문서 명</label>
            <input type="text" class="form-control" id="orderNm" />
          </div>
          <div class="col-md-4">
            <label for="inputEmail5" class="form-label">진행도</label>
            <input type="text" class="form-control" id="progAppe" />
          </div>
          <div class="col-md-4">
            <label for="inputEmail5" class="form-label">주문 날짜</label>
            <div class="d-flex align-items-center">
              <input type="date" class="form-control mr-2" id="startDate" />
              <span class="mx-2">~</span>
              <input type="date" class="form-control ml-2" id="endDate" />
            </div>
          </div>
          <div class="text-center">
            <button type="button" class="btn btn-primary" id="searchOrder">
              조회
            </button>
            <button type="reset" class="btn btn-secondary" id="resetBtn">
              초기화
            </button>
          </div>
        </form>
      </div>
    </div>

    <div class="row">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card">
          <br />
          <div id="btnGrp">
            <sec:authorize access="hasRole('ROLE_ADMIN')">
              <button
                id="orderSheetBtn"
                type="button"
                class="btn btn-success"
                data-bs-toggle="modal"
                data-bs-target="#orderSheet"
              >
                주문서
              </button>
              <button id="deleteBtn" type="button" class="btn btn-danger">
                삭제
              </button>
            </sec:authorize>
          </div>
          <div class="card-body">
            <div
              class="table-responsive"
              style="width: 100%; height: 300px; overflow: auto"
            >
              <table
                class="table table-striped table-bordered first table table-hover"
              >
                <thead>
                  <tr>
                    <th></th>
                    <th>주문 번호</th>
                    <th>거래처 이름</th>
                    <th>주문 이름</th>
                    <th>주문 날짜</th>
                    <th>납기일</th>
                    <th>진행도</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody id="orderListBody">
                  <c:forEach items="${orderList }" var="order">
                    <tr data-id="${order.orderNo }">
                      <td>
                        <c:choose>
                          <c:when test="${order.progAppe eq '주문취소'}">
                            <input
                              type="checkbox"
                              name="chk"
                              value="${order.orderNo }"
                            />
                          </c:when>
                          <c:otherwise>
                            <input
                              type="checkbox"
                              name="chk"
                              value="${order.orderNo }"
                              disabled
                            />
                          </c:otherwise>
                        </c:choose>
                      </td>
                      <td>${order.orderNo }</td>
                      <td>${order.vendNm }</td>
                      <td>${order.orderNm }</td>
                      <td>
                        <fmt:formatDate
                          value="${order.orderDt }"
                          pattern="yyyy-MM-dd"
                        />
                      </td>
                      <td>
                        <fmt:formatDate
                          value="${order.paprdDt }"
                          pattern="yyyy-MM-dd"
                        />
                      </td>
                      <td>
                        <c:choose>
                          <c:when test="${order.progAppe eq '주문취소'}">
                            <select name="progAppe" class="progAppe" disabled>
                              <option value="주문취소">주문취소</option>
                            </select>
                          </c:when>
                          <c:when test="${order.progAppe eq '출고완료'}">
                            <select name="progAppe" class="progAppe" disabled>
                              <option value="${order.progAppe }">
                                ${order.progAppe }
                              </option>
                            </select>
                          </c:when>
                          <c:otherwise>
                            <select name="progAppe" class="progAppe">
                              <option value="${order.progAppe }">
                                ${order.progAppe }
                              </option>
                              <option value="주문취소">주문취소</option>
                            </select>
                          </c:otherwise>
                        </c:choose>
                      </td>
                      <td class="my-td-class">
                        <button
                          class="btn btn-primary btn-circle detailBtn my-td-class"
                          data-bs-toggle="modal"
                          data-bs-target="#orderDetail"
                        >
                          <i class="bi bi-search my-td-class"></i>
                        </button>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 주문서 작성 -->
  <div
    class="modal fade"
    id="createOrder"
    tabindex="-1"
    data-bs-backdrop="static"
  >
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">주문서 작성</h5>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <div class="modal-body">
          <form
            id="planForm"
            name="newPlan"
            action="newPlanInsert"
            method="POST"
            onsubmit="return false"
            class="row g-3"
          >
            <div style="display: none">
              <h5 class="modal-title">거래처 정보</h5>
              <div class="col-md-6">
                <label class="form-label">거래처 코드</label>
                <input
                  type="text"
                  class="form-control"
                  id="vendCd"
                  name="vendCd"
                  value="PLN9000"
                  readonly
                />
              </div>
              <div class="col-md-6">
                <label class="form-label">거래처 명</label>
                <input
                  type="text"
                  class="form-control"
                  name="vendNm"
                  id="vendNm"
                  value=""
                  readonly
                />
              </div>
              <div class="col-md-12">
                <label class="form-label">거래처 담당자</label>
                <input
                  type="text"
                  class="form-control"
                  id="vendMag"
                  name="vendMag"
                  value=""
                  readonly
                />
                <input type="hidden" class="form-control" value="" readonly />
              </div>
              <div class="col-md-6">
                <label class="form-label">사업자 등록번호</label>
                <input
                  type="text"
                  class="form-control"
                  id="brNum"
                  name="brNum"
                  value=""
                  readonly
                />
              </div>
              <div class="col-md-6">
                <label class="form-label">전화번호</label>
                <input
                  type="text"
                  class="form-control"
                  id="vendTel"
                  name="vendTel"
                  value=""
                  readonly
                />
              </div>
              <div class="col-md-12">
                <label class="form-label">비고</label>
                <textarea
                  name="remk"
                  id="remk"
                  rows="5"
                  class="form-control"
                  style="resize: none"
                  readonly
                ></textarea>
              </div>
            </div>
            <hr />
            <h5 class="modal-title">주문서 정보</h5>
            <input
              type="hidden"
              class="form-control"
              name="nowSt"
              value="미진행"
              readonly
            />
            <div style="display: none" class="col-md-6">
              <label class="form-label">주문 번호</label>
              <input
                type="text"
                class="form-control"
                name="orderNo"
                id="orderNo"
                readonly
              />
            </div>
            <div class="col-md-6">
              <label class="form-label">주문 이름</label>
              <input
                type="text"
                name="orderNm"
                id="orderNm"
                class="form-control"
              />
            </div>
            <div class="col-md-6">
              <label class="form-label">거래처 명</label>
              <input
                type="text"
                class="form-control"
                name="vendNm1"
                id="vendNm1"
                value=""
                readonly
              />
            </div>
            <div class="col-md-6">
              <label class="form-label">거래처 주소</label>
              <input type="text" class="form-control" id="vendAddr1" readonly />
            </div>
            <div class="col-md-6">
              <label class="form-label">거래처 담당자</label>
              <input
                type="text"
                class="form-control"
                id="vendMag1"
                name="vendMag1"
                value=""
                readonly
              />
            </div>
            <div class="col-md-6">
              <label class="form-label">접수일자</label>
              <input
                type="date"
                class="form-control"
                name="orderDt"
                id="currentDate"
                readonly
              />
            </div>
            <div class="col-md-6">
              <label class="form-label">납기일자</label>
              <input
                type="date"
                name="paprdDt"
                id="paprdDt"
                class="form-control"
              />
            </div>
            <hr />
            <h5 class="modal-title">상품 정보</h5>
            <table class="table table-hover">
              <thead>
                <tr>
                  <th scope="col">
                    <input type="checkbox" id="cbx_chkAll2" />
                  </th>
                  <th scope="col">상품 코드</th>
                  <th scope="col">상품이름</th>
                  <th scope="col">수량</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${orderPrdList }" var="orderPrd">
                  <tr>
                    <td>
                      <input type="checkbox" name="chk2" />
                    </td>
                    <td>${orderPrd.edctsCd }</td>
                    <td>${orderPrd.prdtNm }</td>
                    <td class="my-td-class">
                      <input type="number" class="my-td-class" value="0" />
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </form>
          <hr />
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
          <button type="button" class="btn btn-primary" onclick="orderSubmit()">
            등록
          </button>
        </div>
      </div>
    </div>
  </div>
  <!-- End Modal Dialog Scrollable-->
  <!-- 모달창 -->
  <!-- 거래처 조회 -->
  <div
    class="modal fade"
    id="orderSheet"
    tabindex="-1"
    data-bs-backdrop="static"
  >
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">거래처 조회</h5>
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
                <th scope="col">거래처 코드</th>
                <th scope="col">거래처 이름</th>
                <th scope="col">사업자 번호</th>
                <th scope="col">거래처 담당자</th>
                <th scope="col">전화번호</th>
                <th scope="col">거래처 주소</th>
              </tr>
            </thead>
            <tbody id="ordSheetTable"></tbody>
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
  <!-- 주문서디테일 조회 -->
  <div
    class="modal fade"
    id="orderDetail"
    tabindex="-1"
    data-bs-backdrop="static"
  >
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">주문서 디테일</h5>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <div class="modal-body">
          <form class="row g-3">
            <h5 class="modal-title">주문서</h5>
            <div class="col-md-4">
              <label class="form-label">주문 번호</label>
              <input
                type="text"
                class="form-control"
                id="orderNoDetail"
                disabled
              />
            </div>
            <div class="col-md-4">
              <label class="form-label">주문 이름</label>
              <input
                type="text"
                class="form-control"
                id="orderNmDetail"
                disabled
              />
            </div>
            <div class="col-md-4">
              <label class="form-label">납기일</label>
              <input
                type="date"
                class="form-control"
                id="orderPaprdDtDetail"
                disabled
              />
            </div>
            <div class="col-md-4">
              <label class="form-label">거래처 명</label>
              <input
                type="text"
                class="form-control"
                id="vendNmDetail"
                disabled
              />
            </div>
            <div class="col-md-4">
              <label class="form-label">거래처 담당자</label>
              <input
                type="text"
                class="form-control"
                id="vendMagDetail"
                disabled
              />
            </div>
            <div class="col-md-4">
              <label class="form-label">거래처 주소</label>
              <input
                type="text"
                class="form-control"
                id="vendAddrDetail"
                disabled
              />
            </div>
            <hr />
            <h5>상품</h5>
            <table class="table table-hover">
              <thead>
                <tr>
                  <th scope="col">상품코드</th>
                  <th scope="col">상품이름</th>
                  <th scope="col">수량</th>
                  <th></th>
                </tr>
              </thead>
              <tbody id="orderDetailList"></tbody>
            </table>
            <div style="display: none" id="orderDetailUpdate">
              <hr />
              <h5>상품 추가</h5>
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">상품코드</th>
                    <th scope="col">상품이름</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${orderPrdList }" var="orderPrd">
                    <tr>
                      <td>${orderPrd.edctsCd }</td>
                      <td>${orderPrd.prdtNm }</td>
                      <td style="width: 100px">
                        <button type="button" class="btn btn-info orderAddBtn">
                          추가
                        </button>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-warning" id="updateOrder">
            수정
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
</body>

<script>
  //닫기 초기화
  $(document).on(
    "click",
    "#orderDetail button[data-bs-dismiss='modal']",
    function () {
      $("#orderDetailUpdate").hide();
      $("#updateOrderSubmit").text("수정").attr("id", "updateOrder");
      $("#orderNmDetail").prop("disabled", true);
      $("#orderPaprdDtDetail").prop("disabled", true);
    }
  );

  $(document).on(
    "click",
    "#createOrder button[data-bs-dismiss='modal']",
    function () {
      $("#paprdDt").val("");
      $("input[name='orderNm']").val("");
      $("#cbx_chkAll2").prop("checked", false);
      $(".my-td-class").val(0);
      $("input[name='chk2']").each(function (idx, item) {
        $(item).prop("checked", false);
        $(item).closest("tr").removeClass();
      });
    }
  );

  // 주문서 디테일 삭제
  $(document).on("click", ".detailDelBtn", function () {
    let orderNo = $("#orderNoDetail").val();
    let edctsCd = $(this).closest("tr").children().eq(0).text();
    let this1 = $(this);

    $.ajax({
      url: "deleteOrderDetail",
      method: "post",
      data: { orderNo: orderNo, edctsCd: edctsCd },
      success: function (result) {
        if (result == "success") {
          this1.closest("tr").remove();
        }
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  });

  //수정완료 클릭시 수정
  $(document).on("click", "#updateOrderSubmit", function () {
    let orderNm = $("#orderNmDetail").val();
    let paprdDt = $("#orderPaprdDtDetail").val();
    let orderNo = $("#orderNoDetail").val();

    let arrDataInsert = [];
    let arrDataUpdate = [];

    $("#orderDetailList tr").each(function (idx, item) {
      let edctsCd = $(item).find("td:eq(0)").text();
      let prdtNm = $(item).find("td:eq(1)").text();
      let orderCnt = $(item).find("td:eq(2) input").val();
      let check = $(item).find("td:eq(3) input").val();

      if (check == "add") {
        let dataObjectInsert = {
          edctsCd: edctsCd,
          prdtNm: prdtNm,
          orderCnt: orderCnt,
          orderNo: orderNo,
        };

        arrDataInsert.push(dataObjectInsert);
      } else {
        let dataObjectUpdate = {
          edctsCd: edctsCd,
          prdtNm: prdtNm,
          orderCnt: orderCnt,
          orderNo: orderNo,
        };

        arrDataUpdate.push(dataObjectUpdate);
      }
    });

    if (orderNm == "") {
      $("#orderNmDetail").focus();
      Swal.fire({
        icon: "warning",
        title: "주문이름이 입력되지 않았습니다.",
      });
      return;
    }
    if (paprdDt == "") {
      $("#orderPaprdDtDetail").focus();
      Swal.fire({
        icon: "warning",
        title: "납기일이 입력되지 않았습니다.",
      });
      return;
    }

    let invalidInputs = [];

    $("#orderDetailList")
      .children()
      .each(function (idx, item) {
        let cnt = $(item).children().eq(2).find("input").val();

        if (parseInt(cnt) <= 0) {
          invalidInputs.push($(this).closest("tr"));
        }
      });

    if (invalidInputs.length > 0) {
      Swal.fire({
        icon: "warning",
        title: "1이상 입력해주세요",
      });
      return;
    }

    Swal.fire({
      title: "수정 하시겠습니까?",
      icon: "question",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "수정",
      cancelButtonText: "닫기",
    }).then((result) => {
      if (result.value) {
        $.ajax({
          url: "updateOrder",
          method: "post",
          data: { orderNo: orderNo, orderNm: orderNm, paprdDt: paprdDt },
          success: function (result) {},
          error: function (reject) {
            console.log(reject);
          },
        })
          .then(function (result) {
            if (result == "success") {
              if (arrDataUpdate.length > 0) {
                return $.ajax({
                  url: "updateOrderDetail",
                  method: "post",
                  headers: { "Content-Type": "application/json" },
                  data: JSON.stringify(arrDataUpdate),
                  success: function (result) {},
                  error: function (reject) {
                    console.log(reject);
                  },
                });
              }
            }
          })
          .then(function (result) {
            if (result == "success") {
              if (arrDataInsert.length > 0) {
                return $.ajax({
                  url: "orderInsertDetail",
                  method: "post",
                  headers: { "Content-Type": "application/json" },
                  data: JSON.stringify(arrDataInsert),
                  success: function (result) {
                    if (result == "success2") {
                      location.reload();
                    }
                  },
                  error: function (reject) {
                    console.log(reject);
                  },
                });
              } else {
                location.reload();
              }
            }
          });
      }
    });
  });

  // 주문디테일 수정 버튼
  $(document).on("click", "#updateOrder", function () {
    $("#orderDetailUpdate").show();
    $("#updateOrder").text("수정완료").attr("id", "updateOrderSubmit");
    $("#orderNmDetail").prop("disabled", false);
    $("#orderPaprdDtDetail").prop("disabled", false);
    $(".detailDelTd").each(function (idx, item) {
      $(item).find("button").prop("disabled", false);
    });

    let orderCnt = $(".orderCntDetail");

    orderCnt.each(function (idx, item) {
      let td = $(this);
      let text = item.innerText;

      td.html('<input type="number">')
        .find("input")
        .prop("value", text)
        .css("width", "150px");
    });
  });

  // 주문디테일 추가버튼
  $(document).on("click", ".orderAddBtn", function () {
    let addEdctsCd = $(this).closest("tr").children().eq(0).text();
    let prdtNm = $(this).closest("tr").children().eq(1).text();
    let button = $(this).closest("button");
    let flag = true;
    $(".checkTd").each(function () {
      // $(this).closest("button").attr("disabled", true);
      let edctsCd = $(this).data("edctscd");
      if (addEdctsCd == edctsCd) {
        Swal.fire({
          icon: "warning",
          title: "이미 상품이 있습니다.",
        });
        // button.attr("disabled", true);
        flag = false;
        return false;
      }
    });

    if (!flag) return;

    let tr = $("<tr>");
    tr.append(
      $("<td>")
        .attr("class", "checkTd")
        .attr("data-edctscd", addEdctsCd)
        .text(addEdctsCd)
    );
    tr.append($("<td>").text(prdtNm));
    tr.append(
      $("<td>").append(
        $("<input>")
          .attr("type", "number")
          .attr("value", "0")
          .css("width", "150px")
      )
    );
    tr.append(
      $("<td>").css("display", "none").append($("<input>").attr("value", "add"))
    );
    tr.append(
      $("<td class='detailDelTd'>")
        .css("width", "100px")
        .append(
          $("<button>")
            .attr("type", "button")
            .attr("class", "btn btn-danger deleteDetailBtn")
            .text("삭제")
        )
    );
    $("#orderDetailList").append(tr);
    // button.attr("disabled", true);
  });
  //주문서 디테일 추가하면 삭제버튼
  $(document).on("click", ".deleteDetailBtn", function () {
    $(this).closest("tr").remove();
  });

  // 초기화 버튼
  $("#resetBtn").on("click", function () {
    $("#check input").val("");
  });

  // 주문서 검색
  $("#searchOrder").on("click", function () {
    let orderNm = $("#orderNm").val();
    let progAppe = $("#progAppe").val();
    let orderDt = $("#startDate").val();
    let paprdDt = $("#endDate").val();
    if ($("#startDate").val() != "" && $("#endDate").val() == "") {
      Swal.fire({
        icon: "warning",
        title: "날짜를 입력해주세요",
      });
      return;
    }
    if ($("#startDate").val() == "" && $("#endDate").val() != "") {
      Swal.fire({
        icon: "warning",
        title: "날짜를 입력해주세요",
      });
      return;
    }

    $.ajax({
      url: "searchOrder",
      data: {
        orderNm: orderNm,
        progAppe: progAppe,
        orderDt: orderDt,
        paprdDt: paprdDt,
      },
      success: function (result) {
        if (result.length == 0) {
          Swal.fire({
            icon: "warning",
            title: "검색 결과가 없습니다.",
          });
          return;
        }
        $("#orderListBody").empty();
        $(result).each(function (idx, item) {
          let tr = $("<tr>").attr("data-id", item.orderNo);
          let select = null;
          let chkbox = $("<input>")
            .attr("type", "checkbox")
            .attr("name", "chk")
            .attr("value", item.orderNo);
          if (item.progAppe === "접수완료") {
            chkbox.prop("disabled", true);
          }
          tr.append($("<td>").append(chkbox));
          tr.append($("<td>").text(item.orderNo));
          tr.append($("<td>").text(item.vendNm));
          tr.append($("<td>").text(item.orderNm));
          tr.append($("<td>").text(orderDate(item.orderDt)));
          tr.append($("<td>").text(orderDate(item.paprdDt)));
          if (item.progAppe === "접수완료") {
            select = $("<select>", { name: "progAppe", class: "progAppe" })
              .append(
                $("<option>", { value: item.progAppe }).text(item.progAppe)
              )
              .append($("<option>", { value: "주문취소" }).text("주문취소"));
          } else {
            select = $("<select>", {
              name: "progAppe",
              class: "progAppe",
              disabled: true,
            }).append($("<option>", { value: "주문취소" }).text("주문취소"));
          }
          tr.append($("<td>").append(select));
          tr.append(
            $("<td>").append(
              $("<button>")
                .addClass("btn btn-primary btn-circle detailBtn my-td-class")
                .attr("data-bs-toggle", "modal")
                .attr("data-bs-target", "#orderDetail")
                .append($("<i>").addClass("bi bi-search my-td-class"))
            )
          );
          $("#orderListBody").append(tr);
        });
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  });

  // 엔터키를 눌렀을 때 검색 버튼 클릭 이벤트 실행
  $("#orderNm, #progAppe, #startDate, #endDate").on(
    "keypress",
    function (event) {
      if (event.which === 13) {
        event.preventDefault();
        $("#searchOrder").click();
      }
    }
  );

  // 주문서 디테일
  $(document).on("click", ".detailBtn", function () {
    let orderNo = $(this).closest("tr").children().eq(1).text().trim();
    let orderNm = $(this).closest("tr").children().eq(3).text().trim();
    let paprdDt = $(this).closest("tr").children().eq(5).text().trim();
    let progAppe = $(this).closest("tr").children().eq(6).find("select").val();

    if (progAppe == "출고완료") {
      $("#updateOrder").prop("disabled", true);
    } else {
      $("#updateOrder").prop("disabled", false);
    }
    $.ajax({
      url: "orderDetail",
      data: { orderNo: orderNo },
      success: function (result) {
        $("#vendNmDetail").val(result[0].vendNm);
        $("#vendMagDetail").val(result[0].vendMag);
        $("#vendAddrDetail").val(result[0].vendAddr);
        $("#orderDetailList").empty();
        $("#orderNoDetail").val(orderNo);
        $("#orderNmDetail").val(orderNm);
        $("#orderPaprdDtDetail").val(paprdDt);
        $(result).each(function (idx, item) {
          let tr = $("<tr>");
          tr.append(
            $("<td class=checkTd>")
              .text(item.edctsCd)
              .attr("data-edctsCd", item.edctsCd)
          );
          tr.append($("<td>").text(item.prdtNm));
          tr.append($("<td class='orderCntDetail'>").text(item.orderCnt));
          tr.append(
            $("<td class='detailDelTd'>")
              .css("width", "100px")
              .append(
                $("<button disabled>")
                  .attr("type", "button")
                  .attr("class", "btn btn-danger detailDelBtn")
                  .text("삭제")
              )
          );

          $("#orderDetailList").append(tr);
        });
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  });

  // 주문취소 하면 체크박스 활성화
  $(document).on("click", ".progAppe", function () {
    if ($(this).val() == "주문취소") {
      let progAppe = $(this).val();
      let orderNo = $(this).closest("tr").children().eq(1).text();
      let self = $(this);

      Swal.fire({
        title: "주문취소 하시겠습니까?",
        text: "복구 할 수 없습니다.",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#d33",
        cancelButtonColor: "#3085d6",
        confirmButtonText: "주문취소",
        cancelButtonText: "닫기",
      }).then((result) => {
        if (result.value) {
          $.ajax({
            url: "orderUpdateProg",
            method: "post",
            data: {
              progAppe: progAppe,
              orderNo: orderNo,
            },
            success: function (result) {
              if (result == "success") {
                self
                  .closest("tr")
                  .children()
                  .eq(0)
                  .find(":checkbox")
                  .prop("disabled", false);
                self.prop("disabled", true);
              }
            },
            error: function (reject) {
              console.log(reject);
            },
          });
        } else {
          $(this).val("접수완료");
        }
      });
    }
  });

  // 체크박스 선택 메인꺼
  $(document).ready(function () {
    $("#cbx_chkAll").click(function () {
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

    $("input[name=chk]").click(function () {
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
  });
  // 체크박스 선택 주문서꺼
  $(document).ready(function () {
    $("#cbx_chkAll2").click(function () {
      if ($("#cbx_chkAll2").is(":checked")) {
        $("input[name=chk2]")
          .prop("checked", true)
          .closest("tr")
          .addClass("selected");
        $("input[name=chk2]").closest("tr").addClass("table-danger");
      } else {
        $("input[name=chk2]")
          .prop("checked", false)
          .closest("tr")
          .removeClass("selected");
        $("input[name=chk2]").closest("tr").removeClass("table-danger");
      }
    });

    $("input[name=chk2]").click(function () {
      var total = $("input[name=chk2]").length;
      var checked = $("input[name=chk2]:checked").length;

      if (total != checked) $("#cbx_chkAll2").prop("checked", false);
      else $("#cbx_chkAll2").prop("checked", true);
    });
  });
  // 행 선택해도 체크 됨
  $(document).on("click", "table tr", function (event) {
    if (event.target.type !== "checkbox") {
      const $checkbox = $(":checkbox", this);
      const $input = $(".my-td-class", this);
      if ($input.is(event.target)) {
        event.stopPropagation();
      } else {
        $checkbox.trigger("click");
      }
    }
  });

  /* 주문일자 오늘 설정 */
  $("#currentDate").val(new Date().toISOString().substring(0, 10));

  document
    .querySelector("#orderSheetBtn")
    .addEventListener("click", getOrderSheet);

  /* 거래처정보 -> 주문서에 전달 */
  $(document).on("click", ".addBtn", function () {
    var orderArray = [];
    var row = $(this).closest("tr");
    row.find("td").each(function () {
      orderArray.push($(this).text());
    });
    $("#vendCd").val(orderArray[0]);
    $("#vendNm").val(orderArray[1]);
    $("#brNum").val(orderArray[2]);
    $("#vendMag").val(orderArray[3]);
    $("#vendTel").val(orderArray[4]);
    $("#remk").val(orderArray[5]);
    $("#vendNm1").val(orderArray[1]);
    $("#vendMag1").val(orderArray[3]);
    $("#vendAddr1").val(orderArray[5]);

    $.ajax({
      url: "orderNo",
      success: function (result) {
        $("#orderNo").val(result);
      },
      error(reject) {
        console.log(reject);
      },
    });

    // 현재 모달창 닫기
    $("#orderSheet").modal("hide");

    // 다른 모달창 열기
    $("#createOrder").modal("show");
  });

  function getOrderSheet() {
    $.ajax({
      url: "orderVendList",
      type: "GET",
      dataType: "json",
      success: function (data) {
        // 성공적으로 응답 받았을 때 처리할 로직
        var tbody = $("#ordSheetTable"); // tbody 선택
        tbody.empty(); // tbody 비우기
        // 데이터 반복문 처리
        $.each(data, function (index, item) {
          if (item.vendTyp == "매출처") {
            var row = $("<tr>");
            // // td 생성
            // row.append($("<td>").attr("hidden", true).text(item.edctsCd));
            // row.append($("<td>").attr("hidden", true).text(item.vendCd));
            row.append($("<td>").text(item.vendCd));
            row.append($("<td>").text(item.vendNm));
            row.append($("<td>").text(item.brNum));
            row.append($("<td>").text(item.vendMag));
            row.append($("<td>").text(item.vendTel));
            row.append($("<td>").text(item.vendAddr));
            var button = $("<button>", {
              type: "button",
              class: "btn btn-primary addBtn",
              text: "등록",
              style: "background-color: #0d6efd;",
            });
            row.append(button);
            tbody.append(row);
          }
        });
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  }

  function orderSubmit() {
    let orderNo = $("input[name='orderNo']").val();
    let orderDt = $("input[name='orderDt']").val();
    let vendCd = $("input[name='vendCd']").val();
    let vendNm = $("input[name='vendNm']").val();
    let paprdDt = $("input[name='paprdDt']").val();
    let orderNm = $("input[name='orderNm']").val();
    let success1 = "";
    let success2 = "";

    if (orderNm == "") {
      $("#orderNm").focus();
      Swal.fire({
        icon: "warning",
        title: "주문이름이 입력되지 않았습니다.",
      });
      return;
    }
    if (paprdDt == "") {
      $("#paprdDt").focus();
      Swal.fire({
        icon: "warning",
        title: "납기일이 입력되지 않았습니다.",
      });
      return;
    }

    // 체크된 체크박스가 없으면 함수 종료
    if ($("input[name=chk2]:checked").length === 0) {
      Swal.fire({
        icon: "warning",
        title: "상품을 선택해주세요",
      });
      return;
    }

    let invalidInputs = [];
    $("input[name=chk2]:checked").each(function () {
      let inputVal = $(this).closest("tr").find("td:eq(3) input").val();
      if (parseInt(inputVal) <= 0) {
        invalidInputs.push($(this).closest("tr"));
      }
    });

    if (invalidInputs.length > 0) {
      Swal.fire({
        icon: "warning",
        title: "수량을 1이상 입력해주세요",
      });
      return;
    }

    // 데이터를 저장할 배열 선언
    let dataArr = [];

    // 체크된 체크박스의 개수만큼 반복하며 데이터 저장
    $('input[name="chk2"]:checked').each(function () {
      let row = $(this).closest("tr");
      let edctsCd = row.find("td:eq(1)").text().trim();
      let prdtNm = row.find("td:eq(2)").text().trim();
      let orderCnt = row.find("td:eq(3) input").val().trim();
      let orderNo = $("input[name='orderNo']").val();

      // 객체 형식으로 데이터 저장
      let dataObj = {
        edctsCd: edctsCd,
        prdtNm: prdtNm,
        orderCnt: orderCnt,
        orderNo: orderNo,
      };

      // 데이터 배열에 객체 추가
      dataArr.push(dataObj);
    });

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
          url: "orderInsert",
          method: "post",
          data: {
            orderNo: orderNo,
            orderDt: orderDt,
            vendCd: vendCd,
            vendNm: vendNm,
            paprdDt: paprdDt,
            orderNm: orderNm,
          },
          success: function (result) {
            if (result == "success1") {
              success1 = "success";
            }
          },
          error: function (reject) {
            console.log(reject);
          },
        }).then(() => {
          $.ajax({
            url: "orderInsertDetail",
            method: "post",
            headers: { "Content-Type": "application/json" },
            data: JSON.stringify(dataArr),
            success: function (result) {
              if (result == "success2") {
                success2 = "success";
              }
            },
            error: function (reject) {
              console.log(reject);
            },
          }).then(() => {
            if (success1 == "success" && success2 == "success") {
              location.reload();
            }
          });
        });
      }
    });
  }

  $(document).on("click", "#deleteBtn", function () {
    let valueArr = [];

    // 체크된 체크박스의 개수만큼 반복하며 데이터 저장
    $('input[name="chk"]:checked').each(function (idx, items) {
      let dataObj = {
        orderNo: items.value,
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
            url: "orderDelete",
            method: "post",
            headers: { "Content-Type": "application/json" },
            data: JSON.stringify(valueArr),
            success: function (result) {
              if (result == "success") {
                for (let i = 0; i < valueArr.length; i++) {
                  $('tr[data-id="' + valueArr[i].orderNo + '"]').remove();
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

  //날짜 변환
  function orderDate(timestamp) {
    let date = new Date(timestamp);
    let year = date.getFullYear();
    let month = String(date.getMonth() + 1).padStart(2, "0");
    let day = String(date.getDate()).padStart(2, "0");
    let formattedDate = year + "-" + month + "-" + day;
    return formattedDate;
  }
</script>
