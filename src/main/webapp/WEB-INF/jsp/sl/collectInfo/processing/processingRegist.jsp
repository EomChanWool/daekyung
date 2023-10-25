<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../../header.jsp" %>
<style>
	.table th{
		padding-top: 1.3rem;
	}
	
	.cnt{
		text-align: center;
	}
	
	.perPrice{
		text-align: right;
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
                        <!-- Nav orders - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">수주 등록</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/collectInfo/processing/registProcessingOk.do" name="registForm" method="post">
                            	<input type="hidden" name="mflIdx">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>수주번호  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="orId" id="orId" list="list" autocomplete="off">
												<datalist id="list">
													<option value="">선택</option>
													<c:forEach var="list" items="${prodList}" varStatus="status">
														<option value="${list.orId}">${list.orId} / ${list.poLotno}</option>
													</c:forEach>
												</datalist></td>
												<th>로트번호</th>
                                    		<td><span class="form-control val-area" id="poLotno"></span></td>
											</tr>
											<tr>
												<th>품목</th>
												<td><span class="form-control val-area" id="mpProdName"></span></td>
												<th>생산량</th>
												<td><span class="form-control val-area" id="mpQty"></span></td>
											</tr>
											<tr>
												<th>작업자</th>
												<td><span class="form-control val-area" id="mflManager"></span></td>
												<th>시작시간</th>
												<td><span class="form-control val-area" id="mflStDate"></span></td>
											</tr>
											
										</tbody>
	                                </table>
	                               
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_regist_pro()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/collectInfo/processing/processingList.do'">취소</span>
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
	function fn_regist_pro(){
		
		registForm.submit();
	}
	
	$(function() {
		$('#collectInfoMenu').addClass("active");
		$('#collectInfo').addClass("show");
		$('#processingList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
		$('#orId').change(function(){
			processingAjax();
		});
		
	
	});
	
	function processingAjax(){
		$.ajax({
			  type:"POST",
			  url:"<c:url value='${pageContext.request.contextPath}/sl/collectInfo/processing/processingAjax.do'/>",	  		  			  
			  dataType:"JSON",
			  data:{
				  'orId':$('#orId').val()
			  },
			  success:function(result){
				  console.log(result);
				  registForm.mflIdx.value = result.mfProc.mflIdx;
				  $('#poLotno').text(result.mfProc.poLotno);
				  $('#mpProdName').text(result.mfProc.mpProdName + ',' + result.mfProc.mpTexture + ',' + result.mfProc.mpThickness + ',' + result.mfProc.mpState + ',' + result.mfProc.mpStandard);
				  $('#mpQty').text(result.mfProc.mpQty);
				  $('#mflManager').text(result.mfProc.mflManager);
				  $('#mflStDate').text(result.mfProc.mflStDate);
			  },
			  error:function(request,status,error){ 
				  alert('수주번호를 확인하시고 새로고침 해주세요');		  
			  }
		  });
	}	
	

	</script>
</body>

</html>