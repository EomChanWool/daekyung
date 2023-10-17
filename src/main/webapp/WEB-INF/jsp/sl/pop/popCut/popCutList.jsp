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
       <%--  <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <!-- Side Menu Section -->
			<%@ include file="../../menu/sideMenu.jsp" %>
        </ul> --%>
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
								<form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/pop/popCut/popCutList.do" method="post">
									<input type="hidden" name="orId">
									<input type="hidden" name="cpsIdx">
									<input type="hidden" name="cplManager" id="cplManage">
									<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
									<input type="text" class="form-control bg-light border-0 small" name="searchKeyword" id="searchKeyword"
						    									value="${searchVO.searchKeyword}" placeholder="수주번호를 입력해 주세요"
						    									style="background-color:#eaecf4; width: 25%; float: left; margin: 0 0.3rem 0 0;">
									
						    	</form>
						    	<a href="#" class="btn btn-info btn-icon-split" onclick="fn_search_cut()" style="margin-left: 0.3rem;">
	                                <span class="text">검색</span>
	                            </a>
						    	<a href="#" class="btn btn-success btn-icon-split" onclick="fn_searchAll_cut()">
	                                <span class="text">전체목록</span>
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
                                            <th>가공공정이동</th>
											<th>작업완료</th>
											<th>작업자</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="result" items="${ordList}" varStatus="status">
	                                   		<tr>
	                                   			<td>${result.orId}</td>
	                                   			<td>${result.orProd}</td>
	                                   			<td>${result.orQty}</td>
	                                   			
	                                   			
	                                   			<c:if test="${result.orProcess eq 0}"><td>절단공정대기중</td></c:if>
	                                   			<c:if test="${result.orProcess eq 1 and (result.cpsState eq 2 or result.cpsState eq 0)}"><td>절단공정중</td></c:if>
	                                   			<c:if test="${result.cpsState eq 1 and result.orProcess eq 1}"><td>일시정지</td></c:if>
	                                   			
	                                   			<c:if test="${result.cpsState eq 1 and result.orProcess eq 1}"><td><a href="#" class="btn btn-primary btn-icon-split" onclick="fn_re_cut_go('${result.orId}','${result.cpsIdx}')">
				                                        <span class="text">재개</span>
				                                    </a></td></c:if>
				                                <c:if test="${result.orProcess eq 0}"><td><a href="#" class="btn btn-warning btn-icon-split" onclick="fn_goProcess('${result.orId}')">
				                                        <span class="text">진행</span>
				                                    </a></td>
				                                    </c:if>
				                                    <c:if test="${result.orProcess eq 1 and (result.cpsState eq 2 or result.cpsState eq 0)}"><td><a href="#" class="btn btn-danger btn-icon-split" onclick="fn_stop_cut('${result.orId}')">
				                                        <span class="text">중단</span>
				                                    </a></td>
				                                    </c:if> 
				                                    
	                                   			
	                                   			<td>
				                                    <a href="#" class="btn btn-danger btn-icon-split" onclick="fn_go_mf('${result.orId}')">
				                                        <span class="text">가공</span>
				                                    </a></td>
	                                            <td>
	                                            	
				                                    <a href="#" class="btn btn-danger btn-icon-split" onclick="fn_go_finish('${result.orId}')">
				                                        <span class="text">작업완료</span>
				                                    </a>
	                                            </td>
	                                            <td>
	                                            <select class="form-control" id="cplManager_${status.index}" onChange="addManger(${status.index})">
	                                            		<option value="">선택</option>
														<c:forEach var="list" items="${cmList}" varStatus="status">
															<option value="${list.miName}" <c:if test="${result.cplManager eq list.miName}">selected="selected"</c:if>>${list.miName}</option>
														</c:forEach>
													</select></td>
	                                        </tr>
                                    	</c:forEach>
                                    	<c:if test="${empty ordList}"><tr><td colspan='7'>결과가 없습니다.</td><del></del></c:if>
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
		listForm.pageIndex.value = 1;
		listForm.submit();
	}
	
	function fn_re_cut_go(orId,cpsIdx){
		listForm.orId.value = orId;
		listForm.cpsIdx.value = cpsIdx;
		listForm.action = "${pageContext.request.contextPath}/sl/pop/popCut/reCut.do";
		listForm.submit();
	}
	
	function fn_goProcess(orId){
		if($('#cplManage').val() == ''){
			alert("작업자를 확인 바랍니다.");
			return;
		}
		listForm.orId.value = orId;
		listForm.action = "${pageContext.request.contextPath}/sl/pop/popCut/goCut.do";
		listForm.submit();
	}
	
	
	function fn_stop_cut(orId){
		listForm.orId.value = orId;
		listForm.action = "${pageContext.request.contextPath}/sl/pop/popCut/stopCut.do";
		listForm.submit();
	}
	
	function fn_go_mf(orId){
		if(confirm('가공 공정으로 넘어가시겠습니까?')) {
			listForm.orId.value = orId; 
			listForm.action = "${pageContext.request.contextPath}/sl/pop/popCut/goMfCut.do";
			listForm.submit();
		}
	}
	
	function fn_go_finish(orId){
		if(confirm('작업을 완료하시겠습니까?')) {
			listForm.orId.value = orId; 
			listForm.action = "${pageContext.request.contextPath}/sl/pop/popCut/finishCut.do";
			listForm.submit();
		}
	}
	
	function addManger(index){
		var str = '#cplManager_'+index;
		console.log($(str).val());
		$('#cplManage').val($(str).val());
	}

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