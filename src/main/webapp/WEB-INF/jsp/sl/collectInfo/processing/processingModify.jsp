<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../../header.jsp" %>
<style>
	.table th{
		padding-top: 1.3rem;
	}
	
	.cnt{
		text-align: center;
	}
	
	.perPrice{
		text-align: right;
	}
</style>
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
                        <!-- Nav orders - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">수주 수정</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/sales/ordersManage/modifyOrdersOk.do" name="modifyForm" method="post">
                            		<input type="hidden" name="orIdx" value="${ordersVO.orIdx}">
                            		<input type="hidden" name="esIdx" value="${ordersVO.esIdx}">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>수주명  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="orName" id="orName" value="${ordersVO.orName}"/></td>
												<th>수주일  <span class="req">*</span></th>
												<td><input type="date" class="form-control" name="orDte" id="orDte" value="${ordersVO.orDte}"/></td>
											</tr>
											<tr>
												<th>사업장  <span class="req">*</span></th>
												<td>
													<select class="form-control" name="cIdx" id="cIdx">
														<c:forEach var="list" items="${companyList}" varStatus="statue">
															<option value="${list.cIdx}" <c:if test="${list.cIdx eq ordersVO.cIdx}">selected="selected"</c:if>>${list.cName}</option>
														</c:forEach>
													</select>
												</td>
												<th>거래처  <span class="req">*</span></th>
												<td>
													<select class="form-control" name="aIdx" id="aIdx">
														<c:forEach var="list" items="${accountList}" varStatus="statue">
															<option value="${list.aIdx}" <c:if test="${list.aIdx eq ordersVO.aIdx}">selected="selected"</c:if>>${list.aName}</option>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th>납기일  <span class="req">*</span></th>
												<td><input type="date" class="form-control" name="orDueDte" id="orDueDte" value="${ordersVO.orDueDte}"/></td>
											</tr>
											<tr>
												<th>납품지 <span class="req">*</span></th>
												<td colspan="3"><input type="text" class="form-control" name="orDuePlace" id="orDuePlace" value="${ordersVO.orDuePlace}"/></td>
											</tr>
											<tr>
												<th>비고</th>
												<td colspan="3"><textarea name="orNote">${ordersVO.orNote}</textarea></td>
											</tr>
										</tbody>
	                                </table>
	                                <table class="table table-bordered" id="dataTable">
	                                	<tbody class="prodList">
	                                		<tr>
	                                			<th style="text-align: center;">제품</th>
												<th style="text-align: center;">수량(EA)</th>
												<th style="text-align: center;">단가(원)</th>
												<th style="text-align: center;">제품총합(원)</th>
	                                		</tr>
	                                		<c:forEach var="list" items="${prodList}" varStatus="state">
	                                			<input type="hidden" name="itemCd${state.count}" value="${list.esItemCd}">
	                                			<input type="hidden" name="curCnt${state.count}" value="${list.esCnt}">
	                                			<tr>
		                                			<td><span class="form-control val-area">${list.esProd}</span><input type="hidden" name="prod${state.count}" value="${list.esProd}"></td>
		                                			<td><input type="text" class="form-control cnt" name="cnt${state.count}" id="cnt${state.count}" value="${list.esCnt}"></td>
		                                			<td><input type="text" class="form-control perPrice" name="perPrice${state.count}" id="perPrice${state.count}" value="${list.esPerPrice}"></td>
		                                			<td><span class="form-control" id="itemTotal${state.count}" style="text-align: right;"></span></td>
	                                			</tr>
	                                		</c:forEach>
	                                		<tr>
												<th colspan="3">합계(원)</th>
												<td style="text-align: right; padding-top: 1.1rem;">
													<span id="total">0</span>
													<input type="hidden" name="orMoney" id="orMoney" value="0">
												</td>	
											</tr>
	                                	</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_modify_orders()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/sales/ordersManage/ordersList.do'">취소</span>
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
	function fn_modify_orders(){
		const num = /^\d+$/;
		if($('#orName').val() == ''){
			alert("수주명을 확인 바랍니다.");
			return;
		}
		
		if($('#orDte').val() == ''){
			alert("수주일을 확인 바랍니다.");
			return;
		}
	
		if($('#orDueDte').val() == ''){
			alert("납기일을 확인 바랍니다.");
			return;
		}
		
		if($('#orDuePlace').val() == ''){
			alert("납품지를 확인 바랍니다.");
			return;
		}
		
		if($('#orMoney').val() == 0 || $('#orMoney').val() == "NaN"){
			alert("수량 및 단가를 확인 바랍니다.");
			return;
		}
		modifyForm.submit();
	}
	
	$(function() {
		calcTotalPrice();
		
		$('#salesMenu').addClass("active");
		$('#sales').addClass("show");
		$('#ordersList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
		calcTotalPrice();
		
		$('.perPrice').focusout(function(){
			calcTotalPrice();
		});
		
		$('.cnt').focusout(function(){
			calcTotalPrice();
		});
	});
	
	function calcTotalPrice(){
		var perPrice = document.getElementsByClassName('perPrice');
		var cnt = document.getElementsByClassName('cnt');
		var total = 0;
		for(var i=0;i<perPrice.length;i++){
			if(perPrice[i].value != ''){
				var itemTotal = "#itemTotal"+(i+1);
				let result = (perPrice[i].value*cnt[i].value).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$(itemTotal).text(result);
				total += (perPrice[i].value*cnt[i].value);
			}
		}

		$('#orMoney').val(total);
		let result = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$('#total').text(result);
	}
	</script>
</body>

</html>