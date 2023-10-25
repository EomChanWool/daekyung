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
                        <!-- Nav member - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">비전검사 등록</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/collectInfo/vision/registVisionOk.do" name="registForm" method="post">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>로트번호  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="poLotno" id="poLotno"/>
												</td>
												<th>문서이름  <span class="req">*</span></th>
												<td><select class="form-control" name="idDoc" id="idDoc">
														<option value="">선택</option>
													</select></td>
											</tr>
											<tr>
												<th>품목코드  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="idProdName" id="idProdName"/></td>
												<th>품목명</th>
												<td><input type="text" class="form-control" name="idName" id="idName"/></td>
											</tr>
											<tr>
												<th>수주번호</th>
												<td><input type="text" class="form-control" name="orId" id="orId"/></td>
												<th>공정번호</th>
												<td><input type="text" class="form-control" name="idMfno" id="idMfno"/></td>
											</tr>
											<tr>
												<th>검사일</th>
												<td><input type="date" class="form-control" name="idTestTime" id="idTestTime"/></td>
												<th>확인일</th>
												<td><input type="date" class="form-control" name="idCheckTime" id="idCheckTime"/></td>
											</tr>
											
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_regist_deilvery()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/collectInfo/vision/visionList.do'">취소</span>
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
	function fn_regist_deilvery(){
	 	if($('#poLotno').val() == ''){
			alert("로트번호를 확인 바랍니다.");
			return;
		}
		
		if($('#idDoc').val() == ''){
			alert("문서이름을 확인 바랍니다.");
			return;
		}
		
		if($('#idProdName').val() == ''){
			alert("품목코드를 확인 바랍니다.");
			return;
		}
		
		if($('#idName').val() == ''){
		alert("품목명을 확인 바랍니다.");
		return;
	}
		
		if($('#mpMfno').val() == ''){
		alert("공정번호를 확인 바랍니다.");
		return;
	}
		
		if($('#idManager').val() == ''){
		alert("검사자를 확인 바랍니다.");
		return;
	}
		
		if($('#idTestTime').val() == ''){
		alert("검사일을 확인 바랍니다.");
		return;
	}
		
		if($('#idCheckTime').val() == ''){
		alert("확인일을 확인 바랍니다.");
		return;
	}
		
		 
		registForm.submit();
	}
	
	$(function() {
		$('#collectInfoMenu').addClass("active");
		$('#collectInfo').addClass("show");
		$('#visionList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
		$('#poLotno').change(function(){
			excelInfoAjax();
			visionInfoAjax2();
			
		});
		
		$('#idDoc').change(function(){
			visionInfoAjax3();
			
		});
	});
	
	function excelInfoAjax(){
		$.ajax({
			  type:"POST",
			  url:"<c:url value='${pageContext.request.contextPath}/sl/collectInfo/vision/visionInfoAjax.do'/>",	  		  			  
			  dataType:"JSON",
			  data:{
				  'poLotno':$('#poLotno').val()
			  },
			  success:function(result){
				  for(var i=0; i<result.ex_info.length;i++){
					  var option = $('<option value="'+result.ex_info[i].idDoc+'">'+result.ex_info[i].idDoc+'</option>');
					  $('#idDoc').append(option);
				  }
			  },
			  error:function(request,status,error){ 
				  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);		  
			  }
		  });
	}
	
	function visionInfoAjax2(){
		$.ajax({
			  type:"POST",
			  url:"<c:url value='${pageContext.request.contextPath}/sl/collectInfo/vision/visionInfoAjax2.do'/>",	  		  			  
			  dataType:"JSON",
			  data:{
				  'poLotno': $('#poLotno').val(),
				  
			  },
			  success:function(result){
				  registForm.idProdName.value = result.ex_info2[0].mpProdName;
				  registForm.orId.value = result.ex_info2[0].orId;
				 var idName = result.ex_info2[0].mpProdName+","+result.ex_info2[0].mpTexture + "," + result.ex_info2[0].mpThickness + "," + result.ex_info2[0].mpState + "," + result.ex_info2[0].mpStandard;
				 registForm.idName.value = idName;
				 registForm.idMfno.value =result.ex_info2[0].mpMfno;
			  },
			  error:function(request,status,error){ 
				  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);		  
			  }
		  });}
		
		function visionInfoAjax3(){
			$.ajax({
				  type:"POST",
				  url:"<c:url value='${pageContext.request.contextPath}/sl/collectInfo/vision/visionInfoAjax3.do'/>",	  		  			  
				  dataType:"JSON",
				  data:{
					  'idDoc': $('#idDoc').val(),
					  
				  },
				  success:function(result){
					  registForm.idTestTime.value = result.ex_info3.idTestTime;
					  
				  },
				  error:function(request,status,error){ 
					  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);		  
				  }
			  });
	}
		
		
	</script>
</body>

</html>