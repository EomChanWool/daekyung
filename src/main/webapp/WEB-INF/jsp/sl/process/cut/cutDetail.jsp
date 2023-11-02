<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../../header.jsp"%>
<style>
.table th {
	padding-top: 1.3rem;
}

.val-area {
	text-align: left;
}

.modal-content {
	position: relative;
	margin-left: 250px;
	flex-direction: column;
	width: 60%;
	pointer-events: auto;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid rgba(0, 0, 0, .2);
	border-radius: 0.3rem;
	outline: 0;
}

.background-wrap {
	background-image:
		url('/resources/conf/images/label.png');
	background-size: 450px 600px;
	width: 450px;
	height: 600px;
	/* display: block; */
	justify-content: center;
	align-items: center;
}

.content {
	/* display: block; */
	flex-direction: column;
	margin-top: 6px;
	padding-top: 6px;

}

.content span {
	color: black;
	
}



.content span:nth-child(1) {
	font-size: 14px;
	font-weight: bold;
}

.content span:nth-child(2) {

	font-size: 14px;

}


@media print {
	body {
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh;
		-webkit-print-color-adjust:exact;
	}
}
</style>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">
			<!-- Side Menu Section -->
			<%@ include file="../../menu/sideMenu.jsp"%>
		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<!-- Sidebar Toggle (Topbar) -->
					<form class="form-inline">
						<button id="sidebarToggleTop"
							class="btn btn-link d-md-none rounded-circle mr-3">
							<i class="fa fa-bars"></i>
						</button>
					</form>
					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">
						<!-- Nav collect - User Information -->
						<%@ include file="../../menu/logout/nav_user.jsp"%>
					</ul>
				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<div class="btn_bottom_wrap">
						<h1 class="h3 mb-2 text-gray-800" style="display: inline-block;">절단공정 상세
							</h1>
						
					</div>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable">
									<tbody>
										<tr>
											<th>공정번호</th>
											<td><span class="form-control val-area">${cutVO.cpCutno}</span></td>
											<th>설비</th>
											<td><span class="form-control val-area">${cutVO.eqId}</span></td>
										</tr>
										<tr>
											<th>로트번호</th>
											<td><span class="form-control val-area">${cutVO.poLotno}</span></td>
											<th>타입</th>
											<td><span class="form-control val-area">${cutVO.piItemType}</span></td>
										</tr>
										<tr>
											<th>작업시작일</th>
											<td><span class="form-control val-area">${cutVO.cpStarttime}</span></td>
											<th>작업종료일</th>
											<td><span class="form-control val-area">${cutVO.cpEndtime}</span></td>
										</tr>
										<tr>
											<th>절단수량</th>
											<td><span class="form-control val-area">${cutVO.cpCutQty}</span></td>
											<th>불량수량</th>
											<td><span class="form-control val-area">${cutVO.cpBadQty}</span></td>
										</tr>
										<tr>
											<th>등록자</th>
											<td><span class="form-control val-area">${cutVO.cpRegId}</span></td>
											<th>등록일</th>
											<td><span class="form-control val-area">${cutVO.cpRegDate}</span></td>
										</tr>
										<c:if test="${not empty cutVO.cpEdtId}">
										<tr>
											<th>수정자</th>
											<td><span class="form-control val-area">${cutVO.cpEdtId}</span></td>
											<th>수정일</th>
											<td><span class="form-control val-area">${cutVO.cpEdtDate}</span></td>
										</tr>
										
										</c:if>

									</tbody>
								</table>
								<div class="btn_bottom_wrap">
									<span class="btn_cancel"
										onclick="location.href='${pageContext.request.contextPath}/sl/process/cutProcess/cutList.do'">목록</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<%@ include file="../../menu/footer/footer.jsp"%>
			<!-- End of Footer -->
		</div>
		<!-- End of Content Wrapper -->
	

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<%@ include file="../../menu/logout/logout_alert.jsp"%>

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/conf/vendor/jquery/jquery.min.js"></script>
	<script
		src="/resources/conf/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/conf/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>

	<script>
		

		$(function() {
			$('#processMenu').addClass("active");
			$('#process').addClass("show");
			$('#cutList').addClass("active");
			
			let msg = '${msg}';
			if(msg) {
				alert(msg);
			}
		});
	</script>

</body>

</html>