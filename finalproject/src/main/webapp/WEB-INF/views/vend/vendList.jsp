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
    padding: 20px 0 15px 0;
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
                <div class="col-md-12">
                  <label for="inputName5" class="form-label">거래처코드</label>
                  <input
                    type="text"
                    class="form-control"
                    id="vendCd"
                    name="vendCd"
                    style="background-color: #e9e9e9"
                    readonly
                  />
                </div>
                <div class="col-12">
                  <label for="inputAddress5" class="form-label">거래처명</label>
                  <input
                    type="text"
                    class="form-control"
                    id="vendNm"
                    name="vendNm"
                  />
                </div>
                <div class="col-12">
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
                <div class="col-12">
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
                <div class="col-12">
                  <label for="inputAddress2" class="form-label">전화번호</label>
                  <input
                    type="text"
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
          <button
            type="button"
            class="btn btn-secondary closeBtn"
            data-bs-dismiss="modal"
          >
            닫기
          </button>
          <button type="submit" class="btn btn-primary" id="insertBtn">
            등록
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
        <div id="btnGrp">
          <sec:authorize access="hasRole('ROLE_ADMIN')">
            <button type="button" class="btn btn-info" onclick="updateBtn()">
              수정
            </button>
            <button
              type="button"
              class="btn btn-success"
              data-bs-toggle="modal"
              data-bs-target="#modalDialogScrollable"
            >
              등록
            </button>
            <button type="button" class="btn btn-danger" onclick="deleteBtn()">
              삭제
            </button>
          </sec:authorize>
        </div>
        <!-- Multi Columns Form -->
        <form class="row g-3" id="check">
          <!-- End Modal Dialog Scrollable-->
          <div class="col-md-4">
            <label for="inputEmail5" class="form-label">거래처 코드</label>
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
                <tbody>
                  <c:forEach var="vend" items="${vendList }" varStatus="loop">
                    <tr data-id="${vend.vendCd }">
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
                      <td>${vend.brNum }</td>
                      <td>${vend.vendTel }</td>
                      <td>${vend.remk }</td>
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

  <script>
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
      let vendCd = document.getElementsByName("vendCd")[0];
      let vendNm = document.getElementsByName("vendNm")[0];
      let vendMag = document.getElementsByName("vendMag")[0];
      let brNum = document.getElementsByName("brNum")[0];
      let vendTel = document.getElementsByName("vendTel")[0];

      if (vendTyp == "none") {
        Swal.fire({
          icon: "warning",
          title: "구분이 입력되지 않았습니다.",
        });
        return;
      }
      if (vendCd.value == "") {
        vendCd.focus();
        Swal.fire({
          icon: "warning",
          title: "거래처코드가 입력되지 않았습니다.",
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
          $(this).closest("tr").addClass("table-danger");
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

      // 행 선택하면 체크
      //       $("table tr").click(function (event) {
      //         if (event.target.type !== "checkbox") {
      //           $(":checkbox", this).trigger("click");
      //         }
      //       });

      //       $("table tr :checkbox").change(function (event) {
      //         $(this).closest("tr").toggleClass("selected", this.checked);
      //       });

      // 검색기능
      $("#searchVend").on("click", function (event) {
        let vendCd = $("#inputVendCd").val().toUpperCase();
        let vendNm = $("#inputVendNm").val();
        let vendMag = $("#inputVendMag").val();

        $.ajax({
          url: "searchVend",
          data: { vendCd: vendCd, vendNm: vendNm, vendMag: vendMag },
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
              $row.append($("<td>").text(item.brNum));
              $row.append($("<td>").text(item.vendTel));
              $row.append($("<td>").text(item.remk));
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
    function updateBtn() {
      // 체크된 체크박스가 없으면 함수 종료
      if ($("input[name=chk]:checked").length === 0) {
        Swal.fire({
          icon: "warning",
          title: "선택된 글이 없습니다.",
        });
        return;
      }
      $("#cbx_chkAll").prop("disabled", true);
      disableCheckBoxes();

      // 수정 버튼의 텍스트를 "수정완료"로 변경
      $(".btn-info").text("수정완료");

      // 수정완료 버튼 클릭 이벤트 핸들러 설정
      // $(".btn-info").off("click").on("click", submitBtn);
      $(".btn-info").removeAttr("onclick");
      $(".btn-info").attr("onclick", "submitBtn();");

      $('input[name="chk"]:checked').each(function () {
        var row = $(this).closest("tr");
        var vendTyp = row.find("td:eq(2)").text().trim();
        var vendCd = row.find("td:eq(3)").text().trim();
        var vendNm = row.find("td:eq(4)").text().trim();
        var vendMag = row.find("td:eq(5)").text().trim();
        var brNum = row.find("td:eq(6)").text().trim();
        var vendTel = row.find("td:eq(7)").text().trim();
        var remk = row.find("td:eq(8)").text().trim();

        row
          .find("td:eq(2)")
          .html(
            '<input type="text" class="form-control" value="' + vendTyp + '">'
          );
        row
          .find("td:eq(3)")
          .html(
            '<input type="text" class="form-control" value="' + vendCd + '">'
          );
        row
          .find("td:eq(4)")
          .html(
            '<input type="text" class="form-control" value="' + vendNm + '">'
          );
        row
          .find("td:eq(5)")
          .html(
            '<input type="text" class="form-control" value="' + vendMag + '">'
          );
        row
          .find("td:eq(6)")
          .html(
            '<input type="text" class="form-control" value="' + brNum + '">'
          );
        row
          .find("td:eq(7)")
          .html(
            '<input type="text" class="form-control" value="' + vendTel + '">'
          );
        row
          .find("td:eq(8)")
          .html(
            '<input type="text" class="form-control" value="' + remk + '">'
          );
      });
    }

    function submitBtn() {
      // 체크된 체크박스가 없으면 함수 종료
      if ($("input[name=chk]:checked").length === 0) return;

      // 데이터를 저장할 배열 선언
      var dataArr = [];

      // 체크된 체크박스의 개수만큼 반복하며 데이터 저장
      $('input[name="chk"]:checked').each(function () {
        var row = $(this).closest("tr");
        var vendTyp = row.find("td:eq(2) input").val().trim();
        var vendCd = row.find("td:eq(3) input").val().trim();
        var vendNm = row.find("td:eq(4) input").val().trim();
        var vendMag = row.find("td:eq(5) input").val().trim();
        var brNum = row.find("td:eq(6) input").val().trim();
        var vendTel = row.find("td:eq(7) input").val().trim();
        var remk = row.find("td:eq(8) input").val().trim();

        // 객체 형식으로 데이터 저장
        var dataObj = {
          vendTyp: vendTyp,
          vendCd: vendCd,
          vendNm: vendNm,
          vendMag: vendMag,
          brNum: brNum,
          vendTel: vendTel,
          remk: remk,
        };

        // 데이터 배열에 객체 추가
        dataArr.push(dataObj);
      });

      $.ajax({
        url: "updateVend",
        method: "POST",
        headers: { "Content-Type": "application/json" },
        data: JSON.stringify(dataArr),
        success: function (result) {
          if (result.result == "success") {
            $("tbody").empty();
            $(result.data).each(function (idx, item) {
              var $row = $("<tr>").attr("data-id", item.vendCd);
              $row.append(
                $("<td>").html(
                  '<input type="checkbox" name="chk" value="' +
                    item.vendCd +
                    '" />'
                )
              );
              $row.append($("<td>").text(idx + 1));
              $row.append($("<td>").text(item.vendTyp));
              $row.append($("<td>").text(item.vendCd));
              $row.append($("<td>").text(item.vendNm));
              $row.append($("<td>").text(item.vendMag));
              $row.append($("<td>").text(item.brNum));
              $row.append($("<td>").text(item.vendTel));
              $row.append($("<td>").text(item.remk));
              $("tbody").append($row);
            });
            enableCheckBoxes();
            $(".btn-info").text("수정");
            $(".btn-info").removeAttr("onclick");
            $(".btn-info").attr("onclick", "updateBtn();");
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
            title: "수정이 정상적으로 되었습니다.",
          });
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    }

    function disableCheckBoxes() {
      $('input[name="chk"]').prop("disabled", true);
    }

    function enableCheckBoxes() {
      $('input[name="chk"]').prop("disabled", false);
    }
  </script>
</body>
