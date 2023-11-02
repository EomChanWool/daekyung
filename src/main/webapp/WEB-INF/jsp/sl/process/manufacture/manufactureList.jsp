<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<style>
	#graph {
		width: 100%;
	}
</style>
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

                        <!-- Nav cut - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="btn_bottom_wrap">
                    	<h1 class="h3 mb-2 text-gray-800" style="display: inline-block;">가공공정관리</h1>
                    	
                    </div>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
							<div class="search">
								<form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/process/manufacture/manufactureList.do" method="post">
									<input type="hidden" name="orId">
									<input type="hidden" name="mfsIdx">
									<input type="hidden" name="mflManager" id="mflManage">
									<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
									<input type="text" class="form-control bg-light border-0 small" name="searchKeyword" id="searchKeyword"
						    									value="${searchVO.searchKeyword}" placeholder="수주번호를 입력해 주세요"
						    								 style="background-color:#eaecf4; width: 25%; float: left; margin: 0 0.3rem 0 0;">
									
						    	</form>
						    	<a href="#" class="btn btn-info btn-icon-split" onclick="fn_search_mf()" style="margin-left: 0.3rem;">
	                                <span class="text">검색</span>
	                            </a>
						    	<a href="#" class="btn btn-success btn-icon-split" onclick="fn_searchAll_mf()">
	                                <span class="text">전체목록</span>
	                            </a>
	                            <a href="#" class="btn btn-primary btn-icon-split" onclick="fn_regist_cutProcess()" style="float: right;">
	                                <span class="text">등록</span>
	                            </a>
	                            
							</div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable"  >
                                    <thead>
                                        <tr>
                                        	<th>수주번호</th>
                                            <th>품목</th>
                                            <th>수주량</th>
                                            <th>현재공정</th>
                                            <th>진행/중단/재개</th>
											<th>작업완료</th>
											<th>수정/삭제</th>
											<th>작업자</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="result" items="${manufactureList}" varStatus="status">
	                                   		<tr>
	                                   			<td>${result.orId}</td>
	                                   			<td>${result.mpProdName}</td>
	                                   			<td>${result.mpQty}</td>
	                                   			<c:if test="${result.mpPrState eq 0}"><td>가공공정대기중</td></c:if>
	                                   			<c:if test="${result.mpPrState eq 1 and (result.mfsState eq 2 or result.mfsState eq 0)}"><td>가공공정중</td></c:if>
	                                   			<c:if test="${result.mfsState eq 1 and result.mpPrState eq 1}"><td>일시정지</td></c:if>
	                                   			<c:if test="${result.mfsState eq 1 and result.mpPrState eq 1}"><td><a href="#" class="btn btn-primary btn-icon-split" onclick="fn_re_mf_go('${result.orId}','${result.mfsIdx}')">
				                                        <span class="text">재개</span>
				                                    </a></td></c:if>
				                                <c:if test="${result.mpPrState eq 0}"><td><a href="#" class="btn btn-warning btn-icon-split" onclick="fn_goProcess('${result.orId}')">
				                                        <span class="text">진행</span>
				                                    </a></td>
				                                    </c:if>
				                                    <c:if test="${result.mpPrState eq 1 and (result.mfsState eq 2 or result.mfsState eq 0)}"><td><a href="#" class="btn btn-danger btn-icon-split" onclick="fn_stop_mf('${result.orId}')">
				                                        <span class="text">중단</span>
				                                    </a></td>
				                                    </c:if> 
				                                    
	                                   			
	                                   			
	                                            <td>
	                                            	
				                                    <a href="#" class="btn btn-danger btn-icon-split" onclick="fn_go_finish('${result.orId}','${result.orProcess}')">
				                                        <span class="text">작업완료</span>
				                                    </a>
	                                            </td>
	                                            
	                                             <td style="padding: 5px 0px;">
	                                            	<a href="#" class="btn btn-warning btn-icon-split" onclick="fn_modify_go_cut('${result.orId}')">
				                                        <span class="text">수정</span>
				                                    </a>
				                                    <a href="#" class="btn btn-danger btn-icon-split" onclick="fn_delete_go_cut('${result.orId}')">
				                                        <span class="text">삭제</span>
				                                    </a>
	                                            </td>
	                                             <td>
	                                            <select class="form-control" id="mflManager_${status.index}" onChange="addManger(${status.index})">
	                                          			    <option value="">선택</option>
														<c:forEach var="list" items="${mfmList}">
															<option value="${list.miName}" <c:if test="${result.mflManager eq list.miName}">selected="selected"</c:if>>${list.miName}</option>
														</c:forEach>
													</select></td>
												
	                                        </tr>
                                    	</c:forEach>
                                    	<c:if test="${empty manufactureList}"><tr><td colspan='10'>결과가 없습니다.</td><del></del></c:if>
                                    </tbody>
                                </table>
                                <div class="btn_page">
									<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_pageview"/>
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
	function fn_pageview(pageNo) {
		listForm.pageIndex.value = pageNo;
	   	listForm.submit();
	}
	
	function fn_search_mf(){
		listForm.pageIndex.value = 1;
		listForm.submit();
	}
	
	function fn_searchAll_mf(){
		listForm.searchKeyword.value = "";
		listForm.pageIndex.value = 1;
		listForm.submit();
	}
	
	function fn_re_mf_go(orId,mfsIdx){
		listForm.orId.value = orId;
		listForm.mfsIdx.value = mfsIdx;
		listForm.action = "${pageContext.request.contextPath}/sl/process/manufacture/reManufacture.do";
		listForm.submit();
	}
	
	function fn_goProcess(orId){
		if($('#mflManage').val() == ''){
			alert("작업자를 확인 바랍니다.");
			return;
		}
		
		listForm.orId.value = orId;
		listForm.action = "${pageContext.request.contextPath}/sl/process/manufacture/goManufacture.do";
		listForm.submit();
	}
	
	
	function fn_stop_mf(orId){
		listForm.orId.value = orId;
		listForm.action = "${pageContext.request.contextPath}/sl/process/manufacture/stopManufacture.do";
		listForm.submit();
	}
	
	
	
	function fn_go_finish(orId,orProcess){
		if(orProcess == 2){
			alert("공정을 진행하여 주세요.");
			return;
		}
		
		if(confirm('작업을 완료하시겠습니까?')) {
			listForm.orId.value = orId; 
			listForm.action = "${pageContext.request.contextPath}/sl/process/manufacture/finishManufacture.do";
			listForm.submit();
		}
	}
	
	function fn_regist_cutProcess(){
		listForm.action = "${pageContext.request.contextPath}/sl/process/manufacture/registManufacture.do";
		listForm.submit();
	}
	
	function fn_modify_go_cut(orId){
		listForm.orId.value = orId;
		listForm.action = "${pageContext.request.contextPath}/sl/process/manufacture/modifyManufacture.do";
		listForm.submit();
	}
	
	function fn_delete_go_cut(orId){
		if(confirm('수주를 삭제하시겠습니까?')){
		listForm.orId.value = orId;
		listForm.action = "${pageContext.request.contextPath}/sl/process/manufacture/deleteManufacture.do";
		listForm.submit();
		}
	}
	
	function addManger(index){
		var str = '#mflManager_'+index;
		$('#mflManage').val($(str).val());
	}
	

	$(function() {
		$('#processMenu').addClass("active");
		$('#process').addClass("show");
		$('#manufactureList').addClass("active");
		
		/* $('#searchKeyword').oninput(function(){
			listForm.sumit();
		}); */
		let msg = '${msg}';	
		if (msg) {
				alert(msg);
			}
		});
	</script>
</body>

</html>