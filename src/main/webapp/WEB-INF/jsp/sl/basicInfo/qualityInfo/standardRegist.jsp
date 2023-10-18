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
                        <!-- Nav qualityInfo - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">규격 등록</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/basicInfo/qualityInfo/registStandardOk.do" name="registForm" method="post">
                            	<input type="hidden" name=qiTrustType id="qiTrustType"/>
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>규격구분<span class="req">*</span></th>
												<td>
													<select name="siId" id="siId" class="form-control">
														<option value="">선택</option>
														<option value="1">KS</option>
														<option value="2">JIS</option>
														<option value="3">ASME</option>
													</select>
												</td>
												<th>규격명</th>
												<td><input type="text" class="form-control" name="piId" id="piId"/></td>
											</tr>
											<tr>
												<th>타입<span class="req">*</span></th>
												<td>
													<select name="" id="ithType" class="form-control">
														<option value="">선택</option>
														<option value="90E(L)">90E(L)</option>
														<option value="90E(S)">90E(S)</option>
														<option value="45E(L)">45E(L)</option>
														<option value="T(S)">TEE(S)</option>
														<option value="T(R)">TEE(R)</option>
														<option value="R(C)">R(C)</option>
														<option value="R(E)">R(E)</option>
														<option value="CAP">CAP</option>
														<option value="STUD">STUD</option>
													</select>
												</td>
											</tr>
										</tbody>
									</table>
									<table class="table table-bordered" id="dataTable2">
										<tbody id="90E_LS">
											<!--  <tr>
												<th>OD1</th>
												<td><input type="text" class="form-control" name="ssiOd01" id="ssiOd01"/></td>
												<th>OD1 상한</th>
												<td><input type="text" class="form-control" name="ssiOd01Max" id="ssiOd01Max"/></td>
												<th>OD1 하한</th>
												<td><input type="text" class="form-control" name="ssiOd01Min" id="ssiOd01Min"/></td>
											</tr>
											<tr>
												<th>ID1</th>
												<td><input type="text" class="form-control" name="ssiId01" id="ssiId01"/></td>
												<th>ID1 상한</th>
												<td><input type="text" class="form-control" name="ssiId01Max" id="ssiId01Max"/></td>
												<th>ID3 하한</th>
												<td><input type="text" class="form-control" name="ssiId01Min" id="ssiId01Min"/></td>
											</tr>
											<tr>
												<th>T1</th>
												<td><input type="text" class="form-control" name="ssiT1Bevel" id="ssiT1Bevel"/></td>
												<th>T1 하한</th>
												<td><input type="text" class="form-control" name="ssiT1BevelMin" id="ssiT1BevelMin"/></td>
											</tr>
											<tr>
												<th>BL1</th>
												<td><input type="text" class="form-control" name="ssiBevelEnd" id="ssiBevelEnd"/></td>
												<th>BL1 상한</th>
												<td><input type="text" class="form-control" name="ssiBevelEndMax" id="ssiBevelEndMax"/></td>
												<th>BL1 하한</th>
												<td><input type="text" class="form-control" name="ssiBevelEndMin" id="ssiBevelEndMin"/></td>
											</tr>
											<tr>
												<th>A</th>
												<td><input type="text" class="form-control" name="ssiElbowA" id="ssiElbowA"/></td>
												<th>A 상한</th>
												<td><input type="text" class="form-control" name="ssiElbowAMax" id="ssiElbowAMax"/></td>
												<th>A 하한</th>
												<td><input type="text" class="form-control" name="ssiElbowAMin" id="ssiElbowAMin"/></td>
											</tr>
											<tr>
												<th>Q</th>
												<td><input type="text" class="form-control" name="ssiOaQMax" id="ssiOaQMax"/></td>
												<th>P</th>
												<td><input type="text" class="form-control" name="ssiOpPMax" id="ssiOpPMax"/></td>
											</tr>-->
										</tbody>
										
										<tbody id="45E_L">
											<tr>
												<th>OD1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>OD1 상한</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>OD1 하한</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>ID1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>ID1 상한</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>ID3 하한</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>T1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T1 하한</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>BL1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL1 상한</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL1 하한</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>A</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>A 상한</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>A 하한</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>Q</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>P</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
										</tbody>
										
										<tbody id="R_CE">
											<tr>
												<th>OD1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>OD2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>OD3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>OD4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												
											</tr>
											<tr>
												<th>ID1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>ID2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>ID3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>ID4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>T1-1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T1-2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T1-3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T1-4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>T2-1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T2-2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T2-3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T2-4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>BL1-1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL1-2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL1-3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL1-4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>BL2-1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL2-2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL2-3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL2-4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr id="sel">
												<th>H</th>
												<td id="selRC"><input type="text" class="form-control" name="" id=""/></td>
												<th id="selRC">Q</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th id="selRE">Q1</th>
												<td id="selRE"><input type="text" class="form-control" name="" id=""/></td>
											</tr>
										</tbody>
										
										<tbody id="T_SR">
											<tr>
												<th>OD1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>OD2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>OD3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>OD4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>OD5</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>OD6</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>ID1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>ID2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>ID3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>ID4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>ID5</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>ID6</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>T1-1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T1-2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T1-3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T1-4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>T2-1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T2-2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T2-3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T2-4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>T3-1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T3-2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T3-3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T3-4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>BL1-1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL1-2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL1-3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL1-4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>BL2-2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL2-3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL2-4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>BL3-1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL3-2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL3-3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL3-4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>P1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>P2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>P3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>P4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>P5</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>P6</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>P7</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>P8</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>C1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>C2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>M1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>M2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>Q</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
										</tbody>
										
										<tbody id="CAP">
											<tr>
												<th>OD1</th>
												<td><input type="text" class="form-control" name="ssiOd01" id="ssiOd01"/></td>
												<th>OD1 상한</th>
												<td><input type="text" class="form-control" name="ssiOd01Max" id="ssiOd01Max"/></td>
												<th>OD1 하한</th>
												<td><input type="text" class="form-control" name="ssiOd01Min" id="ssiOd01Min"/></td>
											</tr>
											<tr>
												<th>ID1</th>
												<td><input type="text" class="form-control" name="ssiId01" id="ssiId01"/></td>
												<th>ID1 상한</th>
												<td><input type="text" class="form-control" name="ssiId01Max" id="ssiId01Max"/></td>
												<th>ID3 하한</th>
												<td><input type="text" class="form-control" name="ssiId01Min" id="ssiId01Min"/></td>
											</tr>
											<tr>
												<th>T1</th>
												<td><input type="text" class="form-control" name="ssiT1Bevel" id="ssiT1Bevel"/></td>
												<th>T1 하한</th>
												<td><input type="text" class="form-control" name="ssiT1BevelMin" id="ssiT1BevelMin"/></td>
											</tr>
											<tr>
												<th>BL1</th>
												<td><input type="text" class="form-control" name="ssiBevelEnd" id="ssiBevelEnd"/></td>
												<th>BL1 상한</th>
												<td><input type="text" class="form-control" name="ssiBevelEndMax" id="ssiBevelEndMax"/></td>
												<th>BL1 하한</th>
												<td><input type="text" class="form-control" name="ssiBevelEndMin" id="ssiBevelEndMin"/></td>
											</tr>
											<tr>
												<th>E</th>
												<td><input type="text" class="form-control" name="ssiCapE" id="ssiCapE"/></td>
												<th>E 상한</th>
												<td><input type="text" class="form-control" name="ssiCapEMax" id="ssiCapEMax"/></td>
												<th>E 하한</th>
												<td><input type="text" class="form-control" name="ssiCapEMin" id="ssiCapEMin"/></td>
											</tr>
											<tr>
												<th>Q</th>
												<td><input type="text" class="form-control" name="ssiOaQMax" id="ssiOaQMax"/></td>
											</tr>
										</tbody>
										</tbody>
										
										<tbody id="STUD_END">
											<tr>
												<th>OD1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>OD2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>ID1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>ID2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>T1-1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T1-2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T1-3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>T1-4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>BL1-1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL1-2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL1-3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>BL1-4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>R1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>R2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>R3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>R4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>GT1-1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>GT1-2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>GT1-3</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>GT1-4</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
											<tr>
												<th>G1-1</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>G1-2</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>F</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
												<th>Q</th>
												<td><input type="text" class="form-control" name="" id=""/></td>
											</tr>
										</tbody>
	                                </table>
	                               
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_regist_qualityInfo()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/basicInfo/qualityInfo/qualityInfoList.do'">취소</span>
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
	function fn_regist_qualityInfo(){
		
		 if(registForm.siId.value == ''){
			 alert("규격구분을 확인바랍니다.")
			 return;
		 }
		 if(registForm.piId.value == ''){
			 alert("규격명을 확인바랍니다.")
			 return;
		 }
		registForm.submit();
	}
	
	
	
	
	$(function() {
		$('#basicInfoMenu').addClass("active");
		$('#basicInfo').addClass("show");
		$('#qualityInfoList').addClass("active");
		$('table#dataTable2 tbody').hide();
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
		
	});
	
	$(document).ready(function(){
		$('#ithType').change(function(){
			var checkedRole = $('#ithType option:selected').val();
			if (checkedRole == '90E(S)' || checkedRole == '90E(L)') {
				$('table#dataTable2 tbody#90E_LS').show();
			} else {
				$('table#dataTable2 tbody#90E_LS').hide();
			}

			if (checkedRole == '45E(L)') {
				$('table#dataTable2 tbody#45E_L').show();
			} else {
				$('table#dataTable2 tbody#45E_L').hide();
			}
			
			if (checkedRole == 'R(C)' || checkedRole == 'R(E)') {
				$('table#dataTable2 tbody#R_CE').show();
				if (checkedRole == 'R(C)') {
					$('table#dataTable2 tbody#R_CE #sel #selRC').show();
					$('table#dataTable2 tbody#R_CE #sel #selRE').hide();
				} else {
					$('table#dataTable2 tbody#R_CE #sel #selRE').show();
					$('table#dataTable2 tbody#R_CE #sel #selRC').hide();
				}
			} else {
				$('table#dataTable2 tbody#R_CE').hide();
			}
			
			if (checkedRole == 'T(S)' || checkedRole == 'T(R)') {
				$('table#dataTable2 tbody#T_SR').show();
			} else {
				$('table#dataTable2 tbody#T_SR').hide();
			}
			
			if (checkedRole == 'CAP') {
				$('table#dataTable2 tbody#CAP').show();
			} else {
				$('table#dataTable2 tbody#CAP').hide();
			}
			
			if (checkedRole == 'STUD') {
				$('table#dataTable2 tbody#STUD_END').show();
			} else {
				$('table#dataTable2 tbody#STUD_END').hide();
			}
		});
	});

	</script>
</body>

</html>