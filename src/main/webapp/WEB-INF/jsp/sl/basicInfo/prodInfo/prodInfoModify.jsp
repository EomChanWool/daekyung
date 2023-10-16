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
                        <!-- Nav ProdInfo - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">제품정보 수정</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/basicInfo/prodInfo/modifyProdInfoOk.do" name="modifyForm" method="post">
                            		<input type="hidden" name="piId" value="${prodInfoVO.piId}">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>제품코드</th>
												<td><input type="text" class="form-control" name="piId" id="piId" value="${prodInfoVO.piId}" disabled="disabled"/></td>
												<th>구분</th>
												<td><input type="text" class="form-control" name="piItemType" id="piItemType" value="${prodInfoVO.piItemType}"/></td>
											</tr>
											<tr>
												<th>재질</th>
												<td><input type="text" class="form-control" name="piItemCode01" id="piItemCode01" value="${prodInfoVO.piItemCode01}"/></td>
												<th>규격</th>
												<td><input type="text" class="form-control" name="piItemCode02" id="piItemCode02" value="${prodInfoVO.piItemCode02}"/></td>
												
											</tr>
											<tr>
												<th>두께</th>
												<td><input type="text" class="form-control" name="piItemCode03" id="piItemCode03" value="${prodInfoVO.piItemCode03}"/></td>
												<th>길이</th>
												<td><input type="text" class="form-control" name="piItemCode04" id="piItemCode04" value="${prodInfoVO.piItemCode04}"/></td>
												
											</tr>
											<tr>
												<th>상태조건</th>
												<td><input type="text" class="form-control" name="piItemState" id="piItemState" value="${prodInfoVO.piItemState}"/></td>
												<th>제품명</th>
												<td><input type="text" class="form-control" name="piItemName" value="${prodInfoVO.piItemName}"/></td>
												
											</tr>
											<tr>
												<th>재고</th>
												<td><input type="text" class="form-control" name="piCnt" id="piCnt" value="${prodInfoVO.piCnt}"/></td>
												<th>잔량</th>
												<td><input type="text" class="form-control" name="piItemRemain" id="piItemRemain" value="${prodInfoVO.piItemRemain}"/></td>
												
											</tr>
											<tr>
												<th>단가</th>
												<td><input type="text" class="form-control" name="piPrice" id="piPrice" value="${prodInfoVO.piPrice}"/></td>
												<th>단중</th>
												<td><input type="text" class="form-control" name="piItemMiddle" id="piItemMiddle" value="${prodInfoVO.piItemMiddle}"/></td>
												
											</tr>
											<tr>
												<th>히트</th>
												<td><input type="text" class="form-control" name="piHeat" value="${prodInfoVO.piHeat}"/></td>
											</tr>
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_modify_prodInfo()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/basicInfo/prodInfo/prodInfoList.do'">취소</span>
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
	function fn_modify_prodInfo(){
		
		var num =  /^[0-9.]+$/;
		
 		if($('#piId').val() == ''){
 			alert("제품코드를 확인 바랍니다.");
 			return;
 		}
 		if($('#piItemType').val() == ''){
 			alert("구분을 확인 바랍니다.");
 			return;
 		}
 		if($('#piItemCode01').val() == ''){
 			alert("재질을 확인 바랍니다.");
 			return;
 		}
 		if($('#piItemCode02').val() == ''){
 			alert("규격을 확인 바랍니다.");
 			return;
 		}
 		if($('#piItemCode03').val() == ''){
 			alert("두께를 확인 바랍니다.");
 			return;
 		}
 		if($('#piItemCode04').val() == ''){
 			alert("길이를 확인 바랍니다.");
 			return;
 		}
 		if($('#piItemState').val() == ''){
 			alert("상태조건을 확인 바랍니다.");
 			return;
 		}
 		if(!num.test($('#piCnt').val())){
 			alert("재고에는 숫자만 입력됩니다.");
			return;
 		}
 		if(!num.test($('#piItemRemain').val())){
 			alert("잔량에는 숫자만 입력됩니다.");
			return;
 		}
 		if(!num.test($('#piPrice').val())){
 			alert("단가에는 숫자만 입력됩니다.");
			return;
 		}
 		if(!num.test($('#piItemMiddle').val())){
 			alert("단중에는 숫자만 입력됩니다.");
			return;
 		}

		modifyForm.submit();
	}
	
	$(function() {
		$('#basicInfoMenu').addClass("active");
		$('#basicInfo').addClass("show");
		$('#prodInfoList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
	});
	</script>
</body>

</html>