package apc.sl.basicInfo.prPerformance.web;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
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

import com.spire.ms.System.DateTime;

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
		
		String DateNabgi = (String) map.get("relNabgi");
		String DateReport = (String) map.get("relReport");
		String DateCompletion = (String) map.get("relCompletion");
		    
		String formattedDateNabgi = DateNabgi.replace("-", "");
		String formattedDateReport = DateReport.replace("-", "");
		String formattedDateCompletion = DateCompletion.replace("-", "");

		map.put("relNabgi", formattedDateNabgi);
		map.put("relReport", formattedDateReport);
		map.put("relCompletion", formattedDateCompletion);
		
		prPerformanceService.registPrPerformance(map);
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		CreateFile(map);
		
		return "redirect:/sl/basicInfo/prPerformance/prPerformanceList.do";
	}
	
	@RequestMapping("/sl/basicInfo/prPerformance/modifyPrPerformance.do")
	public String modifyPrPerformance(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = prPerformanceService.selectPrPerDetail(map);
		
	    String relReportStr = (String)map.get("relReport");
	 
	    
		model.put("prPerVo", detail);
		return "sl/basicInfo/prPerformance/prPerformanceModify";
	}
	
	@RequestMapping("/sl/basicInfo/prPerformance/modifyPrPerformanceOk.do")
	public String modifyPrPerfomanceOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		
		String DateNabgi = (String) map.get("relNabgi");
		String DateReport = (String) map.get("relReport");
		String DateCompletion = (String) map.get("relCompletion");
		    
		String formattedDateNabgi = DateNabgi.replace("-", "");
		String formattedDateReport = DateReport.replace("-", "");
		String formattedDateCompletion = DateCompletion.replace("-", "");

		map.put("relNabgi", formattedDateNabgi);
		map.put("relReport", formattedDateReport);
		map.put("relCompletion", formattedDateCompletion);
		
		
		prPerformanceService.modifyPrPerformance(map);
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		ModifyFile(map);
		return "redirect:/sl/basicInfo/prPerformance/prPerformanceList.do";
	}
	
	@RequestMapping("/sl/basicInfo/prPerformance/detailPrPerformance.do")
	public String detailPrPerformance(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = prPerformanceService.selectPrPerDetail(map);
		
		System.out.println(detail);
		String a = detail.get("relUnit")+"";
		String relUnit = a;
		if (!a.equals("")) {
//	        relUnit = a.substring(0, a.length() - 2);
	        detail.replace("relUnit", relUnit);
	    }
//		String b = detail.get("relPrice")+"";
//		String relPrice = "";
//		if (b != null) {
//		        relPrice = b.substring(0, b.length() - 2);
//		}
//		detail.replace("relPrice", relPrice);
		System.out.println(detail);
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
