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
                        <!-- Nav member - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">납품 수정</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/collectInfo/vision/modifyVisionOk.do" name="modifyForm" method="post">
                            		<input type="hidden" name="idId" id="idId" value="${visionVO.idId}">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>로트번호  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="poLotno" id="poLotno" value="${visionVO.poLotno}" readonly/>
												</td>
												<th>문서이름  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="idDoc" id="idDoc" value="${visionVO.idDoc}" readonly/></td>
											</tr>
											<tr>
												<th>품목코드  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="idProdName" id="idProdName" value="${visionVO.idProdName}" readonly/></td>
												<th>품목명</th>
												<td><input type="text" class="form-control" name="idName" id="idName" value="${visionVO.idName}" readonly/></td>
											</tr>
											<tr>
												<th>수주번호</th>
												<td><input type="text" class="form-control" name="orId" id="orId" value="${visionVO.orId}" readonly/></td>
												<th>공정번호</th>
												<td><input type="text" class="form-control" name="idMfno" id="idMfno" value="${visionVO.idMfno}" readonly/></td>
											</tr>
											<tr>
												<th>검사일</th>
												<td><input type="date" class="form-control" name="idTestTime" id="idTestTime" value="${visionVO.idTestTime}" readonly/></td>
												<th>확인일</th>
												<td><input type="date" class="form-control" name="idCheckTime" id="idCheckTime" value="${visionVO.idCheckTime}"/></td>
											</tr>
											
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_modify_delivery()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/collectInfo/vision/visionList.do'">취소</span>
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
	function fn_modify_delivery(){
		
		
		modifyForm.submit();
	}
	
	$(function() {
		$('#collectInfoMenu').addClass("active");
		$('#collectInfo').addClass("show");
		$('#visionList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
		
	});
	</script>
</body>

</html>