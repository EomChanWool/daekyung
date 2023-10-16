package apc.sl.facility.failReport.web;

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
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class FailReportController {
	@Autowired
	private FailReportService failReportService;
	
	@RequestMapping("/sl/facility/failReport/failReportList.do")
	public String failReportList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = failReportService.selectFailReportListToCnt(searchVO);
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
		
		List<?> failReportList = failReportService.selectFailReportList(searchVO);
		model.put("failReportList", failReportList);
		model.put("paginationInfo", paginationInfo);
		return "sl/facility/failReport/failReportList";
	}
	
	@RequestMapping("/sl/facility/failReport/registFailReport.do")
	public String registFailReport(ModelMap model) {
		List<?> fmList = failReportService.selectFacMasterList();
		model.put("fmList", fmList);
		return "sl/facility/failReport/failReportRegist";
	}
	
	@RequestMapping(value="/sl/facility/failReport/prReWorkOrderInfoAjax.do", method=RequestMethod.POST)
	public ModelAndView prReWorkOrderInfoAjax(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		List<?> list = failReportService.selectWorkOrderInfo(map);
		mav.setViewName("jsonView");
		mav.addObject("wo_info", list);
		return mav;
	}
	
	@RequestMapping("/sl/facility/failReport/registFailReportOk.do")
	public String registFailReportOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		failReportService.registFailReport(map);
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/facility/failReport/failReportList.do";
	}
	
	@RequestMapping("/sl/facility/failReport/modifyFailReport.do")
	public String modifyFailReport(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = failReportService.selectFailReportInfo(map);
		model.put("failReportVO", detail);
		return "sl/facility/failReport/failReportModify";
	}
	
	@RequestMapping("/sl/facility/failReport/modifyFailReportOk.do")
	public String modifyFailReportOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		failReportService.modifyFailReport(map);
		//작업상태가 작업종료일때 sm_process갱신
//		if(map.get("prReState").equals("1")) {
//			//modify = false --> sm_process에서 수정하고자 하는 순서의 공정시작시간, 공정종료시간, 생산수량, 불량수량만 갱신
//			map.put("modify","false");
//			Map<String, Object> process = failReportService.selectProcessSeqInfo(map);
//			int processSeq = Integer.parseInt(map.get("curSeq")+"");
//			map.put("curStTime", "pr_st_time"+processSeq);
//			map.put("curEdTime", "pr_ed_time"+processSeq);
//			map.put("curCnt", "pr_cnt"+processSeq);
//			map.put("curFaulty", "pr_faulty"+processSeq);
//			
//			if(map.get("curPrReState").equals("0") && map.get("prReState").equals("1")) {
//				//이전 상태가 작업중이였다가 작업완료로 변경되었을 경우
//				map.replace("modify", "true");
//				map.put("nextIdx", "pr_list_idx"+(processSeq+1));
//				map.put("nextNm", "pr_list_nm"+(processSeq+1));
//			}
//			
//			map.put("userId", session.getAttribute("user_id"));
//			failReportService.updateProcess(map);
//			if(map.get("curPrReState").equals("0") && map.get("prReState").equals("1")) {
//				updateProcess(process,map);
//			}
//		}
		
		redirectAttributes.addFlashAttribute("msg", "수정 되었습니다.");
		return "redirect:/sl/facility/failReport/failReportList.do";
	}
	
	@RequestMapping("/sl/facility/failReport/detailFailReport.do")
	public String deatail(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = failReportService.selectFailReportInfo(map);
		if (detail.get("eqIsuse").equals(0)) {
			detail.put("eqIsuse", "사용");
		} else if (detail.get("eqIsuse").equals(1)) {
			detail.put("eqIsuse", "미사용");
		}
		model.put("failReportVO", detail);
		return "sl/facility/failReport/failReportDetail";
	}
	
	@RequestMapping("/sl/facility/failReport/deleteFailReport.do")
	public String deleteFailReportOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		failReportService.deleteFailReport(map);
		redirectAttributes.addFlashAttribute("msg", "삭제 되었습니다.");
		return "redirect:/sl/facility/failReport/failReportList.do";
	}
	
//	private void updateProcess(Map<String, Object> process, Map<String, Object> map) {
//		//완료된 공정이 마지막 공정이면 sm_work_order, sm_orders 상태를 작업 완료로
//		String lastProcessNm = failReportService.selectLastProcessNm(map);
//		if(process.get("prListCurNm") != null) {
//			if(process.get("prListCurNm").equals(lastProcessNm)) {
//				map.put("state", "2");
//				failReportService.updateWorkOrder(map);
//				//실제 완제품(밸런싱 통과 수량)을 기반으로 투입 자재 재조정
//				if(map.get("prReFaultyCnt") == "") {
//					map.replace("prReFaultyCnt", 0);
//				}
//				int prodCnt = Integer.parseInt(map.get("prReCnt")+"") + Integer.parseInt(map.get("prReFaultyCnt")+"");
//				Map<String, Object> in_mt = failReportService.selectMaterialList(map);
//				Map<String, Object> temp = new HashMap<>();
//				temp.put("woIdx", map.get("woIdx"));
//				for(int i=1;i<=15;i++) {
//					Map<String, Object> temp2 = new HashMap<>();
//					String itemCd = "itemCd"+i;
//					String cnt = "cnt"+i;
//					
//					if(in_mt.get(itemCd) == null) break;
//					temp.put(itemCd, in_mt.get(itemCd));
//					temp2.put("itemCd", in_mt.get(itemCd));
//					
//					if(in_mt.get(itemCd).equals("MT01") || in_mt.get(itemCd).equals("MT02")) {
//						temp.put(cnt, prodCnt*2);
//						temp2.put("cnt", prodCnt*2);
//					}else {
//						temp.put(cnt, prodCnt);
//						temp2.put("cnt", prodCnt);
//					}
//					int realCnt = Integer.parseInt(in_mt.get(cnt)+"") - Integer.parseInt(temp2.get("cnt")+"");
//					temp2.replace("cnt", realCnt);
//					
//					failReportService.updateMaterialStock(temp2);
//				}
//				failReportService.updateInMaterial(temp);
//				
//				//제품 재고에 추가해줌
//				failReportService.addItemStock(map);
//			}
//		}
//	}
}
