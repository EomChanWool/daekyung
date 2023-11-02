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
                    <h1 class="h3 mb-2 text-gray-800">수금 상세</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable">
                                    <tbody>
										<tr>
											<th>수주명</th>
											<td><span class="form-control val-area">${collectVO.orName}</span></td>
											<th>거래처번호</th>
											<td><span class="form-control val-area">${collectVO.aIdx}</span></td>
										</tr>
										<tr>
											<th>거래처명</th>
											<td><span class="form-control val-area">${collectVO.aName}</span></td>
											<th>수금상태</th>
											<td>
												<c:if test="${collectVO.coState eq '0'}"><span class="form-control val-area">미수금</span></c:if>
												<c:if test="${collectVO.coState eq '1'}"><span class="form-control val-area">수금</span></c:if>
											</td>
										</tr>
										<tr>
											<th>수금예정일</th>
											<td><span class="form-control val-area">${collectVO.coDueDte}</span></td>
											<th>수금일</th>
											<td><span class="form-control val-area">${collectVO.coDte}</span></td>
										</tr>
										<tr>
											<th>자사담당자</th>
											<td><span class="form-control val-area">${collectVO.coComManager}</span></td>
											<th>거래처담당자</th>
											<td><span class="form-control val-area">${collectVO.aManager}</span></td>
										</tr>
										<tr>
											<th>금액</th>
											<td><span class="form-control val-area" id="coTot">${collectVO.coTot}</span></td>
											<th>VAT</th>
											<td><span class="form-control val-area" id="coVat">${collectVO.coVat}</span></td>
										</tr>
										<tr>
											<th>총합계</th>
											<td><span class="form-control val-area" id="coTotPrice">${collectVO.coTotPrice}</span></td>
											<th>세금계산서 발행여부</th>
											<td>
												<c:if test="${collectVO.coTaxUse eq '0'}"><span class="form-control val-area">미발행</span></c:if>
												<c:if test="${collectVO.coTaxUse eq '1'}"><span class="form-control val-area">발행</span></c:if>
											</td>
										</tr>
										<tr>
											<th>비고</th>
											<td colspan="3"><textArea name="coNote" disabled="disabled">${collectVO.coNote}</textArea></td>
										</tr>
									</tbody>
                                </table>
                                <div class="btn_bottom_wrap">
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/sales/collectMoney/collectMoneyList.do'">목록</span>
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
	$(function() {
		$('#salesMenu').addClass("active");
		$('#sales').addClass("show");
		$('#collectMoneyList').addClass("active");
		
		let coTot = $('#coTot').text().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		let coVat = $('#coVat').text().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		let coTotPrice = $('#coTotPrice').text().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$('#coTot').text(coTot);
		$('#coVat').text(coVat);
		$('#coTotPrice').text(coTotPrice);
	});
	</script>
</body>

</html>