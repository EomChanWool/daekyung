<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../../header.jsp" %>
<style>
	.scroll{
		overflow-y: scroll;
		-ms-overflow-style: none;
		scrollbar-width: none;
		scroll-behavior: smooth;
	}
	
	.notice, .stockState{
		height: 320px !important;
		margin-top: 15px;
	}
</style>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5.4.1/dist/echarts.min.js"></script>
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
                <div class="container-fluid" style="overflow: hidden;">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Dashboard</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/monitoring/dashBoard.do" method="post">
                                <input type="hidden" name="noIdx" id="noIdx">
								<input type="hidden" name="searchCondition" id="searchCondition" value="${searchCondition}">
								<div class="cont_wrap">
									<div class="cont">
								      <h1>수주대실적현황(${date}년)</h1>
								      <div id="ordersOutputGraph" style="width: 100%; height:300px;"></div>
								    </div>
								    
								    <div class="cont">
								      <h1>라인가동현황(${date2}년)</h1>
								      
                            		<div id="lineRunningGraph" style="width: 100%; height:300px;"></div>
						    	</div>
						    	<div class="cont">
						    	<c:if test="${searchCondition eq 'manu'}"><h1>생산집계현황(${date3}년)-가공 <a href="#" class="btn btn-primary btn-icon-split" onclick="selcetKeyword('cut')" style="float: right;">
	                                <span class="text">절단</span>
	                            </a> <a href="#" class="btn btn-primary btn-icon-split" onclick="selcetKeyword('manu')" style="float: right;">
	                                <span class="text">가공</span>
	                            </a></h1></c:if>
	                            <c:if test="${searchCondition eq 'cut'}"><h1>생산집계현황(${date3}년)-절단 <a href="#" class="btn btn-primary btn-icon-split" onclick="selcetKeyword('cut')" style="float: right;">
	                                <span class="text">절단</span>
	                            </a> <a href="#" class="btn btn-primary btn-icon-split" onclick="selcetKeyword('manu')" style="float: right;">
	                                <span class="text">가공</span>
	                            </a></h1></c:if>
								      
                            		<div id="actualOutputGraph" style="width: 100%; height:300px;"></div>
						    	</div>
						    	<div class="cont">
								      <h1>Today daq count</h1>
                            		<div id="lineRunningGraph2" style="width: 100%; height:300px;"></div>
						    	</div>
						    	 </div>
					    	</form>
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
	function fn_detail_notice(noIdx){
		$('#noIdx').val(noIdx);
		listForm.action = "${pageContext.request.contextPath}/sl/monitoring/detailNotice.do";
		listForm.submit();
	}

	$(function() {
		$('#dashboard').addClass("active");
		console.log($('#searchCondition').val());
// 		document.getElementById("sidebarToggle").click();

		window.onresize = function() {
			location.reload();
		}
		
		setTimeout(function(){
			location.reload();
		}, 60000);
		
		const stockArea = document.querySelector(".stockState");
		const noticeArea = document.querySelector(".notice");
		
		//autoScroll(stockArea, 2000);
		//autoScroll(noticeArea, 3000);
	});
	
	function selcetKeyword(keyWord){
		listForm.searchCondition.value = keyWord;
		listForm.submit();
	}
	
	function autoScroll(obj, interval){
		
		setInterval(function(){
			obj.scrollTop = obj.scrollTop + 50;
			
			if(obj.offsetHeight + obj.scrollTop >= obj.scrollHeight){
				obj.scrollTop = 0;
			}
		}, interval);
	}
	</script>
	<script>
	//수주대실적 현황
	
	
	var chartDom = document.getElementById('ordersOutputGraph');
	var myChart = echarts.init(chartDom);
	var option;
	let date = [];
	let year = [];
	
	let OutputData = [];
	
	let viewData = [];
	
	let viewData2 = [];

	var num = 0;
	var years = 0;
	var maxMon = 0;
	
	<c:forEach items="${orderCntList}" var="list">
	
	years = ${list.years};
	maxMon = ${list.months};
	</c:forEach>
	for(var i=1;i<=maxMon;i++){
		date.push(i+"월");
		OutputData.push(0);
		viewData.push(0);
		viewData2.push(0);
	}
	<c:forEach items="${prodCntList}" var="list">
	viewData[${list.months-1}] = ${list.prodCnt};
	viewData2[${list.months-1}] = ${list.relPrice};
	</c:forEach>
	<c:forEach items="${orderCntList}" var="list">
	OutputData[${list.months-1}] = ${list.orderCnt};
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
			    data: ['수주량', '생산량','매출액']
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
			      name: 'EA',
			      axisLabel: {
			        formatter: '{value} EA'
			      }
			    },
			    {
	    		  type: 'value',
		      	  name: '매출액',
		      	  position: 'right',
		      	  axisLabel: {
		            formatter: '{value} 원'
				  }
			    }
			  ],
			  series: [
			    {
			      name: '수주량',
			      type: 'bar',
			      /* label: {
			          show: true,
			          position: 'inside',
			          formatter: function(d){
			        	  return d.data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+" EA";
			          }
			          
			        }, */
			      tooltip: {
			        valueFormatter: function (value) {
			        	let result = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');  
				        return result + ' EA';
			        }
			      },
			      data: OutputData
			    },
			    {
		    	name: '생산량',
			    type: 'bar',
			    /* label: {
			          show: true,
			          position: 'inside',
			          formatter: function(d){
			        	  return d.data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+" EA";
			          }
			          
			        }, */
			    tooltip: {
			      valueFormatter: function (value) {
			    	  
			    	let result = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');  
			        return result + ' EA';
			      }
			    },
			    data: viewData
			    },
			    {
			    	name: '매출액',
			    	yAxisIndex: 1,
				    type: 'line',
				    label: {
				          show: true,
				          position: 'inside',
				          formatter: function(d){
				        	  return d.data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+" 원";
				          }
				        },
				    tooltip: {
				      valueFormatter: function (value) {
				    	  if(value == undefined){
				    		 value = 0;
				    	  }
				    	  let result = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				    	 
				        return result + ' 원';
				      }
				    },
				    data: viewData2
				    }
			  ]
			};
	option && myChart.setOption(option);
	</script>
	<script>
	//라인가동
	var chartDom = document.getElementById('lineRunningGraph');
	var myChart = echarts.init(chartDom);
	var option;
	
	
	let date2 = [];
	
	let lineCount = [];
	
	let workTime=[];
	
	<c:forEach items="${eqList}" var="list">
	date2.push('${list.months}월');
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
			      data: date2,
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
	
	<script>
	
	var chartDom3 = document.getElementById('actualOutputGraph');
	var myChart = echarts.init(chartDom3);
	var option;


	var date3 = [];
	var year3 = [];
	
	var totalRealTime = [];
	
	var totalMflPerson = [];
	
	var avgRealTime = [];
	
	var num3 = 0;
	var years3 = 0;
	var maxMon3 = 0;
	
	
	if($('#searchCondition').val() == "manu"){
	<c:forEach items="${prodCntListAc}" var="list">
	year3 = ${list.years};
	maxMon3 = ${list.months};
</c:forEach>

for(var i=1;i<=maxMon3;i++){
	date3.push(i+"월");
	totalRealTime.push(0);
	totalMflPerson.push(0);
	avgRealTime.push(0);
}

<c:forEach items="${prodCntListAc}" var="list">
totalRealTime[${list.months-1}] = ${list.totalRealTime};
totalMflPerson[${list.months-1}] = ${list.totalMflPerson};
avgRealTime[${list.months-1}] = ${list.avgRealTime};
</c:forEach>
}else if($('#searchCondition').val() == "cut"){
	<c:forEach items="${prodCntListAc2}" var="list">
	year3 = ${list.years};
	maxMon3 = ${list.months};
</c:forEach>

for(var i=1;i<=maxMon3;i++){
	date3.push(i+"월");
	totalRealTime.push(0);
	avgRealTime.push(0);
}
<c:forEach items="${prodCntListAc2}" var="list">
totalRealTime[${list.months-1}] = ${list.sumCsWorkTime};
avgRealTime[${list.months-1}] = ${list.avgWorkTime};
</c:forEach>
	
}
	if($('#searchCondition').val() == "manu"){
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
		      data: date3,
		      axisPointer: {
		        type: 'shadow'
		      }
		    }
		  ],
		  yAxis: [
		    {
		      type: 'value',
		      name: '총작업시간(가공)',
		      axisLabel: {
		        formatter: '{value} MIN'
		      }
		    },
		    {
	    		  type: 'value',
		      	  name: '평균시간(절단)',
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
		          position: 'top',
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
		      /* label: {
		          show: true,
		          position: 'top',
		          formatter: '{c}분'
		        }, */
		      tooltip: {
		        valueFormatter: function (value) {
		          return value + ' MIN';
		        }
		      },
		      data: avgRealTime
		    }
		  ]
		};
	}else if($('#searchCondition').val() == "cut"){
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
				      data: date3,
				      axisPointer: {
				        type: 'shadow'
				      }
				    }
				  ],
				  yAxis: [
				    {
				      type: 'value',
				      name: '총작업시간(절단)',
				      axisLabel: {
				        formatter: '{value} MIN'
				      }
				    },
				    {
			    		  type: 'value',
				      	  name: '평균시간(절단)',
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
				      /* label: {
				          show: true,
				          position: 'top',
				          formatter: '{c}분'
				        }, */
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
	
	<script>
	var chartDom4 = document.getElementById('lineRunningGraph2');
	var myChart = echarts.init(chartDom4);
	var option;
	
	
	let lineName = [];
	
	let lineCount4 = [];
	
	let lineWorkTime = [];
	
	<c:forEach items="${lineRunningList}" var="list">
	lineName.push('${list.daqName}');
	lineCount4.push('${list.counting}');
	lineWorkTime.push('${list.workTime}');
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
			      data: lineName,
			      axisPointer: {
			        type: 'shadow'
			      }
			    }
			  ],
			  yAxis: [
			    {
			      type: 'value',
			      name: '카운트',
			      axisLabel: {
			        formatter: '{value} Count'
			      }
			    },
			    {
	    		  type: 'value',
		      	  name: '작동시간',
		      	position: 'right',
		      	  axisLabel: {
		            formatter: '{value} sec',
		            
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
			      data: lineCount4
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
				      data: lineWorkTime
				    },
			  ]
			};
	option && myChart.setOption(option);
	
	
	</script>
	
</body>

</html>