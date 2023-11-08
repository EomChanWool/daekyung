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
                        <!-- Nav collect - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">고장신고 수정</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/facility/failReport/modifyFailReportOk.do" name="modifyForm" method="post">
                            		<input type="hidden" name="trId" value="${failReportVO.trId}">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>신고ID <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="eqId" value="${failReportVO.trId}" disabled="disabled"></td>
												<th>설비ID <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="eqId" value="${failReportVO.eqId}" disabled="disabled"></td>
											</tr>
											<tr>
												<th>고장구분</th>
												<td><input type="text" class="form-control" name="trType" value="${failReportVO.trType}"></td>
												<th>신고일자<span class="req">*</span></th>
												<td><input type="date" class="form-control" name="trDate" id="trDate" value="<fmt:formatDate value='${failReportVO.trDate}' pattern='yyyy-MM-dd' />"></td>
											</tr>
											<tr>
												
												<th>처리여부</th>
												<td>
													<select class="form-control" name="trIscomp">
														<option>선택</option>
														<option value="0" <c:if test="${failReportVO.trIscomp eq '0'}">selected="selected"</c:if>>O</option>
														<option value="1" <c:if test="${failReportVO.trIscomp eq '1'}">selected="selected"</c:if>>X</option>
													</select>
												</td>
											</tr>
											<tr>
											<th>고장내용</th>
											<td colspan="3"><textArea name="trComment" id="trComment">${failReportVO.trComment}</textArea></td>
											</tr>
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_modify_failReport()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/facility/failReport/failReportList.do'">취소</span>
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
	function fn_modify_failReport(){
		var num = /^\d+$/;
// 		if(!num.test($('#prReCnt').val())){
// 			alert("생산수량을 확인 바랍니다.");
// 			return;
// 		}
		
// 		if($('#prReFaultyCnt').val() != '' && !num.test($('#prReFaultyCnt').val())){
// 			alert("불량수량을 확인 바랍니다.");
// 			return;
// 		}
		
// 		if($('#prReState').val() == ''){
// 			alert("작업상태를 확인 바랍니다.");
// 			return;
// 		}
// 		if($('#prReState').val() == '1' && $('#prReEdTime').val() == ''){
// 			alert("작업종료일을 확인 바랍니다.");
// 			return;
// 		}
		
		modifyForm.submit();
	}
	
	$(function() {
		$('#facilityMenu').addClass("active");
		$('#facility').addClass("show");
		$('#failReportList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
// 		$('#prReState').change(function(){
// 			if($('#prReState').val() == "0"){
// 				$('#prReEdTime').val("");
// 			}
// 		});
	});
	</script>
</body>

</html>