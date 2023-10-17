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

                        <!-- Nav equipPrev - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">설비예방보수관리</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
							<div class="search">
								<form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/facility/equipPrev/equipPrevList.do" method="post">
									<input type="hidden" name=epmId>
									<input type="hidden" name=eqId>
									<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
									
									<select class="btn btn-secondary dropdown-toggle searchCondition" name="searchCondition" id="searchCondition">
							    		<option value="" <c:if test="${searchVO.searchCondition eq ''}">selected="selected"</c:if>>선택</option>
							    		<c:forEach var="list" items="${eqList}" varStatus="status">
											<option value="${list.eqId}" <c:if test="${list.eqId eq searchVO.searchCondition}">selected="selected"</c:if>>${list.eqName}</option>
														</c:forEach>
						    		</select>
									
						    		
						    	</form>
						    	<a href="#" class="btn btn-info btn-icon-split" onclick="fn_search_equipPrev()" style="margin-left: 0.3rem;">
	                                <span class="text">검색</span>
	                            </a>
						    	<a href="#" class="btn btn-success btn-icon-split" onclick="fn_searchAll_equipPrev()">
	                                <span class="text">전체목록</span>
	                            </a>
	                            <a href="#" class="btn btn-primary btn-icon-split" onclick="fn_regist_equipPrev()" style="float: right;">
	                                <span class="text">등록</span>
	                            </a>
	                            <a href="#" class="btn btn-primary btn-icon-split" onclick="fn_excelDown()" style="float: right; margin-right: 0.5rem;">
	                                <span class="text">엑셀다운</span>
	                            </a>
							</div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th>예방ID</th>
											<th>예방보수구분</th>
											<th>작업자</th>
											<th>예방보수일자</th>
											<th>수정/삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="result" items="${equipPrevList}" varStatus="status">
	                                   		<tr onclick="fn_detail_EquipPrev('${result.epmId}')" style="cursor: pointer;">
	                                            <td>${result.epmId}</td>
	                                            <td>${result.epmType}</td>
	                                            <td>${result.epmManager}</td>
	                                            <td>
	                                            	<fmt:formatDate value="${result.epmDate}" pattern="yyyy-MM-dd"/>
	                                            </td>
	                                            <td onclick="event.cancelBubble=true" style="padding: 5px 0px;">
	                                            	<a href="#" class="btn btn-warning btn-icon-split" onclick="fn_modify_equipPrev_go('${result.epmId}')">
				                                        <span class="text">수정</span>
				                                    </a>
				                                    <a href="#" class="btn btn-danger btn-icon-split" onclick="fn_delete_equipPrev('${result.epmId}')">
				                                        <span class="text">삭제</span>
				                                    </a>
	                                            </td>
	                                        </tr>
                                    	</c:forEach>
                                    	<c:if test="${empty equipPrevList}"><tr><td colspan='8'>결과가 없습니다.</td><del></del></c:if>
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
	
	function fn_search_equipPrev(){
		if($('#searchCondition').val()==''){
			alert("검색조건을 선택하세요.");
			return;
		}
		listForm.pageIndex.value = 1;
		listForm.submit();
	}
	
	function fn_searchAll_equipPrev(){
		listForm.searchCondition.value = "";
		listForm.pageIndex.value = 1;
		listForm.submit();
	}
	
	function fn_regist_equipPrev(){
		listForm.action = "${pageContext.request.contextPath}/sl/facility/equipPrev/registEquipPrev.do";
		listForm.submit();
	}
	function fn_excelDown(){
		listForm.action = "${pageContext.request.contextPath}/sl/facility/equipPrev/equipPrevExcelDown.do";
		listForm.submit();
	}
	
	function fn_modify_equipPrev_go(epmId){
		listForm.epmId.value = epmId;
		listForm.action = "${pageContext.request.contextPath}/sl/facility/equipPrev/modifyEquipPrev.do";
		listForm.submit();
	}
	
	function fn_detail_EquipPrev(epmId){
		listForm.epmId.value = epmId;
		listForm.action = "${pageContext.request.contextPath}/sl/facility/equipPrev/detailEquipPrev.do";
		listForm.submit();
	}
	
	function fn_delete_equipPrev(epmId){
		if(confirm('해당 내역을 삭제하시겠습니까?')) {
			listForm.epmId.value = epmId;
			listForm.action = "${pageContext.request.contextPath}/sl/facility/equipPrev/deleteEquipPrev.do";
			listForm.submit();
		}
	}
	
	$(function() {
		$('#facilityMenu').addClass("active");
		$('#facility').addClass("show");
		$('#equipPrevList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
	});
	</script>
</body>

</html>