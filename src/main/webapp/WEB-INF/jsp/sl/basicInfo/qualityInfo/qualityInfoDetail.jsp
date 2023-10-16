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
                        <!-- Nav FacMaster - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">품질정보 상세</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable">
                                    <tbody>
										<tr>
											<th>관리항목그룹코드</th>
											<td><span class="form-control val-area">${detail.giGroupcode}</span></td>
											<th>관리항목명</th>
											<td><span class="form-control val-area">${detail.qiName}</span></td>
										</tr>
										<tr>
											<th>신뢰성구분</th>
											<c:if test="${detail.qiTrustType eq 1}">
											<td><span class="form-control val-area">KS</span></td></c:if>
											<c:if test="${detail.qiTrustType eq 2}">
											<td><span class="form-control val-area">JIS</span></td></c:if>
											<c:if test="${detail.qiTrustType eq 3}">
											<td><span class="form-control val-area">ASME</span></td></c:if>
											<th>정성/정량구분</th>
											<c:if test="${detail.qiType eq 1}">
											<td><span class="form-control val-area">정성</span></td></c:if>
											<c:if test="${detail.qiType eq 2}">
											<td><span class="form-control val-area">정량</span></td></c:if>
										</tr>
										<tr>
											<th>사용여부</th>
											<c:if test="${detail.qiIsuse eq 1}">
											<td><span class="form-control val-area">사용</span></td></c:if>
											<c:if test="${detail.qiIsuse eq 0}">
											<td><span class="form-control val-area">미사용</span></td></c:if>
											
										</tr>
										<tr>
											<th>등록ID</th>
											<td><span class="form-control val-area">${detail.qiRegId}</span></td>
											<th>등록일</th>
											<td>
												<span class="form-control val-area">
													<fmt:formatDate value="${detail.qiRegDate}" pattern="yyyy-MM-dd HH:mm"/> 
												</span>
											</td>
										</tr>
										<c:if test="${not empty detail.qiEdtId}">
										<tr>
											<th>수정ID</th>
											<td><span class="form-control val-area">${detail.qiEdtId}</span></td>
											<th>수정일</th>
											<td>
												<span class="form-control val-area">
													<fmt:formatDate value="${detail.qiEdtDate}" pattern="yyyy-MM-dd HH:mm"/> 
												</span>
											</td>
										</tr>
										</c:if>
										<c:if test="${not empty detail.qiComment}">
										<tr>
											<th>부적합내용</th>
											<td colspan="3"><textarea disabled="disabled">${detail.qiComment}</textarea></td>
										</tr>
										</c:if>
										<c:if test="${not empty detail.qiRemark}">
										<tr>
											<th>비고</th>
											<td colspan="3"><textarea disabled="disabled">${detail.qiRemark}</textarea></td>
										</tr>
										</c:if>
									</tbody>
                                </table>
                                <div class="btn_bottom_wrap">
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/basicInfo/qualityInfo/qualityInfoList.do'">목록</span>
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
		$('#qualityInfoList').addClass("active");
	});
	</script>
</body>

</html>