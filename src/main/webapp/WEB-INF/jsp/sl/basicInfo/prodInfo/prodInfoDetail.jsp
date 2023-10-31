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
                        <!-- Nav collect - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">제품정보 상세</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable">
                                    <tbody>
										<tr>
											<th>제품코드</th>
											<td><span class="form-control val-area">${prodInfoVO.piId}</span></td>
											<th>구분</th>
											<td><span class="form-control val-area">${prodInfoVO.piItemType}</span></td>
										</tr>
										<tr>
											<th>재질</th>
											<td><span class="form-control val-area">${prodInfoVO.piItemTexture}</span></td>
											<th>규격</th>
											<td><span class="form-control val-area">${prodInfoVO.piItemStandard}</span></td>
											
										</tr>
										<tr>
											<th>두께</th>
											<td><span class="form-control val-area">${prodInfoVO.piItemThickness}</span></td>
											<th>길이</th>
											<td><span class="form-control val-area">${prodInfoVO.piItemLong}</span></td>
											
										</tr>
										<tr>
											<th>제품명</th>
											<td><span class="form-control val-area">${prodInfoVO.piItemName}</span></td>
											<th>히트</th>
											<td><span class="form-control val-area">${prodInfoVO.piItemHeat}</span></td>
											
										</tr>
										<tr>
											<th>단가</th>
											<td><span class="form-control val-area" id="piPrice">${prodInfoVO.piItemUnit}</span></td>
											<th>단중</th>
											<td><span class="form-control val-area">${prodInfoVO.piMiddle}</span></td>
										</tr>
										<tr>
											<th>수량</th>
											<td><span class="form-control val-area">${prodInfoVO.piRemainQty}</span></td>
											<th>중량</th>
											<td><span class="form-control val-area">${prodInfoVO.piRemainKg}</span></td>
										</tr>
										<tr>
											<th>등록일</th>
											<td>
												<span class="form-control val-area">
													<fmt:formatDate value="${prodInfoVO.piRegDate}" pattern="yyyy-MM-dd HH:mm"/> 
												</span>
											</td>
										</tr>
										
									</tbody>
                                </table>
                                <div class="btn_bottom_wrap">
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/basicInfo/prodInfo/prodInfoList.do'">목록</span>
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
		$('#basicInfoMenu').addClass("active");
		$('#basicInfo').addClass("show");
		$('#prodInfoList').addClass("active");
		let piPrice = $('#piPrice').text().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$('#piPrice').text(piPrice);
	});
	</script>
</body>

</html>