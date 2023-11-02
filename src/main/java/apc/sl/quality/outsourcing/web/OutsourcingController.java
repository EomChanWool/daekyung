package apc.sl.quality.outsourcing.web;

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

import apc.sl.quality.outsourcing.service.OutsourcingService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class OutsourcingController {
	@Autowired
	private OutsourcingService outsourcingService;
	
	@RequestMapping("/sl/material/outsourcing/outsourcingList.do")
	public String outsourcingList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = outsourcingService.selectOutsourcingListToCnt(searchVO);
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
		List<?> outSourcingList = outsourcingService.selectOutsourcingList(searchVO);
		model.put("outSourcingList", outSourcingList);
		model.put("paginationInfo", paginationInfo);
		return "sl/material/outsourcing/outsourcingList";
	}
	
	@RequestMapping("/sl/material/outsourcing/registOutsourcing.do")
	public String registOutsourcing(ModelMap model) {
		List<?> ordersList = outsourcingService.selectOrdersList();
		model.put("ordersList", ordersList);
		return "sl/material/outsourcing/outsourcingRegist";
	}
	
	@RequestMapping(value="/sl/material/outsourcing/outSourcingOrdersInfoAjax.do", method=RequestMethod.POST)
	public ModelAndView outsourcingItemInfoAjax(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		List<?> list = outsourcingService.selectOrdersInfo(map);
		mav.setViewName("jsonView");
		mav.addObject("or_info", list);
		return mav;
	}
	
	@RequestMapping("/sl/material/outsourcing/registOutsourcingOk.do")
	public String registOutsourcingOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		outsourcingService.registOutSourcing(map);

		//수주번호 출하 등록되었는지 확인
		int exists = outsourcingService.selectExistsShipment(map);
		if(exists != 0) {
			//수주번호가 출하에 등록되어있으면 수주 상태 1(외주, 출하 모두 등록된 상태)
			map.put("state", 1);
		}else {
			//수주번호가 출하에 등록되어 있지 않으면 수주 상태2(외주만 등록된 상태)
			map.put("state", 2);
		}
		outsourcingService.updateOrders(map);
		
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/material/outsourcing/outsourcingList.do";
	}
	
	@RequestMapping("/sl/material/outsourcing/modifyOutsourcing.do")
	public String modifyOutsourcing(@RequestParam Map<String, Object> map, ModelMap model) {
		List<?> ordersList = outsourcingService.selectOrdersList();
		model.put("ordersList", ordersList);
		if(!map.isEmpty()) {
			Map<String, Object> detail = outsourcingService.selectOutsourcingInfo(map);
			model.put("outsourcingVO", detail);
		}
		return "sl/material/outsourcing/outsourcingModify";
	}
	
	@RequestMapping("/sl/material/outsourcing/modifyOutsourcingOk.do")
	public String modifyOutsourcingOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		outsourcingService.modifyOutsourcing(map);
		redirectAttributes.addFlashAttribute("msg", "수정 되었습니다.");
		return "redirect:/sl/material/outsourcing/outsourcingList.do";
	}
	
	@RequestMapping("/sl/material/outsourcing/deleteOutsourcing.do")
	public String deleteOutsourcing(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		//수주번호 출하 등록되었는지 확인
		int exists = outsourcingService.selectExistsShipment(map);
		
		if(exists != 0) {
			map.put("state", 3);
		}else if(exists == 0) {
			map.put("state", 4);
		}
		
		outsourcingService.updateOrders(map);
		outsourcingService.deleteOutsourcing(map);
		redirectAttributes.addFlashAttribute("msg", "삭제 되었습니다.");
		return "redirect:/sl/material/outsourcing/outsourcingList.do";
	}
}
