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
                    <h1 class="h3 mb-2 text-gray-800">수금 등록</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/sales/collectMoney/registCollectOk.do" name="registForm" method="post">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>수주  <span class="req">*</span></th>
												<td>
													<select class="form-control" name="orIdx" id="orIdx">
														<option value="">선택</option>
														<c:forEach var="list" items="${deliveryList}" varStatus="status">
															<option value="${list.orIdx}">${list.orName}</option>
														</c:forEach>
													</select>
												</td>
												<th>거래처번호</th>
												<td>
													<span class="form-control val-area" id="aIdx">${collectVO.aIdx}</span>
													<input type="hidden" name="aIdx" value="${collectVO.aIdx}">
												</td>
											</tr>
											<tr>
												<th>수금상태  <span class="req">*</span></th>
												<td>
													<select class="form-control" name="coState" id="coState">
														<option value="0" <c:if test="${collectVO.coState eq '0'}">selected="selected"</c:if>>미수금</option>
														<option value="1" <c:if test="${collectVO.coState eq '1'}">selected="selected"</c:if>>수금</option>
													</select>
												</td>
												<th>수금예정일</th>
												<td><input type="date" class="form-control" name="coDueDte" id="coDueDte" value="${collectVO.coDueDte}"/></td>
											</tr>
											<tr>
												<th>수금일</th>
												<td><input type="date" class="form-control" name="coDte" id="coDte" value="${collectVO.coDte}"/></td>
												<th>자사담당자</th>
												<td><input type="text" class="form-control" name="coComManager" id="coComManager" value="${collectVO.coComManager}"/></td>
											</tr>
											<tr>
												<th>금액  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="coTot" id="coTot" value="${collectVO.coTot}"/></td>
												<th>VAT <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="coVat" id="coVat" value="${collectVO.coVat}"/></td>
											</tr>
											<tr>
												<th>총합계금  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="coTotPrice" id="coTotPrice" value="${collectVO.coTotPrice}"/></td>
												<th>세금계산서 발행여부</th>
												<td>
													<select class="form-control" name="coTaxUse" id="coTaxUse">
														<option value="0" <c:if test="${collectVO.coTaxUse eq '0'}">selected="selected"</c:if>>미발행</option>
														<option value="1" <c:if test="${collectVO.coTaxUse eq '1'}">selected="selected"</c:if>>발행</option>
													</select>
												</td>
											</tr>
											<tr>
												<th>비고</th>
												<td colspan="3"><textArea name="coNote" id="coNote">${collectVO.coNote}</textArea></td>
											</tr>
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_regist_collect()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/sales/collectMoney/collectMoneyList.do'">취소</span>
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
	function fn_regist_collect(){
		var num = /^\d+$/;
		if($('#deIdx').val() == ''){
			alert("납품번호를 확인 바랍니다.");
			return;
		}
		
		if($('#coState').val() == ''){
			alert("수금상태를 확인 바랍니다.");
			return;
		}
		
		if($('#coState').val() == "1" && $('#coDte').val() == ''){
			alert("수금일을 확인 바랍니다.");
			return;
		}
		
		if($('#coTot').val() == '' || !num.test($('#coTot').val())){
			alert("금액을 확인 바랍니다.");
			return;
		}
		
		if($('#coVat').val() == '' || !num.test($('#coVat').val())){
			alert("VAT를 확인 바랍니다.");
			return;
		}
		
		if($('#coTotPrice').val() == '' || !num.test($('#coTotPrice').val())){
			alert("총합계금을 확인 바랍니다.");
			return;
		}
		
		registForm.submit();
	}
	
	$(function() {
		$('#salesMenu').addClass("active");
		$('#sales').addClass("show");
		$('#collectMoneyList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
		$('#orIdx').change(function(){
			deliveryInfoAjax();
		});
		
		$('#coState').change(function(){
			if($('#coState').val() == '1'){
				$('#coDte').val(new Date().toISOString().slice(0,10));
			}
		});
	});
	
	function deliveryInfoAjax(){
		$.ajax({
			  type:"POST",
			  url:"<c:url value='${pageContext.request.contextPath}/sl/sales/collectMoney/deliveryInfoAjax.do'/>",	  		  			  
			  dataType:"JSON",
			  data:{
				  'orIdx':$('#orIdx').val()
			  },
			  success:function(result){
				  $('#aIdx').text(result.de_info[0].aIdx +" (" +result.de_info[0].aName+")");
				  registForm.aIdx.value = result.de_info[0].aIdx;
				  
				  var tot = result.de_info[0].deMoney;
				  var vat = result.de_info[0].deMoney/10;
				  registForm.coTot.value = tot-vat;
				  registForm.coVat.value = vat;
				  registForm.coTotPrice.value = tot;
			  },
			  error:function(request,status,error){ 
				  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);		  
			  }
		  });
	}
	</script>
</body>

</html>