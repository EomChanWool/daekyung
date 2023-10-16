package apc.sl.monitoring.notice.web;

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

import apc.sl.monitoring.notice.service.NoticeService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/sl/monitoring/notice/noticeList.do")
	public String noticeList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = noticeService.selectNoticeListToCnt(searchVO);
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
		List<?> noticeList = noticeService.selectNoticeList(searchVO);
		model.put("noticeList", noticeList);
		model.put("paginationInfo", paginationInfo);
		return "sl/monitoring/notice/noticeList";
	}
	
	@RequestMapping("/sl/monitoring/notice/registNotice.do")
	public String registNotice() {
		return "sl/monitoring/notice/noticeRegist";
	}
	
	@RequestMapping("/sl/monitoring/notice/registNoticeOk.do")
	public String registNoticeOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		noticeService.registNotice(map);
		redirectAttributes.addFlashAttribute("msg", "등록 되었습니다.");
		return "redirect:/sl/monitoring/notice/noticeList.do";
	}
	
	@RequestMapping("/sl/monitoring/notice/modifyNotice.do")
	public String modifyNotice(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = noticeService.selectNoticeInfo(map);
		model.put("noticeVO", detail);
		return "sl/monitoring/notice/noticeModify";
	}
	
	@RequestMapping("/sl/monitoring/notice/modifyNoticeOk.do")
	public String modifyNoticeOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		noticeService.modifyNotice(map);
		redirectAttributes.addFlashAttribute("msg", "수정 되었습니다.");
		return "redirect:/sl/monitoring/notice/noticeList.do";
	}
	
	@RequestMapping("/sl/monitoring/notice/deleteNotice.do")
	public String deleteNotice(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttribues, HttpSession session) {
		noticeService.deleteNotice(map);
		redirectAttribues.addFlashAttribute("msg", "삭제 되었습니다.");
		return "redirect:/sl/monitoring/notice/noticeList.do";
	}
}
