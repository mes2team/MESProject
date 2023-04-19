<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <style>
      h5 {
        float: left;
      }

      .btnGrp {
        float: right;
        padding: 20px 0 15px 0;
      }

      form {
        clear: both;
      }

      .addBtn {
        background-color: #0d6efd;
      }

      table {
        text-align: left;
      }

      td {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
      }

      .scrollable {
        max-height: 500px;
        overflow: auto;
      }

      #processList input[type="text"],
      #processList input[type="date"] {
        border: none;
        height: 47px;
        width: 100%;
        box-sizing: border-box;
      }

      tbody#processList input:not([readonly]) {
        border-bottom: 1px solid green;
      }

      #processList td {
        padding: 0;
        vertical-align: middle;
      }

      #processList select {
        border: none;
        height: 47px;
        width: 100%;
        box-sizing: border-box;
        padding: 0;
        margin: 0;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
      }
    </style>
  </head>
  <body>
    <div class="card">
      <div class="card-body">
        <!-- Bordered Tabs Justified -->
        <ul
          class="nav nav-tabs nav-tabs-bordered d-flex"
          id="borderedTabJustified"
          role="tablist"
        >
          <li class="nav-item flex-fill" role="presentation">
            <button
              class="nav-link w-100 active"
              id="home-tab"
              data-bs-toggle="tab"
              data-bs-target="#bordered-justified-home"
              type="button"
              role="tab"
              aria-controls="home"
              aria-selected="true"
            >
              공정관리
            </button>
          </li>
          <li class="nav-item flex-fill" role="presentation">
            <button
              class="nav-link w-100"
              id="profile-tab"
              data-bs-toggle="tab"
              data-bs-target="#bordered-justified-profile"
              type="button"
              role="tab"
              aria-controls="profile"
              aria-selected="false"
              tabindex="-1"
            >
              공정흐름관리
            </button>
          </li>
        </ul>
        <div class="tab-content pt-2" id="borderedTabJustifiedContent">
          <div
            class="tab-pane fade show active"
            id="bordered-justified-home"
            role="tabpanel"
            aria-labelledby="home-tab"
          >
            <!-- 테이블 영역 -->
            <div class="card">
              <div class="card-body scrollable">
                <div class="btnGrp">
                  <button id="addrow" type="button" class="btn btn-primary">
                    추가
                  </button>
                  <button id="deleteList" type="button" class="btn btn-primary">
                    삭제
                  </button>
                  <button id="saveList" type="button" class="btn btn-primary">
                    저장
                  </button>
                </div>
                <!-- Table with hoverable rows -->
                <table id="processTable" class="table table-hover">
                  <thead>
                    <tr>
                      <th scope="col"><input type="checkbox" /></th>
                      <th scope="col">공정구분</th>
                      <th scope="col">공정명</th>
                      <th scope="col">공정코드</th>
                      <th scope="col">공정등록일</th>
                      <th scope="col">공정내용</th>
                    </tr>
                  </thead>
                  <tbody id="processList">
                    <c:forEach var="item" items="${prcsList}">
                      <tr>
                        <td><input type="checkbox" /></td>
                        <td><select name="prcsFg" disabled>
													<option value="COM"
														${item.prcsFg == 'COM' ? 'selected' : ''}>COM</option>
													<option value="DRY"
														${item.prcsFg == 'DRY' ? 'selected' : ''}>DRY</option>
													<option value="MEN"
														${item.prcsFg == 'MEN' ? 'selected' : ''}>MEN</option>
													<option value="SHR"
														${item.prcsFg == 'SHR' ? 'selected' : ''}>SHR</option>
													<option value="WRA"
														${item.prcsFg == 'WRA' ? 'selected' : ''}>WRA</option>
											</select></td>
                        <td>
                          <input type="text" value="${item.prcsNm}" readonly />
                        </td>
                        <td>
                          <input type="text" value="${item.prcsCd}" readonly />
                        </td>
                        <td>
                          <input type="date" value="<fmt:formatDate
                            value="${item.prcsDt }"
                            pattern="yyyy-MM-dd"
                          />" readonly>
                        </td>
                        <td>
                          <input
                            type="text"
                            value="${item.prcsCtnt}"
                            readonly
                          />
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
                <!-- End Table with hoverable rows -->
              </div>
            </div>
          </div>
          <div
            class="tab-pane fade"
            id="bordered-justified-profile"
            role="tabpanel"
            aria-labelledby="profile-tab"
          >
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Table with hoverable rows</h5>

                <!-- Table with hoverable rows -->
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th scope="col">완제품 코드</th>
                      <th scope="col">완제품 명</th>
                      <th scope="col">규격</th>
                      <th scope="col">단위</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${prdList}" var="prd">
                      <tr ondblclick="prcsFlow('${prd.edctsCd}')">
                        <td>${prd.edctsCd }</td>
                        <td>${prd.prdtNm }</td>
                        <td>${prd.spec }</td>
                        <td>${prd.unit }</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
                <!-- End Table with hoverable rows -->
              </div>
            </div>
            <div class="row" id="prcsFlowBodyList" style="display: none">
              <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="card">
                  <div class="card-body">
                    <div class="btnGrp">
                      <button
                        id="pFlowAdd"
                        type="button"
                        class="btn btn-primary"
                      >
                        추가
                      </button>
                      <button
                        id="pFlowDel"
                        type="button"
                        class="btn btn-primary"
                      >
                        삭제
                      </button>
                      <button
                        id="pFlowSave"
                        type="button"
                        class="btn btn-primary"
                      >
                        저장
                      </button>
                    </div>

                    <!-- Table with hoverable rows -->
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th scope="col">
                            <input type="checkbox" id="cbx_chkAll" />
                          </th>
                          <th scope="col">순서</th>
                          <th scope="col">공정코드</th>
                          <th scope="col">공정이름</th>
                          <th scope="col">공정분류</th>
                          <th scope="col">공정내용</th>
                          <th scope="col">공정날짜</th>
                        </tr>
                      </thead>
                      <tbody id="prcsFlowList"></tbody>
                    </table>
                    <!-- End Table with hoverable rows -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- End Bordered Tabs Justified -->
      </div>
    </div>

    <!-- 모달창 -->
    <!-- 자재 조회 -->
    <div
      class="modal fade"
      id="pFlowModal"
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
            <table class="table table-hover">
              <thead>
                <tr>
                  <th scope="col">공정 코드</th>
                  <th scope="col">공정 명</th>
                  <th scope="col">공정 분류</th>
                  <th scope="col">공정 내용</th>
                  <th scope="col">공정 날짜</th>
                  <th scope="col"></th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${getPrcsList }" var="getPrcs">
                  <tr>
                    <td>${getPrcs.prcsCd }</td>
                    <td>${getPrcs.prcsNm }</td>
                    <td>${getPrcs.prcsFg }</td>
                    <td>${getPrcs.prcsCtnt }</td>
                    <td>${getPrcs.prcsDt }</td>
                    <td>
                      <button class="btn btn-primary choicePrcs">선택</button>
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
  </body>
  <script>
    /* 메세지 체크 */
    $(document).ready(function () {
      //추가버튼
      $("#addrow").click(function () {
        var newRow = $('<tr class="addTr">');
        newRow.append('<td><input class="addchk" type="checkbox"></td>');
        newRow.append(
          '<td><select name="prcsFg" >' +
            '<option value="COM">COM</option>' +
            '<option value="DRY">DRY</option>' +
            '<option value="MEN">MEN</option>' +
            '<option value="SHR">SHR</option>' +
            '<option value="WRA">WRA</option>' +
            "</select></td>"
        );
        newRow.append('<td><input type="text" name="prcsNm" value=""></td>');
        newRow.append('<td><input type="text" name="prcsCd" value=""></td>');
        newRow.append(
          '<td><input type="date" name="prcsDt" value="' +
            new Date().toISOString().slice(0, 10) +
            '" readonly></td>'
        );
        newRow.append('<td><input type="text" name="prcsCtnt" value=""></td>');
        $("#processList").prepend(newRow);
      });

      //저장버튼
      $("#saveList").click(function () {
        var addArr = []; // 데이터 배열 초기화
        // 테이블 내의 각각의 행(tr)에 대해 반복문 실행
        $("#processList tr.addTr").each(function () {
          var prcsFg = $(this).find('select[name="prcsFg"]').val();
          var prcsNm = $(this).find('input[name="prcsNm"]').val();
          var prcsCd = $(this).find('input[name="prcsCd"]').val();
          var prcsDt = $(this).find('input[name="prcsDt"]').val();
          var prcsCtnt = $(this).find('input[name="prcsCtnt"]').val();
          addArr.push({
            prcsFg: prcsFg,
            prcsNm: prcsNm,
            prcsCd: prcsCd,
            prcsDt: prcsDt,
            prcsCtnt: prcsCtnt,
          });
        });

        // AJAX 호출
        $.ajax({
          type: "POST",
          url: "addPrcs",
          data: JSON.stringify(addArr),
          contentType: "application/json; charset=utf-8",
          dataType: "json",
          success: function (result) {
            // 성공적으로 처리된 경우
            console.log(result);
            $("#processList input:not([readonly])")
              .attr("readonly", true)
              .css("border", "none");
          },
          error: function (error) {
            // 오류 발생한 경우
            console.log(error);
          },
        });
      });

      $("#deleteList").click(function () {
        var checkedBoxes = $("#processList input[type=checkbox]:checked");
        if (checkedBoxes.length === 0) {
          alert("삭제할 데이터를 선택하세요.");
          return;
        }
        if (confirm("삭제하시겠습니까?")) {
          var prcsCdList = [];
          checkedBoxes.each(function () {
            var tr = $(this).closest("tr");
            prcsCdList.push(tr.find("td:eq(3) input").val());
          });
          $.ajax({
            url: "removePrcs",
            type: "POST",
            data: JSON.stringify(prcsCdList),
            contentType: "application/json",
            success: function (result) {
              checkedBoxes.each(function () {
                var tr = $(this).closest("tr");
                tr.remove();
              });
            },
            error: function (xhr, status, error) {
              console.error(error);
              alert("서버와의 통신 중 에러가 발생했습니다.");
            },
          });
        }
      });

      // 체크박스 연결
      $("#processTable").on(
        "click",
        'thead input[type="checkbox"]',
        function () {
          var isChecked = $(this).prop("checked");
          $('#processTable tbody input[type="checkbox"]').prop(
            "checked",
            isChecked
          );
        }
      );

      // tbody의 checkbox 중 하나가 체크 해제되었을 때, thead의 checkbox도 체크 해제한다.
      $("#processTable").on(
        "click",
        'tbody input[type="checkbox"]',
        function () {
          var allChecked = true;
          $('#processTable tbody input[type="checkbox"]').each(function () {
            if (!$(this).prop("checked")) {
              allChecked = false;
            }
          });
          $('#processTable thead input[type="checkbox"]').prop(
            "checked",
            allChecked
          );
        }
      );
    });

    // 공정흐름관리 tr 더블클릭하면 나옴
    function prcsFlow(edctsCd) {
      $("#prcsFlowBodyList").css("display", "");

      $.ajax({
        url: "prcsFlowList",
        method: "post",
        data: { edctsCd: edctsCd },
        success: function (result) {
          $("#prcsFlowList").empty();
          $("#prcsFlowList").append(
            $("<input>")
              .attr("value", edctsCd)
              .attr("id", "inputEdctsCd")
              .css("display", "none")
          );
          $(result).each(function (idx, item) {
            let tr = $("<tr>");

            tr.append(
              $("<td>").append(
                $("<input>").attr("type", "checkbox").attr("name", "chk")
              )
            );

            tr.append($("<td>").attr("class", "changeValue").text(item.prcsNo));
            tr.append("<td>" + item.prcsCd + "</td>");
            tr.append("<td>" + item.prcsNm + "</td>");
            tr.append("<td>" + item.prcsFg + "</td>");
            tr.append("<td>" + item.prcsCtnt + "</td>");
            tr.append("<td>" + item.prcsDt + "</td>");

            $("#prcsFlowList").append(tr);
          });
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    }

    $(document).on("click", "#home-tab", function () {
      $("#prcsFlowBodyList").css("display", "none");
    });

    // 공정흐름관리 추가버튼
    $(document).on("click", "#pFlowAdd", function () {
      let tr = $("<tr>").attr("class", "table-danger");

      tr.append(
        $("<td>").append(
          $("<input>")
            .attr("type", "checkbox")
            .attr("name", "chk")
            .prop("checked", true)
        )
      );
      tr.append(
        $("<td>").append(
          $("<input>")
            .attr("type", "number")
            .attr("class", "my-td-class")
            .css("width", "50px")
        )
      );
      tr.append(
        $("<td>").append(
          $("<button>")
            .addClass("btn btn-primary my-td-class pFlowBtn")
            .attr({
              type: "button",
              "data-bs-toggle": "modal",
              "data-bs-target": "#pFlowModal",
            })
            .append($("<i>").addClass("bi bi-search my-td-class pFlowBtn"))
        )
      );

      tr.append("<td>");
      tr.append("<td>");
      tr.append("<td>");
      tr.append("<td>");

      $("#prcsFlowList").append(tr);
    });

    // 체크박스 선택 공정흐름도
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

    // 공정 input에 넣기
    $(document).ready(function () {
      let inputprcsCd;
      let inputprcsNm;
      let inputprcsFg;
      let inputprcsCtnt;
      let inputprcsDt;

      $(document).on("click", ".pFlowBtn", function () {
        inputprcsCd = $(this).closest("tr").children().eq(2);
        inputprcsNm = $(this).closest("tr").children().eq(3);
        inputprcsFg = $(this).closest("tr").children().eq(4);
        inputprcsCtnt = $(this).closest("tr").children().eq(5);
        inputprcsDt = $(this).closest("tr").children().eq(6);
      });

      $(document).on("click", ".choicePrcs", function () {
        let isValid = true;
        let prcsCd = $(this).closest("tr").children().eq(0).text();
        let prcsNm = $(this).closest("tr").children().eq(1).text();
        let prcsFg = $(this).closest("tr").children().eq(2).text();
        let prcsCtnt = $(this).closest("tr").children().eq(3).text();
        let prcsDt = $(this).closest("tr").children().eq(4).text();

        $("#prcsFlowList")
          .children()
          .each(function (idx, item) {
            let check = $(item).children().eq(2).text();
            if (check == prcsCd) {
              Swal.fire({
                icon: "warning",
                title: "같은 공정이 있습니다.",
              });
              isValid = false;
              return;
            }
          });

        if (isValid == false) {
          $("#pFlowModal").modal("hide");
          return isValid;
        }

        inputprcsCd.text(prcsCd);
        inputprcsNm.text(prcsNm);
        inputprcsFg.text(prcsFg);
        inputprcsCtnt.text(prcsCtnt);
        inputprcsDt.text(prcsDt);

        $("#pFlowModal").modal("hide"); // 모달 닫기
      });
    });

    // 공정 저장
    $(document).on("click", "#pFlowSave", function () {
      let valueArr = [];
      $('input[name="chk"]:checked').each(function (idx, item) {
        console.log(item);
        let prcsNo = $(item).closest("tr").children().eq(1).find("input").val();
        let edctsCd = $("#inputEdctsCd").val();
        let prcsCd = $(item).closest("tr").children().eq(2).text();

        let dataObj = {
          prcsNo: parseInt(prcsNo),
          edctsCd: edctsCd,
          prcsCd: prcsCd,
        };

        valueArr.push(dataObj);
      });
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
              url: "savePrcs",
              method: "post",
              headers: { "Content-Type": "application/json" },
              data: JSON.stringify(valueArr),
              success: function (result) {
                $("#prcsFlowList").empty();
                $("#prcsFlowList").append(
                  $("<input>")
                    .attr("value", result[0].edctsCd)
                    .attr("id", "inputEdctsCd")
                    .css("display", "none")
                );
                $(result).each(function (idx, item) {
                  let tr = $("<tr>");

                  tr.append(
                    $("<td>").append(
                      $("<input>").attr("type", "checkbox").attr("name", "chk")
                    )
                  );

                  tr.append(
                    $("<td>").attr("class", "changeValue").text(item.prcsNo)
                  );
                  tr.append("<td>" + item.prcsCd + "</td>");
                  tr.append("<td>" + item.prcsNm + "</td>");
                  tr.append("<td>" + item.prcsFg + "</td>");
                  tr.append("<td>" + item.prcsCtnt + "</td>");
                  tr.append("<td>" + item.prcsDt + "</td>");

                  $("#prcsFlowList").append(tr);
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
    $(document).on("dblclick", "#prcsFlowList tr", function () {
      let currentRow = $(this);
      currentRow.attr("class", "table-danger");
      currentRow.children().eq(0).find("input").prop("checked", true);
      currentRow.find(".changeValue").each(function () {
        let currentValue = $(this).text().trim();
        let input = $("<input>")
          .attr("type", "number")
          .attr("class", "my-td-class")
          .css("width", "50px")
          .val(currentValue);
        $(this).empty().append(input);
      });
    });

    // 공정 삭제
    $(document).on("click", "#pFlowDel", function () {
      let valueArr = [];
      $('input[name="chk"]:checked').each(function (idx, item) {
        console.log(item);
        let edctsCd = $("#inputEdctsCd").val();
        let prcsCd = $(item).closest("tr").children().eq(2).text();

        let dataObj = {
          edctsCd: edctsCd,
          prcsCd: prcsCd,
        };

        valueArr.push(dataObj);
      });

      console.log(valueArr);
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
              url: "prcsFlowDel",
              method: "post",
              headers: { "Content-Type": "application/json" },
              data: JSON.stringify(valueArr),
              success: function (result) {
                $("#prcsFlowList").empty();
                $("#prcsFlowList").append(
                  $("<input>")
                    .attr("value", result[0].edctsCd)
                    .attr("id", "inputEdctsCd")
                    .css("display", "none")
                );
                $(result).each(function (idx, item) {
                  let tr = $("<tr>");

                  tr.append(
                    $("<td>").append(
                      $("<input>").attr("type", "checkbox").attr("name", "chk")
                    )
                  );

                  tr.append(
                    $("<td>").attr("class", "changeValue").text(item.prcsNo)
                  );
                  tr.append("<td>" + item.prcsCd + "</td>");
                  tr.append("<td>" + item.prcsNm + "</td>");
                  tr.append("<td>" + item.prcsFg + "</td>");
                  tr.append("<td>" + item.prcsCtnt + "</td>");
                  tr.append("<td>" + item.prcsDt + "</td>");

                  $("#prcsFlowList").append(tr);
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
      }
    });
  </script>
</html>
