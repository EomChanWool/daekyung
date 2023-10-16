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
                    <div class="btn_bottom_wrap">
                   		<h1 class="h3 mb-2 text-gray-800" style="display: inline-block;">투입 상세</h1>
					</div>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<input type="hidden" id="woIdx" value="${investVO.woIdx}">
                                <table class="table table-bordered">
                                    <tbody>
										<tr>
											<th>작업지시번호</th>
											<td><span class="form-control val-area">${investVO.woIdx}</span></td>
											<th>투입일</th>
											<td><span class="form-control val-area">${investVO.inDte}</span></td>
										</tr>
										<tr>
											<th>담당자</th>
											<td><span class="form-control val-area">${investVO.inComManager}</span></td>
										</tr>
									</tbody>
                                </table>
                                <table class="table table-bordered" id="dataTable">
                                	<thead>
                                		<tr>
                                  		 	<th style="padding-top: 1rem; width: 30%;">자재코드</th>
                                            <th style="padding-top: 1rem; width: 40%;">자재명</th>
											<th style="padding-top: 1rem;">수량</th>
                                        </tr>
                                	</thead>
                                  		<tbody>
                                  		</tbody>
                                </table>
                                <div class="btn_bottom_wrap">
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/material/invest/investList.do'">목록</span>
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
	function changeChk(){
		$('#itemCd1').change(function(){ materialInfoAjax($('#itemCd1').val(),1);	});
		$('#itemCd2').change(function(){ materialInfoAjax($('#itemCd2').val(),2);	});
		$('#itemCd3').change(function(){ materialInfoAjax($('#itemCd3').val(),3);	});
		$('#itemCd4').change(function(){ materialInfoAjax($('#itemCd4').val(),4);	});
		$('#itemCd5').change(function(){ materialInfoAjax($('#itemCd5').val(),5);	});
		$('#itemCd6').change(function(){ materialInfoAjax($('#itemCd6').val(),6);	});
		$('#itemCd7').change(function(){ materialInfoAjax($('#itemCd7').val(),7);	});
		$('#itemCd8').change(function(){ materialInfoAjax($('#itemCd8').val(),8);	});
		$('#itemCd9').change(function(){ materialInfoAjax($('#itemCd9').val(),9);	});
		$('#itemCd10').change(function(){ materialInfoAjax($('#itemCd10').val(),10);	});
		$('#itemCd11').change(function(){ materialInfoAjax($('#itemCd11').val(),11);	});
		$('#itemCd12').change(function(){ materialInfoAjax($('#itemCd12').val(),12);	});
		$('#itemCd13').change(function(){ materialInfoAjax($('#itemCd13').val(),13);	});
		$('#itemCd14').change(function(){ materialInfoAjax($('#itemCd14').val(),14);	});
		$('#itemCd15').change(function(){ materialInfoAjax($('#itemCd15').val(),15);	});
	}

	$(function() {
		$('#materialMenu').addClass("active");
		$('#material').addClass("show");
		$('#investList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		inMaterialInfoAjax();
		changeChk();
	});
	function inMaterialInfoAjax(){
		$.ajax({
			  type:"POST",
			  url:"<c:url value='${pageContext.request.contextPath}/sl/material/invest/investInMaterialInfoAjax.do'/>",	  		  			  
			  dataType:"JSON",
			  data:{
				  'woIdx':$('#woIdx').val()
			  },
			  success:function(result){
				  for(var i=0;i<result.mts_info.length;i++){
					  var itCd = result.mts_info[i].itemCd;
					  var itNm = result.mts_info[i].itemName;
					  var cnt = result.mts_info[i].cnt;
					  var trCnt = (i+1);
					  var innerHtml = "";
						innerHtml += '<tr>';
						innerHtml += '	<td><span class="form-control">'+itCd+'</span></td>';
						innerHtml += '	<td><span class="form-control">'+itNm+'</span></td>';
						innerHtml += '	<td><span class="form-control" style="text-align: right;">'+cnt+'</span></td>';
						innerHtml += '</tr>';
						
						$('#dataTable > tbody:last').append(innerHtml);
				  }
			  },
			  error:function(request,status,error){ 
				  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);		  
			  }
		  });
	}
	</script>
</body>

</html>