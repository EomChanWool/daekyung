package apc.sl.basicInfo.prodInfo.web;

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

import apc.sl.basicInfo.prodInfo.service.ProdInfoService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ProdInfoController {
	@Autowired
	private ProdInfoService prodInfoService;
	
	@RequestMapping("/sl/basicInfo/prodInfo/prodInfoList.do")
	public String prodInfoList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = prodInfoService.selectProdInfoListToCnt(searchVO);
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
		
		List<?> prodInfoList = prodInfoService.selectProdInfoList(searchVO);
		model.put("prodInfoList", prodInfoList);
		model.put("paginationInfo", paginationInfo);
		return "sl/basicInfo/prodInfo/prodInfoList";
	}
	
	@RequestMapping("/sl/basicInfo/prodInfo/detailProdInfo.do")
	public String detailProdInfo(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = prodInfoService.selectProdInfoInfo(map);
		model.put("prodInfoVO", detail);
		return "sl/basicInfo/prodInfo/prodInfoDetail";
	}

	@RequestMapping("/sl/basicInfo/prodInfo/registProdInfo.do")
	public String registProdInfo() {
		return "sl/basicInfo/prodInfo/prodInfoRegist";
	}
	
	@RequestMapping("/sl/basicInfo/prodInfo/registProdInfoOk.do")
	public String registProdInfoOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
//		map.put("userId", session.getAttribute("user_id"));
		System.out.println(map);
		prodInfoService.registProdInfo(map);
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/basicInfo/prodInfo/prodInfoList.do";
	}
	
	@RequestMapping("/sl/basicInfo/prodInfo/modifyProdInfo.do")
	public String modifyProdInfo(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = prodInfoService.selectProdInfoInfo(map);
		model.put("prodInfoVO", detail);
		return "sl/basicInfo/prodInfo/prodInfoModify";
	}
	
	@RequestMapping("/sl/basicInfo/prodInfo/modifyProdInfoOk.do")
	public String modifyProdInfoOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		System.out.println("map 확인 : " + map);
		prodInfoService.modifyProdInfo(map);
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		return "redirect:/sl/basicInfo/prodInfo/prodInfoList.do";
	}
	
	@RequestMapping("/sl/basicInfo/prodInfo/deleteProdInfo.do")
	public String deleteProdInfo(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		prodInfoService.deleteProdInfo(map);
		redirectAttributes.addFlashAttribute("msg","삭제 되었습니다.");
		return "redirect:/sl/basicInfo/prodInfo/prodInfoList.do";
	}
}
