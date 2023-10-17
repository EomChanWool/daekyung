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
                        <!-- Nav Item - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">사원권한관리</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
							<div class="search">
								<form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/basicInfo/Authority/userAuthorityList.do" method="post">
									<input type="hidden" name="maIdx">
									<input type="hidden" name="maPname">
									<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
						    		<select  class="btn btn-secondary dropdown-toggle searchCondition" name="searchCondition" id="searchCondition">
							    		<option value="" <c:if test="${searchVO.searchCondition eq ''}">selected="selected"</c:if>>선택</option>
							    		<option value="기준정보관리" <c:if test="${searchVO.searchCondition eq '기준정보관리'}">selected="selected"</c:if>>기준정보관리</option>
							    		<option value="정보수집관리" <c:if test="${searchVO.searchCondition eq '정보수집관리'}">selected="selected"</c:if>>정보수집관리</option>
							    		<option value="품질관리" <c:if test="${searchVO.searchCondition eq '품질관리'}">selected="selected"</c:if>>품질관리</option>
							    		<option value="설비관리" <c:if test="${searchVO.searchCondition eq '설비관리'}">selected="selected"</c:if>>설비관리</option>
							    		<option value="공정관리" <c:if test="${searchVO.searchCondition eq '공정관리'}">selected="selected"</c:if>>공정관리</option>
							    		<option value="KPI관리" <c:if test="${searchVO.searchCondition eq 'KPI관리'}">selected="selected"</c:if>>KPI관리</option>
							    		<option value="모니터링" <c:if test="${searchVO.searchCondition eq '모니터링'}">selected="selected"</c:if>>모니터링</option>
							    		<option value="POP" <c:if test="${searchVO.searchCondition eq 'POP'}">selected="selected"</c:if>>POP</option>
					    			</select>
						    	</form>
						    	<a href="#" class="btn btn-info btn-icon-split" onclick="fn_search_userAuthority()" style="margin-left: 0.3rem;">
	                                <span class="text">검색</span>
	                            </a>
						    	<a href="#" class="btn btn-success btn-icon-split" onclick="fn_searchAll_userAuthority()">
	                                <span class="text">전체목록</span>
	                            </a>
	                            <a href="#" class="btn btn-primary btn-icon-split" onclick="fn_regist_userAuthority()" style="float: right;">
	                                <span class="text">등록</span>
	                            </a>
							</div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable"  >
                                    <thead>
                                        <tr>
                                            <th>메뉴그룹</th>
                                            <th>메뉴</th>
                                            <th>권한레벨</th>
                                            <th>수정/삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="result" items="${atList}" varStatus="status">
                                    		<tr>
                                            <td>${result.maGroup}</td>
                                            <td>${result.maPname}</td>
                                            <td>${result.miLevel}</td>
                                            <td style="padding: 5px 0px;">
                                            	<a href="#" class="btn btn-warning btn-icon-split" onclick="fn_modify_userAuthority_go('${result.maIdx}')">
			                                        <span class="text">수정</span>
			                                    </a>
			                                    <a href="#" class="btn btn-danger btn-icon-split" onclick="fn_delete_userAuthority('${result.maIdx}','${result.maPname}')">
			                                        <span class="text">삭제</span>
			                                    </a>
                                            </td>
                                        </tr>
                                    	</c:forEach>
                                    	<c:if test="${empty atList}"><tr><td colspan='5'>결과가 없습니다.</td><del></del></c:if>
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
	
		function fn_search_userAuthority(){
			if($('#searchCondition').val()==''){
				alert("검색조건을 선택하세요.");
				return;
			}
			listForm.pageIndex.value = 1;
			listForm.submit();
		}
	
		function fn_searchAll_userAuthority(){
			listForm.searchCondition.value = "";
			listForm.pageIndex.value = 1;
			listForm.submit();
		}
	
		function fn_regist_userAuthority(){
			listForm.action = "${pageContext.request.contextPath}/sl/basicInfo/Authority/registUserAuthority.do";
			listForm.submit();
		}
	
		function fn_modify_userAuthority_go(maIdx){
			listForm.maIdx.value = maIdx;
			
			listForm.action = "${pageContext.request.contextPath}/sl/basicInfo/Authority/modifyUserAuthority.do";
			listForm.submit();
		}
	
		function fn_delete_userAuthority(maIdx, maPname){
			if(confirm('해당 내역을 삭제 하시겠습니까?')) {
				listForm.maIdx.value = maIdx;
				listForm.maPname.value = maPname;
				listForm.action = "${pageContext.request.contextPath}/sl/basicInfo/Authority/deleteUserAuthority.do";
				listForm.submit();
			}
		}
	
		$(function() {
			$('#basicInfoMenu').addClass("active");
			$('#basicInfo').addClass("show");
			$('#userAuthorityList').addClass("active");
			
			let msg = '${msg}';
			if(msg) {
				alert(msg);
			}
			
		});
	</script>
</body>

</html>