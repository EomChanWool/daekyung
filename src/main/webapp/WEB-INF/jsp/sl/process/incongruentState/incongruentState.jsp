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

                        <!-- Nav member - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">부적합 추이 현황</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                    <div class="card-header py-3">
							<div class="search">
								<form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/quality/incongruentState/incongruentStateList.do" method="post">
									
									<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
									
									<select class="btn btn-secondary dropdown-toggle searchCondition" name="searchCondition2" id="searchCondition2">
						    			
						    			<c:forEach var="list" items="${inYearList}" varStatus="status">
						    				<option value="${list.tiYear}" <c:if test="${searchVO.searchCondition2 eq list.tiYear or status.count eq 1}">selected="selected"</c:if>>${list.tiYear}년도</option>
						    			</c:forEach>
						    		</select>
						    								
   									
						    	</form>
						    	
	                           
							</div>
                        </div>
                        <div class="card-header py-3">
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
								<div id="graph" style="width: 100%; height:500px;"></div>
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
	$(function() {
		$('#qualityMenu').addClass("active");
		$('#quality').addClass("show");
		$('#incongruentStateList').addClass("active");
		
		 $('#searchCondition2').change(function(){
				listForm.submit();
			});
		
		window.onresize = function() {
			location.reload();
		}
	});
	
	var chartDom = document.getElementById('graph');
	var myChart = echarts.init(chartDom);
	var option;
	
	let month = [];
	
	let inCnt = [];
	
	let noCnt = [];
	
	
	const dataMin = 0;
	const dataMax = 500;
	const dataInterval = 100;
	
	
	<c:forEach items="${incoStateList}" var="list">
		month.push('${list.month}월');
		inCnt.push('${list.count}');
	</c:forEach>
	
	<c:forEach items = "${incongruityList}" var="list">
		
		noCnt.push('${list.count}');
	</c:forEach>
	
	

	option = {
			
			title:{
				text: '월별 추이'
			},
			tooltip: {
			    trigger: 'axis'
			  },
			 legend: {
				    data: ['월별 검사건수', '월별 부적합 건수']
				  },
			  
			
			  xAxis: {
			    type: 'category',
			    data: month
			    
			  },
			  yAxis: {
				
			    type: 'value',
			    
			    	axisLabel: {
				        formatter: '{value} 건'
				      }
			  },
			  series: [
			    {
			    name : '월별 검사건수',
			    data: inCnt,
			    type: 'line'
			      
			    }
			    ,
			    {
			    	
		    	name : '월별 부적합 건수',
			      data: noCnt,
			      type: 'line'
			    }
			  ]
			};
	option && myChart.setOption(option);
	</script>
</body>

</html>