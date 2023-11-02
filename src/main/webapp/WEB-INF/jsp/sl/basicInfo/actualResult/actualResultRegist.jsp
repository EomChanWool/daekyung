<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../../header.jsp" %>
<style>
	.table th{
		padding-top: 1.3rem;
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
                        <!-- Nav member - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">사용자 등록</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/basicInfo/member/registMemberOk.do" name="registForm" method="post">
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>사원명  <span class="req">*</span></th>
												<td><input type="text" class="form-control" name="mName" id="mName" placeholder="아이디/이름을 입력해 주세요"/></td>
												<th>아이디  <span class="req">*</span></th>
												<td>
													<input type="text" class="form-control" name="mId" id="mId" style="width:77%; float: left;"/>
													<a href="#" class="btn btn-success btn-icon-split" onclick="idChk()">
				                                        <span class="text">중복확인</span>
				                                    </a>
												</td>
											</tr>
											<tr>
												<th>비밀번호  <span class="req">*</span></th>
												<td><input type="password" class="form-control" name="mPwd" id="mPwd"/></td>
												<th>비밀번호 확인  <span class="req">*</span></th>
												<td><input type="password" class="form-control" name="mPwdChk" id="mPwdChk"/></td>
											</tr>
											<tr>
												<th>소속</th>
												<td><input type="text" class="form-control" name="mBelong" id="mBelong"/></td>
												<th>직급</th>
												<td><input type="text" class="form-control" name="mRank" id="mRank"/></td>
											</tr>
											<tr>
												<th>레벨</th>
												<td>
													<select name="mLev" id="mLev" class="form-control">
														<option value="1">현장 작업자</option>
														<option value="2">관리자</option>
													</select>
												</td>
												<th>입사일</th>
												<td><input type="date" class="form-control" name="mEmpltDte" id="mEmpltDte"/></td>
											</tr>
											<tr>
												<th>비고</th>
												<td colspan="3"><textArea name="mNote"></textArea></td>
											</tr>
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_regist_member()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/basicInfo/member/memberList.do'">취소</span>
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
	function fn_regist_member(){
		if($('#mName').val() == ""){
			alert("이름을 확인 바랍니다.");
			return;
		}
		
		if($('#useableId').val() == ""){
			alert("아이디를 중복확인 바랍니다.");
			return;
		}
		
		if($('#mPwd').val() == "" || $('#mPwdChk').val() == ""){
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		if($('#mPwd').val() != $('#mPwdChk').val()) {
			alert('비밀번호가 일치하지 않습니다.');
			$('#mPwd').val('');
			$('#mPwdChk').val('');
			registForm.mPwd.focus();
			return;
		}
		
		registForm.submit();
	}
	
	function idChk(){
		if(registForm.mId.value == ""){
			alert("아이디를 확인 바랍니다.");
			return;
		}
		
		$.ajax({
			  type:"POST",
			  url:"<c:url value='${pageContext.request.contextPath}/sl/basicInfo/member/idChkAjax.do'/>",	  		  			  
			  dataType:"JSON",
			  data:{
				  'id':$('#mId').val()
			  },
			  success:function(result){
				  if(result.id == $('#mId').val()){
					  alert("이미 존재하는 ID입니다.");
					  $('#useableId').val('');
					  $('#mId').val('');
					  $('#mId').focus();
					  return;
				  }else{
					  alert("사용가능한 ID입니다.");
					  $('#useableId').val($('#mId').val());
					  return;
				  }
			  },
			  error:function(request,status,error){ 
				  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);		  
			  }
		  });
	}
	
	$(function() {
		$('#basicInfoMenu').addClass("active");
		$('#basicInfo').addClass("show");
		$('#memberList').addClass("active");
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
	});
	</script>
</body>

</html>