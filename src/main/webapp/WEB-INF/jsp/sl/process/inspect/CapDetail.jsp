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
                    <h1 class="h3 mb-2 text-gray-800">CAP 검사결과</h1>
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
                                    		<td><span class="form-control val-area" id="longF1"></span></td>
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
											<th>ID1-1 검사값</th>
											<td><span class="form-control val-area" id="longC7">${eDataInfo.iehId1}</span></td>
											<th>ID1-1 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiId01}</span></td>
											<th>ID1-1 상하한</th>
											<td><span class="form-control val-area" id="longG7">${spcInfo.ssiId01Min}~${spcInfo.ssiId01Max}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="longF7">${detail.iehT24}</span></td>
										</tr>
										<tr>
											<th>ID1-2 검사값</th>
											<td><span class="form-control val-area" id="longC8">${eDataInfo.iehId2}</span></td>
											<th>ID1-2 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiId01}</span></td>
											<th>ID1-2 상하한</th>
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
											<th>E 검사값</th>
											<td><span class="form-control val-area" id="aC1">${eDataInfo.iehE}</span></td>
											<th>E 기준값</th>
											<td><span class="form-control val-area">${spcInfo.ssiCapE}</span></td>
											<th>E 상하한</th>
											<td><span class="form-control val-area" id="aG1">${spcInfo.ssiCapEMin}~${spcInfo.ssiCapEMax}</span></td>
											<th>합격여부</th>
											<td><span class="form-control val-area" id="aF1">${detail.iehE}</span></td>
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
		for(var i=1; i<13; i++){
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
		for(var i=1; i<13; i++){
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
		
		for(var i=1; i<13; i++){
			
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
		var aC;
		var aG;
		
		for(var i=1; i<5; i++){
		
			aC = $('#aC' + i).text();
			aG = $('#aG' + i).text();
			console.log(aG);
			arr3 = aG.split('~');
			var downVal4 = arr3[0];
			var upVal4 = arr3[1];
			if(aC < downVal4 || aC > upVal4){
				$('#aF' + i).text("불합격");
			}else{
				$('#aF' + i).text("합격");
			}
			
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
		
		window.open(realPath,'approval','scrollbars=yes,location=no,resizable=yes'); 
		
	}
	</script>
</body>

</html>