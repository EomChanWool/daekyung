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
                        <!-- Nav document - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">성능시험관리 수정</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/process/checkPr/modifyPerformanceOk.do" name="modifyForm" method="post">
                            	<input type="hidden" name="ptId" value="${detail.ptId}">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>로트번호 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="ptLotno" id="ptLotno" value="${detail.ptLotno}" readonly></td>
												<th>수주번호 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="orId" id="orId" value="${detail.orId}" readonly></td>
											</tr>
											<tr>
												<th>제품명 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="ptProdName" id="ptProdName" value="${detail.ptProdName}" readonly></td>
												<th>검사일<span class="req">*</span></th>
												<td><input type="date" class="form-control" name="ptInsDate" id="ptInsDate" value="${detail.ptInsDate}"></td>
											</tr>
											<tr>
												<th>가공수량 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="ptQty" id="ptQty" value="${detail.ptQty}" readonly></td>
												<th>불량수량 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="ptBadQty" id="ptBadQty" value="${detail.ptBadQty}"></td>
											</tr>
											<tr>
												<th>등록자 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="ptRegId" id="ptRegId" value="${detail.ptRegId}"></td>
											</tr>
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_regist_document()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/process/checkPr/performanceList.do'">취소</span>
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
	function fn_regist_document(){
		if($('#ptBadQty').val() == ''){
			alert("불량수량을 확인 바랍니다.");
			return;
		}
		modifyForm.submit();
	}
	
	

	
	$(function() {
		$('#processMenu').addClass("active");
		$('#process').addClass("show");
		$('#performanceList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
	});
	</script>
</body>

</html>