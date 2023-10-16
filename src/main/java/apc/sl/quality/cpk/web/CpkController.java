package apc.sl.quality.cpk.web;

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

import apc.sl.quality.cpk.service.CpkService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class CpkController {
	@Autowired
	private CpkService cpkService;
	
	@RequestMapping("/sl/quality/cpk/cpkList.do")
	public String cpkList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = cpkService.selectCpkListToCnt(searchVO);
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
		List<?> cpkList = cpkService.selectCpkList(searchVO);
		model.put("cpkList", cpkList);
		model.put("paginationInfo", paginationInfo);
		return "sl/quality/cpk/cpkList";
	}
	
	@RequestMapping("/sl/quality/cpk/registCpk.do")
	public String registCpk(ModelMap model) {
		String type = "자재";
		List<?> qualityList = cpkService.selectItemList(type);
		model.put("qualityList", qualityList);
		type="제품";
		List<?> productList = cpkService.selectItemList(type);
		model.put("productList", productList);
		return "sl/quality/cpk/cpkRegist";
	}
	
	@RequestMapping(value="/sl/quality/cpk/itemCntInfoAjax.do", method=RequestMethod.POST)
	public ModelAndView itemCntInfoAjax(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		List<?> list = cpkService.selectItemCntInfo(map);
		mav.setViewName("jsonView");
		mav.addObject("item_info", list);
		return mav;
	}
	
	@RequestMapping("/sl/quality/cpk/registCpkOk.do")
	public String registCpkOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		if(map.get("itemType").equals("자재")) {
			map.put("itemCd", map.get("mtItemCd"));
		}else {
			map.put("itemCd", map.get("pdItemCd"));
		}
		
		int exists = cpkService.selectExistsItemCode(map);
		if(exists == 0) {
			redirectAttributes.addFlashAttribute("msg","존재하지 않는 물품입니다.");
			return "redirect:/sl/quality/cpk/registCpk.do";
		}
		map.put("userId", session.getAttribute("user_id"));
		cpkService.registCpk(map);
		
		//sm_item 재고 Stock 갱신
		cpkService.updateItemCnt(map);
		
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/quality/cpk/cpkList.do";
	}
	
	@RequestMapping("/sl/quality/cpk/modifyCpk.do")
	public String modifyCpk(@RequestParam Map<String, Object> map, ModelMap model) {
		String type = "자재";
		List<?> qualityList = cpkService.selectItemList(type);
		model.put("qualityList", qualityList);
		type="제품";
		List<?> productList = cpkService.selectItemList(type);
		model.put("productList", productList);
		
		if(!map.isEmpty()) {
			Map<String, Object> detail = cpkService.selectCpkInfo(map);
			model.put("adjustVO", detail);
		}
		return "sl/quality/cpk/cpkModify";
	}
	
	@RequestMapping("/sl/quality/cpk/modifyCpkOk.do")
	public String modifyCpkOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		if(map.get("itemType").equals("자재")) {
			map.put("itemCd", map.get("mtItemCd"));
		}else {
			map.put("itemCd", map.get("pdItemCd"));
		}
		
		int exists = cpkService.selectExistsItemCode(map);
		if(exists == 0) {
			redirectAttributes.addFlashAttribute("msg","존재하지 않는 물품입니다.");
			redirectAttributes.addFlashAttribute("adjustVO", map);
			return "redirect:/sl/quality/cpk/modifyCpk.do";
		}
		map.put("userId", session.getAttribute("user_id"));
		cpkService.modifyCpk(map);
		
		//수정하려는 항목이 해당 물품 중에서 가장 최근에 등록된 항목이면 sm_item항목도 수정
		int recentIdx = cpkService.selectChkRecent(map);
		if(Integer.parseInt(map.get("adIdx")+"") == recentIdx) {
			cpkService.updateItemCnt(map);
		}
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		return "redirect:/sl/quality/cpk/cpkList.do";
	}
	
	@RequestMapping("/sl/quality/cpk/deleteCpk.do")
	public String deleteCpk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		cpkService.deleteCpk(map);
		redirectAttributes.addFlashAttribute("msg","삭제 되었습니다.");
		return "redirect:/sl/quality/cpk/cpkList.do";
	}
}
