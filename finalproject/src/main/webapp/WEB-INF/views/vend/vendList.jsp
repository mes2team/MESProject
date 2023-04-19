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
    padding: 20px 20px 15px 0;
    text-align: right;
  }

  form {
    clear: both;
  }
</style>
<body>
  <!-- 모달창 -->
  <div
    class="modal fade"
    id="modalDialogScrollable"
    tabindex="-1"
    data-bs-backdrop="static"
  >
    <div class="modal-dialog modal-dialog-scrollable modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">거래처 등록</h5>
          <button
            type="button"
            class="btn-close closeBtn"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <div class="modal-body">
          <div class="card">
            <div class="card-body">
              <form
                class="row g-3"
                name="insertForm"
                action="vendInsert"
                method="post"
                onsubmit="return false"
              >
                <div class="col-md-12">
                  <label for="inputState" class="form-label">구분</label>
                  <select id="vendType" class="form-select" name="vendTyp">
                    <option value="none">=== 선택 ===</option>
                    <option value="매입처">매입처</option>
                    <option value="매출처">매출처</option>
                  </select>
                </div>
                <div class="col-md-6">
                  <label for="inputAddress5" class="form-label">거래처명</label>
                  <input
                    type="text"
                    class="form-control"
                    id="vendNm"
                    name="vendNm"
                  />
                </div>
                <div class="col-md-6">
                  <label for="inputAddress2" class="form-label"
                    >거래처 담당자</label
                  >
                  <input
                    type="text"
                    class="form-control"
                    id="vendMag"
                    name="vendMag"
                  />
                </div>
                <div class="col-md-12">
                  <label for="inputAddress2" class="form-label"
                    >거래처 주소</label
                  >
                  <input
                    type="text"
                    class="form-control"
                    id="vendAddr"
                    name="vendAddr"
                  />
                </div>
                <div class="col-md-6">
                  <label for="inputAddress2" class="form-label"
                    >사업자 등록번호</label
                  >
                  <input
                    type="text"
                    class="form-control"
                    id="brNum"
                    name="brNum"
                  />
                </div>
                <div class="col-md-6">
                  <label for="inputAddress2" class="form-label">전화번호</label>
                  <input
                    type="tel"
                    class="form-control"
                    id="vendTel"
                    name="vendTel"
                  />
                </div>
                <div class="col-12">
                  <label for="inputAddress2" class="form-label">비고</label>
                  <textarea
                    class="form-control"
                    id="remk"
                    rows="10"
                    style="resize: none"
                    name="remk"
                  ></textarea>
                </div>
              </form>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary" id="insertBtn">
            등록
          </button>
          <button
            type="button"
            class="btn btn-secondary closeBtn"
            data-bs-dismiss="modal"
          >
            닫기
          </button>
        </div>
      </div>
    </div>
  </div>
  <div>
    <!-- ============================================================== -->
    <!-- pageheader -->
    <!-- ============================================================== -->
    <div class="row">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
          <h2 class="pageheader-title">거래처 관리</h2>
        </div>
      </div>
    </div>
    <!-- ============================================================== -->
    <!-- end pageheader -->
    <!-- ============================================================== -->
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">거래처 관리</h5>
        <!-- Multi Columns Form -->
        <form class="row g-3" id="check">
          <!-- End Modal Dialog Scrollable-->
          <div class="col-md-4">
            <label for="inputEmail5" class="form-label">구분</label>
            <input type="text" class="form-control" id="inputVendCd" />
          </div>
          <div class="col-md-4">
            <label for="inputEmail5" class="form-label">거래처 명</label>
            <input type="text" class="form-control" id="inputVendNm" />
          </div>
          <div class="col-md-4">
            <label for="inputEmail5" class="form-label">거래처 담당자</label>
            <input type="text" class="form-control" id="inputVendMag" />
          </div>
          <div class="text-center">
            <button type="button" class="btn btn-primary" id="searchVend">
              조회
            </button>
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
          <div id="btnGrp">
            <sec:authorize access="hasRole('ROLE_ADMIN')">
              <button
                type="button"
                class="btn btn-success"
                data-bs-toggle="modal"
                data-bs-target="#modalDialogScrollable"
              >
                등록
              </button>
              <button
                type="button"
                class="btn btn-danger"
                onclick="deleteBtn()"
              >
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
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="vend" items="${vendList }" varStatus="loop">
                    <tr
                      data-id="${vend.vendCd }"
                      ondblclick="openModal('${vend.vendCd}')"
                    >
                      <td>
                        <input
                          type="checkbox"
                          name="chk"
                          value="${vend.vendCd }"
                        />
                      </td>
                      <td>${loop.count }</td>
                      <td>${vend.vendTyp }</td>
                      <td>${vend.vendCd }</td>
                      <td>${vend.vendNm }</td>
                      <td>${vend.vendMag }</td>
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
  <!-- 모달창 상세정보 -->
  <div
    class="modal fade"
    id="vendDetailModal"
    tabindex="-1"
    data-bs-backdrop="static"
  >
    <div class="modal-dialog modal-dialog-scrollable modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">거래처 상세정보</h5>
          <button
            type="button"
            class="btn-close closeBtn"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <div class="modal-body">
          <div class="card">
            <div class="card-body">
              <form class="row g-3" name="">
                <div class="col-md-6">
                  <label for="inputState" class="form-label">구분</label>
                  <input
                    type="text"
                    class="form-control"
                    style="background-color: #e9e9e9"
                    id="vendTypDet"
                    readonly
                  />
                </div>
                <div class="col-md-6">
                  <label for="inputName5" class="form-label">거래처코드</label>
                  <input
                    type="text"
                    class="form-control"
                    style="background-color: #e9e9e9"
                    id="vendCdDet"
                    readonly
                  />
                </div>
                <div class="col-md-6">
                  <label for="inputAddress5" class="form-label">거래처명</label>
                  <input type="text" class="form-control" id="vendNmDet" />
                </div>
                <div class="col-md-6">
                  <label for="inputAddress2" class="form-label"
                    >거래처 담당자</label
                  >
                  <input type="text" class="form-control" id="vendMagDet" />
                </div>
                <div class="col-md-12">
                  <label for="inputAddress2" class="form-label"
                    >거래처 주소</label
                  >
                  <input type="text" class="form-control" id="vendAddrDet" />
                </div>
                <div class="col-md-6">
                  <label for="inputAddress2" class="form-label"
                    >사업자 등록번호</label
                  >
                  <input type="text" class="form-control" id="brNumDet" />
                </div>
                <div class="col-md-6">
                  <label for="inputAddress2" class="form-label">전화번호</label>
                  <input type="tel" class="form-control" id="vendTelDet" />
                </div>
                <div class="col-md-12">
                  <label for="inputAddress2" class="form-label">비고</label>
                  <textarea
                    class="form-control"
                    rows="10"
                    style="resize: none"
                    id="remkDet"
                  ></textarea>
                </div>
              </form>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="updateBtn">
            등록
          </button>
          <button
            type="button"
            class="btn btn-secondary closeBtn"
            data-bs-dismiss="modal"
          >
            닫기
          </button>
        </div>
      </div>
    </div>
  </div>

  <script>
    // 모달창 단건 조회
    function openModal(vendCd) {
      $.ajax({
        url: "vendDetail",
        method: "post",
        data: { vendCd: vendCd },
        success: function (result) {
          $("#vendTypDet").val(result.vendTyp);
          $("#vendCdDet").val(result.vendCd);
          $("#vendNmDet").val(result.vendNm);
          $("#vendMagDet").val(result.vendMag);
          $("#vendAddrDet").val(result.vendAddr);
          $("#brNumDet").val(result.brNum);
          $("#vendTelDet").val(result.vendTel);
          $("#remkDet").val(result.remk);
        },
        error: function (reject) {
          console.log(reject);
        },
      });

      $("#vendDetailModal").modal("show");
    }
    // 거래처 코드 조회
    $("#vendType").on("click", function () {
      let select = $("select option:selected").val();
      if (select == "매입처") {
        $("#vendCd").val("VEI${vendInCd}");
      } else if (select == "매출처") {
        $("#vendCd").val("VEO${vendOutCd}");
      } else {
        $("#vendCd").val("");
      }
    });

    // 등록전에 체크
    function formOptionChk() {
      let vendTyp = $("select option:selected").val();
      let vendNm = document.getElementsByName("vendNm")[0];
      let vendMag = document.getElementsByName("vendMag")[0];
      let brNum = document.getElementsByName("brNum")[0];
      let vendTel = document.getElementsByName("vendTel")[0];
      let vendAddr = document.getElementsByName("vendAddr")[0];

      if (vendTyp == "none") {
        Swal.fire({
          icon: "warning",
          title: "구분이 입력되지 않았습니다.",
        });
        return;
      }
      if (vendNm.value == "") {
        vendNm.focus();
        Swal.fire({
          icon: "warning",
          title: "거래처명이 입력되지 않았습니다.",
        });
        return;
      }
      if (vendMag.value == "") {
        vendMag.focus();
        Swal.fire({
          icon: "warning",
          title: "거래처 담당자가 입력되지 않았습니다.",
        });
        return;
      }
      if (vendAddr.value == "") {
        vendAddr.focus();
        Swal.fire({
          icon: "warning",
          title: "주소가 입력되지 않았습니다.",
        });
        return;
      }
      if (brNum.value == "") {
        brNum.focus();
        Swal.fire({
          icon: "warning",
          title: "사업자 등록번호가 입력되지 않았습니다.",
        });
        return;
      }
      if (vendTel.value == "") {
        vendTel.focus();
        Swal.fire({
          icon: "warning",
          title: "전화번호가 입력되지 않았습니다.",
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
          insertForm.submit();
        }
      });
    }

    $("#insertBtn").on("click", formOptionChk);

    // 닫기버튼
    $(".closeBtn").on("click", function () {
      $('form[name="insertForm"] input').val("");
      $('form[name="insertForm"] textarea').val("");
      $("#vendType").val("none");
    });

    // 초기화
    $("#check button[type=reset]").on("click", function () {
      $("#check input").val("");
    });

    //체크박스 전체 선택
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

      $(document).on("change", ":checkbox", function () {
        if ($(this).prop("checked")) {
          if (!$(this).closest("tr").children().eq(0).is("th")) {
            $(this).closest("tr").addClass("table-danger");
          }
        } else {
          $(this).closest("tr").removeClass("table-danger");
        }
      });

      $(document).on("click", "input[name=chk]", function () {
        var total = $("input[name=chk]").length;
        var checked = $("input[name=chk]:checked").length;

        if (total != checked) $("#cbx_chkAll").prop("checked", false);
        else $("#cbx_chkAll").prop("checked", true);
      });

      // 검색기능
      $("#searchVend").on("click", function (event) {
        let vendCd = $("#inputVendCd").val();
        let vendNm = $("#inputVendNm").val();
        let vendMag = $("#inputVendMag").val();

        $.ajax({
          url: "searchVend",
          data: { vendTyp: vendCd, vendNm: vendNm, vendMag: vendMag },
          success: function (result) {
            if (result.length == 0) {
              Swal.fire({
                icon: "warning",
                title: "검색 결과가 없습니다.",
              });
              return;
            }
            $("tbody").empty();

            $.each(result, function (index, item) {
              var $row = $("<tr>").attr("data-id", item.vendCd);
              $row.append(
                $("<td>").html(
                  '<input type="checkbox" name="chk" value="' +
                    item.vendCd +
                    '" />'
                )
              );
              $row.append($("<td>").text(index + 1));
              $row.append($("<td>").text(item.vendTyp));
              $row.append($("<td>").text(item.vendCd));
              $row.append($("<td>").text(item.vendNm));
              $row.append($("<td>").text(item.vendMag));
              $("tbody").append($row);
            });
            $(document).on("click", "input[name=chk]", function () {
              var total = $("input[name=chk]").length;
              var checked = $("input[name=chk]:checked").length;

              if (total != checked) $("#cbx_chkAll").prop("checked", false);
              else $("#cbx_chkAll").prop("checked", true);
            });
          },
          error: function (reject) {
            console.log(reject);
          },
        });
      });

      // 엔터키를 눌렀을 때 검색 버튼 클릭 이벤트 실행
      $("#inputVendCd, #inputVendNm, #inputVendMag").on(
        "keypress",
        function (event) {
          if (event.which === 13) {
            event.preventDefault();
            $("#searchVend").click();
          }
        }
      );
    });
    // 행 선택하면 체크
    $(document).on("click", "table tr", function (event) {
      if (event.target.type !== "checkbox") {
        $(":checkbox", this).trigger("click");
      }
    });

    $(document).on("change", "table tr :checkbox", function (event) {
      $(this).closest("tr").toggleClass("selected", this.checked);
    });

    //삭제
    function deleteBtn() {
      let valueArr = new Array();
      let list = $("input[name=chk]");
      for (let i = 0; i < list.length; i++) {
        if (list[i].checked) {
          valueArr.push(list[i].value);
        }
      }
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
              url: "vendDelete",
              method: "post",
              traditional: true,
              data: { valueArr: valueArr },
              success: function (result) {
                if (result == "success") {
                  for (let i = 0; i < valueArr.length; i++) {
                    $('tr[data-id="' + valueArr[i] + '"]').remove();
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

    //수정
    $(document).on("click", "#updateBtn", function () {
      let vendNm = $("#vendNmDet").val();
      let vendMag = $("#vendMagDet").val();
      let vendAddr = $("#vendAddrDet").val();
      let brNum = $("#brNumDet").val();
      let vendTel = $("#vendTelDet").val();
      let remk = $("#remkDet").val();
      let vendCd = $("#vendCdDet").val();

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
            url: "updateVend",
            method: "post",
            data: {
              vendCd: vendCd,
              vendNm: vendNm,
              vendMag: vendMag,
              vendAddr: vendAddr,
              brNum: brNum,
              vendTel: vendTel,
              remk: remk,
            },
            success: function (result) {
              if (result == "success") {
                location.reload();
              }
            },
            error: function (reject) {
              console.log(reject);
            },
          });
        }
      });
    });

    function disableCheckBoxes() {
      $('input[name="chk"]').prop("disabled", true);
    }

    function enableCheckBoxes() {
      $('input[name="chk"]').prop("disabled", false);
    }
  </script>
</body>
