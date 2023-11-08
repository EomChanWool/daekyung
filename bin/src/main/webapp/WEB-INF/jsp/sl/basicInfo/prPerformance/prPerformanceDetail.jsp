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
                    <h1 class="h3 mb-2 text-gray-800">생산실적 상세</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/basicInfo/prPerformance/modifyPrPerformanceOk.do" name="modifyForm" method="post">
                            		<input type="hidden" name="relIdx" value="${prPerVo.relIdx}">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
	                                    	<tr>
	                                    	<th>생산실적번호<span class="req">*</span></th>
											<td><span class="form-control val-area">${prPerVo.relIdx}</span></td>
											<th>수주번호<span class="req">*</span></th>
											<td><span class="form-control val-area" >${prPerVo.orId}</span></td>
	                                    	</tr>
											<tr>
												<th>로트번호<span class="req">*</span></th>
												<td><span class="form-control val-area">${prPerVo.poLotno}</span></td>
												<th>거래처</th>
												<td><span class="form-control val-area">${prPerVo.relCompony}</span></td>
											</tr>
											<tr>
												<th>납품처</th>
												<td><span class="form-control val-area">${prPerVo.relDel}</span></td>
												<th>주문번호</th>
												<td><span class="form-control val-area">${prPerVo.relEsno}</span></td>
											</tr>
											<tr>
												<th>공정번호</th>
												<td><span class="form-control val-area">${prPerVo.relPrno}</span></td>
												<th>수주구분</th>
												<td><span class="form-control val-area">${prPerVo.relOrType}</span></td>
											</tr>
											<tr>
												<th>납기일</th>
												<td><span class="form-control val-area">${prPerVo.relNabgi}</span></td>
												<th>수량</th>
												<td><span class="form-control val-area">${prPerVo.relQty}</span></td>
											</tr>
											<tr>
												<th>판매단가</th>
												<td>
												 <span class="form-control val-area">
        <c:if test="${not empty prPerVo.relUnit}"> 
            <fmt:formatNumber value="${prPerVo.relUnit}" type="number" pattern="#,###원"/>
        </c:if>
    </span>
												</td>
												<th>금액</th>
												<td> 
													<span class="form-control val-area"> 
														<c:if test="${not empty prPerVo.relPrice}"> 
											                <fmt:formatNumber value="${prPerVo.relPrice}" type="number" pattern="#,###"/>원
											            </c:if>
													</span>
												</td>
											</tr>
											<tr>
												<th>품명</th>
												<td><span class="form-control val-area">${prPerVo.relProd}</span></td>
												<th>재질</th>
												<td><span class="form-control val-area">${prPerVo.relTexture}</span></td>
											</tr>
											<tr>
												<th>두께</th>
												<td><span class="form-control val-area">${prPerVo.relThickness}</span></td>
												<th>규격</th>
												<td><span class="form-control val-area">${prPerVo.relStandard}</span></td>
											</tr>
											<tr>
												<th>상태</th>
												<td><span class="form-control val-area">${prPerVo.relState}</span></td>
												<th>성적서일자</th>
												<td><span class="form-control val-area" >${prPerVo.relReport}</span></td>
											</tr>
											<tr>
												<th>완료일자</th>
												<td><span class="form-control val-area">${prPerVo.relCompletion}</span></td>
												<th>담당자</th>
												<td><span class="form-control val-area">${prPerVo.relPerson}</span></td>
											</tr>
											<tr>
												<th>출고일</th>
												<td><span class="form-control val-area">${prPerVo.relClgo}</span></td>
												<th>비고</th>
												<td colspan="3"><textArea name="relNote1" id="relNote1" disabled="disabled">${prPerVo.relNote1}</textArea></td>
											</tr>
											
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/basicInfo/prPerformance/prPerformanceList.do'">목록</span>
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
	function fn_modify_prPerfomance(){
		var num =  /^[0-9.]+$/;
		
		if($('#poLotno').val() == ""){
			alert("로트번호를 확인 바랍니다.");
			return;
		}
		
		if($('#orId').val() == ""){
			alert("수주번호를 확인 바랍니다.");
			return;
		}
		
		if($('#relIdx').val() == ""){
			alert("생산실적번호를 확인 바랍니다.");
			return;
		}
		
		
		modifyForm.submit();
	}
	
	function cal(){
		var price =  parseFloat(document.getElementsByClassName('relPrice')[0].value);
		var tax = price * 0.1;
		var total = price + tax;
		
		$('#relTax').val(tax);
		$('#relTotalPrice').val(total);
	}
	
	$(function() {
		$('#basicInfoMenu').addClass("active");
		$('#basicInfo').addClass("show");
		$('#prPerformanceList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		let relUnit = $('#relUnit').text().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$('#relUnit').text(relUnit);
		let relPrice = $('#relPrice').text().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$('#relPrice').text(relPrice);
		let relTax = $('#relTax').text().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$('#relTax').text(relTax);
		let relTotalPrice = $('#relTotalPrice').text().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$('#relTotalPrice').text(relTotalPrice);
		let relNego = $('#relNego').text().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$('#relNego').text(relNego);
	});
	
	
	</script>
</body>

</html>