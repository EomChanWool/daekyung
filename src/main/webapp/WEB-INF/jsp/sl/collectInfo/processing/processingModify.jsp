<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../../header.jsp" %>
<style>
	.table th{
		padding-top: 1.3rem;
	}
	
	.cnt{
		text-align: center;
	}
	
	.perPrice{
		text-align: right;
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
                        <!-- Nav orders - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">수주 수정</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/collectInfo/processing/modifyProcessingOk.do" name="modifyForm" method="post">
                            		<input type="hidden" name="mflIdx" value="${info.mflIdx}">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>수주번호  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="orId" id="orName" value="${info.orId}" readonly/></td>
												<th>작업자  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="mflManager" id="mflManager" value="${info.mflManager}"/></td>
											</tr>
											<tr>
												<th>로트번호  <span class="req">*</span></th>
												<td><input type="text" class="form-control" value="${info.poLotno}" readonly/></td>
												<th>품명  <span class="req">*</span></th>
												<td><input type="text" class="form-control" value="${info.mpProdName},${info.mpTexture},${info.mpThickness},${info.mpState},${info.mpStandard}" readonly/></td>
											</tr>
											<tr>
												<th>수량  <span class="req">*</span></th>
												<td><input type="text" class="form-control" value="${info.mpQty}" readonly/></td>
											</tr>
											<tr>
												<th>시작시간  <span class="req">*</span></th>
												<td><input type="datetime-local" class="form-control" name="mflStDate" id="mflStDate" value="${info.mflStDate}"/></td>
												<th>끝난시간  <span class="req">*</span></th>
												<td><input type="datetime-local" class="form-control" name="mflEdDate" id="mflEdDate" value="${info.mflEdDate}"/></td>
											</tr>
											
										</tbody>
	                                </table>
	                              
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_modify_orders()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/collectInfo/processing/processingList.do'">취소</span>
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
	function fn_modify_orders(){
		
		modifyForm.submit();
	}
	
	$(function() {
		
		$('#collectInfoMenu').addClass("active");
		$('#collectInfo').addClass("show");
		$('#processingList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
	});
	
	
	</script>
</body>

</html>