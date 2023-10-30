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
                    	<h1 class="h3 mb-2 text-gray-800" style="display: inline-block;">절단공정관리</h1>
                    	
                    </div>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
							<div class="search">
								<form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/process/cutProcess/cutList.do" method="post">
									<input type="hidden" name="orId">
									<input type="hidden" name="cpsIdx">
									<input type="hidden" name="cplManager" id="cplManage">
									<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
									<input type="text" class="form-control bg-light border-0 small" name="searchKeyword" id="searchKeyword"
						    									value="${searchVO.searchKeyword}" placeholder="수주번호를 입력해 주세요"
						    									style="background-color:#eaecf4; width: 25%; float: left; margin: 0 0.3rem 0 0;">
						    					
								<input class="btn btn-secondary searchDate" id="searchStDate" name="searchStDate" value="${searchVO.searchStDate}" type="date">
									<span class="dash" style="display: inline-block; float: left; margin: 0.5rem 0.3rem 0 0">~</span>
									<input class="btn btn-secondary searchDate" id="searchEdDate" name="searchEdDate" value="${searchVO.searchEdDate}" type="date">	
						    	</form>
						    	<a href="#" class="btn btn-info btn-icon-split" onclick="fn_search_cut()" style="margin-left: 0.3rem;">
	                                <span class="text">검색</span>
	                            </a>
						    	<a href="#" class="btn btn-success btn-icon-split" onclick="fn_searchAll_cut()">
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
                                            <th>공정번호</th>
                                            <th>품명</th>
                                            <th>재질</th>
                                            <th>두께</th>
                                            <th>상태</th>
											<th>규격</th>
											<th>로트번호</th>
											<th>생산량</th>
											<th>비고</th>
											<th>등록일</th>
											<th>수정/삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="result" items="${cutList}" varStatus="status">
	                                   		<tr>
	                                   			<td>${result.orId}</td>
	                                   			<td>${result.cpMfno}</td>
	                                   			<td>${result.cpProdName}</td>
	                                   			<td>${result.cpTexture}</td>
	                                   			<td>${result.cpThickness}</td>
	                                   			<td>${result.cpState}</td>
	                                   			<td>${result.cpStandard}</td>
	                                   			<td>${result.poLotno}</td>
	                                   			<td>${result.cpQty}</td>
	                                   			<td>${result.cpNote}</td>
	                                            <td>
	                                            	<fmt:formatDate value="${result.cpRegDate}" pattern="yyyy-MM-dd"/>
	                                            </td>
	                                             <td style="padding: 5px 0px;">
	                                            	<a href="#" class="btn btn-warning btn-icon-split" onclick="fn_modify_go_cut('${result.orId}')">
				                                        <span class="text">수정</span>
				                                    </a>
				                                    <a href="#" class="btn btn-danger btn-icon-split" onclick="fn_delete_go_cut('${result.orId}')">
				                                        <span class="text">삭제</span>
				                                    </a>
	                                            </td>
	                                        </tr>
                                    	</c:forEach>
                                    	<c:if test="${empty cutList}"><tr><td colspan='12'>결과가 없습니다.</td><del></del></c:if>
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
	
	function fn_search_cut(){
		listForm.pageIndex.value = 1;
		listForm.submit();
	}
	
	function fn_searchAll_cut(){
		listForm.searchKeyword.value = "";
		listForm.searchStDate.value = "";
		listForm.searchEdDate.value = "";
		listForm.pageIndex.value = 1;
		listForm.submit();
	}
	
/* 	function fn_re_cut_go(orId,cpsIdx){
		listForm.orId.value = orId;
		listForm.cpsIdx.value = cpsIdx;
		listForm.action = "${pageContext.request.contextPath}/sl/process/cutProcess/reCut.do";
		listForm.submit();
	} */
	
/* 	function fn_goProcess(orId){
		if($('#cplManage').val() == ''){
			alert("작업자를 확인 바랍니다.");
			return;
		}
		listForm.orId.value = orId;
		listForm.action = "${pageContext.request.contextPath}/sl/process/cutProcess/goCut.do";
		listForm.submit();
	}
	
	
	function fn_stop_cut(orId){
		listForm.orId.value = orId;
		listForm.action = "${pageContext.request.contextPath}/sl/process/cutProcess/stopCut.do";
		listForm.submit();
	}
	
	function fn_go_mf(orId){
		if(confirm('가공 공정으로 넘어가시겠습니까?')) {
			listForm.orId.value = orId; 
			listForm.action = "${pageContext.request.contextPath}/sl/process/cutProcess/goMfCut.do";
			listForm.submit();
		}
	}
	
	function fn_go_finish(orId){
		if(confirm('작업을 완료하시겠습니까?')) {
			listForm.orId.value = orId; 
			listForm.action = "${pageContext.request.contextPath}/sl/process/cutProcess/finishCut.do";
			listForm.submit();
		}
	} */
	
	function fn_regist_cutProcess(){
		listForm.action = "${pageContext.request.contextPath}/sl/process/cutProcess/registCut.do";
		listForm.submit();
	}
	
	function fn_modify_go_cut(orId){
		listForm.orId.value = orId;
		listForm.action = "${pageContext.request.contextPath}/sl/process/cutProcess/modifyCut.do";
		listForm.submit();
	}
	
	function fn_delete_go_cut(orId){
		
		
		if(confirm('수주를 삭제하시겠습니까?')){
		listForm.orId.value = orId;
		listForm.action = "${pageContext.request.contextPath}/sl/process/cutProcess/deleteCut.do";
		listForm.submit();
		}
	}
	
/* 	function addManger(index){
		var str = '#cplManager_'+index;
		console.log($(str).val());
		$('#cplManage').val($(str).val());
	}
	 */
	

	$(function() {
		$('#processMenu').addClass("active");
		$('#process').addClass("show");
		$('#cutList').addClass("active");
		
		let msg = '${msg}';	
		if (msg) {
				alert(msg);
			}
		
		});
	</script>
</body>

</html>