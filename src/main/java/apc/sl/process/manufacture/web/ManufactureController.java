package apc.sl.process.manufacture.web;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import apc.sl.process.manufacture.service.ManufactureService;
import apc.util.SearchVO;
import egovframework.rte.fdl.filehandling.EgovFileUtil;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ManufactureController {

	FTPClient ftp = null;
	
	@Autowired
	private ManufactureService manufactureService;
	
	@RequestMapping("/sl/process/manufacture/manufactureList.do")
	public String ManufactureList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		
		
		if(searchVO.getSearchKeyword().length() > 17) {
			String searSpilt = searchVO.getSearchKeyword().substring(0,16);
			searchVO.setSearchKeyword(searSpilt);
		}
		if(model.get("sear") != null) {
			Map<String, Object> temp = (Map<String, Object>) model.get("sear");
			searchVO.setSearchKeyword(temp.get("searchKeyword")+"");	
		}
		int totCnt = manufactureService.selectManufactureListToCnt(searchVO);
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
		List<?> manufactureList = manufactureService.selectManufactureList(searchVO);
		List<?> mfmList = manufactureService.selectMfManager();
		model.put("mfmList", mfmList);
		model.put("manufactureList", manufactureList);
		model.put("paginationInfo", paginationInfo);
		
		return "sl/process/manufacture/manufactureList";
	}
	
	@RequestMapping(value="/sl/process/manufacture/goManufacture.do",method=RequestMethod.POST)
	public String goManufacture(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		if(!map.get("searchKeyword").equals("")) {
			redirectAttributes.addFlashAttribute("sear",map);
		}
		map.put("userId", session.getAttribute("user_id"));
		manufactureService.registMfLog(map);
		manufactureService.updateOrState(map);
		
		return "redirect:/sl/process/manufacture/manufactureList.do";
	}
	
	@RequestMapping(value="/sl/process/manufacture/reManufacture.do",method=RequestMethod.POST)
	public String reManufacture(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		if(!map.get("searchKeyword").equals("")) {
			redirectAttributes.addFlashAttribute("sear",map);
		}
		map.put("userId", session.getAttribute("user_id"));
		manufactureService.updateMfStopLog2(map);
		
		return "redirect:/sl/process/manufacture/manufactureList.do";
	}
	
	@RequestMapping(value="/sl/process/manufacture/stopManufacture.do",method=RequestMethod.POST)
	public String stopManufacture(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		if(!map.get("searchKeyword").equals("")) {
			redirectAttributes.addFlashAttribute("sear",map);
		}
		map.put("userId", session.getAttribute("user_id"));
		
		manufactureService.registMfStopLog(map);
		
		return "redirect:/sl/process/manufacture/manufactureList.do";
	}
	
	@RequestMapping(value="/sl/process/manufacture/finishManufacture.do",method=RequestMethod.POST)
	public String finishManufacture(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		if(!map.get("searchKeyword").equals("")) {
			redirectAttributes.addFlashAttribute("sear",map);
		}
		map.put("userId", session.getAttribute("user_id"));
		
		int checkProd = manufactureService.selectCheckStop(map);
		if(checkProd != 0) {
			
			redirectAttributes.addFlashAttribute("msg", "공정을 재개하여 주십시오.");
			return "redirect:/sl/process/manufacture/manufactureList.do";
			}
		redirectAttributes.addFlashAttribute("msg", "작업이 완료되었습니다.");
		manufactureService.updateProcess3(map);
		manufactureService.updateLogEdtime(map);
		int finish = manufactureService.countFinish();
		Map<String,Object> outData = manufactureService.outData(map);
		
		//txt파일 서버에 생성
			//	CreateFile(outData);
				//ftp로 서버에 생성된 파일 전송후 서버에있는 파일 지우기
			//	open(finish);
		return "redirect:/sl/process/manufacture/manufactureList.do";
	}
	
	
	
	@RequestMapping("/sl/process/manufacture/registManufacture.do")
	public String registManufacture(ModelMap model) {
		
		
		return "sl/process/manufacture/manufactureRegist";
	}
	
