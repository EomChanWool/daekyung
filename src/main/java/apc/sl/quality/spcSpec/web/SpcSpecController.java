package apc.sl.quality.spcSpec.web;

import java.util.ArrayList;
import java.util.HashMap;
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

import apc.sl.quality.spcSpec.service.SpcSpecService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class SpcSpecController {
	@Autowired
	private SpcSpecService spcSpecService;
	
	@RequestMapping("/sl/quality/spcSpec/spcSpecList.do")
	public String spcSpecList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = spcSpecService.selectSpcSpecListToCnt(searchVO);
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
		List<?> spcSpecList = spcSpecService.selectSpcSpecList(searchVO);
		model.put("spcSpecList", spcSpecList);
		model.put("paginationInfo", paginationInfo);
		
		return "sl/quality/spcSpec/spcSpecList";
	}
	
	@RequestMapping("/sl/quality/spcSpec/registSpcSpec.do")
	public String registSpcSpec(ModelMap model) {
		List<?> workOrderList = spcSpecService.selectWorkOrderList();
		model.put("workOrderList", workOrderList);
		List<?> qualityList = spcSpecService.selectMaterialList();
		model.put("qualityList", qualityList);
		return "sl/quality/spcSpec/spcSpecRegist";
	}
	
	@RequestMapping(value="/sl/quality/spcSpec/spcSpecInMaterialInfoAjax.do", method=RequestMethod.POST)
	public ModelAndView spcSpecInMaterialInfoAjax(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> list = spcSpecService.selectInMaterialsInfo(map);
		List<Map<String, Object>> qualitysList = new ArrayList<>();
		for(int i=1;i<=15;i++) {
			Map<String, Object> temp = new HashMap<>();
			String itemCd = "itemCd"+i;
			String itemName = "itemName"+i;
			String cnt = "cnt"+i;
			if(list.get(itemCd) == null) {
				break;
			}
			temp.put("itemCd", list.get(itemCd));
			temp.put("itemName", list.get(itemName));
			temp.put("cnt", list.get(cnt));
			qualitysList.add(temp);
		}
		mav.setViewName("jsonView");
		mav.addObject("mts_info", qualitysList);
		return mav;
	}
	
	@RequestMapping(value="/sl/quality/spcSpec/spcSpecMaterialInfoAjax.do", method=RequestMethod.POST)
	public ModelAndView spcSpecMaterialInfoAjax(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		List<?> list = spcSpecService.selectItemInfo(map);
		mav.setViewName("jsonView");
		mav.addObject("mt_info", list);
		return mav;
	}
	
	@RequestMapping("/sl/quality/spcSpec/registSpcSpecOk.do")
	public String registSpcSpecOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		for(int i=1;i<=15;i++) {
			Map<String, Object> temp = new HashMap<>();
			String itemCd = "itemCd"+i;
			String itemName = "itemName"+i;
			String cnt = "cnt"+i;
			if(map.get(itemCd) == null || map.get(cnt) == null) {
				break;
			}
			temp.put("itemCd", map.get(itemCd));
			temp.put("cnt", map.get(cnt));
			//재고확인
			if(!map.get(itemCd).equals("")) {
				int stockOk = spcSpecService.selectMaterialStock(temp);
				if(stockOk == 0) {
					redirectAttributes.addFlashAttribute("msg", map.get(itemName)+"의 재고가 부족합니다.");
					return "redirect:/sl/quality/spcSpec/registSpcSpec.do";
				}
			}
		}
		
		//작업지시번호 체크
		int exists = spcSpecService.selectExistsInsertInfo(map);
		if(exists != 0) {
			redirectAttributes.addFlashAttribute("msg", "이미 등록된 내역입니다.");
			redirectAttributes.addFlashAttribute("spcSpecVO",map);
			return "redirect:/sl/quality/spcSpec/registSpcSpec.do";
		}
		
		//sm_quality 재고 갱신
