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
                    <h1 class="h3 mb-2 text-gray-800">KPI현황</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
							<div class="search">
								<form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/kpi/kpiState/kpiStateList.do" method="post">
									<input type="hidden" name="kiId">
									<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
									
						    		
									<select class="btn btn-secondary dropdown-toggle searchCondition" name="searchCondition" id="searchCondition">
										<option value="">선택</option>
							    		<c:forEach begin="${date.begin}" end="${date.end}" varStatus="status">
							    			<option value="${status.begin+status.count}" <c:if test="${searchVO.searchCondition eq status.begin+status.count}">selected="selected"</c:if>>${status.begin+status.count}</option>
							    		</c:forEach>
						    		</select>
						    		<select class="btn btn-secondary dropdown-toggle searchCondition" name="searchCondition2" id="searchCondition2">
							    		<option value="">선택</option>
							    		<option value="1" <c:if test="${searchVO.searchCondition2 eq 1}">selected="selected"</c:if>>시간당생산량</option>
							    		<option value="2" <c:if test="${searchVO.searchCondition2 eq 2}">selected="selected"</c:if>>불량률</option>
							    		<option value="3" <c:if test="${searchVO.searchCondition2 eq 3}">selected="selected"</c:if>>작업공수</option>
							    		<option value="4" <c:if test="${searchVO.searchCondition2 eq 4}">selected="selected"</c:if>>리드타임</option>
						    		</select>
						    	</form>
						    	
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
		
		$(function() {
			$('#kpiMeun').addClass("active");
			$('#kpi').addClass("show");
			$('#kpiStateList').addClass("active");
			
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
			
			
			window.onresize = function() {
				location.reload();
			}
		});
			
		//그래프
		var chartDom = document.getElementById('graph');
		var myChart = echarts.init(chartDom);
		var option;
		let date = [];
		let year = [];
		
		let kpiOutputData = [];
		let kpiSalesData = [];
		
		let viewData = [];
		
		let totalProd = [];
		
		var years = 0;
		var maxMon = 0;
			
		
		
		
		if($('#searchCondition2').val() == "1"){
			<c:forEach items="${kpiGraphList}" var="list">
			years2 = ${list.kiYear};
			maxMon2 = ${list.kiMonth};
		</c:forEach>
			for(var i=1;i<=maxMon2;i++){
			date.push(years2+"년 "+i+"월");
			kpiOutputData.push(0);
			viewData.push(0);
			totalProd.push(0);
			}
			<c:forEach items="${kpiGraphList}" var="list">
			kpiOutputData[${list.kiMonth-1}] = ${list.kiQty};
			</c:forEach>
			<c:forEach items="${totalProdCnt}" var="list">
			var sumData = ${list.totalQty};
			var workTime = ${list.totalTime};
			
			var hourProd = Math.round((sumData/workTime) * 60);
			
			console.log(hourProd);
			viewData[${list.months-1}] = hourProd;
			totalProd[${list.months-1}] = sumData;
			</c:forEach>
			
		}else if($('#searchCondition2').val() == "2"){
			
			<c:forEach items="${kpiGraphList}" var="list">
			years = ${list.kiYear};
			maxMon = ${list.kiMonth};
			</c:forEach>
			for(var i=1;i<=maxMon;i++){
				date.push(years+"년 "+i+"월");
				kpiOutputData.push(0);
				viewData.push(0);
			}
			<c:forEach items="${kpiGraphList}" var="list">
			kpiOutputData[${list.kiMonth-1}] = ${list.kiBadQty};
			
		</c:forEach>
		<c:forEach items="${inspecPer}" var="list">
		var a1 = ${list.totalCnt};
		var b1 = ${list.badCnt};
		
		
		console.log(c1);
		
		var badPer = Math.round((b1/a1)*100);
		if(manHour == Infinity){
			badPer = 0;
		}
		
		viewData[${list.months-1}] = badPer;
		
		
		</c:forEach>
		}else if($('#searchCondition2').val() == "3"){
			
			<c:forEach items="${kpiGraphList}" var="list">
			years = ${list.kiYear};
			maxMon = ${list.kiMonth};
			</c:forEach>
			for(var i=1;i<=maxMon;i++){
				date.push(years+"년 "+i+"월");
				kpiOutputData.push(0);
				viewData.push(0);
			}
			<c:forEach items="${kpiGraphList}" var="list">
			kpiOutputData[${list.kiMonth-1}] = ${list.kiManhour};
			
		</c:forEach>
		
		<c:forEach items="${wTList}" var="list">
		var a1 = ${list.totalRealTime};
		var b1 = ${list.totalMflPerson};
		
		var c1 = ${list.prodCnt};
		
		console.log(c1);
		
		var manHour = Math.round((a1*b1)/c1 *10)/10;
		if(manHour == Infinity){
			manHour = 0;
		}
		
		viewData[${list.months-1}] = manHour;
		
		
		</c:forEach>
			
		}else if($('#searchCondition2').val() == "4"){
			<c:forEach items="${kpiGraphList}" var="list">
			years2 = ${list.kiYear};
			maxMon2 = ${list.kiMonth};
		</c:forEach>
			for(var i=1;i<=maxMon2;i++){
			date.push(years2+"년 "+i+"월");
			kpiOutputData.push(0);
			viewData.push(0);
			}
			<c:forEach items="${kpiGraphList}" var="list">
			kpiOutputData[${list.kiMonth-1}] = ${list.kiLeadtime};
			</c:forEach>
			
			<c:forEach items="${leadTimeList}" var="list">
			var aa1 = ${list.leadMax};
			var bb1 = ${list.leadMin};
			var cc1 = (aa1+bb1)/2;
			viewData[${list.months-1}] = cc1;
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
					    data: ['목표치', '시간당 생산량', '총 생산량']
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
					      name: '시간당 생산량(절단)',
					      axisLabel: {
					        formatter: '{value} EA'
					      }
					    },
					    {
			    		  type: 'value',
				      	  name: '총 생산량(절단)',
				      	  position : 'right',
				      	  axisLabel: {
				            formatter: '{value} EA'
						  }
					    }
					  ],
					  series: [
					    {
					      name: '목표치',
					      type: 'bar',
					      tooltip: {
					        valueFormatter: function (value) {
					          return value + ' EA';
					        }
					      },
					      data: kpiOutputData
					    },
					    {
				    	name: '시간당 생산량',
					    type: 'bar',
					    tooltip: {
					      valueFormatter: function (value) {
					        return value + ' EA';
					      }
					    },
					    data: viewData
					    },
					    {
					    	name: '총 생산량',
					    	yAxisIndex: 1,
						    type: 'line',
						    tooltip: {
						      valueFormatter: function (value) {
						        return value + ' EA';
						      }
						    },
						    data: totalProd
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
					    data: ['목표치', '불량률']
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
					      name: '검사',
					      axisLabel: {
					        formatter: '{value} %'
					      }
					    },
					    {
			    		  type: 'value',
				      	  name: '불량률',
				      	  axisLabel: {
				            formatter: '{value} %'
						  }
					    }
					  ],
					  series: [
					    {
					      name: '목표치',
					      type: 'bar',
					      tooltip: {
					        valueFormatter: function (value) {
					          return value + ' %';
					        }
					      },
					      data: kpiOutputData
					    },
					    {
				    	name: '불량률',
					    type: 'bar',
					    tooltip: {
					      valueFormatter: function (value) {
					        return value + ' %';
					      }
					    },
					    data: viewData
					    }
					  ]
					};
		}else if($('#searchCondition2').val() == "3"){
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
					    data: ['목표치', '공수']
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
					      name: '가공',
					      axisLabel: {
					        formatter: '{value} mh'
					      }
					    },
					    {
			    		  type: 'value',
				      	  name: '공수',
				      	  axisLabel: {
				            formatter: '{value} mh'
						  }
					    }
					  ],
					  series: [
					    {
					      name: '목표치',
					      type: 'bar',
					      tooltip: {
					        valueFormatter: function (value) {
					          return value + ' mh';
					        }
					      },
					      data: kpiOutputData
					    },
					    {
				    	name: '공수',
					    type: 'bar',
					    tooltip: {
					      valueFormatter: function (value) {
					        return value + ' mh';
					      }
					    },
					    data: viewData
					    }
					  ]
					};
		}else if($('#searchCondition2').val() == "4"){
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
					    data: ['목표치', '리드타임']
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
					      name: '리드타임',
					      axisLabel: {
					        formatter: '{value} 일'
					      }
					    },
					    {
			    		  type: 'value',
				      	  name: '공수',
				      	  axisLabel: {
				            formatter: '{value} 일'
						  }
					    }
					  ],
					  series: [
					    {
					      name: '목표치',
					      type: 'bar',
					      tooltip: {
					        valueFormatter: function (value) {
					          return value + ' 일';
					        }
					      },
					      data: kpiOutputData
					    },
					    {
				    	name: '리드타임',
					    type: 'bar',
					    tooltip: {
					      valueFormatter: function (value) {
					        return value + ' 일';
					      }
					    },
					    data: viewData
					    }
					  ]
					};
		}
		
		option && myChart.setOption(option);
	</script>
</body>

</html>