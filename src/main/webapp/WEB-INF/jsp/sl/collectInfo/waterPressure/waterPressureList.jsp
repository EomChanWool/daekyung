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
                    <h1 class="h3 mb-2 text-gray-800">수압시험정보관리</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
							<div class="search">
								<form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/collectInfo/waterPressure/waterPressureList.do" method="post">
									<input type="hidden" name="wpId">
									<input type="hidden" name="orIdx">
									<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
<!-- 									<input type="text" class="form-control bg-light border-0 small" name="searchKeyword" -->
<%-- 						    									value="${searchVO.searchKeyword}" placeholder="검색어를 입력해 주세요" --%>
<!-- 						    									style="background-color:#eaecf4; width: 25%; float: left;"> -->
						    		
						    		<input class="btn btn-secondary searchDate" id="searchStDate" name="searchStDate" value="${searchVO.searchStDate}" type="datetime-local">
									<span class="dash" style="display: inline-block; float: left; margin: 0.5rem 0.3rem 0 0">~</span>
									<input class="btn btn-secondary searchDate" id="searchEdDate" name="searchEdDate" value="${searchVO.searchEdDate}" type="datetime-local">
						    	</form>
						    	<a href="#" class="btn btn-info btn-icon-split" onclick="fn_search_water()" style="margin-left: 0.3rem;">
	                                <span class="text">검색</span>
	                            </a>
						    	<a href="#" class="btn btn-success btn-icon-split" onclick="fn_searchAll_water()">
	                                <span class="text">오늘 전체목록</span>
	                            </a>
	                            <a href="#" class="btn btn-primary btn-icon-split" onclick="fn_regist_water()" style="float: right;">
	                                <span class="text">등록</span>
	                            </a>
							</div>
                        </div>
                        <div id="graph" style="width: 100%; height:300px;"></div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable"  >
                                    <thead>
                                        <tr>
                                            <th>코드명</th>
											<th>측정값</th>
											<th>측정시간</th>
											<th>사용유무</th>
											<th>수정/삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="result" items="${waterPressureList}" varStatus="status">
	                                   		<tr>
	                                            <td>${result.wpCode}</td>
												<td>${result.wpValue}</td>
												<td><fmt:formatDate value="${result.wpTime}" pattern="yyyy-MM-dd HH:mm"/></td>
												<c:if test="${result.wpState == 0 }"><td>사용가능</td></c:if>
												<c:if test="${result.wpState == 1 }"><td>사용불가</td></c:if>
											
	                                            <td style="padding: 5px 0px;">
	                                            	<a href="#" class="btn btn-warning btn-icon-split" onclick="fn_modify_water_go('${result.wpId}')">
				                                        <span class="text">수정</span>
				                                    </a>
				                                    <a href="#" class="btn btn-danger btn-icon-split" onclick="fn_delete_water('${result.wpId}')">
				                                        <span class="text">삭제</span>
				                                    </a>
	                                            </td>
	                                        </tr>
                                    	</c:forEach>
                                    	<c:if test="${empty waterPressureList}"><tr><td colspan='6'>결과가 없습니다.</td><del></del></c:if>
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
		
		function fn_search_water(){
			var searchStDate = document.getElementById('searchStDate').value;
	        var searchEdDate = document.getElementById('searchEdDate').value;
			var searchStDateValue = searchStDate.replace('T', ' ');
			var searchEdDateValue = searchEdDate.replace('T', ' ');
	        if (searchStDateValue > searchEdDateValue) {
	            alert('검색 시작일은 검색 종료일보다 클 수 없습니다.');
	            return;
	        }
	        
			listForm.submit();
		}
		
		function fn_searchAll_water(){
			listForm.searchStDate.value = "";
			listForm.searchEdDate.value = "";
			listForm.pageIndex.value = 1;
			listForm.submit();
		}
		
		function fn_regist_water(){
			listForm.action = "${pageContext.request.contextPath}/sl/collectInfo/waterPressure/registWaterPressure.do";
			listForm.submit();
		}
		
		function fn_modify_water_go(id){
			listForm.wpId.value = id;
			listForm.action = "${pageContext.request.contextPath}/sl/collectInfo/waterPressure/modifyWaterPressure.do";
			listForm.submit();
		}
		
		function fn_delete_water(id){
			if(confirm('해당 내역을 삭제하시겠습니까?')) {
				listForm.wpId.value = id;
				listForm.action = "${pageContext.request.contextPath}/sl/collectInfo/waterPressure/deleteWaterPressure.do";
				listForm.submit();
			}
		}
		
		
		$(function() {
			$('#collectInfoMenu').addClass("active");
			$('#collectInfo').addClass("show");
			$('#waterPressureList').addClass("active");
			
			let msg = '${msg}';
			if(msg) {
				alert(msg);
			}
			
			
		});
			
		var chartDom = document.getElementById('graph');
		var myChart = echarts.init(chartDom);
		var option;

		let lineTime = [];
		
		let lineValue = [];
		
		<c:forEach items="${waterPressureGraphList}" var="list">
		lineValue.push('${list.wpValue}');
		lineTime.push('${list.wpTime}'.split('.')[0]);
		</c:forEach>
		
		console.log(lineValue)
		console.log(lineTime)
		
		option = {
		  animation: false,
		  xAxis: {
		    type: 'category',
		    name: '측정시간',
		    data: lineTime,
		    axisLabel: {
		        formatter: function (value, index) {
		          var date = new Date(value);
		          var minutes = date.getMinutes();
		          return date.getHours() + ':' + (minutes < 10 ? '0' : '') + minutes;
		        }
		      }
		  },
		  yAxis: {
		    type: 'value',
		    name: '측정값'
		  },
		  tooltip: {
			    trigger: 'axis', 
			    formatter: function (params) {
			      var xValue = params[0].name;
			      var yValue = params[0].value;
			      return '<span style="font-weight: bold; letter-spacing: 4.7px;">측정값:</span>' + yValue + '<br><strong>측정시간:</strong> ' + xValue;
			    }
			  },
		  series: [
		    {
		      data: lineValue,
		      type: 'line',
		      smooth: true
		    }
		  ]
		};

		option && myChart.setOption(option);
		
	</script>
</body>

</html>