//		for(int i=1;i<=15;i++) {
//			Map<String, Object> temp = new HashMap<>();
//			String itemCd = "itemCd"+i;
//			String cnt = "cnt"+i;
//			if(map.get(itemCd) == null || map.get(cnt) == null) {
//				break;
//			}
//			temp.put("itemCd", map.get(itemCd));
//			temp.put("cnt", "-"+map.get(cnt));
//			spcSpecService.updateMaterialStock(temp);
//		}
		
		map.put("userId", session.getAttribute("user_id"));
		spcSpecService.registSpcSpec(map);
		
		redirectAttributes.addFlashAttribute("msg", "등록 되었습니다.");
		return "redirect:/sl/quality/spcSpec/spcSpecList.do";
	}
	
	@RequestMapping("/sl/quality/spcSpec/modifySpcSpec.do")
	public String modifySpcSpec(@RequestParam Map<String, Object> map, ModelMap model) {
		List<?> qualityList = spcSpecService.selectMaterialList();
		model.put("qualityList", qualityList);

		if(!map.isEmpty()) {
			Map<String, Object> detail = spcSpecService.selectSpcSpecInfo(map);
			model.put("spcSpecVO", detail);
		}
		
		return "sl/quality/spcSpec/spcSpecModify";
	}
	
	@RequestMapping("/sl/quality/spcSpec/modifySpcSpecOk.do")
	public String modifySpcSpecOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		for(int i=1;i<=15;i++) {
			Map<String, Object> temp = new HashMap<>();
			String itCd = "itemCd"+i;
			String itNm = "itemName"+i;
			String cnt = "cnt"+i;
			
			if(map.get(itCd) == null || map.get(cnt) == null || map.get(itCd).equals("") || map.get(cnt).equals("")) {
				break;
			}
			
			temp.put("itemCd", map.get(itCd));
			temp.put("cnt", map.get(cnt));
			//재고확인
			int stockOk = spcSpecService.selectMaterialStock(temp);
			if(stockOk == 0) {
				redirectAttributes.addFlashAttribute("msg", map.get(itNm)+"의 재고가 부족합니다.");
				return "redirect:/sl/quality/spcSpec/spcSpecList.do";
			}
		}
		
//		for(int i=1;i<=15;i++) {
//			Map<String, Object> temp = new HashMap<>();
//			temp.put("itemCd", "");
//			temp.put("cnt", "");
//			
//			String itCd = "itemCd"+i;
//			String curItCd = "curItemCd"+i;
//			String cnt = "cnt"+i;
//			String curCnt = "curCnt"+i;
//			
//			if(map.get(itCd) == null || map.get(cnt) == null) {
//				break;
//			}
//			
//			if(map.get(curItCd) != null) {
//				temp.replace("itemCd", map.get(curItCd));
//				temp.replace("cnt", map.get(curCnt));
//				spcSpecService.updateMaterialStock(temp);
//			}
//			temp.replace("itemCd", map.get(itCd));
//			temp.replace("cnt", "-"+map.get(cnt));
//			spcSpecService.updateMaterialStock(temp);
//		}
		
		spcSpecService.updateInMaterial(map);
		
		map.put("userId", session.getAttribute("user_id"));
		spcSpecService.modifySpcSpec(map);
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		return "redirect:/sl/quality/spcSpec/spcSpecList.do";
	}
	
	@RequestMapping("/sl/quality/spcSpec/detailSpcSpec.do")
	public String detailSpcSpec(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = spcSpecService.selectSpcSpecInfo(map);
		model.put("spcSpecVO", detail);
		return "sl/quality/spcSpec/spcSpecDetail";
	}
	
	@RequestMapping("/sl/quality/spcSpec/deleteSpcSpec.do")
	public String deleteSpcSpec(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		spcSpecService.deleteSpcSpec(map);
		
		//sm_marterial 재고 개수 갱신
		map.put("cnt", map.get("inCnt"));
		spcSpecService.updateMaterialStock(map);
		redirectAttributes.addFlashAttribute("msg","삭제 되었습니다.");
		return "redirect:/sl/quality/spcSpec/spcSpecList.do";
	}
}
