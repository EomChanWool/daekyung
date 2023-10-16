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
                        <!-- Nav member - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">납품 수정</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/sales/delivery/modifyDeliveryOk.do" name="modifyForm" method="post">
                            		<input type="hidden" name="deIdx" id="deIdx" value="${deliveryVO.deIdx}">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>수주명</th>
												<td><span class="form-control val-area">${deliveryVO.orName}</span></td>
												<th>납품일  <span class="req">*</span></th>
												<td><input type="date" class="form-control" name="deDte" id="deDte" value="${deliveryVO.deDte}"/></td>
											</tr>
											<tr>
												<th>금액</th>
												<td><span class="form-control val-area" id="deMoney">${deliveryVO.deMoney}</span></td>
												<th>자사 담당자</th>
												<td><input type="text" class="form-control" name="deChkManager" id="deChkManager" value="${deliveryVO.deChkManager}"/></td>
											</tr>
											<tr>
												<th>납품확인 거래처 담당자</th>
												<td><input type="text" class="form-control" name="deChkAcManager" id="deChkAcManager" value="${deliveryVO.deChkAcManager}"/></td>
												<th>납품확인 일자</th>
												<td><input type="date" class="form-control" name="deChkDte" id="deChkDte" value="${deliveryVO.deChkDte}"/></td>
											</tr>
											<tr>
												<th>납품 상태</th>
												<td>
													<c:if test="${deliveryVO.deState eq '3'}">
														<span class="form-control val-area">수금확인</span>
														<input type="hidden" name="deState" value="${deliveryVO.deState}">
													</c:if>
													<c:if test="${deliveryVO.deState ne '3'}">
														<select class="form-control" name="deState" id="deState">
															<option value="0" <c:if test="${deliveryVO.deState eq '0'}">selected="selected"</c:if>>미확인</option>
															<option value="1" <c:if test="${deliveryVO.deState eq '1'}">selected="selected"</c:if>>납품확인</option>
															<option value="2" <c:if test="${deliveryVO.deState eq '2'}">selected="selected"</c:if>>납품불량</option>
														</select>
													</c:if>
												</td>
											</tr>
											<tr>
												<th>비고</th>
												<td colspan="3"><textarea name="deNote">${deliveryVO.deNote}</textarea></td>
											</tr>
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_modify_delivery()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/sales/delivery/deliveryList.do'">취소</span>
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
	function fn_modify_delivery(){
		var num = /^\d+$/;
		if($('#deName').val() == ''){
			alert("납품명을 확인 바랍니다.");
			return;
		}
		
		if($('#deDte').val() == ''){
			alert("납품일을 확인 바랍니다.");
			return;
		}
		
		if($('#deState').val() == '1' && $('#deChkDte').val() == 0){
			alert("납품 확인일을 확인 바랍니다.");
			return;
		}
		
		modifyForm.submit();
	}
	
	$(function() {
		$('#salesMenu').addClass("active");
		$('#sales').addClass("show");
		$('#deliveryList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
		let result = $('#deMoney').text().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$('#deMoney').text(result);
	});
	</script>
</body>

</html>