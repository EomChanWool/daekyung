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
                        <!-- Nav qualityInfo - User Information -->
                        <%@ include file="../../menu/logout/nav_user.jsp" %>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">SPC 항목 수정</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="${pageContext.request.contextPath}/sl/basicInfo/qualityInfo/modifySpcInfoOk.do" name="modifyForm" method="post">
                            	<input type="hidden" name=ssiId id="ssiId" value="${spcInfo.ssiId}"/>
                            	<input type="hidden" name="ssiT1BevelMax" id="ssiT1BevelMax" value=""/>
                            	<input type="hidden" name="ssiT2BevelMax" id="ssiT2BevelMax" value=""/>
                            	<input type="hidden" name="ssiT1BodyMax" id="ssiT1BodyMax" value=""/>
                            	<input type="hidden" name="ssiT2BodyMax" id="ssiT2BodyMax" value=""/>
                            	<input type="hidden" name="ssiOaQ" id="ssiOaQ" value=""/>
                            	<input type="hidden"  name="ssiOaQMin" id="ssiOaQMin" value=""/>
                            	<input type="hidden" name="ssiOpP" id="ssiOpP" value=""/>
                            	<input type="hidden" name="ssiOpPMin" id="ssiOpPMin" value=""/>
	                                <table class="table table-bordered" id="dataTable">
	                                    <tbody>
											<tr>
												<th>규격구분<span class="req">*</span></th>
												<td><input type="text" class="form-control" name="siId" id="siId" value="${spcInfo.siId}" readonly/></td>
												<th>규격명</th>
												<td><input type="text" class="form-control" name="piId" id="piId" value="${spcInfo.piId}" readonly/></td>
											</tr>
											<tr>
												<th>타입<span class="req">*</span></th>
												<td><input type="text" class="form-control" name="ssiType" id="ssiType" value="${spcInfo.ssiType}" readonly/></td>
											</tr>
										</tbody>
									</table>
									<table class="table table-bordered" id="dataTable2">
										<tbody id="90E_LS">
											<tr>
												<th>OD1</th>
												<td><input type="text" class="form-control" name="ssiOd01" id="ssiOd01" value="${spcInfo.ssiOd01}"/></td>
												<th>OD1 상한</th>
												<td><input type="text" class="form-control" name="ssiOd01Max" id="ssiOd01Max" value="${spcInfo.ssiOd01Max}"/></td>
												<th>OD1 하한</th>
												<td><input type="text" class="form-control" name="ssiOd01Min" id="ssiOd01Min" value="${spcInfo.ssiOd01Min}"/></td>
											</tr>
											<tr>
												<th>ID1</th>
												<td><input type="text" class="form-control" name="ssiId01" id="ssiId01" value="${spcInfo.ssiId01}"/></td>
												<th>ID1 상한</th>
												<td><input type="text" class="form-control" name="ssiId01Max" id="ssiId01Max" value="${spcInfo.ssiId01Max}"/></td>
												<th>ID1 하한</th>
												<td><input type="text" class="form-control" name="ssiId01Min" id="ssiId01Min" value="${spcInfo.ssiId01Min}"/></td>
											</tr>
											<tr>
												<th>T1</th>
												<td><input type="text" class="form-control" name="ssiT1Bevel" id="ssiT1Bevel" value="${spcInfo.ssiT1Bevel}"/></td>
												<th>T1 하한</th>
												<td><input type="text" class="form-control" name="ssiT1BevelMin" id="ssiT1BevelMin" value="${spcInfo.ssiT1BevelMin}"/></td>
												
											</tr>
											<tr>
												<th>BL1</th>
												<td><input type="text" class="form-control" name="ssiBevelEnd" id="ssiBevelEnd" value="${spcInfo.ssiBevelEnd}"/></td>
												<th>BL1 상한</th>
												<td><input type="text" class="form-control" name="ssiBevelEndMax" id="ssiBevelEndMax" value="${spcInfo.ssiBevelEndMax}"/></td>
												<th>BL1 하한</th>
												<td><input type="text" class="form-control" name="ssiBevelEndMin" id="ssiBevelEndMin" value="${spcInfo.ssiBevelEndMin}"/></td>
											</tr>
											<tr>
												<th>R</th>
												<td><input type="text" class="form-control" name="ssiRootFace" id="ssiRootFace" value="${spcInfo.ssiRootFace}"/></td>
												<th>R 상한</th>
												<td><input type="text" class="form-control" name="ssiRootFaceMax" id="ssiRootFaceMax" value="${spcInfo.ssiRootFaceMax}"/></td>
												<th>R 하한</th>
												<td><input type="text" class="form-control" name="ssiRootFaceMin" id="ssiRootFaceMin" value="${spcInfo.ssiRootFaceMin}"/></td>
											</tr>
											<tr>
												<th>A</th>
												<td><input type="text" class="form-control" name="ssiElbowA" id="ssiElbowA" value="${spcInfo.ssiElbowA}"/></td>
												<th>A 상한</th>
												<td><input type="text" class="form-control" name="ssiElbowAMax" id="ssiElbowAMax" value="${spcInfo.ssiElbowAMax}"/></td>
												<th>A 하한</th>
												<td><input type="text" class="form-control" name="ssiElbowAMin" id="ssiElbowAMin" value="${spcInfo.ssiElbowAMin}"/></td>
											</tr>
											<tr>
												<th>Q</th>
												<td><input type="text" class="form-control" name="ssiOaQMax" id="ssiOaQMax" value="${spcInfo.ssiOaQMax}"/></td>
												<th>P</th>
												<td><input type="text" class="form-control" name="ssiOpPMax" id="ssiOpPMax" value="${spcInfo.ssiOpPMax}"/></td>
											</tr>
										</tbody>
										
										<tbody id="45E_L">
												<tr>
												<th>OD1</th>
												<td><input type="text" class="form-control" name="ssiOd01" id="ssiOd01" value="${spcInfo.ssiOd01}"/></td>
												<th>OD1 상한</th>
												<td><input type="text" class="form-control" name="ssiOd01Max" id="ssiOd01Max" value="${spcInfo.ssiOd01Max}"/></td>
												<th>OD1 하한</th>
												<td><input type="text" class="form-control" name="ssiOd01Min" id="ssiOd01Min" value="${spcInfo.ssiOd01Min}"/></td>
											</tr>
											<tr>
												<th>ID1</th>
												<td><input type="text" class="form-control" name="ssiId01" id="ssiId01" value="${spcInfo.ssiId01}"/></td>
												<th>ID1 상한</th>
												<td><input type="text" class="form-control" name="ssiId01Max" id="ssiId01Max" value="${spcInfo.ssiId01Max}"/></td>
												<th>ID1 하한</th>
												<td><input type="text" class="form-control" name="ssiId01Min" id="ssiId01Min" value="${spcInfo.ssiId01Min}"/></td>
											</tr>
											<tr>
												<th>T1</th>
												<td><input type="text" class="form-control" name="ssiT1Bevel" id="ssiT1Bevel" value="${spcInfo.ssiT1Bevel}"/></td>
												<th>T1 하한</th>
												<td><input type="text" class="form-control" name="ssiT1BevelMin" id="ssiT1BevelMin" value="${spcInfo.ssiT1BevelMin}"/></td>
											</tr>
											<tr>
												<th>BL1</th>
												<td><input type="text" class="form-control" name="ssiBevelEnd" id="ssiBevelEnd" value="${spcInfo.ssiBevelEnd}"/></td>
												<th>BL1 상한</th>
												<td><input type="text" class="form-control" name="ssiBevelEndMax" id="ssiBevelEndMax" value="${spcInfo.ssiBevelEndMax}"/></td>
												<th>BL1 하한</th>
												<td><input type="text" class="form-control" name="ssiBevelEndMin" id="ssiBevelEndMin" value="${spcInfo.ssiBevelEndMin}"/></td>
											</tr>
											<tr>
												<th>R</th>
												<td><input type="text" class="form-control" name="ssiRootFace" id="ssiRootFace" value="${spcInfo.ssiRootFace}"/></td>
												<th>R 상한</th>
												<td><input type="text" class="form-control" name="ssiRootFaceMax" id="ssiRootFaceMax" value="${spcInfo.ssiRootFaceMax}"/></td>
												<th>R 하한</th>
												<td><input type="text" class="form-control" name="ssiRootFaceMin" id="ssiRootFaceMin" value="${spcInfo.ssiRootFaceMin}"/></td>
											</tr>
											<tr>
												<th>A</th>
												<td><input type="text" class="form-control" name="ssiElbowA" id="ssiElbowA" value="${spcInfo.ssiElbowA}"/></td>
												<th>A 상한</th>
												<td><input type="text" class="form-control" name="ssiElbowAMax" id="ssiElbowAMax" value="${spcInfo.ssiElbowAMax}"/></td>
												<th>A 하한</th>
												<td><input type="text" class="form-control" name="ssiElbowAMin" id="ssiElbowAMin" value="${spcInfo.ssiElbowAMax}"/></td>
											</tr>
											<tr>
												<th>Q</th>
												<td><input type="text" class="form-control" name="ssiOaQMax" id="ssiOaQMax" value="${spcInfo.ssiOaQMax}"/></td>
												<th>P</th>
												<td><input type="text" class="form-control" name="ssiOpPMax" id="ssiOpPMax" value="${spcInfo.ssiOpPMax}"/></td>
											</tr>
										</tbody>
										
										<tbody id="R_CE">
											<tr>
												<th>OD1</th>
												<td><input type="text" class="form-control" name="ssiOd01" id="ssiOd01" value="${spcInfo.ssiOd01}"/></td>
												<th>OD1 상한</th>
												<td><input type="text" class="form-control" name="ssiOd01Max" id="ssiOd01Max" value="${spcInfo.ssiOd01Max}"/></td>
												<th>OD1 하한</th>
												<td><input type="text" class="form-control" name="ssiOd01Min" id="ssiOd01Min" value="${spcInfo.ssiOd01Min}"/></td>
											</tr>
											<tr>
												<th>OD2</th>
												<td><input type="text" class="form-control" name="ssiOd02" id="ssiOd02" value="${spcInfo.ssiOd02}"/></td>
												<th>OD2 상한</th>
												<td><input type="text" class="form-control" name="ssiOd02Max" id="ssiOd02Max" value="${spcInfo.ssiOd02Max}"/></td>
												<th>OD2 하한</th>
												<td><input type="text" class="form-control" name="ssiOd02Min" id="ssiOd02Min" value="${spcInfo.ssiOd02Min}"/></td>
											</tr>
											<tr>
												<th>ID1</th>
												<td><input type="text" class="form-control" name="ssiId01" id="ssiId01" value="${spcInfo.ssiId01}"/></td>
												<th>ID1 상한</th>
												<td><input type="text" class="form-control" name="ssiId01Max" id="ssiId01Max" value="${spcInfo.ssiId01Max}"/></td>
												<th>ID1 하한</th>
												<td><input type="text" class="form-control" name="ssiId01Min" id="ssiId01Min" value="${spcInfo.ssiId01Min}"/></td>
											</tr>
											<tr>
												<th>ID2</th>
												<td><input type="text" class="form-control" name="ssiId02" id="ssiId02" value="${spcInfo.ssiId02}"/></td>
												<th>ID2 상한</th>
												<td><input type="text" class="form-control" name="ssiId02Max" id="ssiId02Max" value="${spcInfo.ssiId02Max}"/></td>
												<th>ID2 하한</th>
												<td><input type="text" class="form-control" name="ssiId02Min" id="ssiId02Min" value="${spcInfo.ssiId02Min}"/></td>
											</tr>
											<tr>
												<th>T1</th>
												<td><input type="text" class="form-control" name="ssiT1Bevel" id="ssiT1Bevel" value="${spcInfo.ssiT1Bevel}"/></td>
												<th>T1 하한</th>
												<td><input type="text" class="form-control" name="ssiT1BevelMin" id="ssiT1BevelMin" value="${spcInfo.ssiT1BevelMin}"/></td>
											</tr>
											<tr>
												<th>T1</th>
												<td><input type="text" class="form-control" name="ssiT1Body" id="ssiT1Body" value="${spcInfo.ssiT1Body}"/></td>
												<th>T1 하한</th>
												<td><input type="text" class="form-control" name="ssiT1BodyMin" id="ssiT1BodyMin" value="${spcInfo.ssiT1BodyMin}"/></td>
											</tr>
											<tr>
												<th>BL1</th>
												<td><input type="text" class="form-control" name="ssiBevelEnd" id="ssiBevelEnd" value="${spcInfo.ssiBevelEnd}"/></td>
												<th>BL1 상한</th>
												<td><input type="text" class="form-control" name="ssiBevelEndMax" id="ssiBevelEndMax" value="${spcInfo.ssiBevelEndMax}"/></td>
												<th>BL1 하한</th>
												<td><input type="text" class="form-control" name="ssiBevelEndMin" id="ssiBevelEndMin" value="${spcInfo.ssiBevelEndMin}"/></td>
											</tr>
											<tr>
												<th>R</th>
												<td><input type="text" class="form-control" name="ssiRootFace" id="ssiRootFace" value="${spcInfo.ssiRootFace}"/></td>
												<th>R 상한</th>
												<td><input type="text" class="form-control" name="ssiRootFaceMax" id="ssiRootFaceMax" value="${spcInfo.ssiRootFaceMax}"/></td>
												<th>R 하한</th>
												<td><input type="text" class="form-control" name="ssiRootFaceMin" id="ssiRootFaceMin" value="${spcInfo.ssiRootFaceMin}"/></td>
											</tr>
											<tr>
												<th>H</th>
												<td><input type="text" class="form-control" name="ssiReduH" id="ssiReduH" value="${spcInfo.ssiReduH}"/></td>
												<th>H 상한</th>
												<td><input type="text" class="form-control" name="ssiReduHMax" id="ssiReduHMax" value="${spcInfo.ssiReduHMax}"/></td>
												<th>H 하한</th>
												<td><input type="text" class="form-control" name="ssiReduHMin" id="ssiReduHMin" value="${spcInfo.ssiReduHMin}"/></td>
											</tr>
											<tr>
												<th>Q</th>
												<td><input type="text" class="form-control" name="ssiOaQMax" id="ssiOaQMax" value="${spcInfo.ssiOaQMax}"/></td>
											</tr>
										</tbody>
										
										<tbody id="T_SR">
											<tr>
												<th>OD1</th>
												<td><input type="text" class="form-control" name="ssiOd01" id="ssiOd01" value="${spcInfo.ssiOd01}"/></td>
												<th>OD1 상한</th>
												<td><input type="text" class="form-control" name="ssiOd01Max" id="ssiOd01Max" value="${spcInfo.ssiOd01Max}"/></td>
												<th>OD1 하한</th>
												<td><input type="text" class="form-control" name="ssiOd01Min" id="ssiOd01Min" value="${spcInfo.ssiOd01Min}"/></td>
											</tr>
											<tr>
												<th>OD2</th>
												<td><input type="text" class="form-control" name="ssiOd02" id="ssiOd02" value="${spcInfo.ssiOd02}"/></td>
												<th>OD2 상한</th>
												<td><input type="text" class="form-control" name="ssiOd02Max" id="ssiOd02Max" value="${spcInfo.ssiOd02Max}"/></td>
												<th>OD2 하한</th>
												<td><input type="text" class="form-control" name="ssiOd02Min" id="ssiOd02Min" value="${spcInfo.ssiOd02Min}"/></td>
											</tr>
											<tr>
												<th>ID1</th>
												<td><input type="text" class="form-control" name="ssiId01" id="ssiId01" value="${spcInfo.ssiId01}"/></td>
												<th>ID1 상한</th>
												<td><input type="text" class="form-control" name="ssiId01Max" id="ssiId01Max" value="${spcInfo.ssiId01Max}"/></td>
												<th>ID1 하한</th>
												<td><input type="text" class="form-control" name="ssiId01Min" id="ssiId01Min" value="${spcInfo.ssiId01Min}"/></td>
											</tr>
											<tr>
												<th>ID2</th>
												<td><input type="text" class="form-control" name="ssiId02" id="ssiId02" value="${spcInfo.ssiId02}"/></td>
												<th>ID2 상한</th>
												<td><input type="text" class="form-control" name="ssiId02Max" id="ssiId02Max" value="${spcInfo.ssiId02Max}"/></td>
												<th>ID2 하한</th>
												<td><input type="text" class="form-control" name="ssiId02Min" id="ssiId02Min" value="${spcInfo.ssiId02Min}"/></td>
											</tr>
											<tr>
												<th>T1</th>
												<td><input type="text" class="form-control" name="ssiT1Bevel" id="ssiT1Bevel" value="${spcInfo.ssiT1Bevel}"/></td>
												<th>T1 하한</th>
												<td><input type="text" class="form-control" name="ssiT1BevelMin" id="ssiT1BevelMin" value="${spcInfo.ssiT1BevelMin}"/></td>
											</tr>
											<tr>
												<th>T1</th>
												<td><input type="text" class="form-control" name="ssiT1Body" id="ssiT1Body" value="${spcInfo.ssiT1Body}"/></td>
												<th>T1 하한</th>
												<td><input type="text" class="form-control" name="ssiT1BodyMin" id="ssiT1BodyMin" value="${spcInfo.ssiT1BodyMin}"/></td>
											</tr>
											<tr>
												<th>BL1</th>
												<td><input type="text" class="form-control" name="ssiBevelEnd" id="ssiBevelEnd" value="${spcInfo.ssiBevelEnd}"/></td>
												<th>BL1 상한</th>
												<td><input type="text" class="form-control" name="ssiBevelEndMax" id="ssiBevelEndMax" value="${spcInfo.ssiBevelEndMax}"/></td>
												<th>BL1 하한</th>
												<td><input type="text" class="form-control" name="ssiBevelEndMin" id="ssiBevelEndMin" value="${spcInfo.ssiBevelEndMin}"/></td>
											</tr>
											<tr>
												<th>R</th>
												<td><input type="text" class="form-control" name="ssiRootFace" id="ssiRootFace" value="${spcInfo.ssiRootFace}"/></td>
												<th>R 상한</th>
												<td><input type="text" class="form-control" name="ssiRootFaceMax" id="ssiRootFaceMax" value="${spcInfo.ssiRootFaceMax}"/></td>
												<th>R 하한</th>
												<td><input type="text" class="form-control" name="ssiRootFaceMin" id="ssiRootFaceMin" value="${spcInfo.ssiRootFaceMin}"/></td>
											</tr>
											<tr>
												<th>C</th>
												<td><input type="text" class="form-control" name="ssiTeeC" id="ssiTeeC" value="${spcInfo.ssiTeeC}"/></td>
												<th>C 상한</th>
												<td><input type="text" class="form-control" name="ssiTeeCMax" id="ssiTeeCMax" value="${spcInfo.ssiTeeCMax}"/></td>
												<th>C 하한</th>
												<td><input type="text" class="form-control" name="ssiTeeCMin" id="ssiTeeCMin" value="${spcInfo.ssiTeeCMin}"/></td>
											</tr>
											<tr>
												<th>M</th>
												<td><input type="text" class="form-control" name="ssiTeeM" id="ssiTeeM" value="${spcInfo.ssiTeeM}"/></td>
												<th>M 상한</th>
												<td><input type="text" class="form-control" name="ssiTeeMMax" id="ssiTeeMMax" value="${spcInfo.ssiTeeMMax}"/></td>
												<th>M 하한</th>
												<td><input type="text" class="form-control" name="ssiTeeMMin" id="ssiTeeMMin" value="${spcInfo.ssiTeeMMin}"/></td>
											</tr>
											<tr>
												<th>Q</th>
												<td><input type="text" class="form-control" name="ssiOaQMax" id="ssiOaQMax" value="${spcInfo.ssiOaQMax}"/></td>
												<th>P</th>
												<td><input type="text" class="form-control" name="ssiOpPMax" id="ssiOpPMax" value="${spcInfo.ssiOpPMax}"/></td>
											</tr>
										</tbody>
										
										<tbody id="CAP">
											<tr>
												<th>OD1</th>
												<td><input type="text" class="form-control" name="ssiOd01" id="ssiOd01" value="${spcInfo.ssiOd01}"/></td>
												<th>OD1 상한</th>
												<td><input type="text" class="form-control" name="ssiOd01Max" id="ssiOd01Max" value="${spcInfo.ssiOd01Max}"/></td>
												<th>OD1 하한</th>
												<td><input type="text" class="form-control" name="ssiOd01Min" id="ssiOd01Min" value="${spcInfo.ssiOd01Min}"/></td>
											</tr>
											<tr>
												<th>ID1</th>
												<td><input type="text" class="form-control" name="ssiId01" id="ssiId01" value="${spcInfo.ssiId01}"/></td>
												<th>ID1 상한</th>
												<td><input type="text" class="form-control" name="ssiId01Max" id="ssiId01Max" value="${spcInfo.ssiId01Max}"/></td>
												<th>ID3 하한</th>
												<td><input type="text" class="form-control" name="ssiId01Min" id="ssiId01Min" value="${spcInfo.ssiId01Min}"/></td>
											</tr>
											<tr>
												<th>T1</th>
												<td><input type="text" class="form-control" name="ssiT1Bevel" id="ssiT1Bevel" value="${spcInfo.ssiT1Bevel}"/></td>
												<th>T1 하한</th>
												<td><input type="text" class="form-control" name="ssiT1BevelMin" id="ssiT1BevelMin" value="${spcInfo.ssiT1BevelMin}"/></td>
											</tr>
											<tr>
												<th>BL1</th>
												<td><input type="text" class="form-control" name="ssiBevelEnd" id="ssiBevelEnd" value="${spcInfo.ssiT1BevelEnd}"/></td>
												<th>BL1 상한</th>
												<td><input type="text" class="form-control" name="ssiBevelEndMax" id="ssiBevelEndMax" value="${spcInfo.ssiT1BevelEndMax}"/></td>
												<th>BL1 하한</th>
												<td><input type="text" class="form-control" name="ssiBevelEndMin" id="ssiBevelEndMin" value="${spcInfo.ssiT1BevelEndMin}"/></td>
											</tr>
											<tr>
												<th>R</th>
												<td><input type="text" class="form-control" name="ssiRootFace" id="ssiRootFace" value="${spcInfo.ssiRootFace}"/></td>
												<th>R 상한</th>
												<td><input type="text" class="form-control" name="ssiRootFaceMax" id="ssiRootFaceMax" value="${spcInfo.ssiRootFaceMax}"/></td>
												<th>R 하한</th>
												<td><input type="text" class="form-control" name="ssiRootFaceMin" id="ssiRootFaceMin" value="${spcInfo.ssiRootFaceMin}"/></td>
											</tr>
											<tr>
												<th>E</th>
												<td><input type="text" class="form-control" name="ssiCapE" id="ssiCapE" value="${spcInfo.ssiCapE}"/></td>
												<th>E 상한</th>
												<td><input type="text" class="form-control" name="ssiCapEMax" id="ssiCapEMax" value="${spcInfo.ssiCapEMax}"/></td>
												<th>E 하한</th>
												<td><input type="text" class="form-control" name="ssiCapEMin" id="ssiCapEMin" value="${spcInfo.ssiCapEMin}"/></td>
											</tr>
											<tr>
												<th>Q</th>
												<td><input type="text" class="form-control" name="ssiOaQMax" id="ssiOaQMax" value="${spcInfo.ssiOaQMax}"/></td>
											</tr>
										</tbody>
										
										<tbody id="STUD_END">
												<tr>
												<th>OD1</th>
												<td><input type="text" class="form-control" name="ssiOd01" id="ssiOd01" value="${spcInfo.ssiOd01}"/></td>
												<th>OD1 상한</th>
												<td><input type="text" class="form-control" name="ssiOd01Max" id="ssiOd01Max" value="${spcInfo.ssiOd01Max}"/></td>
												<th>OD1 하한</th>
												<td><input type="text" class="form-control" name="ssiOd01Min" id="ssiOd01Min" value="${spcInfo.ssiOd01Min}"/></td>
											</tr>
											<tr>
												<th>OD2</th>
												<td><input type="text" class="form-control" name="ssiOd02" id="ssiOd02" value="${spcInfo.ssiOd02}"/></td>
												<th>OD2 상한</th>
												<td><input type="text" class="form-control" name="ssiOd02Max" id="ssiOd02Max" value="${spcInfo.ssiOd02Max}"/></td>
												<th>OD2 하한</th>
												<td><input type="text" class="form-control" name="ssiOd02Min" id="ssiOd02Min" value="${spcInfo.ssiOd02Min}"/></td>
											</tr>
											<tr>
												<th>ID1</th>
												<td><input type="text" class="form-control" name="ssiId01" id="ssiId01" value="${spcInfo.ssiId01}"/></td>
												<th>ID1 상한</th>
												<td><input type="text" class="form-control" name="ssiId01Max" id="ssiId01Max" value="${spcInfo.ssiId01Max}"/></td>
												<th>ID1 하한</th>
												<td><input type="text" class="form-control" name="ssiId01Min" id="ssiId01Min" value="${spcInfo.ssiId01Min}"/></td>
											</tr>
											<tr>
												<th>ID2</th>
												<td><input type="text" class="form-control" name="ssiId02" id="ssiId02" value="${spcInfo.ssiId02}"/></td>
												<th>ID2 상한</th>
												<td><input type="text" class="form-control" name="ssiId02Max" id="ssiId02Max" value="${spcInfo.ssiId02Max}"/></td>
												<th>ID2 하한</th>
												<td><input type="text" class="form-control" name="ssiId02Min" id="ssiId02Min" value="${spcInfo.ssiId02Min}"/></td>
											</tr>
											<tr>
												<th>T1</th>
												<td><input type="text" class="form-control" name="ssiT1Bevel" id="ssiT1Bevel" value="${spcInfo.ssiT1Bevel}"/></td>
												<!-- <th>T1 상한</th>
												<td><input type="text" class="form-control" name="ssiT1BevelMax" id="ssiT1BevelMax"/></td> -->
												<th>T1 하한</th>
												<td><input type="text" class="form-control" name="ssiT1BevelMin" id="ssiT1BevelMin" value="${spcInfo.ssiT1BevelMin}"/></td>
											</tr>
											<tr>
												<th>T2</th>
												<td><input type="text" class="form-control" name="ssiT2Bevel" id="ssiT2Bevel" value="${spcInfo.ssiT2Bevel}"/></td>
												<!-- <th>T2 상한</th>
												<td><input type="text" class="form-control" name="ssiT2BevelMax" id="ssiT2BevelMax"/></td> -->
												<th>T2 하한</th>
												<td><input type="text" class="form-control" name="ssiT2BevelMin" id="ssiT2BevelMin" value="${spcInfo.ssiT2BevelMin}"/></td>
											</tr>
											<tr>
												<th>T1</th>
												<td><input type="text" class="form-control" name="ssiT1Body" id="ssiT1Body" value="${spcInfo.ssiT1Body}"/></td>
												<!-- <th>T1 상한</th>
												<td><input type="text" class="form-control" name="ssiT1BodyMax" id="ssiT1BodyMax"/></td> -->
												<th>T1 하한</th>
												<td><input type="text" class="form-control" name="ssiT1BodyMin" id="ssiT1BodyMin" value="${spcInfo.ssiT1BodyMin}"/></td>
											</tr>
											<tr>
												<th>T2</th>
												<td><input type="text" class="form-control" name="ssiT2Body" id="ssiT2Body" value="${spcInfo.ssiT2Body}"/></td>
												<!-- <th>T2 상한</th>
												<td><input type="text" class="form-control" name="ssiT2BodyMax" id="ssiT2BodyMax"/></td> -->
												<th>T2 하한</th>
												<td><input type="text" class="form-control" name="ssiT2BodyMin" id="ssiT2BodyMin" value="${spcInfo.ssiT2BodyMin}"/></td>
											</tr>
											<tr>
												<th>BL1</th>
												<td><input type="text" class="form-control" name="ssiBevelEnd" id="ssiBevelEnd" value="${spcInfo.ssiBevelEnd}"/></td>
												<th>BL1 상한</th>
												<td><input type="text" class="form-control" name="ssiBevelEndMax" id="ssiBevelEndMax" value="${spcInfo.ssiBevelEndMax}"/></td>
												<th>BL1 하한</th>
												<td><input type="text" class="form-control" name="ssiBevelEndMin" id="ssiBevelEndMin" value="${spcInfo.ssiBevelEndMin}"/></td>
											</tr>
											<tr>
												<th>R</th>
												<td><input type="text" class="form-control" name="ssiRootFace" id="ssiRootFace" value="${spcInfo.ssiRootFace}"/></td>
												<th>R 상한</th>
												<td><input type="text" class="form-control" name="ssiRootFaceMax" id="ssiRootFaceMax" value="${spcInfo.ssiRootFaceMax}"/></td>
												<th>R 하한</th>
												<td><input type="text" class="form-control" name="ssiRootFaceMin" id="ssiRootFaceMin" value="${spcInfo.ssiRootFaceMin}"/></td>
											</tr>
											
											
										
											<tr>
												<th>F</th>
												<td><input type="text" class="form-control" name="ssiStubF" id="ssiStubF" value="${spcInfo.ssiStubF}"/></td>
												<th>F 상한</th>
												<td><input type="text" class="form-control" name="ssiStubFMax" id="ssiStubFMax" value="${spcInfo.ssiStubFMax}"/></td>
												<th>F 하한</th>
												<td><input type="text" class="form-control" name="ssiStubFMin" id="ssiStubFMin" value="${spcInfo.ssiStubFMin}"/></td>
											</tr>
											<tr>
												<th>G</th>
												<td><input type="text" class="form-control" name="ssiStubG" id="ssiStubG" value="${spcInfo.ssiStubG}"/></td>
												<th>G 상한</th>
												<td><input type="text" class="form-control" name="ssiStubGMax" id="ssiStubGMax" value="${spcInfo.ssiStubGMax}"/></td>
												<th>G 하한</th>
												<td><input type="text" class="form-control" name="ssiStubGMin" id="ssiStubGMin" value="${spcInfo.ssiStubGMin}"/></td>
											</tr>
											<tr>
												<th>GT</th>
												<td><input type="text" class="form-control" name="ssiStubGt" id="ssiStubGt" value="${spcInfo.ssiStubGt}"/></td>
												<th>GT 상한</th>
												<td><input type="text" class="form-control" name="ssiStubGtMax" id="ssiStubGtMax" value="${spcInfo.ssiStubGtMax}"/></td>
												<th>GT 하한</th>
												<td><input type="text" class="form-control" name="ssiStubGtMin" id="ssiStubGtMin" value="${spcInfo.ssiStubGtMin}"/></td>
											</tr>
											<tr>
												<th>R</th>
												<td><input type="text" class="form-control" name="ssiStubR" id="ssiStubR" value="${spcInfo.ssiStubR}"/></td>
												<th>R 상한</th>
												<td><input type="text" class="form-control" name="ssiStubRMax" id="ssiStubRMax" value="${spcInfo.ssiStubRMax}"/></td>
												<th>R 하한</th>
												<td><input type="text" class="form-control" name="ssiStubRMin" id="ssiStubRMin" value="${spcInfo.ssiStubRMin}"/></td>
											</tr>
											<tr>
												<!-- <th>T</th>
												<td><input type="text" class="form-control" name="ssiCapLimitT" id="ssiCapLimitT"/></td> -->
												<th>Q</th>
												<td><input type="text" class="form-control" name="ssiOaQMax" id="ssiOaQMax" value="${spcInfo.ssiOaQMax}"/></td>
												<th>P</th>
												<td><input type="text" class="form-control" name="ssiOpPMax" id="ssiOpPMax" value="${spcInfo.ssiOaPMax}"/></td>
											</tr>
										</tbody>
	                                </table>
                                </form>
                                <div class="btn_bottom_wrap">
									<button type="submit" class="btn_ok" onclick="fn_regist_qualityInfo()" style="border:none;">확인</button>
									<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/basicInfo/qualityInfo/qualityInfoList.do'">취소</span>
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
	function fn_regist_qualityInfo(){
		
			 modifyForm.submit();
	}
	
	
	
	
	$(function() {
		$('#basicInfoMenu').addClass("active");
		$('#basicInfo').addClass("show");
		$('#qualityInfoList').addClass("active");
		$('table#dataTable2 tbody').hide();
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
		
		var checkedRole = '${spcInfo.ssiType}';
		$('table#dataTable2 tbody').hide();
		$('table#dataTable2 tbody tr td input').prop('disabled', true);
		
		if (checkedRole == '90E(S)' || checkedRole == '90E(L)') {
			$('table#dataTable2 tbody#90E_LS').show();
			$('table#dataTable2 tbody#90E_LS tr td input').prop('disabled', false);
		} else {
			$('table#dataTable2 tbody#90E_LS').hide()
		}

		if (checkedRole == '45E(L)') {
			$('table#dataTable2 tbody#45E_L').show();
			$('table#dataTable2 tbody#45E_L tr td input').prop('disabled', false);
		} else {
			$('table#dataTable2 tbody#45E_L').hide();
		}
		
		if (checkedRole == 'R(C)' || checkedRole == 'R(E)') {
			$('table#dataTable2 tbody#R_CE').show();
			$('table#dataTable2 tbody#R_CE tr td input').prop('disabled', false);
			if (checkedRole == 'R(C)') {
				$('table#dataTable2 tbody#R_CE #sel #selRC').show();
				$('table#dataTable2 tbody#R_CE #sel #selRE').hide();
			} else {
				$('table#dataTable2 tbody#R_CE #sel #selRE').show();
				$('table#dataTable2 tbody#R_CE #sel #selRC').hide();
			}
		} else {
			$('table#dataTable2 tbody#R_CE').hide();
		}
		
		if (checkedRole == 'T(S)' || checkedRole == 'T(R)') {
			$('table#dataTable2 tbody#T_SR').show();
			$('table#dataTable2 tbody#T_SR tr td input').prop('disabled', false);
		} else {
			$('table#dataTable2 tbody#T_SR').hide();
		}
		
		if (checkedRole == 'CAP') {
			$('table#dataTable2 tbody#CAP').show();
			$('table#dataTable2 tbody#CAP tr td input').prop('disabled', false);
		} else {
			$('table#dataTable2 tbody#CAP').hide();
		}
		
		if (checkedRole == 'STUD') {
			$('table#dataTable2 tbody#STUD_END').show();
			$('table#dataTable2 tbody#STUD_END tr td input').prop('disabled', false);
		} else {
			$('table#dataTable2 tbody#STUD_END').hide();
		}
	});
	
	
			
		

	</script>
</body>

</html>