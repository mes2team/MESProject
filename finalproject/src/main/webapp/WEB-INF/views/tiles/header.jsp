<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%-- 
<ul class="nav justify-content-center">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/empList">게시판</a>
  </li>
  <sec:authorize access="hasRole('ROLE_ADMIN')">
	  <li class="nav-item">
	    <a class="nav-link active" href="${pageContext.request.contextPath }/empInsert">게시글 등록</a>
	  </li>
  </sec:authorize>
  <li class="nav-item">
    <a class="nav-link active" href="${pageContext.request.contextPath }/logout">로그아웃</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled">Disabled</a>
  </li>
</ul>
 --%>


<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">


	<div class="d-flex align-items-center justify-content-between">
		<a href="index.html" class="logo d-flex align-items-center"> <img
			src="${pageContext.request.contextPath}/resources/assets/img/고양이 로고.png"
			alt=""> <span class="d-none d-lg-block">미르야냥냥해봐</span>
		</a> <i class="bi bi-list toggle-sidebar-btn"></i>
	</div>
	<!-- End Logo -->



	<nav class="header-nav ms-auto">
		<ul class="d-flex align-items-center">

			<li class="nav-item dropdown pe-3"><a
				class="nav-link nav-profile d-flex align-items-center pe-0" href="#"
				data-bs-toggle="dropdown"> <i class="bi bi-power"></i>
			</a>
			<!-- End Profile Iamge Icon -->

				<ul
					class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">

					<li><a class="dropdown-item d-flex align-items-center"
						href="users-profile.html"> <i class="bi bi-person"></i> <span>My
								Profile</span>
					</a></li>
					<li>
						<hr class="dropdown-divider">
					</li>

					<li><a class="dropdown-item d-flex align-items-center"
						href="users-profile.html"> <i class="bi bi-gear"></i> <span>Account
								Settings</span>
					</a></li>
					<li>
						<hr class="dropdown-divider">
					</li>

					<li><a class="dropdown-item d-flex align-items-center"
						href="pages-faq.html"> <i class="bi bi-question-circle"></i> <span>Need
								Help?</span>
					</a></li>
					<li>
						<hr class="dropdown-divider">
					</li>

					<li><a class="dropdown-item d-flex align-items-center"
						href="#"> <i class="bi bi-box-arrow-right"></i> <span>Sign
								Out</span>
					</a></li>

				</ul>
				<!-- End Profile Dropdown Items --></li>
			<!-- End Profile Nav -->

		</ul>
	</nav>
	<!-- End Icons Navigation -->

</header>
<!-- End Header -->