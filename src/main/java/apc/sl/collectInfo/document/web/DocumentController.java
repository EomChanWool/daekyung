package apc.sl.collectInfo.document.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sun.mail.handlers.multipart_mixed;

import apc.sl.collectInfo.document.service.DocumentService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class DocumentController {
	@Autowired
	private DocumentService documentService;
	
	private String filePath = "C:\\jungin\\document\\";
	
	@RequestMapping("/sl/sales/document/documentList.do")
	public String documentList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = documentService.selectDocumentListToCnt(searchVO);
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
		List<?> documentList = documentService.selectDocumentList(searchVO);
		model.put("documentList", documentList);
		model.put("paginationInfo", paginationInfo);
		return "sl/sales/document/documentList";
	}
	
	@RequestMapping("/sl/sales/document/registDocument.do")
	public String registDocumnet() {
		return "sl/sales/document/documentRegist";
	}
	
	@RequestMapping("/sl/sales/document/registDocumentOk.do")
	public String registDocumentOk(@ModelAttribute("searchVO") SearchVO searchVO, @RequestParam Map<String, Object> map, 
					RedirectAttributes redirectAttributes, HttpSession session, MultipartFile multipart) throws Exception {
		MultipartFile uploadFile = searchVO.getUploadFile();
		String fileName = "";
		if(!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
            String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
            UUID uuid = UUID.randomUUID(); // UUID 구하기
            fileName = uuid + "." + ext;
			uploadFile.transferTo(new File(filePath + fileName + ""));
		}
		map.put("doFilNm",fileName);
		map.put("orginFileName", uploadFile.getOriginalFilename());
		map.put("userId", session.getAttribute("user_id"));
		documentService.registDocument(map);
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/sales/document/documentList.do";
	}
	
	@RequestMapping("/sl/sales/document/modifyDocument.do")
	public String modifyDocument(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = documentService.selectDocumentInfo(map);
		model.put("documentVO", detail);
		return "sl/sales/document/documentModify";
	}
	
	@RequestMapping("/sl/sales/document/modifyDocumentOk.do")
	public String modifyDocumentOk(@ModelAttribute("searchVO") SearchVO searchVO, @RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) throws Exception {
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
			File file = new File(filePath + "\\" + curFileName);
			if(file.exists()) {
				file.delete();
			}
		}
		map.put("userId", session.getAttribute("user_id"));
		documentService.modifyDocument(map);
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		
		return "redirect:/sl/sales/document/documentList.do";
	}
	
	@RequestMapping("/sl/sales/document/detailDocument.do")
	public String detailDocument(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = documentService.selectDocumentInfo(map);
		model.put("documentVO", detail);
		return "sl/sales/document/documentDetail";
	}
	
	@RequestMapping("/sl/sales/document/downloadDocument.do")
	public void downloadDocument(HttpServletRequest request, HttpServletResponse response) throws Exception{
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
	
	@RequestMapping("/sl/sales/document/deleteDocument.do")
	public String deleteDocument(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		documentService.deleteDocument(map);
		String path = "C:\\jungin\\";
		File file = new File(path + "\\" + map.get("doFilNm"));
		if(file.exists()) {
			file.delete();
		}
		return "redirect:/sl/sales/document/documentList.do";
	}
	
}
