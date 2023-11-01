package apc.sl.process.cut.web;

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

import apc.sl.facility.failReport.service.FailReportService;
import apc.sl.process.cut.service.CutService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class CutController {
	@Autowired
	private CutService cutService;
	@Autowired
	private FailReportService failReportService;
	
	@RequestMapping("/sl/process/cutProcess/cutList.do")
	public String cutList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
//		if(model.get("sear") != null) {
//			Map<String, Object> temp = (Map<String, Object>) model.get("sear");
//			searchVO.setSearchKeyword(temp.get("searchKeyword")+"");	
//		}
		int totCnt = cutService.selectCutListToCnt(searchVO);
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
		List<?> cutList = cutService.selectCutList(searchVO);
		List<?> cmList = cutService.selectCutManager();
		model.put("cutList", cutList);
		model.put("cmList", cmList);
		model.put("paginationInfo", paginationInfo);
		return "sl/process/cut/cutList";
	}
	@RequestMapping(value="/sl/process/cutProcess/goCut.do", method=RequestMethod.POST)
	public String goCut(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		if(!map.get("searchKeyword").equals("")) {
			redirectAttributes.addFlashAttribute("sear",map);
		}
		map.put("userId", session.getAttribute("user_id"));
		cutService.registCPLLog(map);
		cutService.updateOrState(map);
		return "redirect:/sl/process/cutProcess/cutList.do";
	}
	
	@RequestMapping(value="/sl/process/cutProcess/stopCut.do", method=RequestMethod.POST)
	public String stopCut(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		if(!map.get("searchKeyword").equals("")) {
			redirectAttributes.addFlashAttribute("sear",map);
		}
		map.put("userId", session.getAttribute("user_id"));
		
		cutService.registCStopLog(map);
		
		
		return "redirect:/sl/process/cutProcess/cutList.do";
	}
	
	@RequestMapping(value="/sl/process/cutProcess/reCut.do", method=RequestMethod.POST)
	public String reCut(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		if(!map.get("searchKeyword").equals("")) {
			redirectAttributes.addFlashAttribute("sear",map);
		}
		map.put("userId", session.getAttribute("user_id"));
		
		cutService.updateCSStopLog2(map);
		
		return "redirect:/sl/process/cutProcess/cutList.do";
	}
	
	@RequestMapping(value="/sl/process/cutProcess/goMfCut.do",method=RequestMethod.POST)
	public String goMfCut(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		if(!map.get("searchKeyword").equals("")) {
			redirectAttributes.addFlashAttribute("sear",map);
		}
		map.put("userId", session.getAttribute("user_id"));
		//작업중지일때 작업완료나 가공공정으로 이동불가
		int checkProd = cutService.selectCheckStop(map);
		if(checkProd != 0) {
			
			redirectAttributes.addFlashAttribute("msg", "공정을 재개하여 주십시오.");
			return "redirect:/sl/process/cutProcess/cutList.do";
		}
		redirectAttributes.addFlashAttribute("msg", "가공공정으로 이동하였습니다.");
		cutService.updateOrProcess3(map);
		cutService.updateLogEdtime(map);
		
		return "redirect:/sl/process/cutProcess/cutList.do";
	}
	
	@RequestMapping(value="/sl/process/cutProcess/finishCut.do",method=RequestMethod.POST)
	public String finishCut(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		if(!map.get("searchKeyword").equals("")) {
			redirectAttributes.addFlashAttribute("sear",map);
		}
		map.put("userId", session.getAttribute("user_id"));
		//작업중지일때 작업완료나 가공공정으로 이동불가
		int checkProd = cutService.selectCheckStop(map);
		if(checkProd != 0) {
			
			redirectAttributes.addFlashAttribute("msg", "공정을 재개하여 주십시오.");
			return "redirect:/sl/process/cutProcess/cutList.do";
		}
		redirectAttributes.addFlashAttribute("msg", "작업이 완료되었습니다.");
		cutService.updateProcess3(map);
		cutService.updateLogEdtime(map);
		return "redirect:/sl/process/cutProcess/cutList.do";
	}
	
	@RequestMapping("/sl/process/cutProcess/registCut.do")
	public String registCut(ModelMap model) {
		
		return "sl/process/cut/cutRegist";
	}
	
//	@RequestMapping(value="/sl/process/cutProcess/cutAjax.do", method=RequestMethod.POST)
//	public ModelAndView registNonOperFacilityListAjax(@RequestParam Map<String, Object> map) {
//		ModelAndView mav = new ModelAndView();
//		//cutService.registAnalysisData(map);
//		Map<String, Object> list = cutService.selectCutAjax(map);
//		mav.setViewName("jsonView");
//		mav.addObject("cut_ajax", list);
//		return mav;
//	}
//	

	
	@RequestMapping("/sl/process/cutProcess/registCutOk.do")
	public String registCutOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		
