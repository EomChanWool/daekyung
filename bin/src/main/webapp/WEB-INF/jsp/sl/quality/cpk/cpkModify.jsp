<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../../header.jsp" %>
<style>
	.table th{
		padding-top: 1.3rem;
	}
	
	.val-area{
		text-align: left;
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
                        <!-- Nav collect - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">재고 실사 등록</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/material/stockAdjust/modifyStockAdjustOk.do" name="modifyForm" method="post">
                            		<input type="hidden" name="adIdx" value="${adjustVO.adIdx}">
									<input type="hidden" name="itCd" id="itCd" value="${adjustVO.itemCd}">
									<input type="hidden" name="itemName" value="${adjustVO.itemName}">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>분류  <span class="req">*</span></th>
												<td>
													<select class="form-control" name="itemType" id="itemType">
														<option value="자재" <c:if test="${adjustVO.itemType eq '자재'}">selected="selected"</c:if>>자재</option>
														<option value="제품" <c:if test="${adjustVO.itemType eq '제품'}">selected="selected"</c:if>>제품</option>
													</select>
												</td>
												<th>물품코드  <span class="req">*</span></th>
												<td id="mtList">
													<input type="text" class="form-control" name="mtItemCd" id="mtItemCd" value="${adjustVO.itemCd}" list="materialList" autocomplete="off"/>
													<datalist id="materialList">
														<c:forEach var="list" items="${materialList}" varStatus="status">
															<option value="${list.itemCd}">${list.itemName}</option>
														</c:forEach>
													</datalist>
												</td>
												<td id="pdList" style="display: none;">
													<input type="text" class="form-control" name="pdItemCd" id="pdItemCd" value="${adjustVO.itemCd}" list="productList" autocomplete="off"/>
													<datalist id="productList">
														<c:forEach var="list" items="${productList}" varStatus="status">
															<option value="${list.itemCd}">${list.itemName}</option>
														</c:forEach>
													</datalist>
												</td>
											</tr>
											<tr>
												<th>현 재고수량</th>
												<td><span class="form-control val-area" id="adCnt">${adjustVO.adCnt}</span><input type="hidden" name="adCnt" value="${adjustVO.adCnt}"></td>
												<th>실사수량  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="adRealCnt" id="adRealCnt" value="${adjustVO.adRealCnt}"></td>
											</tr>
											<tr>
												<th>변동량</th>
												<td><span class="form-control val-area" id="adAdjCnt">${adjustVO.adAdjCnt}</span><input type="hidden" name="adAdjCnt" value="${adjustVO.adAdjCnt}"></td>
												<th>단위</th>
												<td><input type="text" class="form-control" name="adUom" value="${adjustVO.adUom}"></td>
											</tr>
											<tr>
												<th>보관위치</th>
												<td><input type="text" class="form-control" name="adPlace" value="${adjustVO.adPlace}"></td>
											</tr>
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_modify_stockAdjust()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/material/stockAdjust/stockAdjustList.do'">취소</span>
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
	function fn_modify_stockAdjust(){
		const num = /^\d+$/;
		if($('#itCd').val() == ''){
			alert("물품코드를 확인 바랍니다.");
			return;
		}
		
		if(!num.test($('#adRealCnt').val())){
			alert("실사수량을 확인 바랍니다.");
			return;
		}
		
		modifyForm.submit();
	}
	
	$(function() {
		showDisplay();
		$('#materialMenu').addClass("active");
		$('#material').addClass("show");
		$('#stockAdjustList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
		$('#itemType').change(function(){
			$('#adCnt').text("");
			modifyForm.itCd.value = "";
			modifyForm.itemName.value = "";
			modifyForm.mtItemCd.value = "";
			modifyForm.pdItemCd.value = "";
			
			showDisplay();
		});
		
		$('#mtItemCd').change(function(){
			$('#itCd').val($('#mtItemCd').val());
			itemInfoAjax();
		});
		$('#pdItemCd').change(function(){
			$('#itCd').val($('#pdItemCd').val());
			itemInfoAjax();
		});
		
		$('#adRealCnt').focusout(function(){
			var adjCnt = $('#adRealCnt').val() - $('#adCnt').text();
			$('#adAdjCnt').text(adjCnt);
			modifyForm.adAdjCnt.value = adjCnt;
		});
	});
	
	function showDisplay(){
		if($('#itemType').val() == "자재"){
			$('#mtList').show();
			$('#pdList').hide();
		}else if($('#itemType').val() == "제품"){
			$('#mtList').hide();
			$('#pdList').show();
		}
	}
	
	function itemInfoAjax(){
		$.ajax({
			  type:"POST",
			  url:"<c:url value='${pageContext.request.contextPath}/sl/material/stockAdjust/itemCntInfoAjax.do'/>",	  		  			  
			  dataType:"JSON",
			  data:{
				  'itemCd':$('#itCd').val()
			  },
			  success:function(result){
				  $('#adCnt').text(result.item_info[0].itemCnt);
				  modifyForm.adCnt.value = result.item_info[0].itemCnt;
				  modifyForm.itemName.value = result.item_info[0].itemName;
			  },
			  error:function(request,status,error){ 
				  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);		  
			  }
		  });
	}
	</script>
</body>

</html>