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
                    <h1 class="h3 mb-2 text-gray-800">사원권한관리등록</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/basicInfo/Authority/registUserAuthorityOk.do" name="registForm" method="post">
	                                
	                                
	                                <table class="table table-bordered" id="dataTable"  >
	                                    <tbody>
											<tr>
												<th>프로그램명 <span class="req">*</span></th>
												<td>
												<input type="text" class="form-control" name="maIdx" id="maIdx" list="list" autocomplete="off">
												<datalist id="list">
													<option value="">선택</option>
													<c:forEach var="list" items="${notPro}" varStatus="status">
														<option value="${list.maIdx}">${list.maGroup} / ${list.maPname}</option>
													</c:forEach>
												</datalist>
											</td>
												<th>메뉴그룹 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="maGroup" id="maGroup" disabled="disabled"/></td>
											</tr>
											<tr>
												<th>메뉴이름</th>
												<td><input type="text" class="form-control" name="maPname" id="maPname" disabled="disabled"/></td>
												<th>URL</th>
												<td><input type="text" class="form-control" name="maUrl" id="maUrl" disabled="disabled"/></td>
											</tr>
											<tr>
												<th>권한레벨</th>
												<td><select class="form-control" name="miLevel" id="miLevel">
														<option value="">선택</option>
														<option value="1">작업자</option>
														<option value="2">중간관리자</option>
														<option value="3">관리자</option>
														<option value="4">운영자</option>
														
													</select></td>
												
											</tr>
											
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_regist_account()" style="border:none;">확인</button>
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
		function fn_regist_account(){
			
			if(registForm.maIdx.value == ''){
				alert("프로그램명을 확인 바랍니다.");
				return;
			}
			
			if(registForm.miLevel.value == ''){
				alert("권한레벨을 확인 바랍니다.");
				return;
			}
			
			
			
			registForm.submit();
		}
		
		function UserAuthorityAjax(){
			$.ajax({
				  type:"POST",
				  url:"<c:url value='${pageContext.request.contextPath}/sl/basicInfo/Authority/UserAuthorityAjax.do'/>",	  		  			  
				  dataType:"JSON",
				  data:{
					  'maIdx':$('#maIdx').val()
				  },
				  success:function(result){
					  $('#maGroup').val(result.pro_info[0].maGroup);
					  $('#maPname').val(result.pro_info[0].maPname);
					  $('#maUrl').val(result.pro_info[0].maUrl);
					  $('#miLevel').val(result.pro_info[0].miLevel).prop("selected",true);
				  },
				  error:function(request,status,error){ 
					  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);		  
				  }
			  });
		}
		
		$(function() {
			$('#basicInfoMenu').addClass("active");
			$('#basicInfo').addClass("show");
			$('#userAuthorityList').addClass("active");
			
			let msg = '${msg}';
			if(msg) {
				alert(msg);
			}
			
			$('#maIdx').change(function(){
				UserAuthorityAjax();
			});
		});
	</script>
</body>

</html>