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

                        <!-- Nav qualityInfo - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">품질정보관리</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
							<div class="search">
								<form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/basicInfo/qualityInfo/qualityInfoList.do" method="post">
									<input type="hidden" name="ssiId">
									<input type="hidden" name="piId">
									<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
						    		<input type="text" class="form-control bg-light border-0 small" name="searchKeyword"
						    									value="${searchVO.searchKeyword}" placeholder="관리항목명을 입력해 주세요"
						    									style="background-color:#eaecf4; width: 25%; float: left;">
						    	</form>
						    	<a href="#" class="btn btn-info btn-icon-split" onclick="fn_search_qualityInfo()" style="margin-left: 0.3rem;">
	                                <span class="text">검색</span>
	                            </a>
						    	<a href="#" class="btn btn-success btn-icon-split" onclick="fn_searchAll_qualityInfo()">
	                                <span class="text">전체목록</span>
	                            </a>
	                            <a href="#" class="btn btn-primary btn-icon-split" onclick="fn_regist_qualityInfo()" style="float: right; margin-left: 0.5rem;">
	                                <span class="text">등록</span>
	                            </a>
	                            <a href="#" class="btn btn-primary btn-icon-split" onclick="fn_list_standard()" style="float: right; margin-left: 0.3rem;">
	                                <span class="text">규격관리</span>
	                            </a>
	                            <a href="#" class="btn btn-primary btn-icon-split" onclick="fn_regist_standard()" style="float: right;">
	                                <span class="text">품목등록</span>
	                            </a>
							</div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable"  >
                                    <thead>
                                        <tr>
											<th>관리항목명</th>
											<th>품명</th>
											<th>정성/정량구분</th>
											<th>사용여부</th>
											<th>수정/삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="result" items="${qualityInfoList}" varStatus="status">
	                                   		<tr onclick="fn_detail_qualityInfo('${result.ssiId}')" style="cursor: pointer;">
	                                            <td>${result.siId}</td>
	                                            <td>${result.piId}</td>
	                                            <td>${result.qiType}</td>
	                                            <td>${result.qiIsuse}</td>
	                                            
	                                            <td onclick="event.cancelBubble=true" style="padding: 5px 0px;">
	                                            	<a href="#" class="btn btn-warning btn-icon-split" onclick="fn_modify_qualityInfo_go('${result.ssiId}')">
				                                        <span class="text">수정</span>
				                                    </a>
				                                    <a href="#" class="btn btn-danger btn-icon-split" onclick="fn_delete_qualityInfo('${result.ssiId}','${result.piId}')">
				                                        <span class="text">삭제</span>
				                                    </a>
	                                            </td>
	                                        </tr>
                                    	</c:forEach>
                                    	<c:if test="${empty qualityInfoList}"><tr><td colspan='8'>결과가 없습니다.</td><del></del></c:if>
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
	
		function fn_search_qualityInfo(){
			listForm.pageIndex.value = 1;
			listForm.submit();
		}
	
		function fn_searchAll_qualityInfo(){
			listForm.searchKeyword.value = "";
			listForm.pageIndex.value = 1;
			listForm.submit();
		}
	
		function fn_regist_qualityInfo(){
			listForm.action = "${pageContext.request.contextPath}/sl/basicInfo/qualityInfo/registQualityInfo.do";
			listForm.submit();
		}
		
		function fn_regist_standard(){
			listForm.action = "${pageContext.request.contextPath}/sl/basicInfo/qualityInfo/registStandard.do";
			listForm.submit();
		}
		
		function fn_list_standard(){
			listForm.action = "${pageContext.request.contextPath}/sl/basicInfo/qualityInfo/listStandard.do";
			listForm.submit();
		}
	
		function fn_modify_qualityInfo_go(id){
			listForm.ssiId.value = id;
			listForm.action = "${pageContext.request.contextPath}/sl/basicInfo/qualityInfo/modifySpcInfo.do";
			listForm.submit();
		}
		function fn_detail_qualityInfo(ssiId){
			listForm.ssiId.value = ssiId;
			listForm.action = "${pageContext.request.contextPath}/sl/basicInfo/qualityInfo/detailQualityInfo.do";
			listForm.submit();
		}
	
		function fn_delete_qualityInfo(idx,piId){
			if(confirm('해당 내역을 삭제 하시겠습니까?')) {
				listForm.ssiId.value = idx;
				listForm.piId.value = piId;
				listForm.action = "${pageContext.request.contextPath}/sl/basicInfo/qualityInfo/deleteQualityInfo.do";
				listForm.submit();
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