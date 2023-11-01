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
                        <!-- Nav document - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">검사공정 등록</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/process/inspect/registInspectOk.do" name="registForm" method="post">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>로트번호  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="isiLotno" id="isiLotno"/>
												</td>
												<th>수주번호  <span class="req">*</span></th>
												<td><%-- <input type="text" class="form-control" name="orId" id="orId" list="mfList" autocomplete="off">
													<datalist id="mfList">
														<c:forEach var="list" items="${mfList}" varStatus="status">
															<option value="${list.orId}"></option>
														</c:forEach>
													</datalist> --%>
													<input type="text" class="form-control" name="orId" id="orId"/>
												</td>
											</tr>
											<tr>
												<th>품목코드  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="isiItemType" id="isiItemType"/></td>
												<th>품목명</th>
												<td><input type="text" class="form-control" name="isiItemName" id="isiItemName"/></td>
											</tr>
											<tr>
												<th>검사방식</th>
												<td><input type="text" class="form-control" name="isiWay" id="isiWay"/></td>
												<th>검사자</th>
												<td><input type="text" class="form-control" name="isiManager" id="isiManager"/></td>
											</tr>
											
											
										</tbody>
	                                </table>
	                                
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
<!-- 												<th>SPC항목  <span class="req">*</span></th> -->
<!-- 												<td> -->
<!-- 													<input type="text" class="form-control" name="siType" id="siType" list="siList" autocomplete="off"> -->
<!-- 													<datalist id="siList"> -->
<%-- 														<c:forEach var="list" items="${siList}" varStatus="status"> --%>
<%-- 															<option value="${list.siId}">${list.siName}</option> --%>
<%-- 														</c:forEach> --%>
<!-- 													</datalist> -->
<!-- 												</td> -->
												<th>SPC스펙  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="isiSpcSpec" id="isiSpcSpec"/>
												</td>
												<th>수량  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="isiQty" id="isiQty"/>
												</td>
											</tr>
											<tr>
												<th>검사일</th>
												<td><input type="date" class="form-control" name="isiDate" id="isiDate"/></td>
												<th>검사파일1 <span class="req">*</span></th>
												<td><select class="form-control" name="isiFile1" id="isiFile1">
														<option value="">선택</option>
													</select></td>
											</tr>
											<tr>
												<th>검사파일2 <span class="req">*</span></th>
												<td><select class="form-control" name="isiFile2" id="isiFile2">
														<option value="">선택</option>
													</select></td>
												<th>검사파일3  <span class="req">*</span></th>
												<td><select class="form-control" name="isiFile3" id="isiFile3">
														<option value="">선택</option>
													</select></td>
											</tr>
											<tr>
												<th>검사파일4  <span class="req">*</span></th>
												<td><select class="form-control" name="isiFile4" id="isiFile4">
														<option value="">선택</option>
													</select></td>
												<th>검사파일5  <span class="req">*</span></th>
												<td><select class="form-control" name="isiFile5" id="isiFile5">
														<option value="">선택</option>
													</select></td>	
												
											</tr>
											
											<tr>
											<th>수압코드  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="wpCode" id="wpCode"/>
												</td>
												<th>측정값  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="wpValue" id="wpValue"/>
												</td>
											</tr>
											
										</tbody>
	                                </table>
	                                
	                                
                                </form>
                            	<div style="display: inline-block; float: right; margin-top: -5px;">
                   			<button type="button" class="btn btn-success btn-icon-split" style="border:none;" onclick="fn_popup()">
                   				<span class="text">분석데이터 입력</span>
                   			</button>
                   		</div>
                                
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_regist_ins()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/process/inspect/inspectList.do'">취소</span>
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
	function fn_regist_ins(){
		/* if($('#inName').val() == ''){
			alert("부적합명을 확인 바랍니다.");
			return;
		}
		
		if($('#tiIdx').val() == ''){
			alert("검사명을 확인 바랍니다.");
			return;
		}
		
		
		if($('#biIdx').val() == ''){
			alert("불량항목 번호를 확인 바랍니다.");
			return;
		} */
		
		registForm.submit();
	}
	
	$(function() {
		$('#processMenu').addClass("active");
		$('#process').addClass("show");
		$('#inspectList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
		$('#isiLotno').change(function(){
			inspectInfoAjax();
		});
		
		$('#isiLotno').change(function(){
			inspectInfoAjax2();
		});
		console.log($('#analysis').css('display'));
	});

	function inspectInfoAjax(){
		$.ajax({
			  type:"POST",
			  url:"<c:url value='${pageContext.request.contextPath}/sl/process/inspect/inspectInfoAjax.do'/>",	  		  			  
			  dataType:"JSON",
			  data:{
				  'isiLotno':$('#isiLotno').val()
			  },
			  success:function(result){
				  console.log(result);
				  $('#orId').val(result.inInfo.orId);
				  $('#isiItemType').val(result.inInfo.mpProdName);
			  },
			  error:function(request,status,error){ 
				  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);		  
			  }
		  });
	}	
	
	function inspectInfoAjax2(){
		$.ajax({
			  type:"POST",
			  url:"<c:url value='${pageContext.request.contextPath}/sl/process/inspect/inspectInfoAjax2.do'/>",	  		  			  
			  dataType:"JSON",
			  data:{
				  'isiLotno':$('#isiLotno').val()
			  },
			  success:function(result){
				  for(var x=1; x<6; x++){
					  for(var i=0; i<result.inInfo2.length;i++){
						  var option = $('<option value="'+result.inInfo2[i].idDoc+'">'+result.inInfo2[i].idDoc+'</option>');
						  $('#isiFile'+x).append(option);
					  }
				  }
				 
				  
			  },
			  error:function(request,status,error){ 
				  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);		  
			  }
		  });
	}
	

	function fn_popup() {
		let popOption = "width 750px, hegiht=750px, top=300px,left=300px,scrollbars=yes"
		let openUrl = '/sl/process/inspect/registInspectPopup.do'
		window.open(openUrl,'pop',popOption)
	}
	
	</script>
</body>

</html>