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

                        <!-- Nav inspect - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">검사공정관리</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
							<div class="search">
								<form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/process/inspect/inspectList.do" method="post">
									<input type="hidden" name="isiId">
									<input type="hidden" name="isiItemType">
									<input type="hidden" name="isiSpcSpec">
									<input type="hidden" name="isiFile">
									<input type="hidden" name="cFile">
									<input type="hidden" name="isiReportFile">
									<input type="hidden" name="isiReportImage">
									<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
									<input type="text" class="form-control bg-light border-0 small" name="searchKeyword"
						    									value="${searchVO.searchKeyword}" placeholder="LOT번호를 입력해 주세요"
						    									style="background-color:#eaecf4; width: 25%; float: left;">
						    	</form>
						    	<a href="#" class="btn btn-info btn-icon-split" onclick="fn_search_inspect()" style="margin-left: 0.3rem;">
	                                <span class="text">검색</span>
	                            </a>
						    	<a href="#" class="btn btn-success btn-icon-split" onclick="fn_searchAll_inspect()">
	                                <span class="text">전체목록</span>
	                            </a>
	                            <a href="#" class="btn btn-primary btn-icon-split" onclick="fn_regist_inspect()" style="float: right;">
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
                                            <th>보고서번호</th>
                                            <th>품목코드</th>
                                            <th>품목명</th>
                                            <th>검사방식</th>
                                            <th>관리항목</th>
                                            <th>SPC스펙</th>
                                            <th>검사일</th>
                                            <th>검사자</th>
                                            <th>판정</th>
											<th>수정/삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="result" items="${inspectList}" varStatus="status">
	                                   	<tr onclick="fn_detail_inspect('${result.isiId}','${result.isiItemType}','${result.isiSpcSpec}','${result.isiFile1}','1')" style="cursor: pointer;">
	                                            <td>${result.orId}</td>
	                                            <td>${result.isiLotno}-${result.isiId}</td>
	                                            <td>${result.isiItemType}</td>
	                                            <td>${result.isiItemName}</td>
	                                            <td>${result.isiWay}</td>
	                                            <td>${result.siId}</td>
	                                            <td>${result.isiSpcSpec}</td>
	                                            <td>${result.isiDate}</td>
	                                            <td>${result.isiManager}</td>
	                                            <c:if test="${result.isiCheck == 0 }"><td>판정전</td></c:if>
	                                            <c:if test="${result.isiCheck == 1 }"><td>합격</td></c:if>
	                                            <c:if test="${result.isiCheck == 2 }"><td>불합격</td></c:if>
	                                            <td onclick="event.cancelBubble=true" style="padding: 5px 0px; cursor: default;">
	                                            	<a href="#" class="btn btn-warning btn-icon-split" onclick="fn_modify_inspect_go('${result.isiId}')">
				                                        <span class="text">수정</span>
				                                    </a>
				                                    <a href="#" class="btn btn-danger btn-icon-split" onclick="fn_delete_inspect('${result.isiId}','${result.isiReportFile}','${result.isiReportImage}')">
				                                        <span class="text">삭제</span>
				                                    </a>
	                                            </td>
	                                        </tr>
                                    	</c:forEach>
                                    	<c:if test="${empty inspectList}"><tr><td colspan='11'>결과가 없습니다.</td><del></del></c:if>
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
	
		function fn_search_inspect(){
			listForm.pageIndex.value = 1;
			listForm.submit();
		}
	
		function fn_searchAll_inspect(){
			listForm.searchKeyword.value = "";
			listForm.pageIndex.value = 1;
			listForm.submit();
		}
	
		function fn_regist_inspect(){
			listForm.action = "${pageContext.request.contextPath}/sl/process/inspect/registInspect.do";
			listForm.submit();
		}
	
		function fn_modify_inspect_go(isiId){
			listForm.isiId.value = isiId;
			listForm.action = "${pageContext.request.contextPath}/sl/process/inspect/modifyInspect.do";
			listForm.submit();
		}
		
		function fn_detail_inspect(isiId,isiItemType,isiSpcSpec,isiFile,cFile){
			listForm.isiId.value = isiId;
			listForm.isiItemType.value = isiItemType;
			listForm.isiSpcSpec.value = isiSpcSpec;
			listForm.isiFile.value = isiFile;
			listForm.cFile.value = cFile;
			listForm.action = "${pageContext.request.contextPath}/sl/process/inspect/detailInspect.do";
			listForm.submit();
		}
	
		function fn_delete_inspect(isiId,file,image){
			if(confirm('해당 내역을 삭제 하시겠습니까?')) {
				listForm.isiId.value = isiId;
				listForm.isiReportFile.value = file;
				listForm.isiReportImage.value = image;
				listForm.action = "${pageContext.request.contextPath}/sl/process/inspect/deleteInspect.do";
				listForm.submit();
			}
		}
	
		$(function() {
			$('#processMenu').addClass("active");
			$('#process').addClass("show");
			$('#inspectList').addClass("active");
			
			let msg = '${msg}';
			if(msg) {
				alert(msg);
			}
		});
	</script>
</body>

</html>