package apc.sl.facility.failRepair.web;

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

import apc.sl.facility.failRepair.service.FailRepairService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class FailRepairController {
	@Autowired
	private FailRepairService failRepairService;
	
	@RequestMapping("/sl/facility/failRepair/failRepairList.do")
	public String failRepairList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = failRepairService.selectFailRepairListToCnt(searchVO);
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
		List<?> failRepairList = failRepairService.selectFailRepairList(searchVO);
		model.put("failRepairList", failRepairList);
		model.put("paginationInfo", paginationInfo);
		return "sl/facility/failRepair/failRepairList";
	}
	
	@RequestMapping("/sl/facility/failRepair/registFailRepair.do")
	public String registFailRepair(ModelMap model) {
		List<?> failList = failRepairService.selectFailList();
		model.put("failList", failList);
		return "sl/facility/failRepair/failRepairRegist";
	}
	
	@RequestMapping("/sl/facility/failRepair/registFailRepairOk.do")
	public String registFailRepairOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		System.out.println("map : "+ map);
		failRepairService.registFailRepair(map);
		
		failRepairService.failReportIscomp(map);
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/facility/failRepair/failRepairList.do";
	}
	
	@RequestMapping("/sl/facility/failRepair/modifyFailRepair.do")
	public String modifyFailRepair(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = failRepairService.selectFailRepairInfo(map);
		model.put("failRepairVO", detail);
		return "sl/facility/failRepair/failRepairModify";
	}
	
	@RequestMapping("/sl/facility/failRepair/modifyFailRepairOk.do")
	public String modifyFailRepairOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		failRepairService.modifyFailRepair(map);
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		return "redirect:/sl/facility/failRepair/failRepairList.do";
	}
	
	@RequestMapping("/sl/facility/failRepair/detailFailRepair.do")
	public String deatail(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = failRepairService.selectFailRepairInfo(map);
		model.put("failRepairVO", detail);
		return "sl/facility/failRepair/failRepairDetail";
	}
	
	@RequestMapping("/sl/facility/failRepair/deleteFailRepair.do")
	public String deleteFailRepair(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		failRepairService.deleteFailRepair(map);
		redirectAttributes.addFlashAttribute("msg", "삭제 되었습니다.");
		return "redirect:/sl/facility/failRepair/failRepairList.do";
	}
}
