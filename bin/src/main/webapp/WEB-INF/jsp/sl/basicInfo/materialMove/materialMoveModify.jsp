<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../../header.jsp" %>
<style>
	.table th{
		padding-top: 1.3rem;
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
                        <!-- Nav materialMove - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">자재이동 수정</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/basicInfo/materialMove/modifyMaterialMoveOk.do" name="modifyForm" method="post">
                            		<input type="hidden" name="mmId" value="${materialMoveVO.mmId}">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>바코드 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="piId" id="piId" value="${materialMoveVO.piId}"/></td>
												<th>입고수량 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="mmIn" id="mmIn" value="${materialMoveVO.mmIn}"/></td>
											</tr>
											<tr>
												<th>입고중량(kg) <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="mmInKg" id="mmInKg" value="${materialMoveVO.mmInKg}"/></td>
												<th>출고수량 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="mmOut" id="mmOut" value="${materialMoveVO.mmOut}"/></td>
											</tr>
											<tr>
												<th>출고중량(kg) <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="mmOutKg" id="mmOutKg" value="${materialMoveVO.mmOutKg}"/></td>
												<th>재고수량 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="mmCnt" id="mmCnt" value="${materialMoveVO.mmCnt}"/></td>
											</tr>
											<tr>
												<th>재고중량(kg) <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="mmCntKg" id="mmCntKg" value="${materialMoveVO.mmCntKg}"/></td>
												<th>품명</th>
												<td><input type="text" class="form-control" name="piItemName" id="piItemName" value="${materialMoveVO.piItemName}"/></td>
											</tr>
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_modify_materialMove()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/basicInfo/materialMove/materialMoveList.do'">취소</span>
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
	function fn_modify_materialMove(){
		
		var num =  /^[0-9.]+$/;
		
		if($('#piId').val() == ''){
			alert("바코드를 확인 바랍니다.");
			return;
		}
		
		if(!num.test($('#mmIn').val())){
 			alert("입고수량을 확인 바랍니다.");
			return;
 		}
		if(!num.test($('#mmInKg').val())){
			alert('입고중량을 확인바랍니다.');
			return;
		}
		if(!num.test($('#mmOut').val())){
			alert('출고수량을 확인바랍니다.');
			return;
		}
		if(!num.test($('#mmOutKg').val())){
			alert('출고중량을 확인바랍니다.');
			return;
		}
		if(!num.test($('#mmCnt').val())){
			alert('재고수량을 확인바랍니다.');
			return;
		}
		if(!num.test($('#mmCntKg').val())){
			alert('재고중량을 확인바랍니다.');
			return;
		}
		
		
		
		modifyForm.submit();
	}
	
	$(function() {
		$('#basicInfoMenu').addClass("active");
		$('#basicInfo').addClass("show");
		$('#materialMoveList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
	});
	</script>
</body>

</html>