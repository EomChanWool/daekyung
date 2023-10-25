<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../../header.jsp" %>

<body id="page-top">
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5.4.1/dist/echarts.min.js"></script>
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

                        <!-- Nav kpi - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">가공공정정보관리</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
							<div class="search">
								<form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/collectInfo/processing/processingList.do" method="post">
									<input type="hidden" name="mflIdx">
									<input type="hidden" name="orId">
									<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
									<select class="btn btn-secondary dropdown-toggle searchCondition" name="searchCondition" id="searchCondition">
							    		<option value="" <c:if test="${searchVO.searchCondition eq ''}">selected="selected"</c:if>>선택</option>
							    		<option value="1" <c:if test="${searchVO.searchCondition eq '1'}">selected="selected"</c:if>>수주번호</option>
							    		<option value="2" <c:if test="${searchVO.searchCondition eq '2'}">selected="selected"</c:if>>작업자</option>
							    		<option value="3" <c:if test="${searchVO.searchCondition eq '3'}">selected="selected"</c:if>>로트번호</option>
						    		</select>
									<input type="text" class="form-control bg-light border-0 small" name="searchKeyword"
						    									value="${searchVO.searchKeyword}" placeholder="검색어를 입력해 주세요"
						    									style="background-color:#eaecf4; width: 25%; float: left;">
						    		
						    		<input class="btn btn-secondary searchDate" id="searchStDate" name="searchStDate" value="${searchVO.searchStDate}" type="date">
									<span class="dash" style="display: inline-block; float: left; margin: 0.5rem 0.3rem 0 0">~</span>
									<input class="btn btn-secondary searchDate" id="searchEdDate" name="searchEdDate" value="${searchVO.searchEdDate}" type="date">
						    	</form>
						    	<a href="#" class="btn btn-info btn-icon-split" onclick="fn_search_workOrder()" style="margin-left: 0.3rem;">
	                                <span class="text">검색</span>
	                            </a>
						    	<a href="#" class="btn btn-success btn-icon-split" onclick="fn_searchAll_workOrder()">
	                                <span class="text">전체목록</span>
	                            </a>
	                            <a href="#" class="btn btn-primary btn-icon-split" onclick="fn_regist_pro()" style="float: right;">
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
											<th>로트번호</th>
											<th>품목</th>
											<th>생산량</th>
											<th>작업자</th>
											<th>시작시간</th>
											<th>종료시간</th>
											<th>걸린시간</th>
											<th>실작업시간</th>
											<th>수정/삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="result" items="${processingList}" varStatus="status">
	                                   		<tr>
	                                            <td>${result.orId}</td>
												<td>${result.poLotno}</td>
												<td>${result.mpProdName},${result.mpTexture},${result.mpThickness},,${result.mpState},${result.mpStandard}</td>
												<td>${result.mpQty}</td>
												<td>${result.mflManager}</td>
												<td><fmt:formatDate value="${result.mflStDate}" pattern="yyyy-MM-dd HH:mm"/></td>
												<td><fmt:formatDate value="${result.mflEdDate}" pattern="yyyy-MM-dd HH:mm"/></td>
												<td>${result.mflWorkTime}분</td>
												<td>${result.realTime}분</td>
	                                            <td style="padding: 5px 0px;">
	                                            	<a href="#" class="btn btn-warning btn-icon-split" onclick="fn_modify_pro_go('${result.mflIdx}')">
				                                        <span class="text">수정</span>
				                                    </a>
				                                    <a href="#" class="btn btn-danger btn-icon-split" onclick="fn_delete_pro('${result.orId}')">
				                                        <span class="text">삭제</span>
				                                    </a>
	                                            </td>
	                                        </tr>
                                    	</c:forEach>
                                    	<c:if test="${empty processingList}"><tr><td colspan='10'>결과가 없습니다.</td><del></del></c:if>
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
		
		function fn_search_kpi(){
			listForm.submit();
		}
		
		function fn_searchAll_kpi(){
			listForm.searchCondition.value = "";
			listForm.searchCondition2.value = "";
			listForm.searchCondition3.value = "";
			listForm.pageIndex.value = 1;
			listForm.submit();
		}
		
		function fn_regist_pro(){
			listForm.action = "${pageContext.request.contextPath}/sl/collectInfo/processing/registProcessing.do";
			listForm.submit();
		}
		
		function fn_modify_pro_go(idx){
			listForm.mflIdx.value = idx;
			listForm.action = "${pageContext.request.contextPath}/sl/collectInfo/processing/modifyProcessing.do";
			listForm.submit();
		}
		
		function fn_delete_pro(Idx){
			if(confirm('해당 내역을 삭제하시겠습니까?')) {
				listForm.orId.value = Idx;
				listForm.action = "${pageContext.request.contextPath}/sl/collectInfo/processing/deleteProcessing.do";
				listForm.submit();
			}
		}
		
		$(function() {
			$('#collectInfoMenu').addClass("active");
			$('#collectInfo').addClass("show");
			$('#processingList').addClass("active");
			
			let msg = '${msg}';
			if(msg) {
				alert(msg);
			}
			
			
			});
			
			
		
			
	
	</script>
</body>

</html>