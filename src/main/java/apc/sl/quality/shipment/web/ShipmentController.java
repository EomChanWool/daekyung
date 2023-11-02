package apc.sl.quality.shipment.web;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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

import apc.sl.quality.shipment.service.ShipmentService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ShipmentController {
	@Autowired
	private ShipmentService shipmentService;
	
	@RequestMapping("/sl/material/shipment/shipmentList.do")
	public String shipmentList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = shipmentService.selectShipmentListToCnt(searchVO);
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
		List<?> shipmentList = shipmentService.selectShipmentList(searchVO);
		model.put("shipmentList", shipmentList);
		model.put("paginationInfo", paginationInfo);
		return "sl/material/shipment/shipmentList";
	}
	
	@RequestMapping("/sl/material/shipment/registShipment.do")
	public String registShipment(ModelMap model) {
		List<?> accountList = shipmentService.selectAccountList();
		model.put("accountList", accountList);
		List<?> orderList = shipmentService.selectOrderList();
		model.put("orderList", orderList);
		return "sl/material/shipment/shipmentRegist";
	}
	
	@RequestMapping(value="/sl/material/shipment/shipmentAccountInfoAjax.do", method=RequestMethod.POST)
	public ModelAndView shipmentAccountInfoAjax(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		List<?> list = shipmentService.selectAccountInfo(map);
		mav.setViewName("jsonView");
		mav.addObject("a_info", list);
		return mav;
	}
	
	@RequestMapping(value="/sl/material/shipment/shipmentOrdersInfoAjax.do", method=RequestMethod.POST)
	public ModelAndView shipmentOrdersInfoAjax(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		List<?> list = shipmentService.selectOrdersInfo(map);
		mav.setViewName("jsonView");
		mav.addObject("or_info", list);
		return mav;
	}
	
	@RequestMapping("/sl/material/shipment/registShipmentOk.do")
	public String registShipmentOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session){
		map.put("userId", session.getAttribute("user_id"));
		shipmentService.registShipment(map);
		
		//외주가 등록되어있는지 확인
		int outSourcingExists = shipmentService.selectExistsOutSourcing(map);
		if(outSourcingExists != 0) {
			//외주,출하 둘다 등록 되어있으면
			map.put("state", "1");
		}else if(outSourcingExists == 0){
			//외주 등록 안됨, 출하 등록이면
			map.put("state", "3");
		}
		shipmentService.updateOrders(map);
		
		//같은 수주번호의 납품번호 있을시 출하번호 변경
		shipmentService.updateDelivery(map);
		
		redirectAttributes.addFlashAttribute("msg", "등록 되었습니다.");
		return "redirect:/sl/material/shipment/shipmentList.do";
	}
	
	@RequestMapping("/sl/material/shipment/modifyShipment.do")
	public String modifyShipment(@RequestParam Map<String, Object> map, ModelMap model) {
		List<?> accountList = shipmentService.selectAccountList();
		model.put("accountList", accountList);
		List<?> orderList = shipmentService.selectOrderList();
		model.put("orderList", orderList);
		if(!map.isEmpty()) {
			Map<String, Object> detail = shipmentService.selectShipmentInfo(map);
			model.put("shipmentVO", detail);
		}
		return "sl/material/shipment/shipmentModify";
	}
	
	@RequestMapping("/sl/material/shipment/modifyShipmentOk.do")
	public String modifyShipmentOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		shipmentService.modifyShipment(map);
		
		redirectAttributes.addFlashAttribute("msg", "수정 되었습니다.");
		return "redirect:/sl/material/shipment/shipmentList.do";
	}
	
	@RequestMapping("/sl/material/shipment/detailShipment.do")
	public String detailShipment(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = shipmentService.selectShipmentInfo(map);
		model.put("shipmentVO", detail);
		return "sl/material/shipment/shipmentDetail";
	}
	
	@RequestMapping("/sl/material/shipment/deleteShipment.do")
	public String deleteShipment(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		shipmentService.deleteShipment(map);

		int outSourcingExists = shipmentService.selectExistsOutSourcing(map);
		if(outSourcingExists != 0) {
			//외주가 등록되어 있으면
			map.put("state", "2");
		}else if(outSourcingExists == 0) {
			//외주도 등록 안되어 있으면
			map.put("state", "4");
		}
		shipmentService.updateOrders(map);
		redirectAttributes.addFlashAttribute("msg","삭제 되었습니다.");
		return "redirect:/sl/material/shipment/shipmentList.do";
	}
}
