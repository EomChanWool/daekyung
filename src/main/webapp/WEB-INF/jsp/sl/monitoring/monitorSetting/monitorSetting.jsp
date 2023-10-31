<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../../header.jsp" %>

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

                        <!-- Nav sysLog - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">모니터링 설정</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                        <form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/monitoring/monitorSetting/monitorSettingList.do" method="post">
                        <input type="hidden" name="setId">
                        <input type="hidden" name="setYear">
                        </form>
							 <a href="#" class="btn btn-primary btn-icon-split" onclick="fn_regist_set()" style="float: right;">
	                                <span class="text">등록</span>
	                            </a>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable"  >
                                    <thead>
                                        <tr>
                                            <th>메뉴</th>
											<th>년도선택</th>
											<th>수정/삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="result" items="${msList}" varStatus="status">
	                                   		<tr>
	                                            <c:if test="${result.setMenu eq 'ordersOutput'}"><td>수주대실적현황</td></c:if>
	                                            <c:if test="${result.setMenu eq 'lineRunning'}"><td>라인가동현황</td></c:if>
	                                            <c:if test="${result.setMenu eq 'actualOutput'}"><td>생산집계현황</td></c:if>
												<td><%-- <select class="form-control"  name="setYears_${status.index}" id="setYears_${status.index}">
						    			<option value="2022" <c:if test="${result.setYear eq '2022'}">selected="selected"</c:if>>2022년</option>
						    			<option value="2023" <c:if test="${result.setYear eq '2023'}">selected="selected"</c:if>>2023년</option>
						    			<option value="2024" <c:if test="${result.setYear eq '2024'}">selected="selected"</c:if>>2024년</option>
						    			<option value="2025" <c:if test="${result.setYear eq '2025'}">selected="selected"</c:if>>2025년</option>
						    			<option value="2026" <c:if test="${result.setYear eq '2026'}">selected="selected"</c:if>>2026년</option>
						    		</select> --%>${result.setYear}</td>
												 <td style="padding: 5px 0px;">
	                                            	<%-- <a href="#" class="btn btn-warning btn-icon-split" onclick="fn_setting_go('${result.setId}','${status.index}')">
				                                        <span class="text">확인</span>
				                                    </a> --%>
				                                    <a href="#" class="btn btn-warning btn-icon-split" onclick="fn_modify_set_go('${result.setId}')">
				                                        <span class="text">수정</span>
				                                    </a>
				                                    <a href="#" class="btn btn-danger btn-icon-split" onclick="fn_delete_set('${result.setId}')">
				                                        <span class="text">삭제</span>
				                                    </a>
				                                    
	                                            </td>
	                                        </tr>
                                    	</c:forEach>
                                    	<c:if test="${empty msList}"><tr><td colspan='3'>결과가 없습니다.</td><del></del></c:if>
                                    </tbody>
                                </table>
                                
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
	
	
	
	
	function fn_setting_go(setId, index){
		var str = '#setYears_'+index;
		console.log($(str).val());
		listForm.setId.value = setId;
		listForm.setYear.value = $(str).val();
		listForm.action = "${pageContext.request.contextPath}/sl/monitoring/monitorSetting/monitorSettingGo.do";
		listForm.submit();
		
	}
	
	
	function fn_regist_set(){
		listForm.action = "${pageContext.request.contextPath}/sl/monitoring/monitorSetting/monitorSettingRegist.do";
		listForm.submit();
	}
	
	function fn_modify_set_go(setId){
		listForm.setId.value = setId;
		listForm.action = "${pageContext.request.contextPath}/sl/monitoring/monitorSetting/monitorSettingModify.do";
		listForm.submit();
	}
	
	function fn_delete_set(setId){
		if(confirm('해당 내역을 삭제하시겠습니까?')) {
			listForm.setId.value = setId;
			listForm.action = "${pageContext.request.contextPath}/sl/monitoring/monitorSetting/monitorSettingDelete.do";
			listForm.submit();
		}
	}
	
	
	
	$(function() {
		$('#monitoringMenu').addClass("active");
		$('#monitoring').addClass("show");
		$('#monitorSetting').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
	});
	</script>
</body>

</html>