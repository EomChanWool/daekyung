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
                    <h1 class="h3 mb-2 text-gray-800">현황 및 집계</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
							<div class="search">
								<form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/sales/stateAggregate/stateAggregate.do" method="post">
									<input type="hidden" name="mIdx">
									<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
						    		<select class="btn btn-secondary dropdown-toggle searchCondition" name="searchCondition" id="searchCondition">
							    		<c:forEach begin="${date.begin}" end="${date.end}" varStatus="status">
							    			<option value="${status.begin+status.count}" <c:if test="${searchVO.searchCondition eq status.begin+status.count}">selected="selected"</c:if>>${status.begin+status.count}</option>
							    		</c:forEach>
						    		</select>
						    	</form>
						    	<a href="#" class="btn btn-info btn-icon-split" onclick="fn_search_aggregate()" style="margin-left: 0.3rem;">
	                                <span class="text">검색</span>
	                            </a>
						    	<a href="#" class="btn btn-success btn-icon-split" onclick="fn_searchAll_aggregate()">
	                                <span class="text">전체목록</span>
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
	function fn_search_aggregate(){
		listForm.submit();
	}
	
	function fn_searchAll_aggregate(){
		var now = new Date();
		var year = now.getFullYear();
		$('#searchCondition').val(year);
		listForm.submit();
	}
	
	$(function() {
		$('#salesMenu').addClass("active");
		$('#sales').addClass("show");
		$('#stateAggregate').addClass("active");
		
		$('#searchCondition').change(function(){
			listForm.submit();
		});
		
		window.onresize = function() {
			location.reload();
		}
	});
	
	//생산실적 현황 echart
	var chartDom = document.getElementById('graph');
	var myChart = echarts.init(chartDom);
	var option;

	let date = [];

	let estimateCount = [];
	let ordersCount = [];
	let orderMoney = [];
	let deliveryCount = [];
	let deliveryMoney = [];
	let collectCount = [];
	let collectMoney = [];

	for(var i=1;i<13;i++){
		date.push(i+"월");
		estimateCount.push('0');
		ordersCount.push('0');
		orderMoney.push('0');
		deliveryCount.push('0');
		deliveryMoney.push('0');
		collectCount.push('0');
		collectMoney.push('0');
	}

	<c:forEach items="${estimateList}" var="list">
		var index1 = ${list.month};
		estimateCount[index1-1] = ${list.count};
	</c:forEach>

	<c:forEach items="${ordersList}" var="list">
		var index2 = ${list.month};
		ordersCount[index2-1] = ${list.count};
		orderMoney[index2-1] = ${list.money};
	</c:forEach>

	<c:forEach items="${deliveryList}" var="list">
		var index3 = ${list.month};
		deliveryCount[index3-1] = ${list.count};
		deliveryMoney[index3-1] = ${list.money};
	</c:forEach>

	<c:forEach items="${collectList}" var="list">
		var index4 = ${list.month};
		collectCount[index4-1] = ${list.count};
		collectMoney[index4-1] = ${list.money};
	</c:forEach>




	const countMin = 0;
	const countMax = 10;
	const countInterval = 2;

	const moneyMin = 0;
	const moneyMax = 50000;
	const moneyInterval = 10000;

	option = {
			  tooltip: {
			    trigger: 'axis',
//	 		    formatter: '{b0}<br>{a0} : {c0} 건<br>{a1} : {c1} 건<br>{a2} : {c2} 만원<br>{a3} : {c3} 건<br>{a4} : {c4} 만원<br>{a5} : {c5} 건<br>{a6} : {c6} 만원',
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
			      magicType: { show: true, type: ['line', 'bar'] },
			      restore: { show: true },
			      saveAsImage: { show: true }
			    }
			  },
			  legend: {
			    data: ['견적건수', '수주건수','수주금액', '납품건수','납품금액', '수금건수','수금금액']
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
			      name: '건수',
			      position: 'left',
			      min: countMin,
			      max: countMax,
			      interval: countInterval,
			      axisLabel: {
			        formatter: '{value} 건'
			      }
			    },
			    {
	    		  type: 'value',
		      	  name: '금액',
		      	  position: 'right',
		      	  min: moneyMin,
		     	  max: moneyMax,
		     	  interval: moneyInterval,
		      	  axisLabel: {
		            formatter: '{value} 만원'
				  }
			    }
			  ],
			  series: [
			    {
			      name: '견적건수',
			      type: 'bar',
			      tooltip: {
			        valueFormatter: function (value) {
			          return value + ' 건';
			        }
			      },
			      data: estimateCount
			    },
			    {
		    	name: '수주건수',
			    type: 'bar',
			    tooltip: {
			      valueFormatter: function (value) {
			        return value + ' 건';
			      }
			    },
			    data: ordersCount
			    },
			    {
		    	name: '수주금액',
			    type: 'line',
			    yAxisIndex: 1,
			    tooltip: {
			      valueFormatter: function (value) {
			        return value + ' 만원';
			      }
			    },
			    data: orderMoney
			    },
			    {
		    	name: '납품건수',
			    type: 'bar',
			    tooltip: {
			      valueFormatter: function (value) {
			        return value + ' 건';
			      }
			    },
			    data: deliveryCount
			    },
			    {
		    	name: '납품금액',
			    type: 'line',
			    yAxisIndex: 1,
			    tooltip: {
			      valueFormatter: function (value) {
			        return value + ' 만원';
			      }
			    },
			    data: deliveryMoney
			    },
			    {
		    	name: '수금건수',
			    type: 'bar',
			    tooltip: {
			      valueFormatter: function (value) {
			        return value + ' 건';
			      }
			    },
			    data: collectCount
			    },
			    {
		    	name: '수금금액',
			    type: 'line',
			    yAxisIndex: 1,
			    tooltip: {
			      valueFormatter: function (value) {
			        return value + ' 만원';
			      }
			    },
			    data: collectMoney
			    }
			  ]
			};
	option && myChart.setOption(option);
	</script>
</body>
</html>
