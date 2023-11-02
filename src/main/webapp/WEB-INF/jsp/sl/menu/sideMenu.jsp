<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Sidebar - Brand -->
<c:if test="${memberVO.miLevel eq 4}">
<a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/sl/basicInfo/user/userList.do">
    <div class="sidebar-brand-icon rotate-n-15">
<!--         <i class="fas fa-laugh-wink"></i> -->
	<!-- 	<img alt="로고" src="/resources/conf/images/dk.png" style="width: 55px; transform: rotate(15deg);"> -->
    </div>
    <div class="sidebar-brand-text mx-3">(주)대경벤드</div>
</a>
</c:if>
<c:if test="${memberVO.miLevel ne 4}">
<a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/sl/basicInfo/materialMove/materialMoveList.do">
    <div class="sidebar-brand-icon rotate-n-15">
<!--         <i class="fas fa-laugh-wink"></i> -->
		<!--  <img alt="로고" src="/resources/conf/images/dk.png" style="width: 55px; transform: rotate(15deg);"> -->
    </div>
    <div class="sidebar-brand-text mx-3">(주)대경벤드</div>
</a>
</c:if>
<!-- Divider -->
<hr class="sidebar-divider my-0">
<c:if test="${mLevel.P0032 <= memberVO.mLev}">
<li class="nav-item" id="dashboard">
    <a class="nav-link" href="${pageContext.request.contextPath}/sl/monitoring/dashBoard.do">
        <i class="fas fa-fw fa-tachometer-alt"></i>
        <span>Dashboard</span>
    </a>
</li>
</c:if>
<!-- Divider -->
<hr class="sidebar-divider">
<c:if test="${mLevel.P0001 <= memberVO.mLev || mLevel.P0002 <= memeberVO.mLev || mLevel.P0003 <= memberVO.mLev || mLevel.P0004 <= memberVO.mLev || mLevel.P0005 <= memberVO.mLev || mLevel.P0006 <= memberVO.mLev || mLevel.P0007 <= memberVO.mLev}">
<li class="nav-item" id="basicInfoMenu">
	<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#basicInfo"
	    aria-expanded="true" aria-controls="basicInfo">
	    <i class="fas fa-fw fa-cog"></i>
	    <span>기준정보관리</span>
	</a>
	<div id="basicInfo" class="collapse" aria-labelledby="headingBasicInfo" data-parent="#accordionSidebar">
	   	<div class="bg-white py-2 collapse-inner rounded">
		    <c:if test="${mLevel.P0001 <= memberVO.mLev}"><a class="collapse-item" id="userList" href="${pageContext.request.contextPath}/sl/basicInfo/user/userList.do">사원관리</a></c:if>
		    <c:if test="${mLevel.P0002 <= memberVO.mLev}"><a class="collapse-item" id="userAuthorityList" href="${pageContext.request.contextPath}/sl/basicInfo/Authority/userAuthorityList.do">사원권한관리</a></c:if>
		    <c:if test="${mLevel.P0003 <= memberVO.mLev}"><a class="collapse-item" id="prodInfoList" href="${pageContext.request.contextPath}/sl/basicInfo/prodInfo/prodInfoList.do">제품정보관리</a></c:if>
		    <c:if test="${mLevel.P0004 <= memberVO.mLev}"><a class="collapse-item" id="prPerformanceList" href="${pageContext.request.contextPath}/sl/basicInfo/prPerformance/prPerformanceList.do">생산실적관리</a></c:if>
		    <c:if test="${mLevel.P0005 <= memberVO.mLev}"><a class="collapse-item" id="materialMoveList" href="${pageContext.request.contextPath}/sl/basicInfo/materialMove/materialMoveList.do">자재이동관리</a></c:if>
		    <c:if test="${mLevel.P0006 <= memberVO.mLev}"><a class="collapse-item" id="qualityInfoList" href="${pageContext.request.contextPath}/sl/basicInfo/qualityInfo/qualityInfoList.do">품질정보관리</a></c:if>
		    <c:if test="${mLevel.P0007 <= memberVO.mLev}"><a class="collapse-item" id="goalList" href="${pageContext.request.contextPath}/sl/basicInfo/goal/goalList.do">목표관리정보관리</a></c:if>
		</div>
	</div>
</li>
</c:if>
<c:if test="${mLevel.P0008 <= memberVO.mLev || mLevel.P0009 <= memberVO.mLev || mLevel.P0010 <= memberVO.mLev || mLevel.P0011 <= memberVO.mLev}">
<li class="nav-item" id="collectInfoMenu">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collectInfo"
        aria-expanded="true" aria-controls="collectInfo">
        <i class="fas fa-fw fa-folder"></i>
        <span>정보수집관리</span>
    </a>
    <div id="collectInfo" class="collapse" aria-labelledby="headingCollectInfo" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
		    <c:if test="${mLevel.P0008 <= memberVO.mLev}"><a class="collapse-item" id="cuttingList" href="${pageContext.request.contextPath}/sl/collectInfo/cutting/cuttingList.do">절단공정정보관리</a></c:if>
		    <c:if test="${mLevel.P0009 <= memberVO.mLev}"><a class="collapse-item" id="processingList" href="${pageContext.request.contextPath}/sl/collectInfo/processing/processingList.do">가공공정정보관리</a></c:if>
		    <c:if test="${mLevel.P0010 <= memberVO.mLev}"><a class="collapse-item" id="visionList" href="${pageContext.request.contextPath}/sl/collectInfo/vision/visionList.do">비전검사정보관리</a></c:if>
		    <c:if test="${mLevel.P0011 <= memberVO.mLev}"><a class="collapse-item" id="waterPressureList" href="${pageContext.request.contextPath}/sl/collectInfo/waterPressure/waterPressureList.do">수압시험정보관리</a></c:if>
		</div>
    </div>
