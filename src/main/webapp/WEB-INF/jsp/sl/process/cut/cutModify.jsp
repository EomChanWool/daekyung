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
                        <!-- Nav analyManage - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="btn_bottom_wrap">
                    	<h1 class="h3 mb-2 text-gray-800" style="display: inline-block;">절단공정 수정</h1>
                    	
                    </div>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/process/cutProcess/modifyCutOk.do" name="modifyForm" method="post">
                            	<input type="hidden" name="orId" value="${cutVO.orId}">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>수주번호 <span class="req">*</span></th>
												<td><span class="form-control val-area">${cutVO.orId}</span></td>
												<th>공정번호 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="mpMfno" id="mpMfno" value="${cutVO.mpMfno}"></td>
											</tr>
											<tr>
											<th>품명</th>
											<td><input type="text" class="form-control" name="mpProdName" id="mpProdName" value="${cutVO.mpProdName}"></td>
											<th>재질</th>
											<td><input type="text" class="form-control" name="mpTexture" id="mpTexture" value="${cutVO.mpTexture}"></td>
											</tr>
											<tr>
											<th>두께</th>
											<td><input type="text" class="form-control" name="mpThickness" id="mpThickness" value="${cutVO.mpThickness}"></td>
											<th>상태</th>
											<td><input type="text" class="form-control" name="mpState" id="mpState" value="${cutVO.mpState}"></td>
											</tr>
											<tr>
											<th>규격</th>
											<td><input type="text" class="form-control" name="mpStandard" id="mpStandard" value="${cutVO.mpStandard}"></td>
											<th>로트번호</th>
											<td><span class="form-control val-area">${cutVO.poLotno}</span></td>
											</tr>
											<tr>
											<th>생산량</th>
											<td><input type="text" class="form-control" name="mpQty" id="mpQty" value="${cutVO.mpQty}"></td>
											<th>비고</th>
											<td><input type="text" class="form-control" name="mpNote" id="mpNote" value="${cutVO.mpNote}"></td>
											</tr>
											
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_modify_cut()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/process/cutProcess/cutList.do'">취소</span>
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
	function fn_modify_cut(){
	

		
		
		if($('#mpMfno').val() == ''){
			alert("공정번호를 확인 바랍니다.");
			return;
		}
		if($('#mpQty').val() == ''){
			alert("생산량을 확인 바랍니다.");
			return;
		}

		modifyForm.submit();
	}
	
	
	
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