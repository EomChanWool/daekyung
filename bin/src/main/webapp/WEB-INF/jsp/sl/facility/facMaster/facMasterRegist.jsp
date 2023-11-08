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
                        <!-- Nav FacMaster - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">설비 등록</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/facility/facMaster/registFacMasterOk.do" name="registForm" method="post">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
<!-- 												<th>설비ID</th> -->
<%-- 												<td><input type="text" class="form-control" name="eqId" value="${facMasterVO.eqId}"/></td> --%>
												<th>설비구분</th>
												<td><input type="text" class="form-control" name="eqType" id="eqType" value="${facMasterVO.eqType}"/></td>
												<th>설비명</th>
												<td><input type="text" class="form-control" name="eqName" id="eqName" value="${facMasterVO.eqName}"/></td>
											</tr>
											<tr>
												<th>센서ID</th>
												<td><input type="text" class="form-control" name="eqSensorid" id="eqSensorid" value="${facMasterVO.eqSensorid}"/></td>
												<th>설치장소</th>
												<td><input type="text" class="form-control" name="eqPlace" id="eqPlace" value="${facMasterVO.eqPlace}"/></td>
											</tr>
											<tr>
												<th>설비상태</th>
												<td>
													<select class="form-control" name="eqOpState" id="eqOpState">
														<option value="">선택</option>
														<option value="정상">정상</option>
														<option value="고장">고장</option>
													</select>
												</td>
												<th>사용여부</th>
												<td>
													<select class="form-control" name="eqIsuse" id="eqIsuse">
														<option value="">선택</option>
														<option value="0">사용</option>
														<option value="1">미사용</option>
													</select>
												</td>
											</tr>
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_regist_facMaster()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/facility/facMaster/facMasterList.do'">취소</span>
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
	function fn_regist_facMaster(){
 		if($('#eqType').val() == ''){
 			alert("설비구분을 확인 바랍니다.");
 			return;
 		}
		
 		if($('#eqName').val() == ''){
 			alert("설비명을 확인 바랍니다.");
 			return;
 		}
		
 		if($('#eqSensorid').val() == ''){
 			alert("센서ID를 확인 바랍니다.");
 			return;
 		}
 		if($('#eqPlace').val() == ''){
 			alert("설치장소를 확인 바랍니다.");
 			return;
 		}
 		if($('#eqOpState').val() == ''){
 			alert("설비상태를 확인 바랍니다.");
 			return;
 		}
 		if($('#eqIsuse').val() == ''){
 			alert("사용여부를 확인 바랍니다.");
 			return;
 		}
		
		registForm.submit();
	}
	
	$(function() {
		$('#facilityMenu').addClass("active");
		$('#facility').addClass("show");
		$('#facMasterList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
	});
	</script>
</body>

</html>