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
                    <h1 class="h3 mb-2 text-gray-800">설비체크시트 등록</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/facility/equipChk/registEquipChkOk.do" name="registForm" method="post">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>설비ID <span class="req">*</span></th>
												<td>
													<select class="form-control" name="eqId" id="eqId">
														<option value="">선택</option>
														<c:forEach var="list" items="${equipmentList}" varStatus="status">
															<option value="${list.eqId}">${list.eqId}</option>
														</c:forEach>
													</select>
												</td>
												<th>설비체크명</th>
												<td><input type="text" class="form-control" name="eciName" id="eciName" value="${equipChkVO.eciName}"></td>
											</tr>
											<tr>
												<th>점검내용</th>
												<td><input type="text" class="form-control" name="eciComment" id="eciComment" value="${equipChkVO.eciComment}"></td>
												<th>점검자<span class="req">*</span></th>
												<td><input type="text" class="form-control" name="eciManager" id="eciManager" value="${equipChkVO.eciManager}"></td>
											</tr>
											<tr>
												<th>점검일<span class="req">*</span></th>
												<td><input type="date" class="form-control" name="eciDate" id="eciDate" value="${equipChkVO.eciDate}"></td>
											</tr>
											<tr>
												<th>비고</th>
												<td colspan="3"><textArea name="eciNote" id="eciNote">${equipChkVO.eciNote}</textArea></td>
											</tr>
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_regist_equipChk()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/facility/equipChk/equipChkList.do'">취소</span>
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
	function fn_regist_equipChk(){
 		if($('#eqId').val() == ''){
 			alert("설비ID를 확인 바랍니다.");
 			return;
 		}
		
 		if($('#eciName').val() == ''){
 			alert("설비체크명을 확인 바랍니다.");
 			return;
 		}
 		
 		if($('#eciManager').val() == ''){
 			alert("점검자를 확인 바랍니다.");
 			return;
 		}
		
 		if($('#eciDate').val() == ''){
 			alert("점검일을 확인 바랍니다.");
 			return;
 		}

		
		registForm.submit();
	}
	
	$(function() {
		$('#facilityMenu').addClass("active");
		$('#facility').addClass("show");
		$('#equipChkList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
// 		equipChkEquipInfoAjax();
		
// 		$('#prListIdx').change(function(){
// 			$('#prChkList').val("");
// 			$('#faCd').empty();
// 			equipChkEquipInfoAjax();
// 		});
	});
	
// 	function equipChkEquipInfoAjax(){
// 		$.ajax({
// 			  type:"POST",
// 			  url:"<c:url value='${pageContext.request.contextPath}/sl/facility/equipChk/equipChkEquipInfoAjax.do'/>",	  		  			  
// 			  dataType:"JSON",
// 			  data:{
// 				  'prListIdx':$('#prListIdx').val()
// 			  },
// 			  success:function(result){
// 				  var de_option = $('<option value="">선택</option>');
// 				  $('#faCd').append(de_option);
// 				  for(var i=0;i<result.fa_info.length;i++){
// 					  var option = $('<option value="'+result.fa_info[i].faCd+'">'+result.fa_info[i].faName+'</option>');
// 					  $('#faCd').append(option);
// 				  }
// 			  },
// 			  error:function(request,status,error){ 
// 				  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);		  
// 			  }
// 		  });
// 	}
	</script>
</body>

</html>