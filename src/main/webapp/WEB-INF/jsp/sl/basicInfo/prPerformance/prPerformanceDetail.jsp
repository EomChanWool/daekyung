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
                    <h1 class="h3 mb-2 text-gray-800">생산실적 수정</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/basicInfo/prPerformance/modifyPrPerformanceOk.do" name="modifyForm" method="post">
                            		<input type="hidden" name="relIdx" value="${prPerVo.relIdx}">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>로트번호<span class="req">*</span></th>
												<td><span class="form-control val-area">${prPerVo.poLotno}</span></td>
												<th>일자<span class="req">*</span></th>
												<td><span class="form-control val-area">${prPerVo.relDate}</span></td>
											</tr>
											<tr>
												<th>거래처<span class="req">*</span></th>
												<td><span class="form-control val-area">${prPerVo.relCompony}</span></td>
												<th>수량<span class="req">*</span></th>
												<td><span class="form-control val-area">${prPerVo.relQty}</span></td>
											</tr>
											<tr>
												<th>협가</th>
												<td><span class="form-control val-area" id="relNego">${prPerVo.relNego}원</span></td>
												<th>%</th>
												<td><span class="form-control val-area">${prPerVo.relPercent}%</span></td>
											</tr>
											<tr>
												<th>판매단가(원)</th>
												<td><span class="form-control val-area" id="relUnit">${prPerVo.relUnit}원</span></td>
												<th>금액(원)<span class="req">*</span></th>
												<td><span class="form-control val-area" id="relPrice">${prPerVo.relPrice}원</span></td>
											</tr>
											<tr>
												<th>부가세(원)<span class="req">*</span></th>
												<td><span class="form-control val-area" id="relTax">${prPerVo.relTax}원</span></td>
												<th>합계(원)<span class="req">*</span></th>
												<td><span class="form-control val-area" id="relTotalPrice">${prPerVo.relTotalPrice}원</span></td>
											</tr>
											<tr>
												<th>납품처</th>
												<td><span class="form-control val-area">${prPerVo.relDel}</span></td>
												<th>주문번호<span class="req">*</span></th>
												<td><span class="form-control val-area">${prPerVo.relEsno}</span></td>
											</tr>
											<tr>
												<th>공정번호<span class="req">*</span></th>
												<td><span class="form-control val-area">${prPerVo.relPrno}</span></td>
												<th>히트번호</th>
												<td><span class="form-control val-area">${prPerVo.relHeatno}</span></td>
											</tr>
											<tr>
												<th>과목</th>
												<td><span class="form-control val-area">${prPerVo.relSub}</span></td>
												<th>수주구분<span class="req">*</span></th>
												<td><span class="form-control val-area">${prPerVo.relOrType}</span></td>
											</tr>
											<tr>
												<th>수주번호<span class="req">*</span></th>
												<td><span class="form-control val-area">${prPerVo.orId}</span></td>
												<th>성적서 재질</th>
												<td><span class="form-control val-area">${prPerVo.relReport}</span></td>
											</tr>
											<tr>
												<th>계산서<span class="req">*</span></th>
												<td><span class="form-control val-area">${prPerVo.relBill}</span></td>
												<th>품명<span class="req">*</span></th>
												<td><span class="form-control val-area">${prPerVo.relProd}</span></td>
											</tr>
											<tr>
												<th>재질<span class="req">*</span></th>
												<td><span class="form-control val-area">${prPerVo.relTexture}</span></td>
												<th>두께<span class="req">*</span></th>
												<td><span class="form-control val-area">${prPerVo.relThickness}</span></td>
											</tr>
											<tr>
												<th>규격</th>
												<td><span class="form-control val-area">${prPerVo.relStandard}</span></td>
												<th>상태</th>
												<td><span class="form-control val-area">${prPerVo.relState}</span></td>
											</tr>
											<tr>
												<th>비고</th>
												<td colspan="3"><textArea name="relNote" id="relNote" disabled="disabled">${prPerVo.relNote}</textArea></td>
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
		
		if($('#relDate').val() == ""){
			alert("출고일을 확인 바랍니다.");
			return;
		}
		
		if($('#relCompony').val() == "" ){
			alert("거래처를 입력해주세요.");
			return;
		}
		if($('#relQty').val() == "" ){
			alert("수량을 입력해주세요.");
			return;
		}
		if(!num.test($('#relQty').val())){
 			alert("수량은 숫자만 입력가능합니다.");
			return;
 		}
		if($('#relPrice').val() == "" ){
			alert("금액을 입력해주세요.");
			return;
		}
		if(!num.test($('#relPrice').val())){
 			alert("금액은 숫자만 입력가능합니다.");
			return;
 		}
		if($('#relTax').val() == "" ){
			alert("부가세를 입력해주세요.");
			return;
		}
		if(!num.test($('#relTax').val())){
 			alert("부가세는 숫자만 입력가능합니다.");
			return;
 		}
		if($('#relTotalPrice').val() == "" ){
			alert("합계를 입력해주세요.");
			return;
		}
		if(!num.test($('#relTotalPrice').val())){
 			alert("합계는 숫자만 입력가능합니다.");
			return;
 		}
		if($('#relEsno').val() == "" ){
			alert("주문번호를 입력해주세요.");
			return;
		}
		if($('#relPrno').val() == "" ){
			alert("공정번호를 입력해주세요.");
			return;
		}
		if($('#relOrType').val() == "" ){
			alert("수주구분을 입력해주세요.");
			return;
		}
		if($('#orId').val() == "" ){
			alert("수주번호를 입력해주세요.");
			return;
		}
		
		if($('#relBill').val() == "" ){
			alert("계산서를 입력해주세요.");
			return;
		}
		if($('#relProd').val() == "" ){
			alert("품명을 입력해주세요.");
			return;
		}
		if($('#relTexture').val() == "" ){
			alert("재질을 입력해주세요.");
			return;
		}
		if($('#relThickness').val() == "" ){
			alert("품명을 입력해주세요.");
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