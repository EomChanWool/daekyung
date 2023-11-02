package apc.sl.collectInfo.vision.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import apc.sl.collectInfo.vision.service.VisionService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class VisionController {
	@Autowired
	private VisionService visionService;
	
	private String filePath = "C:\\test\\";
	
	@RequestMapping("/sl/collectInfo/vision/visionList.do")
	public String visionList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = visionService.selectVisionListToCnt(searchVO);
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
		List<?> visionList = visionService.selectVisionList(searchVO);
		model.put("visionList", visionList);
		model.put("paginationInfo", paginationInfo);
		return "sl/collectInfo/vision/visionList";
	}
	
	@RequestMapping("/sl/collectInfo/vision/registVision.do")
	public String registVision(ModelMap model) {
		
		
		return "sl/collectInfo/vision/visionRegist";
	}
	
	@RequestMapping(value="/sl/collectInfo/vision/visionInfoAjax.do", method=RequestMethod.POST)
	public ModelAndView shipmentAjax(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		List<?> list = visionService.excelAjax(map);
		mav.setViewName("jsonView");
		mav.addObject("ex_info", list);
		return mav;
	}
	@RequestMapping(value="/sl/collectInfo/vision/visionInfoAjax2.do", method=RequestMethod.POST)
	public ModelAndView shipmentAjax2(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		List<?> list = visionService.procAjax(map);
		mav.setViewName("jsonView");
		mav.addObject("ex_info2", list);
		System.out.println("리스트 : " + list);
		return mav;
	}
	
	@RequestMapping(value="/sl/collectInfo/vision/visionInfoAjax3.do", method=RequestMethod.POST)
	public ModelAndView shipmentAjax3(@RequestParam Map<String, Object> map) {
		
		ModelAndView mav = new ModelAndView();
		Map<String,Object> list = visionService.idTestTime(map);
		mav.setViewName("jsonView");
		mav.addObject("ex_info3", list);
		return mav;
	}
	
	@RequestMapping("/sl/collectInfo/vision/registVisionOk.do")
	public String registVisionOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		visionService.registVision(map);
		visionService.updateFileState(map);
		
		redirectAttributes.addFlashAttribute("msg", "등록 되었습니다.");
		return "redirect:/sl/collectInfo/vision/visionList.do";
	}
	
	@RequestMapping("/sl/collectInfo/vision/modifyVision.do")
	public String modifyVision(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = visionService.selectData(map);
		model.put("visionVO", detail);
		return "sl/collectInfo/vision/visionModify";
	}
	
	@RequestMapping("/sl/collectInfo/vision/modifyVisionOk.do")
	public String modifyVision(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes) {
		visionService.modifyVision(map);
		redirectAttributes.addFlashAttribute("msg", "수정 되었습니다.");
		return "redirect:/sl/collectInfo/vision/visionList.do";
	}
	
	@RequestMapping("/sl/collectInfo/vision/detailVision.do")
	public String detailVision(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = visionService.selectVisionInfo(map);
		model.put("detail", detail);
		return "sl/collectInfo/vision/visionDetail";
	}
	
	@RequestMapping("/sl/collectInfo/vision/downloadVision.do")
	public void downloadInspect(HttpServletRequest request, HttpServletResponse response) {
		String filename = request.getParameter("fileName");
		 String realFilename = "";
//	        try {
//	            String browser = request.getHeader("User-Agent");
//	            // 파일 인코딩
//	            if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
//	                filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
//	            } else {
//	                filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
//	            }
//	 
//	        } catch (UnsupportedEncodingException e) {
//	            System.out.println("UnsupportedEncodingException 발생");
//	        }
	 
	        realFilename = filePath + filename;
	        System.out.println("파일이름 : " + realFilename);
	        File file = new File(realFilename);
	        if (!file.exists()) {
	            return;
	        }
	 
	        // 파일명 지정
	        response.setContentType("application/octer-stream");
	        response.setHeader("Content-Transfer-Encoding", "binary");
	        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
	 
	        try {
	            OutputStream os = response.getOutputStream();
	            FileInputStream fis = new FileInputStream(realFilename);
	 
	            int cnt = 0;
	            byte[] bytes = new byte[512];
	 
	            while ((cnt = fis.read(bytes)) != -1) {
	                os.write(bytes, 0, cnt);
	            }
	 
	            fis.close();
	            os.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}
	
	@RequestMapping("/sl/collectInfo/vision/deleteVision.do")
	public String deleteVision(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		visionService.deleteVision(map);
		visionService.updateState2(map);
		redirectAttributes.addFlashAttribute("msg", "삭제 되었습니다.");
		return "redirect:/sl/collectInfo/vision/visionList.do";
	}
	
	
		
	
	
	
}
