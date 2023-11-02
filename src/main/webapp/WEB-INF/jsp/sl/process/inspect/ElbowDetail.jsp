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
                    <h1 class="h3 mb-2 text-gray-800">엘보우 검사결과</h1>
                    <form action="${pageContext.request.contextPath}/sl/process/inspect/detailInspect.do" name="detailForm" method="post">
                   					 <input type="hidden" name="isiId">
									<input type="hidden" name="isiItemType">
									<input type="hidden" name="isiSpcSpec">
									<input type="hidden" name="isiFile">
									<input type="hidden" name="cFile">
									<input type="hidden" name="stat">
                    <div class="btn_bottom_wrap">
									<span class="btn_cancel" id="exFile5" onclick="fn_search_excel('${detail.isiId}','${detail.isiItemType}','${detail.isiSpcSpec}','${detail.isiFile5}','5')">5번</span>
									<span class="btn_cancel" id="exFile4" onclick="fn_search_excel('${detail.isiId}','${detail.isiItemType}','${detail.isiSpcSpec}','${detail.isiFile4}','4')">4번</span>
									<span class="btn_cancel" id="exFile3" onclick="fn_search_excel('${detail.isiId}','${detail.isiItemType}','${detail.isiSpcSpec}','${detail.isiFile3}','3')">3번</span>
									<span class="btn_cancel" id="exFile2" onclick="fn_search_excel('${detail.isiId}','${detail.isiItemType}','${detail.isiSpcSpec}','${detail.isiFile2}','2')">2번</span>
									<span class="btn_cancel" id="exFile1" onclick="fn_search_excel('${detail.isiId}','${detail.isiItemType}','${detail.isiSpcSpec}','${detail.isiFile1}','1')">1번</span>
								</div>
								</form>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            <table class="table table-bordered" id="infoTable">
                            <tbody>
                            <tr>
                                    		<th>로트번호</th>
                                    		<td><span class="form-control val-area">${detail.isiLotno}</span></td>
                                    		<th>검사방식</th>
                                    		<td><span class="form-control val-area">${detail.isiWay}</span></td>
                                    		<th>타입</th>
                                    		<td><span class="form-control val-area">${detail.isiItemType}</span></td>
                                    		<th>검사일</th>
                                    		<td><span class="form-control val-area">${detail.isiDate}</span></td>
                                    	</tr>
                                    	<tr>
                                    	<th>보고서 파일</th>
                                    	<td><span class="form-control val-area" id="isiFile">${cIsiFile}</span></td>
                                    	<th>보고서 번호</th>
                                    	<td><span class="form-control val-area" id="isiFile">${detail.isiLotno}-${detail.isiId}</span></td>
                                    	<th>수압측정값</th>
                                    	<td><span class="form-control val-area" id="isiFile">${detail.wpValue}</span></td>
                                    	</tr>
                            </tbody>
                            </table>
                            	
                            		<%-- <input type="hidden" name="doFilNm" value="${documentVO.doFilNm}"> --%>
	                                <table class="table table-bordered" id="dataTable">
                                    <tbody>
                                    	<tr>
                                    		<th>OD1 검사값</th>
                                    		<td><span class="form-control val-area" id="longC1">${eDataInfo.iehOd1}</span></td>
                                    		<th>OD1 기준값</th>
                                    		<td><span class="form-control val-area">${spcInfo.ssiOd01}</span></td>
                                    		<th>OD1 상하한</th>
                                    		<td><span class="form-control val-area" id="longG1">${spcInfo.ssiOd01Min}~${spcInfo.ssiOd01Max}</span></td>
                                    		<th>합격여부</th>
                                    		<td><span class="form-control val-area" id="longF1">${detail.iehOd4}</span></td>
                                    	</tr>
                                    	<tr>
                                    		<th>OD1-2 검사값</th>
                                    		<td><span class="form-control val-area" id="longC2">${eDataInfo.iehOd2}</span></td>
                                    		<th>OD1-2 기준값</th>
                                    		<td><span class="form-control val-area">${spcInfo.ssiOd01}</span></td>
                                    		<th>OD1-2 상하한</th>
                                    		<td><span class="form-control val-area" id="longG2">${spcInfo.ssiOd01Min}~${spcInfo.ssiOd01Max}</span></td>
                                    		<th>합격여부</th>
                                    		<td><span class="form-control val-area" id="longF2">${detail.iehId4}</span></td>
                                    	</tr>
										<tr>
											<th>OD2-1 검사값</th>
											<td><span class="form-control val-area" id="longC3">${eDataInfo.iehOd3}</span></td>
											<th>OD2-1 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiOd01}</span></td>
											<th>OD2-1 상하한</th>
											<td><span class="form-control val-area" id="longG3">${spcInfo.ssiOd01Min}~${spcInfo.ssiOd01Max}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="longF3">${detail.iheId6}</span></td>
										</tr>
										<tr>
											<th>OD2-2 검사값</th>
											<td><span class="form-control val-area" id="longC4">${eDataInfo.iehOd4}</span></td>
											<th>OD2-2 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiOd01}</span></td>
											<th>OD2-2 상하한</th>
											<td><span class="form-control val-area" id="longG4">${spcInfo.ssiOd01Min}~${spcInfo.ssiOd01Max}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="longF4">${detail.iehT14}</span></td>
										</tr>
										<tr>
											<th>ID1-1 검사값</th>
											<td><span class="form-control val-area" id="longC5">${eDataInfo.iehId1}</span></td>
											<th>ID1-1 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiId01}</span></td>
											<th>ID1-1 상하한</th>
											<td><span class="form-control val-area" id="longG5">${spcInfo.ssiId01Min}~${spcInfo.ssiId01Max}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="longF5">${detail.iehT24}</span></td>
										</tr>
										<tr>
											<th>ID1-2 검사값</th>
											<td><span class="form-control val-area" id="longC6">${eDataInfo.iehId2}</span></td>
											<th>ID1-2 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiId01}</span></td>
											<th>ID1-2 상하한</th>
											<td><span class="form-control val-area" id="longG6">${spcInfo.ssiId01Min}~${spcInfo.ssiId01Max}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="longF6">${detail.iehT24}</span></td>
										</tr>
										<tr>
											<th>ID2-1 검사값</th>
											<td><span class="form-control val-area" id="longC7">${eDataInfo.iehId3}</span></td>
											<th>ID2-1 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiId01}</span></td>
											<th>ID2-1 상하한</th>
											<td><span class="form-control val-area" id="longG7">${spcInfo.ssiId01Min}~${spcInfo.ssiId01Max}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="longF7">${detail.iehT24}</span></td>
										</tr>
										<tr>
											<th>ID2-2 검사값</th>
											<td><span class="form-control val-area" id="longC8">${eDataInfo.iehId4}</span></td>
											<th>ID2-2 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiId01}</span></td>
											<th>ID2-2 상하한</th>
											<td><span class="form-control val-area" id="longG8">${spcInfo.ssiId01Min}~${spcInfo.ssiId01Max}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="longF8">${detail.iehT24}</span></td>
										</tr>
										<tr>
											<th>T1-1 검사값</th>
											<td><span class="form-control val-area" id="tC1">${eDataInfo.iehT11}</span></td>
											<th>T1-1 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiT1Bevel}</span></td>
											<th>T1-1 하한</th>
											<td><span class="form-control val-area" id="tG1">${spcInfo.ssiT1BevelMin}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="tF1">${detail.iehT34}</span></td>
										</tr>
										<tr>
											<th>T1-2 검사값</th>
											<td><span class="form-control val-area" id="tC2">${eDataInfo.iehT12}</span></td>
											<th>T1-2 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiT1Bevel}</span></td>
											<th>T1-2 하한</th>
											<td><span class="form-control val-area" id="tG2">${spcInfo.ssiT1BevelMin}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="tF2">${detail.iehT34}</span></td>
										</tr>
										<tr>
											<th>T1-3 검사값</th>
											<td><span class="form-control val-area" id="tC3">${eDataInfo.iehT13}</span></td>
											<th>T1-3 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiT1Bevel}</span></td>
											<th>T1-3 하한</th>
											<td><span class="form-control val-area" id="tG3">${spcInfo.ssiT1BevelMin}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="tF3">${detail.iehT34}</span></td>
										</tr>
										<tr>
											<th>T1-4 검사값</th>
											<td><span class="form-control val-area" id="tC4">${eDataInfo.iehT14}</span></td>
											<th>T1-4 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiT1Bevel}</span></td>
											<th>T1-4 하한</th>
											<td><span class="form-control val-area" id="tG4">${spcInfo.ssiT1BevelMin}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="tF4">${detail.iehT34}</span></td>
										</tr>
										<tr>
											<th>T2-1 검사값</th>
											<td><span class="form-control val-area" id="tC5">${eDataInfo.iehT21}</span></td>
											<th>T2-1 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiT1Bevel}</span></td>
											<th>T2-1 하한</th>
											<td><span class="form-control val-area" id="tG5">${spcInfo.ssiT1BevelMin}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="tF5">${detail.iehT34}</span></td>
										</tr>
										<tr>
											<th>T2-2 검사값</th>
											<td><span class="form-control val-area" id="tC6">${eDataInfo.iehT22}</span></td>
											<th>T2-2 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiT1Bevel}</span></td>
											<th>T2-2 하한</th>
											<td><span class="form-control val-area" id="tG6">${spcInfo.ssiT1BevelMin}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="tF6">${detail.iehT34}</span></td>
										</tr>
										<tr>
											<th>T2-3 검사값</th>
											<td><span class="form-control val-area" id="tC7">${eDataInfo.iehT23}</span></td>
											<th>T2-3 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiT1Bevel}</span></td>
											<th>T2-3 하한</th>
											<td><span class="form-control val-area" id="tG7">${spcInfo.ssiT1BevelMin}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="tF7">${detail.iehT34}</span></td>
										</tr>
										<tr>
											<th>T2-4 검사값</th>
											<td><span class="form-control val-area" id="tC8">${eDataInfo.iehT24}</span></td>
											<th>T2-4 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiT1Bevel}</span></td>
											<th>T2-4 하한</th>
											<td><span class="form-control val-area" id="tG8">${spcInfo.ssiT1BevelMin}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="tF8">${detail.iehT34}</span></td>
										</tr>
										
										<tr>
											<th>BL1-1 검사값</th>
											<td><span class="form-control val-area" id="blC1">${eDataInfo.iehBl11}</span></td>
											<th>BL1-1 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiBevelEnd}</span></td>
											<th>BL1-1 상하한</th>
											<td><span class="form-control val-area" id="blG1">${spcInfo.ssiBevelEndMin}~${spcInfo.ssiBevelEndMax}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="blF1">${detail.iehBl34}</span></td>
										</tr>
										<tr>
											<th>BL1-2 검사값</th>
											<td><span class="form-control val-area" id="blC2">${eDataInfo.iehBl12}</span></td>
											<th>BL1-2 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiBevelEnd}</span></td>
											<th>BL1-2 상하한</th>
											<td><span class="form-control val-area" id="blG2">${spcInfo.ssiBevelEndMin}~${spcInfo.ssiBevelEndMax}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="blF2">${detail.iehBl34}</span></td>
										</tr>
										<tr>
											<th>BL1-3 검사값</th>
											<td><span class="form-control val-area" id="blC3">${eDataInfo.iehBl13}</span></td>
											<th>BL1-3 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiBevelEnd}</span></td>
											<th>BL1-3 상하한</th>
											<td><span class="form-control val-area" id="blG3">${spcInfo.ssiBevelEndMin}~${spcInfo.ssiBevelEndMax}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="blF3">${detail.iehBl34}</span></td>
										</tr>
										<tr>
											<th>BL1-4 검사값</th>
											<td><span class="form-control val-area" id="blC4">${eDataInfo.iehBl14}</span></td>
											<th>BL1-4 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiBevelEnd}</span></td>
											<th>BL1-4 상하한</th>
											<td><span class="form-control val-area" id="blG4">${spcInfo.ssiBevelEndMin}~${spcInfo.ssiBevelEndMax}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="blF4">${detail.iehBl34}</span></td>
										</tr>
										<tr>
											<th>BL2-1 검사값</th>
											<td><span class="form-control val-area" id="blC5">${eDataInfo.iehBl21}</span></td>
											<th>BL2-1 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiBevelEnd}</span></td>
											<th>BL2-1 상하한</th>
											<td><span class="form-control val-area" id="blG5">${spcInfo.ssiBevelEndMin}~${spcInfo.ssiBevelEndMax}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="blF5">${detail.iehBl34}</span></td>
										</tr>
										<tr>
											<th>BL2-2 검사값</th>
											<td><span class="form-control val-area" id="blC6">${eDataInfo.iehBl22}</span></td>
											<th>BL2-2 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiBevelEnd}</span></td>
											<th>BL2-2 상하한</th>
											<td><span class="form-control val-area" id="blG6">${spcInfo.ssiBevelEndMin}~${spcInfo.ssiBevelEndMax}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="blF6">${detail.iehBl34}</span></td>
										</tr>
										<tr>
											<th>BL2-3 검사값</th>
											<td><span class="form-control val-area" id="blC7">${eDataInfo.iehBl23}</span></td>
											<th>BL2-3 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiBevelEnd}</span></td>
											<th>BL2-3 상하한</th>
											<td><span class="form-control val-area" id="blG7">${spcInfo.ssiBevelEndMin}~${spcInfo.ssiBevelEndMax}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="blF7">${detail.iehBl34}</span></td>
										</tr>
										<tr>
											<th>BL2-4 검사값</th>
											<td><span class="form-control val-area" id="blC8">${eDataInfo.iehBl24}</span></td>
											<th>BL2-4 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiBevelEnd}</span></td>
											<th>BL2-4 상하한</th>
											<td><span class="form-control val-area" id="blG8">${spcInfo.ssiBevelEndMin}~${spcInfo.ssiBevelEndMax}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="blF8">${detail.iehBl34}</span></td>
										</tr>
										<tr>
											<th>A 검사값</th>
											<td><span class="form-control val-area" id="aC">${eDataInfo.iehA}</span></td>
											<th>A 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiElbowA}</span></td>
											<th>A 상하한</th>
											<td><span class="form-control val-area" id="aG">${spcInfo.ssiElbowAMin}~${spcInfo.ssiElbowAMax}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="aF">${detail.iehE}</span></td>
										</tr>
										
									</tbody>
                               	</table>
                                <div class="btn_bottom_wrap">
                                <c:if test="${detail.isiCheck == 0}"><a href="#" class="btn btn-warning btn-icon-split" onclick="fn_Ok_ins('${detail.isiId}','1')">
				                                        <span class="text">합격</span>
				                                    </a>
				                                    <a href="#" class="btn btn-danger btn-icon-split" onclick="fn_Ok_ins('${detail.isiId}','2')">
				                                        <span class="text">불합격</span>
				                                    </a></c:if>
                                <c:if test="${detail.isiCheck !=0}">
                                <a href="#" class="btn btn-warning btn-icon-split" onclick="fn_view_report('${detail.isiReportImage}')">
				                                        <span class="text">보고서 보기</span>
				                                    </a>
				                                    <a href="${pageContext.request.contextPath}/sl/process/inspect/downloadInspect.do?fileName=${detail.isiReportImage}" class="btn btn-danger btn-icon-split">
				                                        <span class="text">보고서 다운</span>
				                                    </a>
                                </c:if>
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
		if('${cFile}' == 1){
			$('#exFile1').css("background-color","black");
		}
		if('${cFile}' == 2){
			$('#exFile2').css("background-color","black");
		}
		if('${cFile}' == 3){
			$('#exFile3').css("background-color","black");
		}
		if('${cFile}' == 4){
			$('#exFile4').css("background-color","black");
		}
		if('${cFile}' == 5){
			$('#exFile5').css("background-color","black");
		}
		jugment1();
		jugment2();
		jugment3();
		jugment4();
		
	});
	
	function jugment1 () {
		var longC;
		var longG;
		var arr1;
		for(var i=1; i<9; i++){
			longC = $('#longC' + i).text();
			longG = $('#longG' + i).text();
			var ll = parseFloat(longC);
			arr = longG.split('~');
			var downVal = arr[0];
			var upVal = arr[1];
			if(ll > upVal || ll<downVal){
				$('#longF' + i).text('불합격');
			}else{
				$('#longF' + i).text('합격');
			}
		}
	}
	
	function jugment2(){
		var tC;
		var tG;
		for(var i=1; i<9; i++){
			tC = $('#tC' + i).text();
			tG = $('#tG' + i).text();
			
			if(tC < tG){
				$('#tF' + i).text("불합격");
			}else{
				$('#tF' + i).text("합격");
			}
			
		}
	}
	
	function jugment3(){
		var blC;
		var blG;
		
		for(var i=1; i<9; i++){
			
			blC = $('#blC' + i).text();
			blG = $('#blG' + i).text();
			arr2 = blG.split('~');		
			var downVal2 = arr2[0];
			var upVal2 = arr2[1];
			if(blC < downVal2 || blC > upVal2){
				$('#blF' + i).text("불합격");
			}else{
				$('#blF' + i).text("합격");
			}
		}
		
	}
	
	function jugment4(){
		var aC = $('#aC').text();
		var aG = $('#aG').text();
		
		arr3 = aG.split('~');
		var downVal3 = arr3[0];
		var upVal3 = arr3[1];
		
		if(aC < downVal3 || aC > upVal3){
			$('#aF').text("불합격");
		}else{
			$('#aF').text("합격");
		}
		
	}
	function fn_search_excel(isiId,isiItemType,isiSpcSpec,isiFile,cFile){
		detailForm.isiId.value = isiId;
		detailForm.isiItemType.value = isiItemType;
		detailForm.isiSpcSpec.value = isiSpcSpec;
		detailForm.isiFile.value = isiFile;
		detailForm.cFile.value = cFile;
		detailForm.submit();
	}
	
	function fn_Ok_ins(isiId,stat){
		detailForm.isiId.value = isiId;
		detailForm.stat.value = stat;
		detailForm.action = "${pageContext.request.contextPath}/sl/process/inspect/updateStat.do";
		detailForm.submit();
	}
	
	function fn_view_report(path) {
		
		var folderPath = /test/;
		
		var realPath = folderPath+path;
		
		console.log(realPath);
		
		window.open(realPath,'approval','scrollbars=yes,location=no,resizable=yes'); 
		
	}
	</script>
</body>

</html>