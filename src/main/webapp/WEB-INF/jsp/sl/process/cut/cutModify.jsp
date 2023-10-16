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
                    	<h1 class="h3 mb-2 text-gray-800" style="display: inline-block;">절단공정 수정</h1>
                    	
                    </div>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/process/cutProcess/modifyCutOk.do" name="modifyForm" method="post">
                            	<input type="hidden" name="orId" value="${cutVO.orId}">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>수주번호 <span class="req">*</span></th>
												<td><span class="form-control val-area">${cutVO.orId}</span></td>
												<th>거래처 <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="orCompany" id="orCompany" value="${cutVO.orCompany}"></td>
											</tr>
											<tr>
											<th>품명</th>
											<td><input type="text" class="form-control" name="orProd" id="orProd" value="${cutVO.orProd}"></td>
											<th>일자</th>
											<td><input type="date" class="form-control" name="orDate" id="orDate" value="${cutVO.orDate}"></td>
											</tr>
											<tr>
											<th>납기일자</th>
											<td><input type="date" class="form-control" name="orDueDate" id="orDueDate" value="${cutVO.orDueDate}"></td>
											<th>완료일자</th>
											<td><input type="date" class="form-control" name="orFinDate" id="orFinDate" value="${cutVO.orFinDate}"></td>
											</tr>
											<tr>
											<th>수주구분</th>
											<td><input type="text" class="form-control" name="orOrType" id="orOrType" value="${cutVO.orOrType}"></td>
											<th>재질</th>
											<td><input type="text" class="form-control" name="orTexture" id="orTexture" value="${cutVO.orTexture}"></td>
											</tr>
											<tr>
											<th>두께</th>
											<td><input type="text" class="form-control" name="orThickness" id="orThickness" value="${cutVO.orThickness}"></td>
											<th>규격</th>
											<td><input type="text" class="form-control" name="orStandard" id="orStandard" value="${cutVO.orStandard}"></td>
											</tr>
											<tr>
											<th>상태</th>
											<td><input type="text" class="form-control" name="orState" id="orState" value="${cutVO.orState}"></td>
											<th>담당자</th>
											<td><input type="text" class="form-control" name="orManager" id="orManager" value="${cutVO.orManager}"></td>
											</tr>
											<tr>
											<th>성적서의뢰</th>
											<td><input type="text" class="form-control" name="orReport" id="orReport" value="${cutVO.orReport}"></td>
											<th>단가</th>
											<td><input type="text" class="form-control" name="orUnit" id="orUnit" value="${cutVO.orUnit}"></td>
											</tr>
											<tr>
											<th>금액</th>
											<td><input type="text" class="form-control" name="orMoney" id="orMoney" value="${cutVO.orMoney}"></td>
											<th>수량</th>
											<td><input type="text" class="form-control" name="orQty" id="orQty" value="${cutVO.orQty}"></td>
											</tr>
											<tr>
											<th>작업자</th>
											<td><select class="form-control" name="cplManager" id="cplManager">
	                                          			    <option value="">선택</option>
														<c:forEach var="list" items="${cmList}" varStatus="status">
															<option value="${list.miName}" <c:if test="${cutVO.cplManager eq list.miName}">selected="selected"</c:if>>${list.miName}</option>
														</c:forEach>
													</select></td>
											</tr>
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_modify_cut()" style="border:none;">확인</button>
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
	function fn_modify_cut(){
		var regex = /^20\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])-([0-9A-Za-z]{4})-([0-9A-Za-z]{4})$/;
		var num =  /^[0-9.]+$/;

		
		
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
		
		modifyForm.submit();
	}
	
	
	
	$(function() {
		$('#processMenu').addClass("active");
		$('#process').addClass("show");
		$('#cutList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
		
	});
	
	
	
	</script>
</body>

</html>