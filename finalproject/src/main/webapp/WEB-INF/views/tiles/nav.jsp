<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="index.html">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>기준관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath }/vendList">
              <i class="bi bi-circle"></i><span>거래처 관리</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath }/bomMag">
              <i class="bi bi-circle"></i><span>BOM 관리</span>
            </a>
          </li>
        </ul>
      </li><!-- End Components Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>영업관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath }/orderMag">
              <i class="bi bi-circle"></i><span>주문서 관리</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath }/edctsIst">
              <i class="bi bi-circle"></i><span>제품 입고 관리</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath }/edctsOust">
              <i class="bi bi-circle"></i><span>제품 출고 관리</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath }/finishedPrd">
              <i class="bi bi-circle"></i><span>완제품 조회</span>
            </a>
          </li>
        </ul>
      </li><!-- End Forms Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>생산관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath}/productionPlan">
              <i class="bi bi-circle"></i><span>생산계획</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/productionOrder">
              <i class="bi bi-circle"></i><span>생산지시</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/productionResult">
              <i class="bi bi-circle"></i><span>공정실적</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/processManage">
              <i class="bi bi-circle"></i><span>공정흐름</span>
            </a>
          </li>
        </ul>
      </li><!-- End Tables Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-bar-chart"></i><span>설비관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="eqm">
              <i class="bi bi-circle"></i><span>설비관리</span>
            </a>
          </li>
          <li>
            <a href="eqmCheck">
              <i class="bi bi-circle"></i><span>설비점검</span>
            </a>
          </li>
          <li>
            <a href="eqmOpr">
              <i class="bi bi-circle"></i><span>비가동관리</span>
            </a>
          </li>
        </ul>
      </li><!-- End Charts Nav -->
      
            <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#abc-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-bar-chart"></i><span>자재관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="abc-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath }/matList">
              <i class="bi bi-circle"></i><span>자재정보</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath }/matOrder">
              <i class="bi bi-circle"></i><span>자재발주</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath }/matCheck">
              <i class="bi bi-circle"></i><span>자재검사</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath }/matReceipt">
              <i class="bi bi-circle"></i><span>자재입고</span>
            </a>
          </li>
        </ul>
      </li><!-- End Charts Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-gem"></i><span>품질관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath }/prcsInsp">
              <i class="bi bi-circle"></i><span>공정검사관리</span>
            </a>
          </li>
          <li>
            <a href="icons-remix.html">
              <i class="bi bi-circle"></i><span>Remix Icons</span>
            </a>
          </li>
          <li>
            <a href="icons-boxicons.html">
              <i class="bi bi-circle"></i><span>Boxicons</span>
            </a>
          </li>
        </ul>
      </li><!-- End Icons Nav -->
    </ul>
  </aside><!-- End Sidebar-->