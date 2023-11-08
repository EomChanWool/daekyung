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
                        <!-- Nav materialMove - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">자재이동 상세보기</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                          <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable">
                                    <tbody>
										<tr>
											<th>품명</th>
											<td><span class="form-control val-area">${materialMoveVO.piItemName}</span></td>
											<th>바코드</th>
											<td><span class="form-control val-area">${materialMoveVO.piId}</span></td>
										</tr>
										<tr>
											<th>입고수량</th>
											<td><span class="form-control val-area">${materialMoveVO.mmIn}</span></td>
											<th>입고중량(kg)</th>
											<td><span class="form-control val-area">${materialMoveVO.mmInKg}kg</span></td>
											
										</tr>
										<tr>
											<th>출고수량</th>
											<td><span class="form-control val-area">${materialMoveVO.mmOut}</span></td>
											<th>출고중량(kg)</th>
											<td><span class="form-control val-area">${materialMoveVO.mmOutKg}kg</span></td>
										</tr>
										<!--  <tr>
											<th>재고수량</th>
											<td><span class="form-control val-area">${materialMoveVO.mmCnt}</span></td>
											<th>재고중량(kg)</th>
											<td><span class="form-control val-area">${materialMoveVO.mmCntKg}kg</span></td>
										</tr>-->
										<tr>
											<th>제품구분</th>
											<td><span class="form-control val-area">${materialMoveVO.piItemType}</span></td>
											<th>재질</th>
											<td><span class="form-control val-area">${materialMoveVO.piItemTexture}</span></td>
										</tr>
										<tr>
											<th>규격</th>
											<td><span class="form-control val-area">${materialMoveVO.piItemStandard}</span></td>
											<th>두께</th>
											<td><span class="form-control val-area">${materialMoveVO.piItemThickness}</span></td>
										</tr>
										<tr>
											<th>길이</th>
											<td><span class="form-control val-area">${materialMoveVO.piItemLong}</span></td>
											<th>히트</th>
											<td><span class="form-control val-area">${materialMoveVO.piItemHeat}</span></td>
										</tr>
										<tr>
											<th>단중</th>
											<td><span class="form-control val-area">${materialMoveVO.piMiddle}</span></td>
											<th>단가</th>
											<td><span class="form-control val-area">${materialMoveVO.piItemUnit}</span></td>
										</tr>
										<tr>
											<th>재고수량</th>
											<td><span class="form-control val-area">${materialMoveVO.piRemainQty}</span></td>
											<th>재고중량</th>
											<td><span class="form-control val-area">${materialMoveVO.piRemainKg}kg</span></td>
										</tr>
										<tr>
											<!-- <th>등록ID</th>
											<td><span class="form-control val-area">${materialMoveVO.mmRegId}</span></td> -->
											<th>등록일</th>
											<td>
												<span class="form-control val-area">
													<fmt:formatDate value="${materialMoveVO.mmRegDate}" pattern="yyyy-MM-dd HH:mm"/> 
												</span>
											</td>
										</tr>
										
										<c:if test="${not empty materialMoveVO.mmEdtId}">
										<tr>
											<th>수정ID</th>
											<td><span class="form-control val-area">${materialMoveVO.mmEdtId}</span></td>
											<th>수정일</th>
											<td>
												<span class="form-control val-area">
													<fmt:formatDate value="${materialMoveVO.mmEdtDate}" pattern="yyyy-MM-dd HH:mm"/> 
												</span>
											</td>
										</tr></c:if>
									</tbody>
                                </table>
                                <div class="btn_bottom_wrap">
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/basicInfo/materialMove/materialMoveList.do'">목록</span>
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
	function fn_modify_materialMove(){
		if($('#piId').val() == ''){
			alert("바코드를 확인 바랍니다.");
			return;
		}
		
		
		
		modifyForm.submit();
	}
	
	$(function() {
		$('#basicInfoMenu').addClass("active");
		$('#basicInfo').addClass("show");
		$('#materialMoveList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
	});
	</script>
</body>

</html>