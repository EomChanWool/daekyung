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
                    <h1 class="h3 mb-2 text-gray-800">생산집계 현황</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                        <div class="search">
								<form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/monitoring/actualOutput/actualOutput.do" method="post">
									<input type="hidden" name="orId">
									<input type="hidden" name="relIdx">
									<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
									
									<select class="btn btn-secondary dropdown-toggle searchCondition" name="searchCondition" id="searchCondition">
										<option value="">선택</option>
							    		<c:forEach begin="${date.begin}" end="${date.end}" varStatus="status">
							    			<option value="${status.begin+status.count}" <c:if test="${searchVO.searchCondition eq status.begin+status.count}">selected="selected"</c:if>>${status.begin+status.count}</option>
							    		</c:forEach>
						    		</select>
						    		<select class="btn btn-secondary dropdown-toggle searchCondition" name="searchCondition2" id="searchCondition2">
						    		<option value="1" <c:if test="${searchVO.searchCondition2 eq 1}">selected="selected"</c:if>>가공</option>
						    		<option value="2" <c:if test="${searchVO.searchCondition2 eq 2}">selected="selected"</c:if>>절단</option>
						    		</select>
						    		
						    	</form>
						    	<a href="#" class="btn btn-info btn-icon-split" onclick="fn_search_actualOutput()" style="margin-left: 0.3rem;">
	                                <span class="text">검색</span>
	                            </a>
						    	<a href="#" class="btn btn-success btn-icon-split" onclick="fn_searchAll_actualOutput()">
	                                <span class="text">올해</span>
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
	
	function fn_search_actualOutput(){
		listForm.submit();
	}
	
	function fn_searchAll_actualOutput(){
		listForm.searchCondition.value = "";
		listForm.submit();
	}
	
	
	$(function() {
		$('#monitoringMenu').addClass("active");
		$('#monitoring').addClass("show");
		$('#actualOutput').addClass("active");
		
		window.onresize = function() {
			location.reload();
		}
	});
	
	//생산실적 현황
	var chartDom = document.getElementById('graph');
	var myChart = echarts.init(chartDom);
	var option;


	var date = [];
	var year = [];
	
	var totalRealTime = [];
	
	var totalMflPerson = [];
	
	var avgRealTime = [];
	
	var num = 0;
	var years = 0;
	var maxMon = 0;
	
	if($('#searchCondition2').val() == "1"){
	
	<c:forEach items="${prodCntList}" var="list">
		year = ${list.years};
		maxMon = ${list.months};
	</c:forEach>
	
	for(var i=1;i<=maxMon;i++){
		date.push(year+"년 "+i+"월");
		totalRealTime.push(0);
		totalMflPerson.push(0);
		avgRealTime.push(0);
	}
	
	<c:forEach items="${prodCntList}" var="list">
	totalRealTime[${list.months-1}] = ${list.totalRealTime};
	totalMflPerson[${list.months-1}] = ${list.totalMflPerson};
	avgRealTime[${list.months-1}] = ${list.avgRealTime};
	</c:forEach>
	}else if($('#searchCondition2').val() == "2"){
		
		<c:forEach items="${prodCntList2}" var="list">
		year = ${list.years};
		maxMon = ${list.months};
	</c:forEach>
	for(var i=1;i<=maxMon;i++){
		date.push(year+"년 "+i+"월");
		totalRealTime.push(0);
		avgRealTime.push(0);
	}
	<c:forEach items="${prodCntList2}" var="list">
	totalRealTime[${list.months-1}] = ${list.totalTime};
	avgRealTime[${list.months-1}] = ${list.avgTime};
	</c:forEach>
		
	}
	
	
	if($('#searchCondition2').val() == "1"){
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
			    data: ['총 시간', '작업인원', '평균 시간']
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
			      name: '총작업시간',
			      axisLabel: {
			        formatter: '{value} MIN'
			      }
			    },
			    {
		    		  type: 'value',
			      	  name: '평균시간',
			      	  position: 'right',
			      	  axisLabel: {
			            formatter: '{value} MIN'
					  }
				    }
			    
			  ],
			  series: [
			    {
			      name: '총 시간',
			      stack: 'one',
			      type: 'bar',
			      label: {
			          show: true,
			          position: 'inside',
			          formatter: '{c}분'
			          
			        },
			      tooltip: {
			        valueFormatter: function (value) {
			          return value + ' MIN';
			        }
			      },
			      data: totalRealTime
			    },
			    {
			      name: '작업인원',
			      stack: 'one',
			      type: 'bar',
			      
			      label: {
			          show: true,
			          position: 'left',
			          formatter: '{c}명'
			          
			        },
			      tooltip: {
			        valueFormatter: function (value) {
			          return value + ' HC';
			        }
			      },
			      data: totalMflPerson
			    },
			    {
			      name: '평균 시간',
			      yAxisIndex: 1,
			      type: 'line',
			      label: {
			          show: true,
			          position: 'top',
			          formatter: '{c}분'
			        },
			      tooltip: {
			        valueFormatter: function (value) {
			          return value + ' MIN';
			        }
			      },
			      data: avgRealTime
			    }
			  ]
			};
	}else if($('#searchCondition2').val() == "2"){
		
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
				    data: ['총 시간', '평균 시간']
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
				      name: '총작업시간',
				      axisLabel: {
				        formatter: '{value} MIN'
				      }
				    },
				    {
			    		  type: 'value',
				      	  name: '평균시간',
				      	  position: 'right',
				      	  axisLabel: {
				            formatter: '{value} MIN'
						  }
					    }
				    
				  ],
				  series: [
				    {
				      name: '총 시간',
				      stack: 'one',
				      type: 'bar',
				      label: {
				          show: true,
				          position: 'inside',
				          formatter: '{c}분'
				          
				        },
				      tooltip: {
				        valueFormatter: function (value) {
				          return value + ' MIN';
				        }
				      },
				      data: totalRealTime
				    },
				   
				    {
				      name: '평균 시간',
				      yAxisIndex: 1,
				      type: 'line',
				      label: {
				          show: true,
				          position: 'top',
				          formatter: '{c}분'
				        },
				      tooltip: {
				        valueFormatter: function (value) {
				          return value + ' MIN';
				        }
				      },
				      data: avgRealTime
				    }
				  ]
				};
		
	}
	
	option && myChart.setOption(option);
	</script>
</body>

</html>