</li>
</c:if>
<%-- <c:if test="${mLevel.P0012 <= memberVO.mLev || mLevel.P0013 <= memberVO.mLev || mLevel.P0014 <= memberVO.mLev || mLevel.P0015 <= memberVO.mLev}">
<li class="nav-item" id="qualityMenu">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#quality"
        aria-expanded="true" aria-controls="quality">
        <i class="fas fa-fw fa-folder"></i>
        <span>품질관리</span>
    </a>
    <div id="quality" class="collapse" aria-labelledby="headingQuality" data-parent="#accordionSidebar">
    	<div class="bg-white py-2 collapse-inner rounded">
		    <c:if test="${mLevel.P0012 <= memberVO.mLev}"><a class="collapse-item" id="spcItemList" href="${pageContext.request.contextPath}/sl/quality/spcItem/spcItemList.do">SPC항목관리</a></c:if>
		    <c:if test="${mLevel.P0013 <= memberVO.mLev}"><a class="collapse-item" id="spcSpecList" href="${pageContext.request.contextPath}/sl/quality/spcSpec/spcSpecList.do">SPC스펙관리</a></c:if>
		    <c:if test="${mLevel.P0014 <= memberVO.mLev}"><a class="collapse-item" id="conChartList" href="${pageContext.request.contextPath}/sl/quality/conChart/conChartList.do">관리도조회</a></c:if>
		    <c:if test="${mLevel.P0015 <= memberVO.mLev}"><a class="collapse-item" id="cpkList" href="${pageContext.request.contextPath}/sl/quality/cpk/cpkList.do">공정능력추이조회</a></c:if>
		</div>
    </div>
</li>
</c:if> --%>
<c:if test="${mLevel.P0016 <= memberVO.mLev || mLevel.P0017 <= memberVO.mLev || mLevel.P0018 <= memberVO.mLev || mLevel.P0019 <= memberVO.mLev || mLevel.P0020 <= memberVO.mLev}">
<li class="nav-item" id="facilityMenu">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#facility"
        aria-expanded="true" aria-controls="facility">
        <i class="fas fa-fw fa-folder"></i>
        <span>설비관리</span>
    </a>
    <div id="facility" class="collapse" aria-labelledby="headingFacility" data-parent="#accordionSidebar">
    	<div class="bg-white py-2 collapse-inner rounded">
		    <c:if test="${mLevel.P0016 <= memberVO.mLev}"><a class="collapse-item" id="facMasterList" href="${pageContext.request.contextPath}/sl/facility/facMaster/facMasterList.do">설비마스터관리</a></c:if>
		    <c:if test="${mLevel.P0017 <= memberVO.mLev}"><a class="collapse-item" id="failReportList" href="${pageContext.request.contextPath}/sl/facility/failReport/failReportList.do">고장신고관리</a></c:if>
		    <c:if test="${mLevel.P0018 <= memberVO.mLev}"><a class="collapse-item" id="failRepairList" href="${pageContext.request.contextPath}/sl/facility/failRepair/failRepairList.do">고장조치관리</a></c:if>
		    <c:if test="${mLevel.P0019 <= memberVO.mLev}"><a class="collapse-item" id="equipChkList" href="${pageContext.request.contextPath}/sl/facility/equipChk/equipChkList.do">설비체크시트관리</a></c:if>
		    <c:if test="${mLevel.P0020 <= memberVO.mLev}"><a class="collapse-item" id="equipPrevList" href="${pageContext.request.contextPath}/sl/facility/equipPrev/equipPrevList.do">설비예방보수관리</a></c:if>
		</div>
    </div>
</li>
</c:if>

<c:if test="${mLevel.P0021 <= memberVO.mLev || mLevel.P0022 <= memberVO.mLev || mLevel.P0023 <= memberVO.mLev || mLevel.P0024 <= memberVO.mLev}">
<li class="nav-item" id="processMenu">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#process"
        aria-expanded="true" aria-controls="process">
        <i class="fas fa-fw fa-folder"></i>
        <span>공정관리</span>
    </a>
    <div id="process" class="collapse" aria-labelledby="headingProcess" data-parent="#accordionSidebar">
    	<div class="bg-white py-2 collapse-inner rounded">
		    <c:if test="${mLevel.P0021 <= memberVO.mLev}"><a class="collapse-item" id="cutList" href="${pageContext.request.contextPath}/sl/process/cutProcess/cutList.do">절단공정관리</a></c:if>
		    <c:if test="${mLevel.P0022 <= memberVO.mLev}"><a class="collapse-item" id="manufactureList" href="${pageContext.request.contextPath}/sl/process/manufacture/manufactureList.do">가공공정관리</a></c:if>
		    <c:if test="${mLevel.P0023 <= memberVO.mLev}"><a class="collapse-item" id="inspectList" href="${pageContext.request.contextPath}/sl/process/inspect/inspectList.do">검사공정관리</a></c:if>
		    <c:if test="${mLevel.P0024 <= memberVO.mLev}"><a class="collapse-item" id="performanceList" href="${pageContext.request.contextPath}/sl/process/checkPr/performanceList.do">성능시험관리</a></c:if>
		</div>
    </div>
