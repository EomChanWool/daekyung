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
									<input type="hidden" name="woIdx">
									<input type="hidden" name="orIdx">
									<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
									
						    		
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
	                            <a href="#" class="btn btn-primary btn-icon-split" onclick="fn_regist_workOrder()" style="float: right;">
	                                <span class="text">등록</span>
	                            </a>
							</div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	<div id="graph" style="width: 100%; height:300px;"></div>
                                <table class="table table-bordered" id="dataTable"  >
                                    <thead>
                                        <tr>
                                            <th>설비명</th>
											<th>센서명</th>
											<th>입력값</th>
											<th>입력방식</th>
											<th>다운로드</th>
											<th>수정/삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="result" items="${kpiList}" varStatus="status">
	                                   		<tr>
	                                            <td>${result.exYear}년</td>
												<td>${result.exMonth}월</td>
												<td>${result.exTrgError}%</td>
												<td>${result.totalCnt}</td>

												<td style="padding: 5px 0px;">
	                                            	<a href="#" class="btn btn-warning btn-icon-split" onclick="fn_modify_kpi_go('${result.exIdx}')">
				                                        <span class="text">수정</span>
				                                    </a>
				                                    <a href="#" class="btn btn-danger btn-icon-split" onclick="fn_delete_kpi('${result.exIdx}')">
				                                        <span class="text">삭제</span>
				                                    </a>
	                                            </td>
	                                            <td style="padding: 5px 0px;">
	                                            	<a href="#" class="btn btn-warning btn-icon-split" onclick="fn_modify_kpi_go('${result.exIdx}')">
				                                        <span class="text">수정</span>
				                                    </a>
				                                    <a href="#" class="btn btn-danger btn-icon-split" onclick="fn_delete_kpi('${result.exIdx}')">
				                                        <span class="text">삭제</span>
				                                    </a>
	                                            </td>
	                                        </tr>
                                    	</c:forEach>
                                    	<c:if test="${empty kpiList}"><tr><td colspan='6'>결과가 없습니다.</td><del></del></c:if>
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
		
		function fn_regist_kpi(){
			listForm.action = "${pageContext.request.contextPath}/sl/production/kpi/registKpi.do";
			listForm.submit();
		}
		
		function fn_modify_kpi_go(exIdx){
			listForm.exIdx.value = exIdx;
			listForm.action = "${pageContext.request.contextPath}/sl/production/kpi/modifyKpi.do";
			listForm.submit();
		}
		
		function fn_delete_kpi(exIdx){
			if(confirm('해당 내역을 삭제하시겠습니까?')) {
				listForm.exIdx.value = exIdx;
				listForm.action = "${pageContext.request.contextPath}/sl/production/kpi/deleteKpi.do";
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
			
			$('#searchCondition').change(function(){
				listForm.submit();
			});
			$('#searchCondition2').change(function(){
				listForm.submit();
			});
			$('#searchCondition3').change(function(){
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
		
		let kpiErrorData = [];
		let kpiOutputData = [];
		let kpiSalesData = [];
		
		let viewData = [];
	
		const errorMin = 0;
		const errorMax = 10;
		const errorInterval = 2;
		const outputMin = 0;
		const outputMax = 5000;
		const outputInterval = 1000;
		const salesMin = 0;
		const salesMax = 50000;
		const salesInterval = 10000;
			
		<c:forEach items="${kpiGraphList}" var="list">
			date.push('${list.exYear}년 ' + '${list.exMonth}월');
			kpiErrorData.push('${list.exTrgError}');
			kpiOutputData.push('${list.totalCnt}');
			kpiSalesData.push('${list.exTrgSales}');
			viewData.push('0');
		</c:forEach>
		
		if($('#searchCondition').val() == "불량률"){
			<c:forEach items="${dataList}" var="list">
				var index1 = ${list.month};
				if($('#searchCondition3').val() != ''){
					viewData[0] = ${list.percent};
				}else{
					viewData[index1-1] = ${list.percent};
				}
			</c:forEach>
		}else if($('#searchCondition').val() == "생산량"){
			<c:forEach items="${dataList}" var="list">
				var index2 = ${list.month};
				if($('#searchCondition3').val() != ''){
					viewData[0] = ${list.prodCnt};
				}else{
					viewData[index2-1] = ${list.prodCnt};
				}
			</c:forEach>
		}else if($('#searchCondition').val() == "매출액"){
			<c:forEach items="${dataList}" var="list">
				var index3 = ${list.month};
				if($('#searchCondition3').val() != ''){
					viewData[0] = ${list.money};	
				}else{
					viewData[index3-1] = ${list.money};	
				}
			</c:forEach>
		}
		
		if($('#searchCondition').val() == "불량률"){
			option = {
					  tooltip: {
					    trigger: 'axis',
//	 				    formatter: '{b0}<br>{a0} : {c0} %<br>{a1} : {c1} %',
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
					      name: '목표치',
					      min: errorMin,
					      max: errorMax,
					      interval: errorInterval,
					      axisLabel: {
					        formatter: '{value} %'
					      }
					    },
					    {
			    		  type: 'value',
				      	  name: '불량률',
				      	  min: errorMin,
				     	  max: errorMax,
				     	  interval: errorInterval,
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
					      data: kpiErrorData
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
		}else if($('#searchCondition').val() == "생산량"){
			option = {
					  tooltip: {
					    trigger: 'axis',
//	 				    formatter: '{b0}<br>{a0} : {c0} EA<br>{a1} : {c1} EA',
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
					    data: ['목표치', '생산량']
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
					      name: '목표치',
					      min: outputMin,
					      max: outputMax,
					      interval: outputInterval,
					      axisLabel: {
					        formatter: '{value} EA'
					      }
					    },
					    {
			    		  type: 'value',
				      	  name: '생산량',
				      	  min: outputMin,
				     	  max: outputMax,
				     	  interval: outputInterval,
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
				    	name: '생산량',
					    type: 'bar',
					    tooltip: {
					      valueFormatter: function (value) {
					        return value + ' EA';
					      }
					    },
					    data: viewData
					    }
					  ]
					};
		}else if($('#searchCondition').val() == "매출액"){
			option = {
					  tooltip: {
					    trigger: 'axis',
//	 				    formatter: '{b0}<br>{a0} : {c0} (만원)<br>{a1} : {c1} (만원)',
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
					    data: ['KPI', '매출액']
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
					      name: 'KPI',
					      min: salesMin,
					      max: salesMax,
					      interval: salesInterval,
					      axisLabel: {
					        formatter: '{value} 만원'
					      }
					    },
					    {
			    		  type: 'value',
				      	  name: '매출액',
				      	  min: salesMin,
				     	  max: salesMax,
				     	  interval: salesInterval,
				      	  axisLabel: {
				            formatter: '{value} 만원'
						  }
					    }
					  ],
					  series: [
					    {
					      name: 'KPI',
					      type: 'bar',
					      tooltip: {
					        valueFormatter: function (value) {
					          return value + ' 만원';
					        }
					      },
					      data: kpiSalesData
					    },
					    {
				    	name: '매출액',
					    type: 'bar',
					    tooltip: {
					      valueFormatter: function (value) {
					        return value + ' 만원';
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