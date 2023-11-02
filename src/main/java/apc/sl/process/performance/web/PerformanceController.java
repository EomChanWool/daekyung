package apc.sl.process.performance.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import apc.sl.process.performance.service.PerformanceService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class PerformanceController {
	@Autowired
	private PerformanceService performanceService;
	
	private String filePath = "C:\\jnb\\report\\";
	
	@RequestMapping("/sl/process/checkPr/performanceList.do")
	public String performanceList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session){
		int totCnt = performanceService.selectPerformanceListToCnt(searchVO);
		System.out.println("확인");
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
		List<?> performanceList = performanceService.selectPerformanceList(searchVO);
		model.put("performanceList", performanceList);
		model.put("paginationInfo", paginationInfo);
		return "sl/process/performance/performanceList";
	}
	
	@RequestMapping("/sl/process/checkPr/registPerformance.do")
	public String registPerformance(ModelMap model) {
		
		
		return "sl/process/performance/performanceRegist";
	}
	
	@RequestMapping(value="/sl/process/checkPr/performanceInfoAjax.do", method=RequestMethod.POST)
	public ModelAndView estimateInfoAjax(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		List<?> list = performanceService.performanceInfo(map);
		mav.setViewName("jsonView");
		mav.addObject("perforList", list);
		return mav;
	}
	
	@RequestMapping("/sl/process/checkPr/registPerformanceOk.do")
	public String registPerformanceOk(@ModelAttribute("searchVO") SearchVO searchVO, @RequestParam Map<String, Object> map, 
																RedirectAttributes redirectAttributes, HttpSession session){
		int checkOrid = performanceService.checkOrid(map);
		if(checkOrid == 0) {
			redirectAttributes.addFlashAttribute("msg","없거나 검사하지 않은 제품 입니다.");
			return "redirect:/sl/process/checkPr/registPerformance.do";
		}
		int checkExist = performanceService.checkExists(map);
		
		if(checkExist !=0) {
			redirectAttributes.addFlashAttribute("msg","이미 등록한 제품 입니다.");
			return "redirect:/sl/process/checkPr/registPerformance.do";
		}
		map.put("userId", session.getAttribute("user_id"));
		performanceService.registcheckPr(map);
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/process/checkPr/performanceList.do";
	}
	
	@RequestMapping("/sl/process/checkPr/modifyPerformance.do")
	public String modifyPerformance(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = performanceService.selectCheckPrInfo(map);
		model.put("detail", detail);
		return "sl/process/performance/performanceModify";
	}
	
	@RequestMapping("/sl/process/checkPr/modifyPerformanceOk.do")
	public String modifyPerformanceOk(@ModelAttribute("searchVO") SearchVO searchVO, @RequestParam Map<String, Object> map, 
															RedirectAttributes redirectAttributes, HttpSession session){
		map.put("userId", session.getAttribute("user_id"));
		performanceService.modifyCheckPr(map);
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		return "redirect:/sl/process/checkPr/performanceList.do";
	}
	
	@RequestMapping("/sl/process/checkPr/detailPerformance.do")
	public String detailPerformance(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = performanceService.selectCheckPrInfo(map);
		model.put("detail", detail);
		List<?> insList = performanceService.inspectList(map);
		model.put("insList", insList);
		System.out.println("리스트 : " + insList);
		
		return "sl/process/performance/performanceDetail";
	}
	
	
	
	@RequestMapping("/sl/process/checkPr/deletePerformance.do")
	public String deletePerformance(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		performanceService.deletePerformance(map);
		redirectAttributes.addFlashAttribute("msg", "삭제 되었습니다.");
		return "redirect:/sl/process/checkPr/performanceList.do";
	}
}
