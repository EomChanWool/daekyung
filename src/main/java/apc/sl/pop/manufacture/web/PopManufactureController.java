package apc.sl.pop.manufacture.web;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.net.PrintCommandListener;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import apc.sl.pop.manufacture.service.PopManufactureService;
import apc.util.SearchVO;
import egovframework.rte.fdl.filehandling.EgovFileUtil;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class PopManufactureController {
	
	FTPClient ftp = null;
	
	@Autowired
	private PopManufactureService popManufactureService;
	
	@RequestMapping("/sl/pop/popMf/popMfList.do")
	public String popManufactureList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		
		if(searchVO.getSearchKeyword().length() > 16) {
			String searSpilt = searchVO.getSearchKeyword().substring(0,16);
			searchVO.setSearchKeyword(searSpilt);
		}
		
		if(model.get("sear") != null) {
			Map<String, Object> temp = (Map<String, Object>) model.get("sear");
			searchVO.setSearchKeyword(temp.get("searchKeyword")+"");	
		}
		int totCnt = popManufactureService.selectMfListToCnt(searchVO);
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
		List<?> ordList = popManufactureService.selectMfList(searchVO);
		List<?> mfmList = popManufactureService.selectMfManager();
		model.put("mfmList", mfmList);
		model.put("ordList", ordList);
		model.put("paginationInfo", paginationInfo);
		
		
		return "sl/pop/popManufacture/popManufactureList";
	}
	
	@RequestMapping(value="/sl/pop/popMf/goMf.do" , method=RequestMethod.POST)
	public String goManufacture(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		if(!map.get("searchKeyword").equals("")) {
			redirectAttributes.addFlashAttribute("sear",map);
		}
		map.put("userId", session.getAttribute("user_id"));
		
		popManufactureService.registMfLog(map);
		popManufactureService.updateOrState(map);
		
		return "redirect:/sl/pop/popMf/popMfList.do";
	}
	
	@RequestMapping(value="/sl/pop/popMf/reMf.do" , method=RequestMethod.POST)
	public String reManufacture(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		if(!map.get("searchKeyword").equals("")) {
			redirectAttributes.addFlashAttribute("sear",map);
		}
		map.put("userId", session.getAttribute("user_id"));
		
		popManufactureService.updateMfStopLog2(map);
		
		return "redirect:/sl/pop/popMf/popMfList.do";
	}
	
	@RequestMapping(value="/sl/pop/popMf/stopMf.do" , method=RequestMethod.POST)
	public String stopManufacture(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		if(!map.get("searchKeyword").equals("")) {
			redirectAttributes.addFlashAttribute("sear",map);
		}
		map.put("userId", session.getAttribute("user_id"));
		
		popManufactureService.registMfStopLog(map);
		
		return "redirect:/sl/pop/popMf/popMfList.do";
	}
	
	@RequestMapping(value="/sl/pop/popMf/finishMf.do" , method=RequestMethod.POST)
	public String finishManufacture(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		if(!map.get("searchKeyword").equals("")) {
			redirectAttributes.addFlashAttribute("sear",map);
		}
		map.put("userId", session.getAttribute("user_id"));
		int checkProd = popManufactureService.selectCheckStop(map);
		if(checkProd != 0) {
			redirectAttributes.addFlashAttribute("msg", "공정을 재개하여 주십시오.");
			return "redirect:/sl/pop/popMf/popMfList.do";
			}
		redirectAttributes.addFlashAttribute("msg", "작업이 완료되었습니다.");
		popManufactureService.updateProcess3(map);
		popManufactureService.updateLogEdtime(map);
		
		int finish = popManufactureService.countFinish();
		
		String str = map.get("orId")+"";
		
		System.out.println("str : " + str);
		//txt파일 서버에 생성
		CreateFile(str);
		//ftp로 서버에 생성된 파일 전송후 서버에있는 파일 지우기
		open(finish);
		
		return "redirect:/sl/pop/popMf/popMfList.do";
	}
	
	private void CreateFile(String str) {
		Map<String,Object> outData = popManufactureService.outData(str);
		
		
		
		String fileName = "C:\\test\\Test2.txt";
		System.out.println("아웃데이터 : " + outData);
		
		try {
			BufferedWriter fw = new BufferedWriter(new FileWriter(fileName,true));
			
			fw.write(outData.toString()+",");
			fw.flush();
			fw.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	public void open(int finish) {
		
	    ftp = new FTPClient();
	    //default controlEncoding 값이 "ISO-8859-1" 때문에 한글 파일의 경우 파일명이 깨짐
	    //ftp server 에 저장될 파일명을 uuid 등의 방식으로 한글을 사용하지 않고 저장할 경우 UTF-8 설정이 따로 필요하지 않다.
	    ftp.setControlEncoding("UTF-8");
	    //PrintCommandListener 를 추가하여 표준 출력에 대한 명령줄 도구를 사용하여 FTP 서버에 연결할 때 일반적으로 표시되는 응답을 출력
	    ftp.addProtocolCommandListener(new PrintCommandListener(new PrintWriter(System.out), true));

	    try {
	        //ftp 서버 연결
	        ftp.connect("dkbend.iptime.org", 30431);

	        //ftp 서버에 정상적으로 연결되었는지 확인
	        int reply = ftp.getReplyCode();
	        if (!FTPReply.isPositiveCompletion(reply)) {
	            ftp.disconnect();
	            System.out.println("에러");
	        }

	        //socketTimeout 값 설정
	        ftp.setSoTimeout(1000);
	        //ftp 서버 로그인
	        ftp.login("signlab", "dk304316@");
	        //file type 설정 (default FTP.ASCII_FILE_TYPE)
	        ftp.setFileType(FTP.BINARY_FILE_TYPE);
	        //ftp Active모드 설정
	        ftp.enterLocalPassiveMode(); 
	            
	    } catch (IOException e) {
	        e.printStackTrace();
	        System.out.println("에러");
	    }
	    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	    Date now = new Date();
		String edDate = format.format(now);
	    
	    String append_fileName = "C:\\test\\Test2.txt";
	    
	    File append_file = new File(append_fileName);
	    
	    String fileName = "/textTest/test"+edDate+"_"+finish+".txt";
	   
	    System.out.println("");
		 try {
		FileInputStream inputStream = new FileInputStream(append_file);
		
		boolean result = ftp.appendFile(fileName, inputStream);
		
		inputStream.close();
		}
		 catch (Exception e) {
			e.printStackTrace();
		}
		 finally {
			 try {
				 EgovFileUtil.delete(append_file);
			        ftp.logout();
			        ftp.disconnect();
			        
			    } catch (IOException e) {
			        e.printStackTrace();
			        System.out.println("에러");
			    }
		}
		
	}
}