</li>
</c:if>
<c:if test="${mLevel.P0025 <= memberVO.mLev || mLevel.P0026 <= memberVO.mLev}">
<li class="nav-item" id="kpiMenu">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#kpi"
        aria-expanded="true" aria-controls="kpi">
        <i class="fas fa-fw fa-folder"></i>
        <span>KPI관리</span>
    </a>
    <div id="kpi" class="collapse" aria-labelledby="headingKpi" data-parent="#accordionSidebar">
    	<div class="bg-white py-2 collapse-inner rounded">
		    <c:if test="${mLevel.P0025 <= memberVO.mLev}"><a class="collapse-item" id="kpiList" href="${pageContext.request.contextPath}/sl/kpi/kpimanagement/kpiList.do">KPI목표관리</a></c:if>
		    <c:if test="${mLevel.P0026 <= memberVO.mLev}"><a class="collapse-item" id="kpiStateList" href="${pageContext.request.contextPath}/sl/kpi/kpiState/kpiStateList.do">KPI현황</a></c:if>
		</div>
    </div>
</li>
</c:if>

<c:if test="${mLevel.P0027 <= memberVO.mLev || mLevel.P0028 <= memberVO.mLev || mLevel.P0029 <= memberVO.mLev || mLevel.P0030 <= memberVO.mLev || mLevel.P0031 <= memberVO.mLev || mLevel.P0032 <= memberVO.mLev}">
<li class="nav-item" id="monitoringMenu">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#monitoring"
        aria-expanded="true" aria-controls="monitoring">
        <i class="fas fa-fw fa-folder"></i>
        <span>모니터링</span>
    </a>
    <div id="monitoring" class="collapse" aria-labelledby="headingMonitoring" data-parent="#accordionSidebar">
    	<div class="bg-white py-2 collapse-inner rounded">
		    <c:if test="${mLevel.P0027 <= memberVO.mLev}"><a class="collapse-item" id="ordersOutput" href="${pageContext.request.contextPath}/sl/monitoring/ordersOutput/ordersOutput.do">수주대실적현황</a></c:if>
		    <c:if test="${mLevel.P0028 <= memberVO.mLev}"><a class="collapse-item" id="lineRunning" href="${pageContext.request.contextPath}/sl/monitoring/lineRunning/lineRunning.do">라인가동현황</a></c:if>
		    <c:if test="${mLevel.P0029 <= memberVO.mLev}"><a class="collapse-item" id="actualOutput" href="${pageContext.request.contextPath}/sl/monitoring/actualOutput/actualOutput.do">생산집계현황</a></c:if>
		 <%--    <c:if test="${mLevel.P0028 <= memberVO.mLev}"><a class="collapse-item" id="capabilityList" href="${pageContext.request.contextPath}/sl/monitoring/capability/capabilityList.do">공정능력추이현황</a></c:if> --%>
		     <c:if test="${mLevel.P0030 <= memberVO.mLev}"><a class="collapse-item" id="sysLog" href="${pageContext.request.contextPath}/sl/monitoring/sysLog/sysLogList.do">시스템사용로그</a></c:if>
		     <c:if test="${mLevel.P0030 <= memberVO.mLev}"><a class="collapse-item" id="monitorSetting" href="${pageContext.request.contextPath}/sl/monitoring/monitorSetting/monitorSettingList.do">모니터링설정</a></c:if>
		 <%--    <c:if test="${mLevel.P0028 <= memberVO.mLev}"><a class="collapse-item" id="noticeList" href="${pageContext.request.contextPath}/sl/monitoring/notice/noticeList.do">공지사항</a></c:if>
		    <c:if test="${mLevel.P0029 <= memberVO.mLev}"><a class="collapse-item" id="noticeList" href="${pageContext.request.contextPath}/sl/monitoring/notice/noticeList.do">공지사항</a></c:if>
		    <c:if test="${mLevel.P0030 <= memberVO.mLev}"><a class="collapse-item" id="noticeList" href="${pageContext.request.contextPath}/sl/monitoring/notice/noticeList.do">공지사항</a></c:if> --%>
		</div>
    </div>
</li>
</c:if>
<!-- Divider -->
<hr class="sidebar-divider d-none d-md-block">
<!-- Sidebar Toggler (Sidebar) -->
<div class="text-center d-none d-md-inline">
    <button class="rounded-circle border-0" id="sidebarToggle"></button>
</div>
