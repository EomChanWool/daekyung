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
                        <!-- Nav Item - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">사원권한관리수정</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/basicInfo/Authority/modifyUserAuthorityOk.do" name="modifyForm" method="post">
                            		<input type="hidden" name="maIdx" value="${userAuthorityVO.maIdx}">
	                                <table class="table table-bordered" id="dataTable"  >
	                                    <tbody>
											<tr>
												<th>프로그램명 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="maGroup" id="maGroup" disabled="disabled" value="${userAuthorityVO.maPname}"/></td>
												<th>메뉴그룹 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="maPname" id="maPname" disabled="disabled" value="${userAuthorityVO.maGroup}"/></td>
											</tr>
											<tr>
											<th>URL</th>
												<td><input type="text" class="form-control" name="maUrl" id="maUrl" disabled="disabled" value="${userAuthorityVO.maUrl}"/></td>
												
												<th>권한레벨</th>
												<td>
												<select class="form-control" name="miLevel" id="miLevel">
												  <option value="">선택</option>
												  <option value="1" ${userAuthorityVO.miLevel == 1 ? 'selected' : ''}>작업자</option>
												  <option value="2" ${userAuthorityVO.miLevel == 2 ? 'selected' : ''}>중간관리자</option>
												  <option value="3" ${userAuthorityVO.miLevel == 3 ? 'selected' : ''}>관리자</option>
												  <option value="4" ${userAuthorityVO.miLevel == 4 ? 'selected' : ''}>운영자</option>
												</select>
													</td>
											</tr>
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_modify_account()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/basicInfo/Authority/userAuthorityList.do'">취소</span>
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
		function fn_modify_account(){
			/* //연락처
			var localPhone = /^(0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4]))-(\d{3,4})-(\d{4})$/;
			var cellPhone = /^\d{3}-\d{3,4}-\d{4}$/;
			//사업자 등록번호
			const regitNo = /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/;
			//이메일
			const email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/; */
			
			if(modifyForm.miLevel.value == ''){
				alert("권한레벨을 확인 바랍니다.");
				return;
			}
			
			
			
			modifyForm.submit();
		}
		
		$(function() {
			$('#basicInfoMenu').addClass("active");
			$('#basicInfo').addClass("show");
			$('#userAuthorityList').addClass("active");
			
			let msg = '${msg}';
			if(msg) {
				alert(msg);
			}
		});
	</script>
</body>

</html>