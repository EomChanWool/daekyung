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
                        <!-- Nav FailReport - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">고장신고 상세</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable">
                                    <tbody>
										<tr>
											<th>신고ID</th>
											<td><span class="form-control val-area">${failReportVO.trId}</span></td>
											<th>고장구분</th>
											<td><span class="form-control val-area">${failReportVO.trType}</span></td>
										</tr>
										<tr>
											<th>신고일자</th>
											<td>
												<span class="form-control val-area">
													<fmt:formatDate value="${failReportVO.trDate}" pattern="yyyy-MM-dd"/> 
												</span>
											</td>
											<th>처리여부</th>
											<td><span class="form-control val-area"><c:if test="${failReportVO.trIscomp eq 0}">O</c:if>
	                                            	<c:if test="${failReportVO.trIscomp eq 1}">X</c:if></span></td>
										</tr>
										<tr>
											<th>등록ID</th>
											<td><span class="form-control val-area">${failReportVO.trRegId}</span></td>
											<th>등록일</th>
											<td>
												<span class="form-control val-area">
													<fmt:formatDate value="${failReportVO.trRegDate}" pattern="yyyy-MM-dd HH:mm"/> 
												</span>
											</td>
										</tr>
										<c:if test="${not empty failReportVO.trEdtId}">
										<tr>
											<th>수정ID</th>
											<td><span class="form-control val-area">${failReportVO.trEdtId}</span></td>
											<th>수정일</th>
											<td>
												<span class="form-control val-area">
													<fmt:formatDate value="${failReportVO.trEdtDate}" pattern="yyyy-MM-dd HH:mm"/> 
												</span>
											</td>
										</tr>
										</c:if>
										<tr>
											<th>설비ID</th>
											<td><span class="form-control val-area">${failReportVO.eqId}</span></td>
											<th>설비구분</th>
											<td><span class="form-control val-area">${failReportVO.eqType}</span></td>
										</tr>
										<tr>
											
										</tr>
										<tr>
											<th>설비명</th>
											<td><span class="form-control val-area">${failReportVO.eqName}</span></td>
										</tr>
										<tr>
											<th>센서ID</th>
											<td><span class="form-control val-area">${failReportVO.eqSensorid}</span></td>
											<th>설치장소</th>
											<td><span class="form-control val-area">${failReportVO.eqPlace}</span></td>
										</tr>
										<tr>
											<th>설비상태</th>
											<td><span class="form-control val-area">${failReportVO.eqOpState}</span></td>
											<th>사용여부</th>
											<td><span class="form-control val-area">${failReportVO.eqIsuse}</span></td>
										</tr>
										<tr>
										<th>고장내용</th>
										<td colspan="3"><textArea disabled="disabled">${failReportVO.trComment}</textArea></td>
									</tr>
									</tbody>
                                </table>
                                <div class="btn_bottom_wrap">
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/facility/failReport/failReportList.do'">목록</span>
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
		$('#facilityMenu').addClass("active");
		$('#facility').addClass("show");
		$('#failReportList').addClass("active");
	});
	</script>
</body>

</html>