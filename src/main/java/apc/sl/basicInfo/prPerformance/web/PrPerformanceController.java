package apc.sl.basicInfo.prPerformance.web;

import java.io.BufferedWriter;
import java.io.FileWriter;
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

import apc.sl.basicInfo.prPerformance.service.PrPerformanceService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class PrPerformanceController {

	@Autowired
	PrPerformanceService prPerformanceService;
	
	
	@RequestMapping("/sl/basicInfo/prPerformance/prPerformanceList.do")
	public String prPerformanceList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = prPerformanceService.selectPrPerformanceToCnt(searchVO);
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
		List<?> prPerList = prPerformanceService.selectPrPerformanceList(searchVO);
		model.put("prPerList",prPerList);
		model.put("paginationInfo", paginationInfo);
		
		return "sl/basicInfo/prPerformance/prPerformanceList";
	}
	
	@RequestMapping("/sl/basicInfo/prPerformance/registPrPerformance.do")
	public String registPrPerformance() {
		
		return "sl/basicInfo/prPerformance/prPerformanceRegist";
	}
	
	@RequestMapping("/sl/basicInfo/prPerformance/registPrPerformanceOk.do")
	public String registPrPerformanceOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		
		prPerformanceService.registPrPerformance(map);
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		CreateFile(map);
		
		return "redirect:/sl/basicInfo/prPerformance/prPerformanceList.do";
	}
	
	@RequestMapping("/sl/basicInfo/prPerformance/modifyPrPerformance.do")
	public String modifyPrPerformance(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = prPerformanceService.selectPrPerDetail(map);
		model.put("prPerVo", detail);
		
		return "sl/basicInfo/prPerformance/prPerformanceModify";
	}
	
	@RequestMapping("/sl/basicInfo/prPerformance/modifyPrPerformanceOk.do")
	public String modifyPrPerfomanceOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		prPerformanceService.modifyPrPerformance(map);
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		ModifyFile(map);
		return "redirect:/sl/basicInfo/prPerformance/prPerformanceList.do";
	}
	
	@RequestMapping("/sl/basicInfo/prPerformance/detailPrPerformance.do")
	public String detailPrPerformance(@RequestParam Map<String, Object> map, ModelMap model) {
		
		Map<String, Object> detail = prPerformanceService.selectPrPerDetail(map);
		String a = detail.get("relUnit")+"";
		String relUnit = a.substring(0, a.length()-2);
		String b = detail.get("relPrice")+"";
		String relPrice = b.substring(0, b.length()-2);
		String c = detail.get("relTax")+"";
		String relTax = c.substring(0, c.length()-2);
		String d = detail.get("relTotalPrice")+"";
		String relTotalPrice = d.substring(0, d.length()-2);
		
		detail.replace("relUnit", relUnit);
		detail.replace("relPrice", relPrice);
		detail.replace("relTax", relTax);
		detail.replace("relTotalPrice", relTotalPrice);
		
		if(detail.get("relNego").equals("")) {
			detail.replace("relNego", 0);
		}else {
			String e = detail.get("relNego")+"";
			String relNego = e.substring(0, e.length()-2);
			detail.replace("relNego", relNego);
		}
		
		model.put("prPerVo", detail);
		
		return "sl/basicInfo/prPerformance/prPerformanceDetail";
	}
	
	@RequestMapping("/sl/basicInfo/prPerformance/deletePrPerformance.do")
	public String deletePrPerformance(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes) {
		
		prPerformanceService.deletePrPerfomance(map);
		redirectAttributes.addFlashAttribute("msg", "삭제 되었습니다.");
		
		return "redirect:/sl/basicInfo/prPerformance/prPerformanceList.do";
	}
	
	
	private void CreateFile(Map<String, Object> map) {
		String fileName = "C:\\test\\RegistReleaseTest.txt";
		
		
		
		try {
			BufferedWriter fw = new BufferedWriter(new FileWriter(fileName,true));
			
			fw.write(map.toString()+",");
			fw.flush();
			fw.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
		
	}
	
	private void ModifyFile(Map<String, Object> map) {
		String fileName = "C:\\test\\ModifyReleaseTest.txt";
		
		
		
		try {
			BufferedWriter fw = new BufferedWriter(new FileWriter(fileName,true));
			
			fw.write(map.toString()+",");
			fw.flush();
			fw.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
		
	}
}
