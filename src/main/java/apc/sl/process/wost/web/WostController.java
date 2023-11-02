package apc.sl.process.wost.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import apc.sl.process.wost.service.WostService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class WostController {
	@Autowired
	private WostService wostService;
	
	private String filePath = "C:\\jnb\\standard\\";
	
	@RequestMapping("/sl/quality/wost/wostList.do")
	public String wostList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session, MultipartFile multipart) throws Exception{
		int totCnt = wostService.selectWostListToCnt(searchVO);
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
		List<?> wostList = wostService.selectWostList(searchVO);
		model.put("wostList", wostList);
		model.put("paginationInfo", paginationInfo);
		return "sl/quality/wost/wostList";
	}
	
	@RequestMapping("/sl/quality/wost/registWost.do")
	public String registWost(ModelMap model) {
		return "sl/quality/wost/wostRegist";
	}
	
	@RequestMapping("/sl/quality/wost/registWostOk.do")
	public String registWostOk(@ModelAttribute("searchVO") SearchVO searchVO, @RequestParam Map<String, Object> map, 
													RedirectAttributes redirectAttributes, HttpSession session) throws Exception{
		System.out.println("확인 1 : " + map);
		MultipartFile uploadFile = searchVO.getUploadFile();
		String fileName = "";
		if(!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
            String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
            UUID uuid = UUID.randomUUID(); // UUID 구하기
            fileName = uuid + "." + ext;
            System.out.println(fileName);
			uploadFile.transferTo(new File(filePath + fileName + ""));
		}
		System.out.println("확인2");
		map.put("doFilNm",fileName);
		map.put("doOriginFilNm", uploadFile.getOriginalFilename());
		map.put("userId", session.getAttribute("user_id"));
		map.put("type", "작업표준서");
		
		wostService.registDocument(map);
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/quality/wost/wostList.do";
	}
	
	@RequestMapping("/sl/quality/wost/modifyWost.do")
	public String modifyWost(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = wostService.selectDocumentInfo(map);
		model.put("documentVO", detail);
		return "sl/quality/wost/wostModify";
	}
	
	@RequestMapping("/sl/quality/wost/modifyWostOk.do")
	public String modifyWostOk(@ModelAttribute("searchVO") SearchVO searchVO, @RequestParam Map<String, Object> map, 
														RedirectAttributes redirectAttributes, HttpSession session) throws Exception{
		String curFileName = map.get("doFilNm")+"";
		MultipartFile uploadFile = searchVO.getUploadFile();
		String fileName = "";
		map.put("doFilNm", "");
		map.put("orginFileName", "");
		if(!uploadFile.isEmpty()) {
			//파일이 변경되었으면
			String originalFileName = uploadFile.getOriginalFilename();
            String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
            UUID uuid = UUID.randomUUID(); // UUID 구하기
            fileName = uuid + "." + ext;
            uploadFile.transferTo(new File(filePath + fileName + ""));
			map.replace("doFilNm",fileName);
			map.replace("orginFileName", uploadFile.getOriginalFilename());
			
			//기존 파일 삭제
			File file = new File(filePath + "" + curFileName);
			if(file.exists()) {
				file.delete();
			}
		}
		map.put("userId", session.getAttribute("user_id"));
		wostService.modifyDocument(map);
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		return "redirect:/sl/quality/inst/instList.do";
	}
	
	@RequestMapping("/sl/quality/wost/detailWost.do")
	public String detailWost(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = wostService.selectDocumentInfo(map);
		model.put("documentVO", detail);
		return "sl/quality/wost/wostDetail";
	}
	
	@RequestMapping("/sl/quality/wost/downloadWost.do")
	public void downloadInst(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String filename = request.getParameter("fileName");
        String realFilename = "";
        try {
            String browser = request.getHeader("User-Agent");
            // 파일 인코딩
            if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
                filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
            } else {
                filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
            }
 
        } catch (UnsupportedEncodingException e) {
            System.out.println("UnsupportedEncodingException 발생");
        }
 
        realFilename = filePath + filename + "";
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
	
	@RequestMapping("/sl/quality/wost/deleteWost.do")
	public String deleteWost(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		//기존 파일 삭제
		File file = new File(filePath + map.get("doFilNm")+"");
		if(file.exists()) {
			file.delete();
		}
		
		wostService.deleteWost(map);
		redirectAttributes.addFlashAttribute("msg", "삭제 되었습니다.");
		return "redirect:/sl/quality/wost/wostList.do";
	}
}
