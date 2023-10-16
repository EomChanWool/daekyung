package apc.sl.collectInfo.cutting.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import apc.sl.collectInfo.cutting.service.CuttingService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class CuttingController {
	@Autowired
	private CuttingService cuttingService;
	
	@RequestMapping("/sl/collectInfo/cutting/cuttingList.do")
	public String cuttingList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = cuttingService.selectCuttingListToCnt(searchVO);
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
		List<?> cuttingList = cuttingService.selectCuttingList(searchVO);
		model.put("cuttingList", cuttingList);
		model.put("paginationInfo", paginationInfo);
		return "sl/collectInfo/cutting/cuttingList";
	}
	
	@RequestMapping("/sl/collectInfo/cutting/registCutting.do")
	public String registCutting(ModelMap model) {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date now = new Date();
		String edDate = format.format(now);
		
		model.put("curTime", edDate);
	
		List<?> eqList = cuttingService.selectEqList();
		model.put("eqList", eqList);
		
		return "sl/collectInfo/cutting/cuttingRegist";
	}
	
	
	
	@RequestMapping("/sl/collectInfo/cutting/registCuttingOk.do")
	public String registCuttingOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		SimpleDateFormat format = new SimpleDateFormat("yyMMddHHmm");
		
		Date now = new Date();
		String edDate = format.format(now);
		map.put("csData09", edDate);
		int checkEq = cuttingService.checkEq(map);
		System.out.println("등록 맵 : " + map);
		if(checkEq == 0) {
			redirectAttributes.addFlashAttribute("msg","설비명을 확인해주세요.");
			redirectAttributes.addFlashAttribute("cuttingVO", map);
			return "redirect:/sl/collectInfo/cutting/registCutting.do";
		}
		
		cuttingService.registCutting(map);
		cuttingService.registCutting2(map);
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/collectInfo/cutting/cuttingList.do";
	}
	
	@RequestMapping("/sl/collectInfo/cutting/modifyCutting.do")
	public String modifyCutting(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String,Object> clDetail = cuttingService.selectCuttingInfo(map);
		model.put("cuttingVO", clDetail);
		
		
		
		
		return "sl/collectInfo/cutting/cuttingModify";
	}
	
	@RequestMapping("/sl/collectInfo/cutting/modifyCuttingOk.do")
	public String modifyCuttingOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		System.out.println("수정맵 : " + map);
	
		cuttingService.modifyCutting(map);
		cuttingService.modifyCutting2(map);
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		return "redirect:/sl/collectInfo/cutting/cuttingList.do";
	}
	
	@RequestMapping("/sl/collectInfo/cutting/deleteCutting.do")
	public String deleteCutting(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		cuttingService.deleteCutting(map);
		redirectAttributes.addFlashAttribute("msg","삭제 되었습니다.");
		return "redirect:/sl/collectInfo/cutting/cuttingList.do";
	}
}
