package apc.sl.basicInfo.goal.web;

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

import apc.sl.basicInfo.goal.service.GoalService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class GoalController {
	@Autowired
	private GoalService goalService;
	
	@RequestMapping("/sl/basicInfo/goal/goalList.do")
	public String goalList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = goalService.selectGoalToCnt(searchVO);
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
		
		List<?> goalList = goalService.selectGoalList(searchVO);
		model.put("goalList", goalList);
		model.put("paginationInfo", paginationInfo);
		
		return "sl/basicInfo/goal/goalList";
	}
	
	@RequestMapping("/sl/basicInfo/goal/registGoal.do")
	public String registGoal(ModelMap model) {
		return "sl/basicInfo/goal/goalRegist";
	}
	
	@RequestMapping("/sl/basicInfo/goal/registGoalOk.do")
	public String registGoalOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		
		int exists = goalService.selectGoalExists(map);
		
		if(exists == 1) {
			redirectAttributes.addFlashAttribute("msg","이미 존재하는 내역입니다.");
			return "redirect:/sl/basicInfo/goal/registGoal.do";
		}
		
		goalService.registGoal(map);
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/basicInfo/goal/goalList.do";
	}
	
	@RequestMapping("/sl/basicInfo/goal/modifyGoal.do")
	public String modifyGoal(@RequestParam Map<String, Object> map , ModelMap model) {
		
		Map<String, Object> goalInfo = goalService.selectGoalInfo(map);
		
		model.put("goalInfo", goalInfo);
		
		return "sl/basicInfo/goal/goalModify";
	}
	
	@RequestMapping("/sl/basicInfo/goal/modifyGoalOk.do")
	public String modifyGoalOk(@RequestParam Map<String,Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		map.put("userId", session.getAttribute("user_id"));
		
		goalService.modifyGoal(map);
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		return "redirect:/sl/basicInfo/goal/goalList.do";
	}
	
	@RequestMapping("/sl/basicInfo/goal/deleteGoal.do")
	public String deleteGoal(@RequestParam Map<String,Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		goalService.deleteGoal(map);
		redirectAttributes.addFlashAttribute("msg","삭제 되었습니다.");
		return "redirect:/sl/basicInfo/goal/goalList.do";
	}
	
	
}
