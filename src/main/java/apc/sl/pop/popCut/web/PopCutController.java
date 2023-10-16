package apc.sl.pop.popCut.web;

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
import org.stringtemplate.v4.compiler.STParser.mapExpr_return;

import apc.sl.facility.failReport.service.FailReportService;
import apc.sl.pop.popCut.service.PopCutService;
import apc.sl.process.cut.service.CutService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class PopCutController {
	@Autowired
	private PopCutService popCutService;
	
	
	@RequestMapping("/sl/pop/popCut/popCutList.do")
	public String cutList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		if(model.get("sear") != null) {
			Map<String, Object> temp = (Map<String, Object>) model.get("sear");
			searchVO.setSearchKeyword(temp.get("searchKeyword")+"");	
		}
		int totCnt = popCutService.selectCutListToCnt(searchVO);
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
		List<?> ordList = popCutService.selectCutList(searchVO);
		List<?> cmList = popCutService.selectCutManager();
		model.put("ordList", ordList);
		model.put("cmList", cmList);
		model.put("paginationInfo", paginationInfo);
		return "sl/pop/popCut/popCutList";
	}
	
	@RequestMapping(value="/sl/pop/popCut/goCut.do", method=RequestMethod.POST)
	public String goCut(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		if(!map.get("searchKeyword").equals("")) {
			redirectAttributes.addFlashAttribute("sear",map);
		}
		map.put("userId", session.getAttribute("user_id"));
		popCutService.registCPLLog(map);
		popCutService.updateOrState(map);
		return "redirect:/sl/pop/popCut/popCutList.do";
	}
	
	@RequestMapping(value="/sl/pop/popCut/stopCut.do", method=RequestMethod.POST)
	public String stopCut(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		if(!map.get("searchKeyword").equals("")) {
			redirectAttributes.addFlashAttribute("sear",map);
		}
		map.put("userId", session.getAttribute("user_id"));
		
		popCutService.registCStopLog(map);
		
		
		return "redirect:/sl/pop/popCut/popCutList.do";
	}
	
	@RequestMapping(value="/sl/pop/popCut/reCut.do", method=RequestMethod.POST)
	public String reCut(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		if(!map.get("searchKeyword").equals("")) {
			redirectAttributes.addFlashAttribute("sear",map);
		}
		map.put("userId", session.getAttribute("user_id"));
		
		System.out.println("확인  : " + map);
		popCutService.updateCSStopLog2(map);
		
		return "redirect:/sl/pop/popCut/popCutList.do";
	}
	
	@RequestMapping(value="/sl/pop/popCut/goMfCut.do",method=RequestMethod.POST)
	public String goMfCut(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		if(!map.get("searchKeyword").equals("")) {
			redirectAttributes.addFlashAttribute("sear",map);
		}
		map.put("userId", session.getAttribute("user_id"));
		System.out.println("맵3 : " + map);
		//작업중지일때 작업완료나 가공공정으로 이동불가
		int checkProd = popCutService.selectCheckStop(map);
		System.out.println("맵 : " + map);
		if(checkProd != 0) {
			
			redirectAttributes.addFlashAttribute("msg", "공정을 재개하여 주십시오.");
			return "redirect:/sl/pop/popCut/popCutList.do";
		}
		redirectAttributes.addFlashAttribute("msg", "가공공정으로 이동하였습니다.");
		popCutService.updateOrProcess3(map);
		popCutService.updateLogEdtime(map);
		
		return "redirect:/sl/pop/popCut/popCutList.do";
	}
	
	@RequestMapping(value="/sl/pop/popCut/finishCut.do",method=RequestMethod.POST)
	public String finishCut(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		if(!map.get("searchKeyword").equals("")) {
			redirectAttributes.addFlashAttribute("sear",map);
		}
		map.put("userId", session.getAttribute("user_id"));
		System.out.println("맵3 : " + map);
		//작업중지일때 작업완료나 가공공정으로 이동불가
		int checkProd = popCutService.selectCheckStop(map);
		System.out.println("맵 : " + map);
		if(checkProd != 0) {
			
			redirectAttributes.addFlashAttribute("msg", "공정을 재개하여 주십시오.");
			return "redirect:/sl/pop/popCut/popCutList.do";
		}
		redirectAttributes.addFlashAttribute("msg", "작업이 완료되었습니다.");
		popCutService.updateProcess3(map);
		popCutService.updateLogEdtime(map);
		return "redirect:/sl/pop/popCut/popCutList.do";
	}
