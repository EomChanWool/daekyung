<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../../header.jsp"%>

<body id="page-top">
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts@5.4.1/dist/echarts.min.js"></script>
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">
			<!-- Side Menu Section -->
			<%@ include file="../../menu/sideMenu.jsp"%>
		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<form class="form-inline">
						<button id="sidebarToggleTop"
							class="btn btn-link d-md-none rounded-circle mr-3">
							<i class="fa fa-bars"></i>
						</button>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav conChart - User Information -->
						<%@ include file="../../menu/logout/nav_user.jsp"%>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">관리도조회</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<div class="search">
								<form name="listForm" class="listForm"
									action="${pageContext.request.contextPath}/sl/quality/mtConChart/conChartList.do"
									method="post">
									<input type="hidden" name="mIdx"> <input type="hidden"
										name="pageIndex"
										value="<c:out value='${searchVO.pageIndex}'/>" /> <input
										class="btn btn-secondary searchDate" id="searchStDate"
										name="searchStDate" value="${searchVO.searchStDate}"
										type="date"> <span class="dash"
										style="display: inline-block; float: left; margin: 0.5rem 0.3rem 0 0">~</span>
									<input class="btn btn-secondary searchDate" id="searchEdDate"
										name="searchEdDate" value="${searchVO.searchEdDate}"
										type="date"> <input type="text"
										class="form-control bg-light border-0 small"
										name="searchKeyword" value="${searchVO.searchKeyword}"
										placeholder="스펙정보를 입력해 주세요"
										style="background-color: #eaecf4; width: 25%; float: left;">
								</form>
								<a href="#" class="btn btn-info btn-icon-split"
									onclick="fn_search_conChart()" style="margin-left: 0.3rem;">
									<span class="text">검색</span>
								</a> <a href="#" class="btn btn-success btn-icon-split"
									onclick="fn_searchAll_conChart()"> <span class="text">전체목록</span>
								</a>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<div id="graph" style="width: 100%; height: 500px;"></div>


								<div class="btn_page">
									<ui:pagination paginationInfo="${paginationInfo}" type="image"
										jsFunction="fn_pageview" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<%@ include file="../../menu/footer/footer.jsp"%>
			<!-- End of Footer -->
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<%@ include file="../../menu/logout/logout_alert.jsp"%>

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/conf/vendor/jquery/jquery.min.js"></script>
	<script
		src="/resources/conf/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/conf/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>

	<script>
		function fn_pageview(pageNo) {
			listForm.pageIndex.value = pageNo;
			listForm.submit();
		}

		function fn_search_conChart() {
			listForm.submit();
		}

		function fn_searchAll_conChart() {
			listForm.searchKeyword.value = "";
			listForm.pageIndex.value = 1;
			listForm.submit();
		}

		$(function() {
			$('#qualityMenu').addClass("active");
			$('#quality').addClass("show");
			$('#conChartList').addClass("active");

			let msg = '${msg}';
			if (msg) {
				alert(msg);
			}

			$('#searchCondition').change(function() {
				listForm.submit();
			});

		});

		//그래프
		var chartDom = document.getElementById('graph');
		var myChart = echarts.init(chartDom);
		var option;

		const dataMin = 0;
		const dataMax = 0;
		const dataInterval = 1000;

		option = {
			xAxis : {
				type : 'category',
				data : [ 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun' ]
			},
			yAxis : {
				type : 'value'
			},
			series : [ {
				data : [ 150, 230, 224, 218, 135, 147, 260 ],
				type : 'line'
			} ]
		};

		option && myChart.setOption(option);
	</script>
</body>

</html>