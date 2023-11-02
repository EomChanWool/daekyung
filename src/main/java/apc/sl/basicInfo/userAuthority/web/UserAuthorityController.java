package apc.sl.basicInfo.userAuthority.web;

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

import apc.sl.basicInfo.userAuthority.service.UserAuthorityService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class UserAuthorityController {
	@Autowired
	private UserAuthorityService userAuthorityService;
	
	@RequestMapping("/sl/basicInfo/Authority/userAuthorityList.do")
	public String userAuthorityList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = userAuthorityService.selectUserAuthorityListToCnt(searchVO);
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
		List<?> userAuthorityList = userAuthorityService.selectUserAuthorityList(searchVO);
		model.put("atList", userAuthorityList);
		model.put("paginationInfo", paginationInfo);
		return "sl/basicInfo/userAuthority/userAuthorityList";
	}
	
	@RequestMapping("/sl/basicInfo/Authority/registUserAuthority.do")
	public String registUserAuthority(ModelMap model) {
		
		List<?> notPro = userAuthorityService.selectNotPro();
		model.put("notPro", notPro);
		
		return "sl/basicInfo/userAuthority/userAuthorityRegist";
	}
	
	@RequestMapping(value="/sl/basicInfo/Authority/UserAuthorityAjax.do", method=RequestMethod.POST)
	public ModelAndView UserAuthorityAjax(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		List<?> list = userAuthorityService.selectNotInfo(map);
		mav.setViewName("jsonView");
		mav.addObject("pro_info", list);
		return mav;
	}
	
	@RequestMapping("/sl/basicInfo/Authority/registUserAuthorityOk.do")
	public String registUserAuthorityOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		
		int exists = userAuthorityService.selectExistAuth(map);
		
		if(exists == 0) {
			redirectAttributes.addFlashAttribute("msg","없는 프로그램입니다.");
			return "redirect:/sl/basicInfo/Authority/registUserAuthority.do";
		}
		
		userAuthorityService.registUserAuthority(map);
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/basicInfo/Authority/userAuthorityList.do";
	}
	
	@RequestMapping("/sl/basicInfo/Authority/modifyUserAuthority.do")
	public String modifyUserAuthority(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = userAuthorityService.selectUserAuthorityInfo(map);
		model.put("userAuthorityVO", detail);
		return "sl/basicInfo/userAuthority/userAuthorityModify";
	}
	
	@RequestMapping("/sl/basicInfo/Authority/modifyUserAuthorityOk.do")
	public String modifyUserAuthorityOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		userAuthorityService.modifyUserAuthority(map);
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		return "redirect:/sl/basicInfo/Authority/userAuthorityList.do";
	}
	
	@RequestMapping("/sl/basicInfo/Authority/deleteUserAuthority.do")
	public String deleteUserAuthority(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		if(map.get("maPname").equals("사원권한관리")) {
			redirectAttributes.addFlashAttribute("msg","사원권한관리는 삭제할 수 없습니다.");
			return "redirect:/sl/basicInfo/Authority/userAuthorityList.do";
		}
		
		if(map.get("maPname").equals("사원관리")) {
			redirectAttributes.addFlashAttribute("msg","사원관리는 삭제할 수 없습니다.");
			return "redirect:/sl/basicInfo/Authority/userAuthorityList.do";
		}
		
		if(map.get("maPname").equals("제품정보관리")) {
			redirectAttributes.addFlashAttribute("msg", "제품정보관리는 삭제할 수 없습니다.");
			return "redirect:/sl/basicInfo/Authority/userAuthorityList.do";
		}
		
		if(map.get("maPname").equals("자재이동관리")) {
			redirectAttributes.addFlashAttribute("msg", "자재이동관리는 삭제할 수 없습니다.");
			return "redirect:/sl/basicInfo/Authority/userAuthorityList.do";
		}
		
		
		userAuthorityService.deleteUserAuthority(map);
		redirectAttributes.addFlashAttribute("msg","삭제 되었습니다.");
		return "redirect:/sl/basicInfo/Authority/userAuthorityList.do";
	}
}