//		//mssql형식의 맞게 변환
//		String time1 = map.get("cpStarttime")+"";
//		String[] time11 = time1.split("T");
//		
//		String time111 = time11[0]+" "+time11[1]+":00";
//		String time2 = map.get("cpEndtime")+"";
//		
//		String[] time22 = time2.split("T");
//		
//		String time222 = time22[0] + " " + time22[1]+ ":00";
//		map.replace("cpStarttime",time111);
//		map.replace("cpEndtime", time222);
		//수주번호체크
		int exists = cutService.selctExistsOn(map);
		
		if(exists != 0) {
			redirectAttributes.addFlashAttribute("msg", "중복되는 수주번호입니다.");
			return "redirect:/sl/process/cutProcess/registCut.do";
		}
		
		
		
		
//		//로트번호 체크
//		if(!map.get("poLotno").equals("")) {
//			exists = cutService.selectExistsLot(map);
//			if(exists == 0) {
//				redirectAttributes.addFlashAttribute("msg", "등록되지 않은 생산실적 입니다.");
//				return "redirect:/sl/process/cutProcess/registCut.do";
//			}
//			
//			
//		}
		
		map.put("userId", session.getAttribute("user_id"));
		cutService.registCut(map);
	
		redirectAttributes.addFlashAttribute("msg", "등록 되었습니다.");
		return "redirect:/sl/process/cutProcess/cutList.do";
	}
	
	@RequestMapping("/sl/process/cutProcess/modifyCut.do")
	public String modifyCut(@RequestParam Map<String, Object> map, ModelMap model) {
		

			System.out.println("맵확인 : " + map);
			Map<String, Object> detail = cutService.selectCutInfo(map);
			model.put("cutVO", detail);
		
		return "sl/process/cut/cutModify";
	}
	
//	@RequestMapping(value="/sl/process/cut/modifyAnalysisDataAjax.do", method=RequestMethod.POST)
//	public ModelAndView modifyNonOperFacilityListAjax(@RequestParam Map<String, Object> map) {
//		ModelAndView mav = new ModelAndView();
//		cutService.modifyAnalysisData(map);
//		mav.setViewName("jsonView");
//		mav.addObject("analysis_ajax", "");
//		return mav;
//	}
//	
	@RequestMapping("/sl/process/cutProcess/modifyCutOk.do")
	public String modfiyCutOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
//		//mssql형식의 맞게 변환
//				String time1 = map.get("cpStarttime")+"";
//				String[] time11 = time1.split("T");
//				
//				String time111 = time11[0]+" "+time11[1]+":00";
//				String time2 = map.get("cpEndtime")+"";
//				
//				String[] time22 = time2.split("T");
//				
//				String time222 = time22[0] + " " + time22[1]+ ":00";
//				map.replace("cpStarttime",time111);
//				map.replace("cpEndtime", time222);
				
		
		cutService.modifyCut(map);
		
		redirectAttributes.addFlashAttribute("msg", "수정 되었습니다.");
		return "redirect:/sl/process/cutProcess/cutList.do";
	}
	
//	@RequestMapping("/sl/process/cutProcess/detailCut.do")
//	public String detailCut(@RequestParam Map<String, Object> map, ModelMap model) {
//		
//		Map<String, Object> detail = cutService.detailCut(map);
//		
//		
//		model.put("cutVO", detail);
//		
//		
//		
//		return "sl/process/cut/cutDetail";
//	}
	
	
	
	@RequestMapping("/sl/process/cutProcess/deleteCut.do")
	public String deleteCut(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		cutService.deleteCut(map);

		redirectAttributes.addFlashAttribute("msg","삭제 되었습니다.");
		return "redirect:/sl/process/cutProcess/cutList.do";
	}
	
	@RequestMapping("/sl/production/cut/graphCut.do")
	public String graphAnalyMange(ModelMap model) {
		Map<String, Object> list = cutService.selectAnalysisCnt();
		model.put("list", list);
		return "sl/process/cut/cutGraph";
	}
	
//	private void updateProcess(Map<String, Object> map) {
//		
//		
//		
//		
//		if(map.get("tiState").equals("부적합")) {
//			
//			map.put("prReReSt", map.get("tiState"));
////			prodResultService.updatePrReReSt(map);
//			
//		}
//		if(!map.get("tiState").equals("부적합")) {
////			failReportService.registProdResult(map);
//		}
//		
//		
//		
//	
//		
//		map.put("modify","true");
//		Map<String, Object> process = failReportService.selectProcessSeqInfo(map);
//		int processSeq = Integer.parseInt(process.get("prCurSeq")+"");
//		System.out.println("확인 : " + processSeq);
//		map.put("curSeq", processSeq);
//		map.put("curStDte", "pr_st_time"+processSeq);
//		map.put("curEdDte", "pr_ed_time"+processSeq);
//		map.put("curCnt", "pr_cnt"+processSeq);
//		map.put("curFaulty", "pr_faulty"+processSeq);
//		map.put("nextIdx", "pr_list_idx"+(processSeq+1));
//		map.put("nextNm", "pr_list_nm"+(processSeq+1));
//		failReportService.updateProcess(map);
//	
//		
//	}
}
