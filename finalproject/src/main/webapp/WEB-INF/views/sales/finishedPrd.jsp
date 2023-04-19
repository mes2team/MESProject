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
    <div class="row">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="page-header">
          <h2 class="pageheader-title">완제품LOT 조회</h2>
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">완제품LOT 조회</h5>
        <!-- Multi Columns Form -->
        <form class="row g-3">
          <div class="col-md-4">
            <label class="form-label">제품 명</label>
            <input type="text" class="form-control" id="inputName" />
          </div>
          <div class="text-center">
            <button type="button" class="btn btn-primary" id="searchBtn">
              검색
            </button>
            <button type="button" class="btn btn-secondary" id="resetBtn">
              초기화
            </button>
          </div>
        </form>
      </div>
    </div>
    <div class="row">
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
                    <th>No.</th>
                    <th>제품 LOT번호</th>
                    <th>제품 명</th>
                    <th>규격</th>
                    <th>단위</th>
                    <th>제품 수량</th>
                    <th>입고 일자</th>
                    <th>유통 기한</th>
                  </tr>
                </thead>
                <tbody id="PrdList">
                  <c:forEach
                    items="${finishedPrdList }"
                    var="prdList"
                    varStatus="loop"
                  >
                    <tr>
                      <td>${loop.count }</td>
                      <td>${prdList.edctsLotNo }</td>
                      <td>${prdList.prdtNm }</td>
                      <td>${prdList.spec }</td>
                      <td>${prdList.unit }</td>
                      <td>${prdList.edctsLotCnt }</td>
                      <td><fmt:formatDate
                          value="${prdList.edctsIstDt }"
                          pattern="yyyy-MM-dd"
                        /></td>
                      <td><fmt:formatDate
                          value="${prdList.edctsExpire }"
                          pattern="yyyy-MM-dd"
                        /></td>
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

  <script>
    // 검색버튼
    $(document).on("click", "#searchBtn", function () {
      let prdtNm = $("#inputName").val();

      if (prdtNm == "") {
        Swal.fire({
          icon: "warning",
          title: "상품을 입력해주세요",
        });
        return;
      }
      $.ajax({
        url: "searchFinishedPrd",
        data: { prdtNm: prdtNm },
        success: function (result) {
          if (result.length == 0) {
            Swal.fire({
              icon: "warning",
              title: "검색 결과가 없습니다.",
            });
            return;
          }
          $("#PrdList").empty();
          $(result).each(function (idx, item) {
            let tr = $("<tr>");

            tr.append("<td>" + (idx + 1) + "</td>");
            tr.append("<td>" + item.edctsLotNo + "</td>");
            tr.append("<td>" + item.prdtNm + "</td>");
            tr.append("<td>" + item.spec + "</td>");
            tr.append("<td>" + item.unit + "</td>");
            tr.append("<td>" + item.edctsLotCnt + "</td>");

            $("#PrdList").append(tr);
          });
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    });

    // 리셋버튼
    $(document).on("click", "#resetBtn", function () {
      $("#inputName").val("");
    });

    // 엔터키를 눌렀을 때 검색 버튼 클릭 이벤트 실행
    $("#inputName").on("keypress", function (event) {
      if (event.which === 13) {
        event.preventDefault();
        $("#searchBtn").click();
      }
    });
  </script>
</body>
