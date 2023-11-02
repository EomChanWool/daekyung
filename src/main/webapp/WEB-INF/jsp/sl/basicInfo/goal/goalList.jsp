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

                        <!-- Nav goal - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">목표관리정보관리</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
							<div class="search">
								<form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/basicInfo/goal/goalList.do" method="post">
									<input type="hidden" name="gmYear">
									<input type="hidden" name="gmMonth">
									<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
						    		<select class="btn btn-secondary dropdown-toggle searchCondition" name="searchCondition" id="searchCondition">
						    			<option value="" <c:if test="${searchVO.searchCondition eq ''}">selected="selected"</c:if>>전체</option>
						    			<option value="2023" <c:if test="${searchVO.searchCondition eq '2023'}">selected="selected"</c:if>>2023년</option>
						    			<option value="2024" <c:if test="${searchVO.searchCondition eq '2024'}">selected="selected"</c:if>>2024년</option>
						    			<option value="2025" <c:if test="${searchVO.searchCondition eq '2025'}">selected="selected"</c:if>>2025년</option>
						    			<option value="2026" <c:if test="${searchVO.searchCondition eq '2026'}">selected="selected"</c:if>>2026년</option>
						    		</select>
						    		<select class="btn btn-secondary dropdown-toggle searchCondition" name="searchCondition2" id="searchCondition2">
							    		<option value="">선택</option>
							    		<c:forEach begin="1" end="12" varStatus="status">
							    			<option value="${status.count}" <c:if test="${searchVO.searchCondition3 eq status.count}">selected="selected"</c:if>>${status.count}월</option>
							    		</c:forEach>
						    		</select>
						    	</form>
						    	<a href="#" class="btn btn-info btn-icon-split" onclick="fn_search_goal()" style="margin-left: 0.3rem;">
	                                <span class="text">검색</span>
	                            </a>
						    	<a href="#" class="btn btn-success btn-icon-split" onclick="fn_searchAll_goal()">
	                                <span class="text">전체목록</span>
	                            </a>
	                            <a href="#" class="btn btn-primary btn-icon-split" onclick="fn_regist_goal()" style="float: right;">
	                                <span class="text">등록</span>
	                            </a>
							</div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable"  >
                                    <thead>
                                        <tr>
                                            <th>목표연도</th>
											<th>목표월</th>
											<th>목표생산량</th>
											<th>목표생산률</th>
											<th>목표불량율</th>
											<th>수정/삭제</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    	<c:forEach var="result" items="${goalList}" varStatus="status">
	                                   		<tr>
	                                            <td>${result.gmYear}년</td>
												<td>${result.gmMonth}월</td>
												<td>${result.gmProdQty}kg</td>
												<td>${result.gmGoodRate}%</td>
												<td>${result.gmBadRate}%</td>
												<td style="padding: 5px 0px;">
                                            	<a href="#" class="btn btn-warning btn-icon-split" onclick="fn_modify_goal_go('${result.gmYear}','${result.gmMonth}')">
			                                        <span class="text">수정</span>
			                                    </a>
			                                    <a href="#" class="btn btn-danger btn-icon-split" onclick="fn_delete_goal('${result.gmYear}','${result.gmMonth}')">
			                                        <span class="text">삭제</span>
			                                    </a>
                                            </td>
	                                        </tr>
                                    	</c:forEach>
                                    	<c:if test="${empty goalList}"><tr><td colspan='6'>결과가 없습니다.</td><del></del></c:if>
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
	
		function fn_search_goal(){
			listForm.pageIndex.value = 1;
			listForm.submit();
		}
	
		function fn_searchAll_goal(){
			listForm.searchCondition.value = "";
			listForm.searchCondition2.value = "";
			listForm.pageIndex.value = 1;
			listForm.submit();
		}
		function fn_regist_goal(){
			listForm.action = "${pageContext.request.contextPath}/sl/basicInfo/goal/registGoal.do";
			listForm.submit();
		}
	
		function fn_modify_goal_go(gmYear,gmMonth){
			listForm.gmYear.value = gmYear;
			listForm.gmMonth.value = gmMonth;
			listForm.action = "${pageContext.request.contextPath}/sl/basicInfo/goal/modifyGoal.do";
			listForm.submit();
		}
	
		function fn_delete_goal(gmYear,gmMonth){
			if(confirm('해당 내역을 삭제 하시겠습니까?')) {
				listForm.gmYear.value = gmYear;
				listForm.gmMonth.value = gmMonth;
				listForm.action = "${pageContext.request.contextPath}/sl/basicInfo/goal/deleteGoal.do";
				listForm.submit();
			}
		}
	
		$(function() {
			$('#basicInfoMenu').addClass("active");
			$('#basicInfo').addClass("show");
			$('#goalList').addClass("active");
			
			var msg = '${msg}';
			if(msg){
				alert(msg);
			}
			
		});
	</script>
</body>

</html>