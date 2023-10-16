package apc.sl.facility.equipPrev.web;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import apc.sl.facility.equipPrev.service.EquipPrevService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EquipPrevController {
	@Autowired
	private EquipPrevService equipPrevService;
	
	@RequestMapping("/sl/facility/equipPrev/equipPrevList.do")
	public String equipPrevList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = equipPrevService.selectEquipPrevListToCnt(searchVO);
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
		List<?> eqList = equipPrevService.selectEquipmentList();
		List<?> equipPrevList = equipPrevService.selectEquipPrevList(searchVO);
		model.put("eqList", eqList);
		model.put("equipPrevList", equipPrevList);
		model.put("paginationInfo", paginationInfo);
		
		return "sl/facility/equipPrev/equipPrevList";
	}
	
	@RequestMapping("/sl/facility/equipPrev/registEquipPrev.do")
	public String registEquipPrev(ModelMap model) {
		List<?> equipmentList = equipPrevService.selectEquipmentList();
		model.put("equipmentList", equipmentList);
		return "sl/facility/equipPrev/equipPrevRegist";
	}
	
	@RequestMapping("/sl/facility/equipPrev/registEquipPrevOk.do")
	public String registEquipPrevOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		System.out.println("map : "+ map);
		equipPrevService.registEquipPrev(map);
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/facility/equipPrev/equipPrevList.do";
	}
	
	@RequestMapping("/sl/facility/equipPrev/modifyEquipPrev.do")
	public String modifyEquipPrev(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = equipPrevService.selectEquipPrevInfo(map);
		model.put("equipPrevVO", detail);
		return "sl/facility/equipPrev/equipPrevModify";
	}
	
	@RequestMapping("/sl/facility/equipPrev/modifyEquipPrevOk.do")
	public String modifyEquipPrevOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		equipPrevService.modifyEquipPrev(map);
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		return "redirect:/sl/facility/equipPrev/equipPrevList.do";
	}
	
	@RequestMapping("/sl/facility/equipPrev/detailEquipPrev.do")
	public String deatail(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = equipPrevService.selectEquipPrevInfo(map);
		model.put("equipPrevVO", detail);
		return "sl/facility/equipPrev/equipPrevDetail";
	}
	
	@RequestMapping("/sl/facility/equipPrev/deleteEquipPrev.do")
	public String deleteEquipPrev(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		equipPrevService.deleteEquipPrev(map);
		redirectAttributes.addFlashAttribute("msg", "삭제 되었습니다.");
		return "redirect:/sl/facility/equipPrev/equipPrevList.do";
	}
	
	@RequestMapping("/sl/facility/equipPrev/equipPrevExcelDown.do")
	public ModelAndView equipPrevExcelDown(@ModelAttribute("searchVO") SearchVO searchVO) throws Exception {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd-h:mm");
		Date now = new Date();
		String edDate = format.format(now);
		
		ModelAndView mav = new ModelAndView("excelView");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		int totCnt = equipPrevService.selectEquipPrevListToCnt(searchVO);
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
		List<?> list = equipPrevService.selectEquipPrevList(searchVO);
		String filename = "설비예방보수"+edDate;
		
		String[] columnArr = {"예방ID", "설비ID","예방보수구분","예방보수일자","작업자","등록일","등록ID","수정일","수정ID","예방보수내용"};
		String[] columnVarArr = {"epmId","eqId","epmType","epmDate","epmManager","epmRegDate","epmRegId","epmEdtDate","epmEdtId","epmComment"};
		
		dataMap.put("columnArr", columnArr);
		dataMap.put("columnVarArr", columnVarArr);
		dataMap.put("sheetNm","예방보수목록");
		dataMap.put("list",list);
		
		mav.addObject("dataMap",dataMap);
		mav.addObject("filename",filename);
		return mav;
	}
}
