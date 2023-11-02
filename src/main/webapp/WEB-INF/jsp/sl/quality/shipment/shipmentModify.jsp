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
                    <h1 class="h3 mb-2 text-gray-800">출하 계획/지시 수정</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/material/shipment/modifyShipmentOk.do" name="modifyForm" method="post">
                            		<input type="hidden" name="shIdx" value="${shipmentVO.shIdx}">
                            		<input type="hidden" name="orIdx" value="${shipmentVO.orIdx}">
                            		<input type="hidden" name="aName" id="aName" value="${shipmentVO.aName}"/>
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>수주명  <span class="req">*</span></th>
												<td><span class="form-control val-area">${shipmentVO.orName}</span></td>
												<th>거래처  <span class="req">*</span></th>
												<td>
													<select class="form-control" name="aIdx" id="aIdx">
														<option value="">선택</option>
														<c:forEach var="list" items="${accountList}" varStatus="status">
															<option value="${list.aIdx}" <c:if test="${shipmentVO.aIdx eq list.aIdx}">selected="selected"</c:if>>${list.aName}</option>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th>거래처주소</th>
												<td><span class="form-control val-area" id="aAddr">${shipmentVO.aAddr}</span><input type="hidden" name="aAddr" value="${shipmentVO.aAddr}"></td>
												<th>거래처연락처  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="aTel" id="aTel" value="${shipmentVO.aTel}"></td>
											</tr>
											<tr>
												<th>담당자</th>
												<td><input type="text" class="form-control" name="shManager" id="shManager" value="${shipmentVO.shManager}"></td>
												<th>출하요청일  <span class="req">*</span></th>
												<td><input type="date" class="form-control" name="shReqDte" id="shReqDte" value="${shipmentVO.shReqDte}"></td>
											</tr>
											<tr>
												<th>납품지  <span class="req">*</span></th>
												<td colspan="3"><input type="text" class="form-control" name="shPlace" id="shPlace" value="${shipmentVO.shPlace}"></td>
											</tr>
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_modify_shipment()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/material/shipment/shipmentList.do'">취소</span>
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
	function fn_modify_shipment(){
		var tel = /^\d{3}-\d{3,4}-\d{4}$/;
		if($('#aIdx').val() == ''){
			alert("거래처를 확인 바랍니다.");
			return;
		}
		
		if(($('#aTel').val() != '') && !tel.test($('#aTel').val())){
			alert("연락처를 확인 바랍니다.");
			return;
		}

		if($('#orIdx').val() == ''){
			alert("수주명을 확인 바랍니다.");
			return;
		}
		
		if($('#shReqDte').val() == ''){
			alert("출하요청일을 확인 바랍니다.");
			return;
		}
		
		if($('#shPlace').val() == ''){
			alert("납품지를 확인 바랍니다.");
			return;
		}
		
		modifyForm.submit();
	}
	
	$(function() {
		$('#materialMenu').addClass("active");
		$('#material').addClass("show");
		$('#shipmentList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
		$('#aIdx').change(function(){
			shipmentAccountInfoAjax();
		});
		
		$('#orIdx').change(function(){
			shipmentOrdersInfoAjax();
		});
		
		$('#input_file').change(function(){
			$('#fileName').val($('#input_file').val().split('\\')[2]);
		});
	});
	
	function shipmentAccountInfoAjax(){
		$.ajax({
			  type:"POST",
			  url:"<c:url value='${pageContext.request.contextPath}/sl/material/shipment/shipmentAccountInfoAjax.do'/>",	  		  			  
			  dataType:"JSON",
			  data:{
				  'aIdx':$('#aIdx').val()
			  },
			  success:function(result){
				  $('#aName').val(result.a_info[0].aName);
				  $('#aAddr').text(result.a_info[0].aAddr);
				  modifyForm.aAddr.value = result.a_info[0].aAddr;
				  $('#aTel').val(result.a_info[0].aTel);
			  },
			  error:function(request,status,error){ 
				  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);		  
			  }
		  });
	}
	
	function shipmentOrdersInfoAjax(){
		$.ajax({
			  type:"POST",
			  url:"<c:url value='${pageContext.request.contextPath}/sl/material/shipment/shipmentOrdersInfoAjax.do'/>",	  		  			  
			  dataType:"JSON",
			  data:{
				  'orIdx':$('#orIdx').val()
			  },
			  success:function(result){
				  $('#shPlace').val(result.or_info[0].orDuePlace);
			  },
			  error:function(request,status,error){ 
				  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);		  
			  }
		  });
	}
	</script>
</body>

</html>