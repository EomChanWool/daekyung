package apc.sl.facility.equipChk.web;

import java.util.ArrayList;
import java.util.Collection;
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

import apc.sl.facility.equipChk.service.EquipChkService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EquipChkController {
	@Autowired
	private EquipChkService equipChkService;
	
	@RequestMapping("/sl/facility/equipChk/equipChkList.do")
	public String equipChkList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = equipChkService.selectEquipChkListToCnt(searchVO);
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
		List<?> equipChkList = equipChkService.selectEquipChkList(searchVO);
		model.put("equipChkList", equipChkList);
		model.put("paginationInfo", paginationInfo);
		
		return "sl/facility/equipChk/equipChkList";
	}
	
	@RequestMapping("/sl/facility/equipChk/registEquipChk.do")
	public String registEquipChk(ModelMap model) {
		List<?> regEquipmentList = equipChkService.selectRegEquipmentChkList();
		List<?> equipmentList = equipChkService.selectEquipmentChkList();
		
		for (int i = 0; i < regEquipmentList.size(); i++) {
			for (int j = 0; j < equipmentList.size(); j++) {
				if (regEquipmentList.get(i).equals(equipmentList.get(j))) {
					equipmentList.remove(j);
				}
			}
		}
		
		model.put("equipmentList", equipmentList);
		return "sl/facility/equipChk/equipChkRegist";
	}
	
	@RequestMapping("/sl/facility/equipChk/registEquipChkOk.do")
	public String registEquipChkOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		System.out.println("map : "+ map);
		equipChkService.registEquipChk(map);
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/facility/equipChk/equipChkList.do";
	}
	
	@RequestMapping("/sl/facility/equipChk/modifyEquipChk.do")
	public String modifyEquipChk(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = equipChkService.selectEquipChkInfo(map);
		model.put("equipChkVO", detail);
		return "sl/facility/equipChk/equipChkModify";
	}
	
	@RequestMapping("/sl/facility/equipChk/modifyEquipChkOk.do")
	public String modifyEquipChkOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		equipChkService.modifyEquipChk(map);
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		return "redirect:/sl/facility/equipChk/equipChkList.do";
	}
	
	@RequestMapping("/sl/facility/equipChk/detailEquipChk.do")
	public String deatail(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = equipChkService.selectEquipChkInfo(map);
		model.put("equipChkVO", detail);
		return "sl/facility/equipChk/equipChkDetail";
	}
	
	@RequestMapping("/sl/facility/equipChk/deleteEquipChk.do")
	public String deleteEquipChk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		equipChkService.deleteEquipChk(map);
		redirectAttributes.addFlashAttribute("msg", "삭제 되었습니다.");
		return "redirect:/sl/facility/equipChk/equipChkList.do";
	}
}
