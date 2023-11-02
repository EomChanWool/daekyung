package apc.sl.quality.spcItem.web;

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

import apc.sl.quality.spcItem.service.SpcItemService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class SpcItemController {
	@Autowired
	private SpcItemService spcItemService;
	
	@RequestMapping("/sl/quality/spcItem/spcItemList.do")
	public String spcItemList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = spcItemService.selectSpcItemListToCnt(searchVO);
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
		List<?> spcItemList = spcItemService.selectSpcItemList(searchVO);
		model.put("spcItemList", spcItemList);
		model.put("paginationInfo", paginationInfo);
		return "sl/quality/spcItem/spcItemList";
	}
	
	@RequestMapping("/sl/quality/spcItem/registSpcItem.do")
	public String registSpcItem(ModelMap model) {
		List<?> accountList = spcItemService.selectAccountList();
		model.put("accountList", accountList);
		List<?> qualityList = spcItemService.selectMaterialList();
		model.put("qualityList", qualityList);
		return "sl/quality/spcItem/spcItemRegist";
	}
	
	@RequestMapping(value="/sl/quality/spcItem/itemInfoAjax.do", method=RequestMethod.POST)
	public ModelAndView itemInfoAjax(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		List<?> list = spcItemService.selectItemInfo(map);
		mav.setViewName("jsonView");
		mav.addObject("item_info", list);
		return mav;
	}
	
	@RequestMapping("/sl/quality/spcItem/registSpcItemOk.do")
	public String registSpcItemOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		spcItemService.registSpcItem(map);
		
		//sm_quality에 재고 갱신
		map.put("cnt", map.get("stCnt"));
		spcItemService.updateMaterialCnt(map);
		
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/quality/spcItem/spcItemList.do";
	}
	
	@RequestMapping("/sl/quality/spcItem/modifySpcItem.do")
	public String modifySpcItem(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = spcItemService.selectSpcItemInfo(map);
		model.put("spcItemVO", detail);
		List<?> accountList = spcItemService.selectAccountList();
		model.put("accountList", accountList);
		List<?> qualityList = spcItemService.selectMaterialList();
		model.put("qualityList", qualityList);
		return "sl/quality/spcItem/spcItemModify";
	}
	
	@RequestMapping("/sl/quality/spcItem/modifySpcItemOk.do")
	public String modifySpcItemOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		spcItemService.modifySpcItem(map);
		
		String itemCd = map.get("itemCd")+"";
		//sm_item에 재고 갱신
		//자재가 바뀌었을경우
		map.put("cnt", "");
		if(!map.get("curItemCd").equals(map.get("itemCd"))) {
			//이전 자재 재고 복구
			map.replace("cnt", "-"+map.get("curStCnt"));
			map.replace("itemCd", map.get("curItemCd"));
			spcItemService.updateMaterialCnt(map);
			//변경된 자재 재고 더해줌
			map.replace("cnt", map.get("stCnt"));
			map.replace("itemCd", itemCd);
			spcItemService.updateMaterialCnt(map);
		}else {
			//자재가 안바뀌었을 경우
			int cnt = Integer.parseInt(map.get("stCnt")+"") - Integer.parseInt(map.get("curStCnt")+"");
			map.replace("cnt", cnt);
			spcItemService.updateMaterialCnt(map);
		}
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		return "redirect:/sl/quality/spcItem/spcItemList.do";
	}
	
	@RequestMapping("/sl/quality/spcItem/detailSpcItem.do")
	public String detailSpcItem(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = spcItemService.selectSpcItemInfo(map);
		model.put("spcItemVO", detail);
		return "sl/quality/spcItem/spcItemDetail";
	}
	
	@RequestMapping("/sl/quality/spcItem/deleteSpcItem.do")
	public String deleteSpcItem(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		spcItemService.deleteSpcItem(map);
		
		//sm_item에서 재고 제외
		int cnt = Integer.parseInt("-"+map.get("stCnt"));
		map.put("cnt", cnt);
		spcItemService.updateMaterialCnt(map);
		redirectAttributes.addFlashAttribute("msg","삭제 되었습니다.");
		return "redirect:/sl/quality/spcItem/spcItemList.do";
	}
}
