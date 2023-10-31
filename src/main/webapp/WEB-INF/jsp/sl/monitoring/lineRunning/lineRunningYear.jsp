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
                    <h1 class="h3 mb-2 text-gray-800">라인가동현황(월별)</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
							<div class="search">
								<form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/monitoring/lineRunning/lineRunningYear.do" method="post">
						    		
						    		<select class="btn btn-secondary dropdown-toggle searchCondition" name="searchCondition" id="searchCondition">
						    			<option value="" <c:if test="${searchVO.searchCondition eq ''}">selected="selected"</c:if>>전체</option>
						    			<option value="2023" <c:if test="${searchVO.searchCondition eq '2023'}">selected="selected"</c:if>>2023년</option>
						    			<option value="2024" <c:if test="${searchVO.searchCondition eq '2024'}">selected="selected"</c:if>>2024년</option>
						    			<option value="2025" <c:if test="${searchVO.searchCondition eq '2025'}">selected="selected"</c:if>>2025년</option>
						    			<option value="2026" <c:if test="${searchVO.searchCondition eq '2026'}">selected="selected"</c:if>>2026년</option>
						    		</select>
						    		
						    		<select class="btn btn-secondary dropdown-toggle searchCondition" name="searchCondition2" id="searchCondition2">
						    		<option value="" <c:if test="${searchVO.searchCondition2 eq ''}">selected="selected"</c:if>>전체</option>
						    		<c:forEach var="list" items="${eqName}" varStatus="status">
						    		<option value="${list.eqSensorid}" <c:if test="${searchVO.searchCondition2 eq list.eqSensorid}">selected="selected"</c:if>>${list.eqSensorid}</option>
						    		</c:forEach>
						    		
						    		</select>
									
						    	</form>
						    	<a href="#" class="btn btn-info btn-icon-split" onclick="fn_search_lineRunning()" style="margin-left: 0.3rem;">
	                                <span class="text">검색</span>
	                            </a>
						    	<a href="#" class="btn btn-success btn-icon-split" onclick="fn_searchAll_lineRunning()">
	                                <span class="text">올해전체</span>
	                            </a>
	                            
	                            <a href="#" class="btn btn-primary btn-icon-split" onclick="fn_go_line()" style="float: right; margin-left: 0.5rem;">
	                                <span class="text">일별데이터로 이동</span>
	                            </a>
	                             
							</div>
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
	function fn_pageview(pageNo) {
		listForm.pageIndex.value = pageNo;
	   	listForm.submit();
	}
	
	function fn_go_line(){
		listForm.action = "${pageContext.request.contextPath}/sl/monitoring/lineRunning/lineRunning.do";
		listForm.submit();
	}
	
	function fn_search_lineRunning(){
		
		/* 
		var date1 = $('#searchEdDate').val();
		var date1_arr = date1.split("-");
		var date2 = $('#searchStDate').val();
		var date2_arr = date2.split("-");
		
		var edDate = new Date(date1_arr[0],date1_arr[1],date1_arr[2]);
		var stDate = new Date(date2_arr[0],date2_arr[1],date2_arr[2]);
		
		var btMs = edDate.getTime() - stDate.getTime();
		var btDay = btMs / (1000*60*60*24);
		
		if(btDay > 30){
			alert("30일 단위로만 검색가능합니다.");
			return;
		} */
		
		listForm.submit();
	}
	
	function fn_searchAll_lineRunning(){
		listForm.searchCondition.value = "";
		listForm.searchCondition2.value = "";
		listForm.submit();
	}
	

	
	$(function() {
		$('#monitoringMenu').addClass("active");
		$('#monitoring').addClass("show");
		$('#lineRunning').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
		$('#searchCondition').change(function(){
			listForm.submit();
		});
		$('#searchCondition2').change(function(){
			listForm.submit();
		});
	});
	
	var chartDom = document.getElementById('graph');
	var myChart = echarts.init(chartDom);
	var option;
	
	
	let date = [];
	
	let lineCount = [];
	
	let workTime=[];
	
	<c:forEach items="${eqList}" var="list">
	date.push('${list.months}월');
	lineCount.push('${list.counting}');
	workTime.push('${list.workTime}');
	</c:forEach>
	
	
	option = {
			  tooltip: {
			    trigger: 'axis',
			    axisPointer: {
			    	type: 'cross',
			    	axis: "auto",
			    	crossStyle: {
			        	color: '#999'
			    	}
			    }
			  },
			  toolbox: {
			    feature: {
			      dataView: { show: false, readOnly: false },
			      magicType: { show: false, type: ['line', 'bar'] },
			      restore: { show: false },
			      saveAsImage: { show: true }
			    }
			  },
			  legend: {
			    data: ['카운트','작동시간']
			  },
			  xAxis: [
			    {
			      type: 'category',
			      data: date,
			      axisPointer: {
			        type: 'shadow'
			      }
			    }
			  ],
			  yAxis: [
			    {
			      type: 'value',
			      name: 'Count',
			      axisLabel: {
			        formatter: '{value} Count'
			      }
			    },
			    {
	    		  type: 'value',
		      	  name: '작동시간',
		      	  position: 'right',
		      	  axisLabel: {
		            formatter: '{value} sec'
				  }
			    }
			  ],
			  series: [
			    {
			      name: '카운트',
			      type: 'bar',
			      label: {
			          show: true,
			          position: 'inside',
			          formatter: '{c} Count'
			          
			        },
			      tooltip: {
			        valueFormatter: function (value) {
			          return value + ' Count';
			        }
			      },
			      data: lineCount
			    },
			    {
				      name: '작동시간',
				      yAxisIndex: 1,
				      type: 'bar',
				      label: {
				          show: true,
				          position: 'inside',
				          formatter: '{c} sec'
				          
				        },
				      tooltip: {
				        valueFormatter: function (value) {
				          return value + ' sec';
				        }
				      },
				      data: workTime
				    },
			  ]
			};
	option && myChart.setOption(option);
	</script>
</body>

</html>