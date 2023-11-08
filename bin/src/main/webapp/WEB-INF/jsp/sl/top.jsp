<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header> 
	<div class="gnb">
		<div class="gnb_date">
			<span class="time" id="time"></span>
		</div>
		<div style="font-size: 20px;">(주) 대경벤드</div>
		<div class="gnb_info">
			<span>${memberVO.mName}님  접속중입니다</span>
			<span class="btn_logout" onclick="location.href='${pageContext.request.contextPath}/sl/logout.do'">로그아웃</span>
		</div>
	</div>
	
	<div class="lnb">
		<ul>
			<li id="basicInfo" onclick="menuSet('basicInfo');location.href='${pageContext.request.contextPath}/sl/basicInfo/companyList.do'">기준정보관리</li>
			<li id="sales" onclick="menuSet('sales');location.href='${pageContext.request.contextPath}/sl/sales/estimateList.do'">영업관리</li>
			<li id="material" onclick="menuSet('material');location.href='${pageContext.request.contextPath}/sl/material/incomeList.do'">자재/출하관리</li>
			<li id="production" onclick="menuSet('production');location.href='${pageContext.request.contextPath}/sl/production/workOrderList.do'">생산관리</li>
			<li id="monitoring" onclick="menuSet('monitoring');location.href='${pageContext.request.contextPath}/sl/monitoring/dashBoard.do'">모니터링</li>
		</ul>
	</div>
</header> 