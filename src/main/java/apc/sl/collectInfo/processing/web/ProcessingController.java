package apc.sl.collectInfo.processing.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
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

import apc.sl.collectInfo.processing.service.ProcessingService;
import apc.sl.process.manufacture.service.ManufactureService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ProcessingController {
	@Autowired
	private ProcessingService processingService;
	
	@Autowired
	private ManufactureService manufactureService;
	
	@RequestMapping("/sl/collectInfo/processing/processingList.do")
	public String processingList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = processingService.selectProcessingListToCnt(searchVO);
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
		List<?> processingList = processingService.selectProcessingList(searchVO);
		
		model.put("processingList", processingList);
		
		model.put("paginationInfo", paginationInfo);
		return "sl/collectInfo/processing/processingList";
	}
	
	@RequestMapping("/sl/collectInfo/processing/registProcessing.do")
	public String registProcessing(ModelMap model) {
		List<?> prodList = processingService.prodList();
		model.put("prodList", prodList);
		return "sl/collectInfo/processing/processingRegist";
	}
	
	
	@RequestMapping(value="/sl/collectInfo/processing/processingAjax.do", method=RequestMethod.POST)
	public ModelAndView shipmentAjax(@RequestParam Map<String, Object> map) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> list = processingService.processingAjax(map);
		
		String stDate = list.get("mflStDate")+"";
		String stDate2 = stDate.substring(0,16);
	    list.replace("mflStDate", stDate2);
		mav.setViewName("jsonView");
		mav.addObject("mfProc", list);
		return mav;
	}
	
	
	@RequestMapping("/sl/collectInfo/processing/registProcessingOk.do")
	public String registProcessingOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttribues, HttpSession session) {
		int checkStop = 0;
		int exist = processingService.existPro(map);
		
		if(exist == 0) {
			redirectAttribues.addFlashAttribute("msg", "작업중인 수주번호가 아닙니다.");
			return "redirect:/sl/collectInfo/processing/registProcessing.do";
		}
		
		Map<String, Object> checkMap = processingService.checkStop(map);
		if(checkMap != null) {
			checkStop = Integer.parseInt(checkMap.get("mfsState")+"");
		}
		
		
		Map<String, Object> proState = processingService.proState(map);
		
		int proStateVal = Integer.parseInt(proState.get("mpPrState")+"");
		
		if(proStateVal == 3) {
			manufactureService.updateProcess3(map);
			redirectAttribues.addFlashAttribute("msg", "복구 되었습니다.");
			return "redirect:/sl/collectInfo/processing/processingList.do";
		}
		
		
		if(checkStop == 1) {
			manufactureService.updateMfStopLog2(checkMap);
		}
		
		
		
		manufactureService.updateProcess3(map);
		manufactureService.updateLogEdtime(map);
		
		redirectAttribues.addFlashAttribute("msg", "등록 되었습니다.");
		return "redirect:/sl/collectInfo/processing/processingList.do";
	}
	
	@RequestMapping("/sl/collectInfo/processing/modifyProcessing.do")
	public String modifyProcessing(@RequestParam Map<String, Object> map, ModelMap model) {
		
		Map<String,Object> info = processingService.processInfo(map);
		
		
		model.put("info" , info);
		
		
		return "sl/collectInfo/processing/processingModify";
	}
	
	@RequestMapping("/sl/collectInfo/processing/modifyProcessingOk.do")
	public String modifyProcessingOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		System.out.println("확인 : " +map);
		String time1 = map.get("mflStDate")+"";
		String[] time11 = time1.split("T");
		
		String time111 = time11[0]+" "+time11[1]+":00";
		
		
		String time2 = map.get("mflEdDate")+"";
		
		String[] time22 = time2.split("T");
		
		String time222 = time22[0] + " " + time22[1]+ ":00";
		
		map.replace("mflStDate",time111);
		map.replace("mflEdDate", time222);
		
		
		processingService.updatePro(map);
		
		processingService.updateWorktime(map);
		
		redirectAttributes.addFlashAttribute("msg", "수정 되었습니다.");
		return "redirect:/sl/collectInfo/processing/processingList.do";
	}
	

	@RequestMapping("/sl/collectInfo/processing/deleteProcessing.do")
	public String deleteProcessing(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		processingService.deletePro(map);
		
		redirectAttributes.addFlashAttribute("msg", "삭제 되었습니다.");
		return "redirect:/sl/collectInfo/processing/processingList.do";
	}
}
