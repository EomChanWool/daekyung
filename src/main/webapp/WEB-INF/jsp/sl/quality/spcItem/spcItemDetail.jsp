<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../../header.jsp" %>
<style>
	.table th{
		padding-top: 1.3rem;
	}
	
	.val-area{
		text-align: left;
	}
</style>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <!-- Side Menu Section -->
			<%@ include file="../../menu/sideMenu.jsp" %>
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Nav income - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">입고 상세</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable">
                                    <tbody>
										<tr>
											<th>거래처명</th>
											<td><span class="form-control val-area">${incomeVO.aName}</span></td>
											<th>거래처연락처</th>
											<td><span class="form-control val-area">${incomeVO.aTel}</span></td>
										</tr>
										<tr>
											<th>품명</th>
											<td><span class="form-control val-area">${incomeVO.itemName}</span></td>
											<th>규격</th>
											<td><span class="form-control val-area">${incomeVO.itemStd}</span></td>
										</tr>
										<tr>
											<th>수량</th>
											<td><span class="form-control val-area">${incomeVO.stCnt}</span></td>
											<th>적재위치</th>
											<td><span class="form-control val-area">${incomeVO.pInsPosition}</span></td>
										</tr>
										<tr>
											<th>입고일</th>
											<td><span class="form-control val-area">${incomeVO.stDte}</span></td>
											<th>검사일</th>
											<td><span class="form-control val-area">${incomeVO.stInsDte}</span></td>
										</tr>
										<tr>
											<th>종합판정</th>
											<td colspan="3"><span class="form-control val-area">${incomeVO.stTotJudge}</span></td>
										</tr>
										<tr>
											<th>특이사항</th>
											<td colspan="3"><textarea name="stNote" disabled="disabled">${incomeVO.stNote}</textarea></td>
										</tr>
										<tr>
											<th>등록자</th>
											<td><span class="form-control val-area">${incomeVO.stRegMem} (${incomeVO.mName})</span></td>
											<th>등록일</th>
											<td><span class="form-control val-area">${incomeVO.stRegDte}</span></td>
										</tr>
									</tbody>
                                </table>
                                <div class="btn_bottom_wrap">
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/material/income/incomeList.do'">목록</span>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <%@ include file="../../menu/footer/footer.jsp" %>
            <!-- End of Footer -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <%@ include file="../../menu/logout/logout_alert.jsp" %>
    
    <!-- Bootstrap core JavaScript-->
    <script src="/resources/conf/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/conf/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    <!-- Core plugin JavaScript-->
    <script src="/resources/conf/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>

	<script>
	$(function() {
		$('#materialMenu').addClass("active");
		$('#material').addClass("show");
		$('#incomeList').addClass("active");
	});
	</script>
</body>

</html>