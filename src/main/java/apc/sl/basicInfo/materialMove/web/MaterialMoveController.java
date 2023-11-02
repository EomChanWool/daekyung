package apc.sl.basicInfo.materialMove.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import apc.sl.basicInfo.materialMove.service.MaterialMoveService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class MaterialMoveController {
	@Autowired
	private MaterialMoveService materialMoveService;
	
	@RequestMapping("/sl/basicInfo/materialMove/materialMoveList.do")
	public String materialMoveList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = materialMoveService.selectMaterialMoveListToCnt(searchVO);
		
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
		List<?> materialMoveList = materialMoveService.selectMaterialMoveList(searchVO);
		
		
		model.put("materialMoveList", materialMoveList);
		model.put("paginationInfo", paginationInfo);
		return "sl/basicInfo/materialMove/materialMoveList";
	}
	
	@RequestMapping("/sl/basicInfo/materialMove/registMaterialMove.do")
	public String registMaterialMove() {
		return "sl/basicInfo/materialMove/materialMoveRegist";
	}
	
	@RequestMapping("/sl/basicInfo/materialMove/registMaterialMoveOk.do")
	public String registMaterialMoveOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		int exist = materialMoveService.selectExistCode(map);
		
		if(exist == 0) {
			redirectAttributes.addFlashAttribute("msg","존재하지 않는 바코드 입니다.");
			redirectAttributes.addFlashAttribute("materialMoveVO", map);
			return "redirect:/sl/basicInfo/materialMove/registMaterialMove.do";
		}
		
		map.put("userId", session.getAttribute("user_id"));
		materialMoveService.registMaterialMove(map);
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/basicInfo/materialMove/materialMoveList.do";
	}
	
	@RequestMapping("/sl/basicInfo/materialMove/modifyMaterialMove.do")
	public String modifyMaterialMove(@RequestParam Map<String, Object> map, ModelMap model) {
		
		Map<String, Object> detail = materialMoveService.selectMaterialMoveInfo(map);
		model.put("materialMoveVO", detail);
		return "sl/basicInfo/materialMove/materialMoveModify";
	}
	
	@RequestMapping("/sl/basicInfo/materialMove/modifyMaterialMoveOk.do")
	public String modifyMaterialMoveOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		materialMoveService.modifyMaterialMove(map);
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		return "redirect:/sl/basicInfo/materialMove/materialMoveList.do";
	}
	
	@RequestMapping("/sl/basicInfo/user/detailMaterialMove.do")
	public String detailUser(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = materialMoveService.selectMaterialMoveInfo(map);
		model.put("materialMoveVO", detail);
		return "sl/basicInfo/materialMove/materialMoveDetail";
	}
	
	@RequestMapping("/sl/basicInfo/materialMove/deleteMaterialMove.do")
	public String deleteMaterialMove(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		materialMoveService.deleteMaterialMove(map);
		redirectAttributes.addFlashAttribute("msg","삭제 되었습니다.");
		return "redirect:/sl/basicInfo/materialMove/materialMoveList.do";
	}
}
