package apc.sl.monitoring.lineRunning.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import apc.sl.monitoring.lineRunning.service.LineRunningService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class LineRunningController {
	@Autowired
	private LineRunningService lineRunningService;
	
	@RequestMapping("/sl/monitoring/lineRunning/lineRunning.do")
	public String lineRunningList1(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		//오늘 날짜 넣기
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		Date now = new Date();
		
//		// Calendar 객체 생성 및 현재 날짜로 설정
//		Calendar calendar = Calendar.getInstance();
//		calendar.setTime(now);
//
//		// 하루를 뺀다
//		calendar.add(Calendar.DATE, -1);
//
//		// 하루 전의 날짜를 얻음
//		Date oneDayBefore = calendar.getTime();

		String edDate = format.format(now);
		
		if(searchVO.getSearchEdDate().equals("")) {
			searchVO.setSearchEdDate(edDate);
		}
		
		
		int totCnt = lineRunningService.selectLineRunningListToCnt(searchVO);
		/** pageing setting */
		searchVO.setPageSize(10);
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(5); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(searchVO.getPageSize()); // 페이징 리스트의 사이즈
		paginationInfo.setTotalRecordCount(totCnt);
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		List<?> lineRunningList = lineRunningService.selectLineRunningList(searchVO);
		model.put("lineRunningList", lineRunningList);
		model.put("paginationInfo", paginationInfo);
		return "sl/monitoring/lineRunning/lineRunning";
	}
	
	@RequestMapping("/sl/monitoring/lineRunning/lineRunningYear.do")
	public String lineRunningYear(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		if(searchVO.getSearchCondition().equals("")) {
			  searchVO.setSearchCondition(getYears().get("thisYear")+""); }
		
		model.put("date", getYears());
		
		List<?> daqName = lineRunningService.selectDaqName();
		model.put("eqName", daqName);
		List<?> list = lineRunningService.selectLineYear(searchVO);
		model.put("eqList", list);
		
		return "sl/monitoring/lineRunning/lineRunningYear";
	}
	
	private Map<String, Object> getYears(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		Date now = new Date();
		int begin = Integer.parseInt(format.format(now))-3;
		int end = begin+5;
		Map<String, Object> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("thisYear", format.format(now));
		return map;
	}
}
