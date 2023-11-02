package apc.sl.facility.facMaster.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import apc.sl.facility.facMaster.service.FacMasterService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class FacMasterController {
	@Autowired
	private FacMasterService facMasterService;
	
	@RequestMapping("/sl/facility/facMaster/facMasterList.do")
	public String facMasterList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = facMasterService.selectFacMasterListToCnt(searchVO);
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
		List<?> facMasterList = facMasterService.selectFacMasterList(searchVO);
		model.put("facMasterList", facMasterList);
		model.put("paginationInfo", paginationInfo);
		return "sl/facility/facMaster/facMasterList";
	}
	
	@RequestMapping("/sl/facility/facMaster/registFacMaster.do")
	public String registFacMaster() {
		return "sl/facility/facMaster/facMasterRegist";
	}
	
	@RequestMapping(value="/sl/facility/facMaster/woFacMasterInfoAjax.do", method=RequestMethod.POST)
	public ModelAndView woFacMasterInfoAjax(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> mtStd = facMasterService.selectFacMasterStd(map);
		mav.setViewName("jsonView");
		mav.addObject("mt_info", mtStd);
		return mav;
	}
	
	@RequestMapping("/sl/facility/facMaster/registFacMasterOk.do")
	public String registFacMasterOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		facMasterService.registFacMaster(map);
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/facility/facMaster/facMasterList.do";
	}
	
	@RequestMapping("/sl/facility/facMaster/modifyFacMaster.do")
	public String modifyFacMaster(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = facMasterService.selectFacMasterInfo(map);
		model.put("facMasterVO", detail);
		return "sl/facility/facMaster/facMasterModify";
	}
	
	@RequestMapping("/sl/facility/facMaster/modifyFacMasterOk.do")
	public String modifyFacMasterOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		facMasterService.modifyFacMaster(map);
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		return "redirect:/sl/facility/facMaster/facMasterList.do";
	}
	
	@RequestMapping("/sl/facility/facMaster/detailFacMaster.do")
	public String deatail(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = facMasterService.selectFacMasterInfo(map);
		if (detail.get("eqIsuse").equals(0)) {
			detail.put("eqIsuse", "사용");
		} else if (detail.get("eqIsuse").equals(1)) {
			detail.put("eqIsuse", "미사용");
		}
		model.put("facMasterVO", detail);
		return "sl/facility/facMaster/facMasterDetail";
	}
	
	@RequestMapping("/sl/facility/facMaster/deleteFacMaster.do")
	public String deleteFacMaster(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		facMasterService.deleteFacMaster(map);
		redirectAttributes.addFlashAttribute("msg", "삭제 되었습니다.");
		return "redirect:/sl/facility/facMaster/facMasterList.do";
	}
	
}