//	@RequestMapping(value="/sl/process/manufacture/manufactureInfoAjax.do", method=RequestMethod.POST)
//	public ModelAndView manufactureInfoAjax(@RequestParam Map<String, Object> map) {
//		ModelAndView mav = new ModelAndView();
//		Map<String, Object> list = manufactureService.selectInfo(map);
//		
//		mav.setViewName("jsonView");
//		mav.addObject("mf_ajax", list);
//		
//		return mav;
//	}
	
	
	@RequestMapping("/sl/process/manufacture/registManufactureOk.do")
	public String registManufactureOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
//		//mssql형식의 맞게 변환
//				String time1 = map.get("mpStarttime")+"";
//				String[] time11 = time1.split("T");
//				
//				String time111 = time11[0]+" "+time11[1]+":00";
//				String time2 = map.get("mpEndtime")+"";
//				
//				String[] time22 = time2.split("T");
//				
//				String time222 = time22[0] + " " + time22[1]+ ":00";
//				map.replace("mpStarttime",time111);
//				map.replace("mpEndtime", time222);
				//수주번호 중복체크
		int exists = manufactureService.selctExistsOn(map);
		
		if(exists == 0) {
			redirectAttributes.addFlashAttribute("msg", "없는 수주번호입니다.");
			return "redirect:/sl/process/manufacture/registManufacture.do";
		}
		
		map.put("userId", session.getAttribute("user_id"));
		manufactureService.registManufacture(map);
		redirectAttributes.addFlashAttribute("msg", "등록 되었습니다.");
		
		
		return "redirect:/sl/process/manufacture/manufactureList.do";
	}
	
	@RequestMapping("/sl/process/manufacture/modifyManufacture.do")
	public String modifyManufacture(@RequestParam Map<String, Object> map, ModelMap model) { 
		
		
		
		
		if(!map.isEmpty()) {
			List<?> mfmList = manufactureService.selectMfManager();
			model.put("mfmList", mfmList);
			Map<String, Object> detail = manufactureService.selectMfInfo(map);
			model.put("mfVO", detail);
		}
		
		return "sl/process/manufacture/manufactureModify";
	}
	
	@RequestMapping("/sl/process/manufacture/modifyManufactureOk.do")
	public String modifyManufactureOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
//		//mssql형식의 맞게 변환
//		String time1 = map.get("mpStarttime")+"";
//		String[] time11 = time1.split("T");
//		
//		String time111 = time11[0]+" "+time11[1]+":00";
//		String time2 = map.get("mpEndtime")+"";
//		
//		String[] time22 = time2.split("T");
//		
//		String time222 = time22[0] + " " + time22[1]+ ":00";
//		map.replace("mpStarttime",time111);
//		map.replace("mpEndtime", time222);
//		
//
		map.put("userId", session.getAttribute("user_id"));
		manufactureService.modifyManufacture(map);
		manufactureService.modifyMfManager(map);
		
		
		redirectAttributes.addFlashAttribute("msg", "수정 되었습니다");
		return "redirect:/sl/process/manufacture/manufactureList.do";
	}
	
	@RequestMapping("/sl/process/manufacture/deleteManufacture.do")
	public String deleteManufacture(@RequestParam Map<String, Object> map , RedirectAttributes redirectAttributes, HttpSession session) {
		manufactureService.deleteManufacture(map);
		
		redirectAttributes.addFlashAttribute("msg", "삭제 되었습니다.");
		
		return "redirect:/sl/process/manufacture/manufactureList.do";
	}
	
	@RequestMapping("/sl/process/manufacture/detailManufacture.do")
	public String detailManufacture(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = manufactureService.selectDetailManufacture(map);
		
		model.put("checkVO", detail);
		return "sl/process/manufacture/manufactureDetail";
	}
	
//	
//	private void CreateFile(Map<String,Object> outData) {
//		String fileName = "C:\\test\\Test2.txt";
//		
//		try {
//			BufferedWriter fw = new BufferedWriter(new FileWriter(fileName,true));
//			
//			fw.write(outData.toString()+",");
//			fw.flush();
//			fw.close();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		
//	}
	
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
