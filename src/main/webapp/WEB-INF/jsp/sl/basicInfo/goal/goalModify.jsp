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
                    <h1 class="h3 mb-2 text-gray-800">목표관리 수정</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/basicInfo/goal/modifyGoalOk.do" name="registForm" method="post">
                            	<input type="hidden" name="gmYear" value="${goalInfo.gmYear}"/>
                            	<input type="hidden" name="gmMonth" value="${goalInfo.gmMonth}"/>
                            	
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>목표년도 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="gmYear" id="gmYear" value="${goalInfo.gmYear}년" readonly/></td>
												<th>목표월 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="gmMonth" id="gmMonth" value="${goalInfo.gmMonth}월" readonly/></td>
											</tr>
											<tr>
												<th>목표생산량 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="gmProdQty" id="gmProdQty" value="${goalInfo.gmProdQty}"/></td>
												<th>목표생산률</th>
												<td><input type="text" class="form-control" name="gmGoodRate" id="gmGoodRate"  value="${goalInfo.gmGoodRate}"/></td>
											</tr>
											<tr>
												<th>목표불량률 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="gmBadRate" id="gmBadRate"  value="${goalInfo.gmBadRate}"/></td>
												<th></th>
												<td></td>
											</tr>
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_regist_goal()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/basicInfo/goal/goalList.do'">취소</span>
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
	function fn_regist_goal(){
		if($('#gmYear').val() == ''){
			alert("목표년도를 확인 바랍니다.");
			return;
		}
		if($('#gmMonth').val() == ''){
			alert("목표월을 확인 바랍니다.");
			return;
		}
		if($('#gmProdQty').val() == ''){
			alert("목표생산량을 확인 바랍니다.");
			return;
		}
		if($('#gmGoodRate').val() == ''){
			alert("목표생산률을 확인 바랍니다.");
			return;
		}
		if($('#gmBadRate').val() == ''){
			alert("목표불량률을 확인 바랍니다.");
			return;
		}
		
		registForm.submit();
	}
	
	$(function() {
		console.log('${msg}');
		$('#basicInfoMenu').addClass("active");
		$('#basicInfo').addClass("show");
		$('#goalList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
		
		
	});
	</script>
</body>

</html>