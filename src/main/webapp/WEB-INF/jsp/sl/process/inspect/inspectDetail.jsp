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
                    <h1 class="h3 mb-2 text-gray-800">부적합관리 수정</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	
                            		<%-- <input type="hidden" name="doFilNm" value="${documentVO.doFilNm}"> --%>
	                                <table class="table table-bordered" id="dataTable">
                                    <tbody>
                                    	<tr>
                                    		<th>OD1</th>
                                    		<td><span class="form-control val-area">${detail.iehOd1}</span></td>
                                    		<th>OD2</th>
                                    		<td><span class="form-control val-area">${detail.iehOd2}</span></td>
                                    		<th>OD3</th>
                                    		<td><span class="form-control val-area">${detail.iehOd3}</span></td>
                                    		<th>OD4</th>
                                    		<td><span class="form-control val-area">${detail.iehOd4}</span></td>
                                    	</tr>
                                    	<tr>
                                    		<th>ID1</th>
                                    		<td><span class="form-control val-area">${detail.iehId1}</span></td>
                                    		<th>ID2</th>
                                    		<td><span class="form-control val-area">${detail.iehId2}</span></td>
                                    		<th>ID3</th>
                                    		<td><span class="form-control val-area">${detail.iehId3}</span></td>
                                    		<th>ID4</th>
                                    		<td><span class="form-control val-area">${detail.iehId4}</span></td>
                                    	</tr>
                                    	<c:if test="${not empty detail.iheOd5 || detail.iheId5}">
										<tr>
											<th>OD5</th>
											<td><span class="form-control val-area">${detail.iheOd5}</span></td>
											<th>OD6</th>
											<td><span class="form-control val-area">${detail.iheOd6}</span></td>
											<th>ID5</th>
											<td><span class="form-control val-area">${detail.iheId5}</span></td>
											<th>ID6</th>
											<td><span class="form-control val-area">${detail.iheId6}</span></td>
										</tr>
										</c:if>
										<tr>
											<th>T1-1</th>
											<td><span class="form-control val-area">${detail.iehT11}</span></td>
											<th>T1-2</th>
											<td><span class="form-control val-area">${detail.iehT12}</span></td>
											<th>T1-3</th>
											<td><span class="form-control val-area">${detail.iehT13}</span></td>
											<th>T1-4</th>
											<td><span class="form-control val-area">${detail.iehT14}</span></td>
										</tr>
										<c:if test="${not empty detail.iheT21}">
										<tr>
											<th>T2-1</th>
											<td><span class="form-control val-area">${detail.iehT21}</span></td>
											<th>T2-2</th>
											<td><span class="form-control val-area">${detail.iehT22}</span></td>
											<th>T2-3</th>
											<td><span class="form-control val-area">${detail.iehT23}</span></td>
											<th>T2-4</th>
											<td><span class="form-control val-area">${detail.iehT24}</span></td>
										</tr>
										</c:if>
										<c:if test="${not empty detail.iheT31}">
										<tr>
											<th>T3-1</th>
											<td><span class="form-control val-area">${detail.iehT31}</span></td>
											<th>T3-2</th>
											<td><span class="form-control val-area">${detail.iehT32}</span></td>
											<th>T3-3</th>
											<td><span class="form-control val-area">${detail.iehT33}</span></td>
											<th>T3-4</th>
											<td><span class="form-control val-area">${detail.iehT34}</span></td>
										</tr>
										</c:if>
										<tr>
											<th>BL1-1</th>
											<td><span class="form-control val-area">${detail.iehBl11}</span></td>
											<th>BL1-2</th>
											<td><span class="form-control val-area">${detail.iehBl12}</span></td>
											<th>BL1-3</th>
											<td><span class="form-control val-area">${detail.iehBl13}</span></td>
											<th>BL1-4</th>
											<td><span class="form-control val-area">${detail.iehBl14}</span></td>
										</tr>
										<c:if test="${not empty detail.iehBl21}">
										<tr>
											<th>BL2-1</th>
											<td><span class="form-control val-area">${detail.iehBl21}</span></td>
											<th>BL2-2</th>
											<td><span class="form-control val-area">${detail.iehBl22}</span></td>
											<th>BL2-3</th>
											<td><span class="form-control val-area">${detail.iehBl23}</span></td>
											<th>BL2-4</th>
											<td><span class="form-control val-area">${detail.iehBl24}</span></td>
										</tr>
										</c:if>
										<c:if test="${not empty detail.iehBl31}">
										<tr>
											<th>BL3-1</th>
											<td><span class="form-control val-area">${detail.iehBl31}</span></td>
											<th>BL3-2</th>
											<td><span class="form-control val-area">${detail.iehBl32}</span></td>
											<th>BL3-3</th>
											<td><span class="form-control val-area">${detail.iehBl33}</span></td>
											<th>BL3-4</th>
											<td><span class="form-control val-area">${detail.iehBl34}</span></td>
										</tr>
										</c:if>
										<tr>
											<th>A</th>
											<td><span class="form-control val-area">${detail.iehA}</span></td>
											<th>C1</th>
											<td><span class="form-control val-area">${detail.iehC1}</span></td>
											<th>C2</th>
											<td><span class="form-control val-area">${detail.iehC2}</span></td>
											<th>E</th>
											<td><span class="form-control val-area">${detail.iehE}</span></td>
										</tr>
										<tr>
											<th>H</th>
											<td><span class="form-control val-area">${detail.iehH}</span></td>
											<th>M1</th>
											<td><span class="form-control val-area">${detail.iehM1}</span></td>
											<th>M2</th>
											<td><span class="form-control val-area">${detail.iehM2}</span></td>
											<th>Q</th>
											<td><span class="form-control val-area">${detail.iehQ}</span></td>
										</tr>
										<tr>
											<th>P1</th>
											<td><span class="form-control val-area">${detail.iehP1}</span></td>
											<th>P2</th>
											<td><span class="form-control val-area">${detail.iehP2}</span></td>
											<th>P3</th>
											<td><span class="form-control val-area">${detail.iehP3}</span></td>
											<th>P4</th>
											<td><span class="form-control val-area">${detail.iehP4}</span></td>
										</tr>
										<tr>
											<th>P5</th>
											<td><span class="form-control val-area">${detail.iehP5}</span></td>
											<th>P6</th>
											<td><span class="form-control val-area">${detail.iehP6}</span></td>
											<th>P7</th>
											<td><span class="form-control val-area">${detail.iehP7}</span></td>
											<th>P8</th>
											<td><span class="form-control val-area">${detail.iehP8}</span></td>
										</tr>
										<tr>
										<th>Q1</th>
										<td><span class="form-control val-area">${detail.iehQ1}</span></td>
										<th>LotNo</th>
										<td><span class="form-control val-area">${detail.iehLotno}</span></td>
										<th>문서명</th>
										<td><span class="form-control val-area">${detail.idDoc}</span></td>
										<th>등록날짜</th>
										<td><span class="form-control val-area">${detail.iehRegDate}</span></td>
										</tr>
										<tr>
											<th>다운로드</th>
											<td colspan="3">
												<span class="form-control val-area">
													<a href="${pageContext.request.contextPath}/sl/process/inspect/downloadInspect.do?fileName=${detail.idDoc}">
														<span>${detail.idDoc}</span>
													</a>
												</span>
											</td>
										</tr>
									</tbody>
                               	</table>
                                <div class="btn_bottom_wrap">
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/process/inspect/inspectList.do'">목록</span>
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
		$('#processMenu').addClass("active");
		$('#process').addClass("show");
		$('#inspectList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		console.log('${detail.iehOd5}');
	});
	</script>
</body>

</html>