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
                    	<h1 class="h3 mb-2 text-gray-800" style="display: inline-block;">가공공정 등록</h1>
                    	
                    </div>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/process/manufacture/registManufactureOk.do" name="registForm" method="post">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>수주번호 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="orId" id="orId"></td>
												<th>가공공정번호 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="mpMfno" id="mpMfno" ></td>
											</tr>
											<tr>
											<th>품명</th>
											<td><input type="text" class="form-control" name="mpProdName" id="mpProdName"></td>
											<th>일자</th>
											<td><input type="datetime-local" class="form-control" name="mpRegDate" id="mpRegDate" ></td>
											</tr>
											<tr>
											<th>재질</th>
											<td><input type="text" class="form-control" name="mpTexture" id="mpTexture" ></td>
											<th>두께</th>
											<td><input type="text" class="form-control" name="mpThickness" id="mpThickness" ></td>
											</tr>
											<tr>
											<th>상태</th>
											<td><input type="text" class="form-control" name="mpState" id="mpState"></td>
											<th>규격</th>
											<td><input type="text" class="form-control" name="mpStandard" id="mpStandard"></td>
											</tr>
											<tr>
											<th>로트번호</th>
											<td><input type="text" class="form-control" name="poLotno" id="poLotno"></td>
											<th>생산량</th>
											<td><input type="text" class="form-control" name="mpQty" id="mpQty"></td>
											</tr>
											
											<tr>
												<th>비고</th>
												<td colspan="3"><textarea name="mpNote"></textarea></td>
											</tr>
											
											
											
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_regist_mf()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/process/manufacture/manufactureList.do'">취소</span>
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
	function fn_regist_mf(){
		
		var regex = /^\d{16}$/;
		var num =  /^[0-9.]+$/;

		
		/*  if(!regex.test($('#orId').val())){
	 			alert("수주번호형식을 확인해주세요.");
				return;
	 		} */
		 
		if($('#orId').val() == ''){
			alert("수주번호를 확인 바랍니다.");
			return;
		}
		
		
		
		if($('#mpMfno').val() == ''){
			alert("가공공정번호를 확인 바랍니다.");
			return;
		}
		
		if($('#mpProdName').val() == ''){
			alert("품명을 확인 바랍니다.");
			return;
		}
		
		
		if($('#mpRegDate').val() == ''){
			alert("일자를 확인 바랍니다.");
			return;
		}
		if($('#mpTexture').val() == ''){
			alert("재질을 확인 바랍니다.");
			return;
		}
		if($('#mpThickness').val() == ''){
			alert("두께를 확인 바랍니다.");
			return;
		}
		
		if($('#mpStandard').val() == ''){
			alert("규격을 확인 바랍니다.");
			return;
		}
		
		if($('#mpState').val() == ''){
			alert("상태를 확인 바랍니다.");
			return;
		}
		
		if($('#poLotno').val() == ''){
			alert("로트번호를 확인 바랍니다.");
			return;
		}
		
		if($('#mpQty').val() == ''){
			alert("수량을 확인 바랍니다.");
			return;
		}
		if(!num.test($('#mpQty').val())){
 			alert("수량은 숫자만 입력가능합니다.");
			return;
 		}
		
		registForm.submit();
	}
	
	
	
	$(function() {
		$('#processMenu').addClass("active");
		$('#process').addClass("show");
		$('#manufactureList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
		
		
		
		
	});
	

	
	
	</script>
</body>

</html>