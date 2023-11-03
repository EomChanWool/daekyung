package apc.sl.kpi.kpiManagement.web;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import apc.sl.kpi.kpiManagement.service.KpiService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class KpiController {
	@Autowired
	private KpiService kpiService;
	
	@RequestMapping("/sl/kpi/kpimanagement/kpiList.do")
	public String kpiList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = kpiService.selectKpiListToCnt(searchVO);
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
		List<?> kpiList = kpiService.selectKpiList(searchVO);
		model.put("kpiList", kpiList);
		model.put("paginationInfo", paginationInfo);
		return "sl/kpi/kpiManagement/kpiList";
	}
	
	@RequestMapping("/sl/kpi/kpiState/kpiStateList.do")
	public String graphKpi(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		
		  if(searchVO.getSearchCondition().equals("")) {
		  searchVO.setSearchCondition(getYears().get("kiYear")+"");
		  searchVO.setSearchCondition2("1"); }
		  List<?> kpiList = kpiService.selectKpiList(searchVO); 
		  model.put("kpiList", kpiList);
		  model.put("date", getYears());
		  List<?> kpiGraphList = kpiService.selectKpiGraphList(searchVO);
		  model.put("kpiGraphList", kpiGraphList);
		  //생산량
		  List<?> totalProdCnt = kpiService.selectProdCnt(searchVO);
		  model.put("totalProdCnt", totalProdCnt);
		  //불량률
		  List<?> inspecPer = kpiService.inspecPer(searchVO);
		  model.put("inspecPer", inspecPer);
		  //작업공수
		  List<Map<String, Object>> workTimeList = kpiService.selectWorktime(searchVO);
		  List<Map<String, Object>> workCntList = kpiService.selectWorkCnt(searchVO);
		  
		  for(int i=0; i<workCntList.size(); i++) {
			  workTimeList.get(i).put("prodCnt",workCntList.get(i).get("prodCnt"));
			  if(workCntList.size() < workTimeList.size()) {
				  workTimeList.get(i+1).put("prodCnt", "0");
			  }
		  }
//		 
//		  if(workCntList.size() < workTimeList.size()) {
//			  for(int x= workCntList.size(); x<workTimeList.size();x++) {
//				  workTimeList.get(x).put("prodCnt", "0");
//			  }
//			  
//		  }
		  model.put("wTList" , workTimeList);
		  
		  //리드타임
		  List<?> leadTime = kpiService.selectLeadtime(searchVO);
		  model.put("leadTimeList", leadTime);
		 
		return "sl/kpi/kpiState/kpiGraph";
	}
	
	@RequestMapping("/sl/kpi/kpimanagement/registKpi.do")
	public String registKpi(ModelMap model) {
		
		return "sl/kpi/kpiManagement/kpiRegist";
	}
	
	
//	@RequestMapping(value="/sl/kpi/kpimanagement/prodPerPriceInfoAjax.do", method=RequestMethod.POST)
//	public ModelAndView prodPerPriceInfoAjax(@RequestParam Map<String, Object> map) {
//		ModelAndView mav = new ModelAndView();
//		List<?> list = kpiService.selectProdPerPriceInfo(map);
//		mav.setViewName("jsonView");
//		mav.addObject("pp_info", list);
//		return mav;
//	}
	
	@RequestMapping("/sl/kpi/kpimanagement/registKpiOk.do")
	public String registKpiOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		
		int exists = kpiService.selectExistsKpi(map);
		if(exists != 0) {
			redirectAttributes.addFlashAttribute("msg", "이미 등록된 내역입니다.");
			redirectAttributes.addFlashAttribute("kpiVO", map);
			return "redirect:/sl/kpi/kpimanagement/registKpi.do";
		}
		
		kpiService.registKpi(map);
		System.out.println("map 확인 : "+map);
		redirectAttributes.addFlashAttribute("msg", "등록 되었습니다.");
		return "redirect:/sl/kpi/kpimanagement/kpiList.do";
	}
	
	@RequestMapping("/sl/kpi/kpimanagement/modifyKpi.do")
	public String modifyKpi(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = kpiService.selectKpiInfo(map);
		model.put("kpiVO", detail);
		return "sl/kpi/kpiManagement/kpiModify";
	}
	
	@RequestMapping("/sl/kpi/kpimanagement/modifyKpiOk.do")
	public String modifyKpiOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		kpiService.modifyKpi(map);
		redirectAttributes.addFlashAttribute("msg", "수정 되었습니다.");
		return "redirect:/sl/kpi/kpimanagement/kpiList.do";
	}
	
	@RequestMapping("/sl/kpi/kpimanagement/deleteKpi.do")
	public String deleteKpi(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		kpiService.deleteKpi(map);
		redirectAttributes.addFlashAttribute("msg", "삭제 되었습니다.");
		return "redirect:/sl/kpi/kpimanagement/kpiList.do";
	}
	
	private Map<String, Object> getYears(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		Date now = new Date();
		int begin = Integer.parseInt(format.format(now))-1;
		int end = begin+5;
		Map<String, Object> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("kiYear", format.format(now));
		return map;
	}
}
