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
                    <h1 class="h3 mb-2 text-gray-800">품질정보 수정</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/basicInfo/qualityInfo/modifyQualityInfoOk.do" name="registForm" method="post">
                            		<input type="hidden" name="qiCode" value="${qualityInfoVO.qiCode}">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>관리항목명 <span class="req">*</span></th>
												<td>
													<input type="text" class="form-control" name="qiName" id="qiName" value="${qualityInfoVO.qiName}" readonly/>
												</td>
												<th>신뢰성구분 <span class="req">*</span></th>
												<td>
												<input type="text" class="form-control" name="qiTrustType" id="qiTrustType" value="${qualityInfoVO.qiTrustType}" readonly/></td>
												
											</tr>
											<tr>
											<th>정성/정량구분</th>
											<td>
											<select name="qiType" class="form-control">
											<option value="">선택</option>
											<option value="정성" ${qualityInfoVO.qiType == '정성' ? 'selected' : ''}>정성</option>
											<option value="정량" ${qualityInfoVO.qiType == '정량' ? 'selected' : ''}>정량</option>
											</select>
											</td>
											<th>사용여부</th>
											<td>
											<select name="qiIsuse" class="form-control">
											<option value="">선택</option>
											<option value="사용" ${qualityInfoVO.qiIsuse == '사용' ? 'selected' : ''}>사용</option>
											<option value="미사용" ${qualityInfoVO.qiIsuse == '미사용' ? 'selected' : ''}>미사용</option>
											</select>
											</td>
											</tr>
										</tbody>
	                                </table>
	                                
	                                 <table class="table table-bordered" id="dataTable">
	                                	<thead>
											<tr>
												<th colspan="3"><span onclick="qiBtn()" id="qiBtn" style="cursor: pointer; width:100%; height:30px; margin-top: 10px;">펼치기</span></th>
											</tr>
											</thead>
											<tbody class="qiList" style="display: none;">
											
											<tr>
											<th colspan="3">부적합내용(없으면 빈칸)</th>
											
											
											</tr>
											<tr><td colspan="3"><textArea name="qiComment" id="qiComment">${qualityInfoVO.qiComment}</textArea></td></tr>
											<tr>
											<th>비고</th>
											
											</tr>
											<tr><td colspan="3"><textArea name="qiRemark" id="qiRemark">${qualityInfoVO.qiRemark}</textArea></td></tr>
											
											</tbody>
											
											</table>
	                                
	                                
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_regist_qualityInfo()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/basicInfo/qualityInfo/listStandard.do'">취소</span>
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
		
		 if(registForm.qiType.value == ''){
			 alert("정성/정량 구분을 확인바랍니다.")
			 return;
		 }
		 if(registForm.qiIsuse.value == ''){
			 alert("사용여부를 확인바랍니다.")
			 return;
		 }
		registForm.submit();
	}
	
	function qiBtn(){
		if($('#qiBtn').text() == '펼치기'){
			$('#qiBtn').text("접기");
			$('.qiList').show();
		}else{
			$('#qiBtn').text("펼치기");
			$('.qiList').hide();
		}
	}
	
	
	
	$(function() {
		$('#basicInfoMenu').addClass("active");
		$('#basicInfo').addClass("show");
		$('#qualityInfoList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
	});
	</script>
</body>

</html>