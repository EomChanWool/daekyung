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
                        <!-- Nav FacMaster - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">품질정보 상세</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable">
                                    <tbody>
									    <tr>
									        <th>관리항목명</th>
									        <td><span class="form-control val-area">${detail.siId}</span></td>
									        <th>품명</th>
									        <td><span class="form-control val-area">${detail.piId}</span></td>
									    </tr>
									    <tr>
									        <th>구분</th>
									        <td><span class="form-control val-area">${detail.qiType}</span></td>
									        <th>사용여부</th>
									        <td><span class="form-control val-area">${detail.qiIsuse}</span></td>
									    </tr>
								  </tbody>
							  </table>
							   <table class="table table-bordered" id="dataTable">
								   <tbody>
									    <tr>
									        <c:if test="${not empty detail.ssiOd01}">
									            <th>OD1</th>
									            <td><span class="form-control val-area">${detail.ssiOd01}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiOd01Max}">
									            <th>OD1 상한</th>
									            <td><span class="form-control val-area">${detail.ssiOd01Max}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiOd01Min}">
									            <th>OD1 하한</th>
									            <td><span class="form-control val-area">${detail.ssiOd01Min}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiOd02}">
									            <th>OD2</th>
									            <td><span class="form-control val-area">${detail.ssiOd02}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiOd02Max}">
									            <th>OD2 상한</th>
									            <td><span class="form-control val-area">${detail.ssiOd02Max}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiOd02Min}">
									            <th>OD2 하한</th>
									            <td><span class="form-control val-area">${detail.ssiOd02Min}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiId01}">
									            <th>ID1</th>
									            <td><span class="form-control val-area">${detail.ssiId01}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiId01Max}">
									            <th>ID1 상한</th>
									            <td><span class="form-control val-area">${detail.ssiId01Max}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiId01Min}">
									            <th>ID1 하한</th>
									            <td><span class="form-control val-area">${detail.ssiId01Min}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiId02}">
									            <th>ID2</th>
									            <td><span class="form-control val-area">${detail.ssiId02}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiId02Max}">
									            <th>ID2 상한</th>
									            <td><span class="form-control val-area">${detail.ssiId02Max}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiId02Min}">
									            <th>ID2 하한</th>
									            <td><span class="form-control val-area">${detail.ssiId02Min}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiT1Bevel}">
									            <th>T1</th>
									            <td><span class="form-control val-area">${detail.ssiT1Bevel}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiT1BevelMax}">
									            <th>T1 상한</th>
									            <td><span class="form-control val-area">${detail.ssiT1BevelMax}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiT1BevelMin}">
									            <th>T1 하한</th>
									            <td><span class="form-control val-area">${detail.ssiT1BevelMin}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiT2Bevel}">
									            <th>T2</th>
									            <td><span class="form-control val-area">${detail.ssiT2Bevel}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiT2BevelMax}">
									            <th>T2 상한</th>
									            <td><span class="form-control val-area">${detail.ssiT2BevelMax}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiT2BevelMin}">
									            <th>T2 하한</th>
									            <td><span class="form-control val-area">${detail.ssiT2BevelMin}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiT1Body}">
									            <th>T1</th>
									            <td><span class="form-control val-area">${detail.ssiT1Body}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiT1BodyMax}">
									            <th>T1 상한</th>
									            <td><span class="form-control val-area">${detail.ssiT1BodyMax}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiT1BodyMin}">
									            <th>T1 하한</th>
									            <td><span class="form-control val-area">${detail.ssiT1BodyMin}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiT2Body}">
									            <th>T2</th>
									            <td><span class="form-control val-area">${detail.ssiT2Body}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiT2BodyMax}">
									            <th>T2 상한</th>
									            <td><span class="form-control val-area">${detail.ssiT2BodyMax}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiT2BodyMin}">
									            <th>T2 하한</th>
									            <td><span class="form-control val-area">${detail.ssiT2BodyMin}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiBevelEnd}">
									            <th>BL1</th>
									            <td><span class="form-control val-area">${detail.ssiBevelEnd}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiBevelEndMax}">
									            <th>BL1 상한</th>
									            <td><span class="form-control val-area">${detail.ssiBevelEndMax}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiBevelEndMin}">
									            <th>BL1 하한</th>
									            <td><span class="form-control val-area">${detail.ssiBevelEndMin}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiRootFace}">
									            <th>R</th>
									            <td><span class="form-control val-area">${detail.ssiRootFace}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiRootFaceMax}">
									            <th>R 상한</th>
									            <td><span class="form-control val-area">${detail.ssiRootFaceMax}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiRootFaceMin}">
									            <th>R 하한</th>
									            <td><span class="form-control val-area">${detail.ssiRootFaceMin}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiElbowA}">
									            <th>A</th>
									            <td><span class="form-control val-area">${detail.ssiElbowA}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiElbowAMax}">
									            <th>A 상한</th>
									            <td><span class="form-control val-area">${detail.ssiElbowAMax}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiElbowAMin}">
									            <th>A 하한</th>
									            <td><span class="form-control val-area">${detail.ssiElbowAMin}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiTeeC}">
									            <th>C</th>
									            <td><span class="form-control val-area">${detail.ssiTeeC}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiTeeCMax}">
									            <th>C 상한</th>
									            <td><span class="form-control val-area">${detail.ssiTeeCMax}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiTeeCMin}">
									            <th>C 하한</th>
									            <td><span class="form-control val-area">${detail.ssiTeeCMin}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiTeeM}">
									            <th>M</th>
									            <td><span class="form-control val-area">${detail.ssiTeeM}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiTeeMMax}">
									            <th>M 상한</th>
									            <td><span class="form-control val-area">${detail.ssiTeeMMax}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiTeeMMin}">
									            <th>M 하한</th>
									            <td><span class="form-control val-area">${detail.ssiTeeMMin}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiTeeH}">
									            <th>H</th>
									            <td><span class="form-control val-area">${detail.ssiTeeH}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiTeeHMax}">
									            <th>H 상한</th>
									            <td><span class="form-control val-area">${detail.ssiTeeHMax}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiTeeHMin}">
									            <th>H 하한</th>
									            <td><span class="form-control val-area">${detail.ssiTeeHMin}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiCapE}">
									            <th>E</th>
									            <td><span class="form-control val-area">${detail.ssiCapE}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiCapEMax}">
									            <th>E 상한</th>
									            <td><span class="form-control val-area">${detail.ssiCapEMax}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiCapEMin}">
									            <th>E 하한</th>
									            <td><span class="form-control val-area">${detail.ssiCapEMin}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiCapE1}">
									            <th>E1</th>
									            <td><span class="form-control val-area">${detail.ssiCapE1}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiCapE1Max}">
									            <th>E1 상한</th>
									            <td><span class="form-control val-area">${detail.ssiCapE1Max}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiCapE1Min}">
									            <th>E1 하한</th>
									            <td><span class="form-control val-area">${detail.ssiCapE1Min}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiStubF}">
									            <th>F</th>
									            <td><span class="form-control val-area">${detail.ssiStubF}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiStubFMax}">
									            <th>F 상한</th>
									            <td><span class="form-control val-area">${detail.ssiStubFMax}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiStubFMin}">
									            <th>F 하한</th>
									            <td><span class="form-control val-area">${detail.ssiStubFMin}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiStubG}">
									            <th>G</th>
									            <td><span class="form-control val-area">${detail.ssiStubG}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiStubGMax}">
									            <th>G 상한</th>
									            <td><span class="form-control val-area">${detail.ssiStubGMax}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiStubGMin}">
									            <th>G 하한</th>
									            <td><span class="form-control val-area">${detail.ssiStubGMin}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiStubGt}">
									            <th>GT</th>
									            <td><span class="form-control val-area">${detail.ssiStubGt}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiStubGtMax}">
									            <th>GT 상한</th>
									            <td><span class="form-control val-area">${detail.ssiStubGtMax}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiStubGtMin}">
									            <th>GT 하한</th>
									            <td><span class="form-control val-area">${detail.ssiStubGtMin}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiStubR}">
									            <th>R</th>
									            <td><span class="form-control val-area">${detail.ssiStubR}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiStubRMax}">
									            <th>R 상한</th>
									            <td><span class="form-control val-area">${detail.ssiStubRMax}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiStubRMin}">
									            <th>R 하한</th>
									            <td><span class="form-control val-area">${detail.ssiStubRMin}</span></td>
									        </c:if>
									    </tr>
									    <tr>
									        <c:if test="${not empty detail.ssiCapLimitT}">
									            <th>T</th>
									            <td><span class="form-control val-area">${detail.ssiCapLimitT}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiOaQMax}">
									            <th>Q</th>
									            <td><span class="form-control val-area">${detail.ssiOaQMax}</span></td>
									        </c:if>
									        <c:if test="${not empty detail.ssiOpPMax}">
									            <th>P</th>
									            <td><span class="form-control val-area">${detail.ssiOpPMax}</span></td>
									        </c:if>
									    </tr>
									</tbody>
                                </table>
                                <div class="btn_bottom_wrap">
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/basicInfo/qualityInfo/qualityInfoList.do'">목록</span>
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
		$('#basicInfoMenu').addClass("active");
		$('#basicInfo').addClass("show");
		$('#qualityInfoList').addClass("active");
	});
	</script>
</body>

</html>