//	
//	@RequestMapping(value="/sl/process/cutProcess/cutAjax.do", method=RequestMethod.POST)
//	public ModelAndView registNonOperFacilityListAjax(@RequestParam Map<String, Object> map) {
//		ModelAndView mav = new ModelAndView();
//		//cutService.registAnalysisData(map);
//		Map<String, Object> list = popCutService.selectCutAjax(map);
//		mav.setViewName("jsonView");
//		mav.addObject("cut_ajax", list);
//		return mav;
//	}
//	
//
//	
//	@RequestMapping("/sl/process/cutProcess/registCutOk.do")
//	public String registCutOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
//		
//		
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
//		//설비체크
//		int exists = popCutService.selctExistsEq(map);
//		
//		if(exists == 0) {
//			redirectAttributes.addFlashAttribute("msg", "존재하지 않는 설비 입니다.");
//			return "redirect:/sl/process/cutProcess/registCut.do";
//		}
//		
//		
//		
//		
//		//로트번호 체크
//		if(!map.get("poLotno").equals("")) {
//			exists = popCutService.selectExistsLot(map);
//			if(exists == 0) {
//				redirectAttributes.addFlashAttribute("msg", "등록되지 않은 생산실적 입니다.");
//				return "redirect:/sl/process/cutProcess/registCut.do";
//			}
//			
//			
//		}
//		
//		map.put("userId", session.getAttribute("user_id"));
//		popCutService.updatePoState(map);
//		popCutService.registCut(map);
//	
//		redirectAttributes.addFlashAttribute("msg", "등록 되었습니다.");
//		return "redirect:/sl/process/cutProcess/cutList.do";
//	}
//	
//	@RequestMapping("/sl/process/cutProcess/modifyCut.do")
//	public String modifyCut(@RequestParam Map<String, Object> map, ModelMap model) {
//		
//		List<?> eqList = popCutService.selectEQList();
//		List<?> lotnoList = popCutService.selectLotnoList();
//		model.put("eqList", eqList);
//		model.put("lotnoList", lotnoList);
//		
//		if(!map.isEmpty()) {
//			Map<String, Object> detail = popCutService.selectCutInfo(map);
//			model.put("cutVO", detail);
//		}
//		return "sl/process/cut/cutModify";
//	}
//	
//	@RequestMapping(value="/sl/process/cut/modifyAnalysisDataAjax.do", method=RequestMethod.POST)
//	public ModelAndView modifyNonOperFacilityListAjax(@RequestParam Map<String, Object> map) {
//		ModelAndView mav = new ModelAndView();
//		popCutService.modifyAnalysisData(map);
//		mav.setViewName("jsonView");
//		mav.addObject("analysis_ajax", "");
//		return mav;
//	}
//	
//	@RequestMapping("/sl/process/cutProcess/modifyCutOk.do")
//	public String modfiyCutOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
//		
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
//				
//				
//		
//		int exists = popCutService.selctExistsEq(map);
//		
//		if(exists == 0) {
//			redirectAttributes.addFlashAttribute("msg", "존재하지 않는 설비 입니다.");
//			return "redirect:/sl/process/cutProcess/modifyCut.do";
//		}
//		
//		
//		map.put("userId", session.getAttribute("user_id"));
//		popCutService.modifyCut(map);
//		
//		redirectAttributes.addFlashAttribute("msg", "수정 되었습니다.");
//		return "redirect:/sl/process/cutProcess/cutList.do";
//	}
//	
//	@RequestMapping("/sl/process/cutProcess/detailCut.do")
//	public String detailCut(@RequestParam Map<String, Object> map, ModelMap model) {
//		
//		Map<String, Object> detail = popCutService.detailCut(map);
//		
//		
//		model.put("cutVO", detail);
//		
//		
//		
//		return "sl/process/cut/cutDetail";
//	}
//	
//	
//	
//	@RequestMapping("/sl/process/cutProcess/deleteCut.do")
//	public String deleteCut(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
//		popCutService.deleteCut(map);
//		map.put("poState", "0");
//		popCutService.updatePoState(map);
//
//		redirectAttributes.addFlashAttribute("msg","삭제 되었습니다.");
//		return "redirect:/sl/process/cutProcess/cutList.do";
//	}
//	
//	@RequestMapping("/sl/production/cut/graphCut.do")
//	public String graphAnalyMange(ModelMap model) {
//		Map<String, Object> list = popCutService.selectAnalysisCnt();
//		model.put("list", list);
//		return "sl/process/cut/cutGraph";
//	}
//	

}
