package apc.sl.quality.conChart.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import apc.sl.quality.conChart.service.ConChartService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ConChartController {
	@Autowired
	private ConChartService conChartService;
	
	@RequestMapping("/sl/quality/conChart/conChartList.do")
	public String conChartList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		if(searchVO.getSearchCondition() == "") {
			searchVO.setSearchCondition("자재");
		}
		
		int totCnt = conChartService.selectConChartListToCnt(searchVO);
		/** pageing setting */
		searchVO.setPageSize(10);
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(searchVO.getPageSize()); // 페이징 리스트의 사이즈
		paginationInfo.setTotalRecordCount(totCnt);
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		List<?> conChartList = conChartService.selectConChartList(searchVO);
		model.put("conChartList", conChartList);
		model.put("paginationInfo", paginationInfo);
		return "sl/quality/conChart/conChartList";
	}
}
