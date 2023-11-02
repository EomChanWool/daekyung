package apc.sl.collectInfo.waterPressure.web;

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

import apc.sl.collectInfo.waterPressure.service.WaterPressureService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class WaterPressureController {
	@Autowired
	private WaterPressureService waterPressureService;
	
	@RequestMapping("/sl/collectInfo/waterPressure/waterPressureList.do")
	public String waterPressureList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = waterPressureService.selectWaterPressureListToCnt(searchVO);
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
		List<?> waterPressureList = waterPressureService.selectWaterPressureList(searchVO);
		model.put("waterPressureList", waterPressureList);
		model.put("paginationInfo", paginationInfo);
		return "sl/collectInfo/waterPressure/waterPressureList";
	}
	
	@RequestMapping("/sl/collectInfo/waterPressure/registWaterPressure.do")
	public String registCollect(ModelMap model) {
		
		return "sl/collectInfo/waterPressure/waterPressureRegist";
	}
	
	
	@RequestMapping("/sl/collectInfo/waterPressure/registWaterPressureOk.do")
	public String registWaterPressureOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		//이미 존재여부
		int exists = waterPressureService.selectAlreadyRegistDeIdx(map);
		if(exists != 0) {
			redirectAttributes.addFlashAttribute("msg", "이미 등록된  코드명입니다.");
			return "redirect:/sl/collectInfo/waterPressure/registWaterPressure.do";
		}
		
		map.put("userId", session.getAttribute("user_id"));
		waterPressureService.registWaterPressure(map);
		
		
		redirectAttributes.addFlashAttribute("msg", "등록 되었습니다.");
		return "redirect:/sl/collectInfo/waterPressure/waterPressureList.do";
	}
	
	@RequestMapping("/sl/collectInfo/waterPressure/modifyWaterPressure.do")
	public String modifyWaterPressure(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = waterPressureService.selectCollectInfo(map);
		model.put("waterPressureVO", detail);
		
		return "sl/collectInfo/waterPressure/waterPressureModify";
	}
	
	@RequestMapping("/sl/collectInfo/waterPressure/modifyWaterPressureOk.do")
	public String modifyWaterPressureOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		
		waterPressureService.modifyWaterPressure(map);
		
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		return "redirect:/sl/collectInfo/waterPressure/waterPressureList.do";
	}
	

	
	@RequestMapping("/sl/collectInfo/waterPressure/deleteWaterPressure.do")
	public String deleteWaterPressure(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		waterPressureService.deleteCollect(map);
		
		redirectAttributes.addFlashAttribute("msg","삭제 되었습니다.");
		return "redirect:/sl/collectInfo/waterPressure/waterPressureList.do";
	}
}
