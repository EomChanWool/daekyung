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
                        <!-- Nav income - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">입고 수정</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/material/income/modifyIncomeOk.do" name="modifyForm" method="post">
                            		<input type="hidden" name="stIdx" value="${incomeVO.stIdx}">
									<input type="hidden" name="curStCnt" value="${incomeVO.stCnt}">
									<input type="hidden" name="curItemCd" value="${incomeVO.itemCd}">
									<input type="hidden" name="itemName" value="${incomeVO.itemName}">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>거래처  <span class="req">*</span></th>
												<td>
													<select class="form-control" name="aIdx" id="aIdx">
														<option value="">선택</option>
														<c:forEach var="list" items="${accountList}" varStatus="status">
															<option value="${list.aIdx}" <c:if test="${incomeVO.aIdx eq list.aIdx}">selected="selected"</c:if>>${list.aIdx} (${list.aName})</option>
														</c:forEach>
													</select>
												</td>
												<th>품목  <span class="req">*</span></th>
												<td>
													<select class="form-control" name="itemCd" id="itemCd">
														<option value="">선택</option>
														<c:forEach var="list" items="${materialList}" varStatus="status">
															<option value="${list.itemCd}" <c:if test="${incomeVO.itemCd eq list.itemCd}">selected="selected"</c:if>>${list.itemCd} (${list.itemName})</option>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th>수량  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="stCnt" id="stCnt" value="${incomeVO.stCnt}"></td>
												<th>규격</th>
												<td><span class="form-control val-area" id="itemStd">${incomeVO.itemStd}</span><input type="hidden" name="itemStd" value="${incomeVO.itemStd}"></td>
											</tr>
											<tr>
												<th>적재위치</th>
												<td><input type="text" class="form-control" name="pInsPosition" value="${incomeVO.pInsPosition}"></td>
												<th>입고일  <span class="req">*</span></th>
												<td><input type="datetime-local" class="form-control" name="stDte" id="stDte" value="${incomeVO.stDte}"></td>
											</tr>
											<tr>
												<th>검사일  <span class="req">*</span></th>
												<td><input type="datetime-local" class="form-control" name="stInsDte" id="stInsDte" value="${incomeVO.stInsDte}"></td>
												<th>종합판정  <span class="req">*</span></th>
												<td>
													<select class="form-control" name="stTotJudge" id="stTotJudge">
														<option value="">선택</option>
														<option value="적합" <c:if test="${incomeVO.stTotJudge eq '적합'}">selected="selected"</c:if>>적합</option>
														<option value="부적합" <c:if test="${incomeVO.stTotJudge eq '부적합'}">selected="selected"</c:if>>부적합</option>
													</select>
												</td>
											</tr>
											<tr>
												<th>특이사항</th>
												<td colspan="3"><textarea name="stNote">${incomeVO.stNote}</textarea></td>
											</tr>
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_modify_income()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/material/income/incomeList.do'">취소</span>
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
	function fn_modify_income(){
		const num = /^\d+$/;
		if($('#aIdx').val() == ''){
			alert("거래처를 확인 바랍니다.");
			return;
		}
		
		if($('#itemCd').val() == ''){
			alert("품목을 확인 바랍니다.");
			return;
		}
		
		if(!num.test($('#stCnt').val())){
			alert("수량을 확인 바랍니다.");
			return;
		}
		
		if($('#stDte').val() == ''){
			alert("입고일을 확인 바랍니다.");
			return;
		}
		
		if($('#stInsDte').val() == ''){
			alert("검사일을 확인 바랍니다.");
			return;
		}
		
		if($('#stTotJudge').val() == ''){
			alert("종합판정을 확인 바랍니다.");
			return;
		}
		
		modifyForm.submit();
	}
	
	$(function() {
		$('#materialMenu').addClass("active");
		$('#material').addClass("show");
		$('#incomeList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
		$('#itemCd').change(function(){
			itemInfoAjax();
		});
	});
	
	function itemInfoAjax(){
		$.ajax({
			  type:"POST",
			  url:"<c:url value='${pageContext.request.contextPath}/sl/material/income/itemInfoAjax.do'/>",	  		  			  
			  dataType:"JSON",
			  data:{
				  'itemCd':$('#itemCd').val()
			  },
			  success:function(result){
				  $('#itemStd').text(result.item_info[0].itemStd);
				  modifyForm.itemName.value = result.item_info[0].itemName;
				  modifyForm.itemStd.value = result.item_info[0].itemStd;
			  },
			  error:function(request,status,error){ 
				  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);		  
			  }
		  });
	}
	</script>
</body>

</html>