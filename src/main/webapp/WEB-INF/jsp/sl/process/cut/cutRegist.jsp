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
                    	<h1 class="h3 mb-2 text-gray-800" style="display: inline-block;">절단공정 등록</h1>
                    	
                    </div>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/process/cutProcess/registCutOk.do" name="registForm" method="post">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>수주번호 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="orId" id="orId"></td>
												<th>거래처 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="orCompany" id="orCompany" ></td>
											</tr>
											<tr>
											<th>품명</th>
											<td><input type="text" class="form-control" name="orProd" id="orProd"></td>
											<th>일자</th>
											<td><input type="date" class="form-control" name="orDate" id="orDate" ></td>
											</tr>
											<tr>
											<th>납기일자</th>
											<td><input type="date" class="form-control" name="orDueDate" id="orDueDate" ></td>
											<th>완료일자</th>
											<td><input type="date" class="form-control" name="orFinDate" id="orFinDate" ></td>
											</tr>
											<tr>
											<th>수주구분</th>
											<td><input type="text" class="form-control" name="orOrType" id="orOrType"></td>
											<th>재질</th>
											<td><input type="text" class="form-control" name="orTexture" id="orTexture"></td>
											</tr>
											<tr>
											<th>두께</th>
											<td><input type="text" class="form-control" name="orThickness" id="orThickness"></td>
											<th>규격</th>
											<td><input type="text" class="form-control" name="orStandard" id="orStandard"></td>
											</tr>
											<tr>
											<th>상태</th>
											<td><input type="text" class="form-control" name="orState" id="orState"></td>
											<th>담당자</th>
											<td><input type="text" class="form-control" name="orManager" id="orManager"></td>
											</tr>
											<tr>
											<th>성적서의뢰</th>
											<td><input type="text" class="form-control" name="orReport" id="orReport"></td>
											<th>단가</th>
											<td><input type="text" class="form-control" name="orUnit" id="orUnit"></td>
											</tr>
											<tr>
											<th>금액</th>
											<td><input type="text" class="form-control" name="orMoney" id="orMoney"></td>
											<th>수량</th>
											<td><input type="text" class="form-control" name="orQty" id="orQty"></td>
											</tr>
											
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_regist_cut()" style="border:none;">확인</button>
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
	function fn_regist_cut(){
		
		var regex = /^\d{16}$/;


		var num =  /^[0-9.]+$/;

		
		 if(!regex.test($('#orId').val())){
	 			alert("수주번호형식을 확인해주세요.");
				return;
	 		}
		 
		if($('#orId').val() == ''){
			alert("수주번호를 확인 바랍니다.");
			return;
		}
		
		if($('#orCompany').val() == ''){
			alert("거래처를 확인 바랍니다.");
			return;
		}
		
		if($('#orProd').val() == ''){
			alert("품명을 확인 바랍니다.");
			return;
		}
		
		if($('#orDate').val() == ''){
			alert("일자를 확인 바랍니다.");
			return;
		}
		
		
		if($('#orDueDate').val() == ''){
			alert("납기일을 확인 바랍니다.");
			return;
		}
		if($('#orFinDate').val() == ''){
			alert("완료일을 확인 바랍니다.");
			return;
		}
		if($('#orOrType').val() == ''){
			alert("수주구분을 확인 바랍니다.");
			return;
		}
		
		if($('#orTexture').val() == ''){
			alert("재질을 확인 바랍니다.");
			return;
		}
		
		if($('#orThickness').val() == ''){
			alert("두께를 확인 바랍니다.");
			return;
		}
		
		if($('#orStandard').val() == ''){
			alert("규격을 확인 바랍니다.");
			return;
		}
		
		
		
		if($('#orManager').val() == ''){
			alert("담당자를 확인 바랍니다.");
			return;
		}
		
		if($('#orUnit').val() !=''){
		
		if(!num.test($('#orUnit').val())){
 			alert("단가는 숫자만 입력가능합니다.");
			return;
 		}
		}
		
		if($('#orMoney').val()){
		
		if(!num.test($('#orMoney').val())){
 			alert("금액은 숫자만 입력가능합니다.");
			return;
 		}}
		
		if($('#orQty').val() == ''){
			alert("수량을 확인 바랍니다.");
			return;
		}
		if(!num.test($('#orQty').val())){
 			alert("수량은 숫자만 입력가능합니다.");
			return;
 		}
		
		registForm.submit();
	}
	
	
	
	$(function() {
		$('#processMenu').addClass("active");
		$('#process').addClass("show");
		$('#cutList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
		
		
		$('#poLotno').change(function(){
			cutAjax();
		});
		
	});
	
	
	function cutAjax(){
		$.ajax({
			  type:"POST",
			  url:"<c:url value='${pageContext.request.contextPath}/sl/process/cutProcess/cutAjax.do'/>",	  		  			  
			  dataType:"JSON",
			  data:{
				  'poLotno': $('#poLotno').val(),
				  
			  },
			  success:function(result){
				  registForm.piItemType.value = result.cut_ajax.piItemType;
				  registForm.cpCutQty.value = result.cut_ajax.poOrderQty;
				  if(result.cut_ajax.poState == 0 || result.cut_ajax.poState == 1){
					  $('#poState').val("1");
				  }
			  },
			  error:function(request,status,error){ 
				  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);		  
			  }
		  });
	}
	
	
	</script>
</body>

</html>