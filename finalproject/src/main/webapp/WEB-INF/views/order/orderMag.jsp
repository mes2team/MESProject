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
    padding: 20px 0 15px 0;
  }
  form {
    clear: both;
  }
</style>
<body>
  <!-- 모달창 -->
  <!-- 주문서 조회 -->
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
                <th scope="col">비고</th>
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
          <button
            id="deleteList"
            type="button"
            class="btn btn-danger"
            onclick="deleteBtn()"
          >
            삭제
          </button>
        </sec:authorize>
      </div>
      <form class="row g-3" id="check">
        <div class="col-md-4">
          <label for="inputEmail5" class="form-label">주문서 명</label>
          <input type="text" class="form-control" />
        </div>
        <div class="col-md-4">
          <label for="inputEmail5" class="form-label">주문 날짜</label>
          <div class="d-flex align-items-center">
            <input type="date" class="form-control mr-2" />
            <span class="mx-2">~</span>
            <input type="date" class="form-control ml-2" />
          </div>
        </div>
        <div class="text-center">
          <button type="button" class="btn btn-primary" id="searchVend">
            조회
          </button>
          <button type="reset" class="btn btn-secondary">초기화</button>
        </div>
      </form>
    </div>
  </div>

  <div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
      <div class="card">
        <br />
        <div class="card-body">
          <div
            class="table-responsive"
            style="width: 100%; height: 300px; overflow: auto"
          >
            <table class="table table-striped table-bordered first">
              <thead>
                <tr>
                  <th>
                    <input type="checkbox" id="cbx_chkAll" disabled />
                  </th>
                  <th>주문 번호</th>
                  <th>거래처 코드</th>
                  <th>거래처 이름</th>
                  <th>주문 이름</th>
                  <th>주문 날짜</th>
                  <th>납기일</th>
                  <th>진행도</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${orderList }" var="order">
                  <tr data-id="${order.orderNo }">
                    <td>
                      <input
                        type="checkbox"
                        name="chk"
                        value="${order.orderNo }"
                        disabled
                      />
                    </td>
                    <td>${order.orderNo }</td>
                    <td>${order.vendCd }</td>
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
                      <select name="progAppe" id="progAppe">
                        <option value="${order.progAppe }">
                          ${order.progAppe }
                        </option>
                        <option value="주문취소">주문취소</option>
                      </select>
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
  <!-- 주문서 작성 -->
  <div
    class="modal fade"
    id="createPlan"
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
            <hr />
            <h5 class="modal-title">주문서 정보</h5>
            <input
              type="hidden"
              class="form-control"
              name="nowSt"
              value="미진행"
              readonly
            />
            <div class="col-md-6">
              <label class="form-label">주문 번호</label>
              <input
                type="text"
                class="form-control"
                name="orderNo"
                value="ORD${orderNo }"
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
                      <input type="number" class="my-td-class" />
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
</body>

<script>
  // 주문취소 하면 체크박스 활성화
  $("#progAppe").on("click", function () {
    if ($(this).val() == "주문취소") {
      $(this).closest("tr").children[0];
      console.log($(this).closest("tr").children[0]);
    }
    console.log($(this).val());
  });

  // 체크박스 선택 메인꺼
  $(document).ready(function () {
    $("#cbx_chkAll").click(function () {
      if ($("#cbx_chkAll").is(":checked"))
        $("input[name=chk]").prop("checked", true);
      else $("input[name=chk]").prop("checked", false);
    });

    $("input[name=chk]").click(function () {
      var total = $("input[name=chk]").length;
      var checked = $("input[name=chk]:checked").length;

      if (total != checked) $("#cbx_chkAll").prop("checked", false);
      else $("#cbx_chkAll").prop("checked", true);
    });
  });
  // 체크박스 선택 주문서꺼
  $(document).ready(function () {
    $("#cbx_chkAll2").click(function () {
      if ($("#cbx_chkAll2").is(":checked"))
        $("input[name=chk2]").prop("checked", true);
      else $("input[name=chk2]").prop("checked", false);
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

    // 현재 모달창 닫기
    $("#orderSheet").modal("hide");

    // 다른 모달창 열기
    $("#createPlan").modal("show");
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
            row.append($("<td>").text(item.remk));
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
      error: function (xhr, status, error) {
        // 요청이 실패했을 때 처리할 로직
        console.error("요청 실패:", error);
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

  function deleteBtn() {
    console.log("클릭");
    let valueArr = [];

    // 체크된 체크박스의 개수만큼 반복하며 데이터 저장
    $('input[name="chk"]:checked').each(function (idx, items) {
      console.log(items);
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
  }
</script>
