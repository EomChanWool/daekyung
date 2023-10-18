package apc.sl.process.inspect.web;

import java.awt.Font;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.formula.functions.EDate;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spire.xls.FileFormat;
import com.spire.xls.Workbook;

import apc.sl.process.inspect.service.InspectService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


@Controller
public class InspectController {

	@Autowired
	private InspectService inspectService;
	
	private String filePath = "C:\\test\\";
	
	@RequestMapping("/sl/process/inspect/inspectList.do")
	public String inspectList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		
		int totCnt = inspectService.selectInspectListToCnt(searchVO);
		
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
		
		List<?> inspectList = inspectService.selectInspectList(searchVO);
		
		
		model.put("inspectList", inspectList);
		model.put("paginationInfo", paginationInfo);
		
		
		return "sl/process/inspect/inspectList";
	}
	
	@RequestMapping("/sl/process/inspect/registInspect.do")
	public String registInspect(ModelMap model) {
		
		List<?> mfList = inspectService.selectMfList();
		
		List<?> siList = inspectService.selectSiList();
		
		model.put("siList", siList);
		
		model.put("mfList", mfList);
		
		return "sl/process/inspect/inspectRegist";
	}
	
	@RequestMapping(value="/sl/process/inspect/inspectInfoAjax.do", method=RequestMethod.POST)
	public ModelAndView inspectInfoAjax(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> list = inspectService.selectInfo(map);
		mav.setViewName("jsonView");
		mav.addObject("inInfo", list);
		
		return mav;
	}
	
	@RequestMapping(value="/sl/process/inspect/inspectInfoAjax2.do", method=RequestMethod.POST)
	public ModelAndView inspectInfoAjax2(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		List<?> list = inspectService.selectInfo2(map);
		mav.setViewName("jsonView");
		mav.addObject("inInfo2", list);
		
		return mav;
	}
	
	@RequestMapping("/sl/process/inspect/registInspectOk.do")
	public String registInspectOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		//검사번호 체크
//		int exists = inspectService.selectCheckIns(map);
//		if(exists != 0) {
//			redirectAttributes.addFlashAttribute("msg", "이미검사한 제품 입니다.");
//			return "redirect:/sl/process/inspect/registInspect.do";
//		}

		
		inspectService.registInspect(map);
		
		redirectAttributes.addFlashAttribute("msg", "등록 되었습니다.");
		
		return "redirect:/sl/process/inspect/inspectList.do";
	}
	
	@RequestMapping("/sl/process/inspect/modifyInspect.do")
	public String modifyInspect(@RequestParam Map<String,Object> map, ModelMap model) {
		
		Map<String, Object> list = inspectService.selectInco(map);
		
		//List<?> biList = inspectService.selectBiList();
		
		model.put("incoVO", list);
		//model.put("biList", biList);
		System.out.println("리스트 : " + list);
		
		return "sl/process/inspect/inspectModify";
	}
	
	@RequestMapping("/sl/process/inspect/modifyInspectOk.do")
	public String modifyInspectOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		inspectService.modifyInspect(map);
		
		redirectAttributes.addFlashAttribute("msg", "수정 되었습니다.");
		
		return "redirect:/sl/process/inspect/inspectList.do";
	}
	
	@RequestMapping("/sl/process/inspect/detailInspect.do")
	public String detailInspect(@RequestParam Map<String, Object> map,ModelMap model) {
		String type = map.get("isiItemType")+"";
		System.out.println(type);
		if(type.equals("90E(L)") || type.equals("90E(S)") || type.equals("45E(L)")) {
			Map<String, Object> detail = inspectService.detailInspec(map);
			model.put("detail", detail);
			String spcSpect = map.get("isiSpcSpec")+"";
			Map<String, Object> spcInfo = inspectService.spcInfo(spcSpect);
			model.put("spcInfo",spcInfo);
			String Edata = map.get("isiFile")+"";
			Map<String, Object> eDataInfo = inspectService.eDataInfo(Edata);
			model.put("eDataInfo", eDataInfo);
			model.put("cIsiFile", Edata);
			model.put("cFile", map.get("cFile"));
			return "sl/process/inspect/ElbowDetail";
		}
		if(type.equals("TEE")) {
			Map<String, Object> detail = inspectService.detailInspec(map);
			model.put("detail", detail);
			String spcSpect = map.get("isiSpcSpec")+"";
			Map<String, Object> spcInfo = inspectService.spcInfo(spcSpect);
			model.put("spcInfo",spcInfo);
			String Edata = map.get("isiFile")+"";
			Map<String, Object> eDataInfo = inspectService.eDataInfo(Edata);
			System.out.println(eDataInfo);
			model.put("eDataInfo", eDataInfo);
			model.put("cIsiFile", Edata);
			model.put("cFile", map.get("cFile"));
			return "sl/process/inspect/TeeDetail";
		}
		
		Map<String, Object> detail = inspectService.detailInspec(map);
		
		
		model.put("detail", detail);
		return "sl/process/inspect/inspectDetail";
	}
	
	@RequestMapping("/sl/process/inspect/updateStat.do")
	public String updateStat(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes) throws Exception {
		
		
		inspectService.updateStat(map);
		
		redirectAttributes.addFlashAttribute("msg", "판정이 완료되었습니다.");
		
		Map<String, Object> infoData =  inspectService.detailInspec(map);
		
		String type = infoData.get("isiItemType")+"";
		
		String itemName = infoData.get("isiFile1")+"";
		
		String Lotno = infoData.get("isiLotno")+"";
		
		String[] beFileName = itemName.split("-");
		
		String afterFileName = "C:\\test4\\" + beFileName[0]+"-"+Lotno +"-" +infoData.get("isiId")+""+".xlsx";
		String fileName = "C:\\test\\insEx.xlsx";
		
		String itemType = infoData.get("isiItemName")+"";
		String[] itemType2 = itemType.split(",");
		
		
		InputStream fis = new FileInputStream(fileName);
		XSSFWorkbook form_wb = new XSSFWorkbook(fis);
		
		String docNo = infoData.get("isiLotno")+""+"-"+infoData.get("isiId")+"";
		
		if(type.equals("90E(L)") || type.equals("90E(S)")) {
		
		setStyle2(form_wb, docNo ,2, 4);
		setStyle2(form_wb, infoData.get("isiItemType")+"" ,3, 4);
		setStyle2(form_wb, itemType2[1] ,4, 4);
		setStyle2(form_wb, infoData.get("isiLotno")+"" ,5, 4);
		setStyle2(form_wb, itemType2[2] ,3, 14);
		setStyle2(form_wb, itemType2[3] ,3, 19);
		setStyle2(form_wb, infoData.get("isiDate")+"" ,4, 14);
		
		setStyle2(form_wb, infoData.get("isiQty")+"" ,5, 14);
		
		Map<String,Object> specInfo = inspectService.spcInfo(itemType);
		
		setStyle(form_wb, specInfo.get("ssiOd01")+"" ,15, 5);
		setStyle(form_wb, specInfo.get("ssiOd01Max")+"" ,15, 8);
		setStyle(form_wb, specInfo.get("ssiOd01Min")+"" ,15, 10);
		
		
		setStyle(form_wb, specInfo.get("ssiId01")+"" ,19, 5);
		setStyle(form_wb, specInfo.get("ssiId01Max")+"" ,19, 8);
		setStyle(form_wb, specInfo.get("ssiId01Min")+"" ,19, 10);
		
		
		
		setStyle(form_wb, specInfo.get("ssiT1Bevel")+"" ,23, 5);
		setStyle(form_wb, specInfo.get("ssiT1BevelMin")+"" ,23, 10);
		
		setStyle(form_wb, specInfo.get("ssiT1Bevel")+"" ,27, 5);
		setStyle(form_wb, specInfo.get("ssiT1BevelMin")+"" ,27, 10);
		
		setStyle(form_wb, specInfo.get("ssiBevelEnd")+"" ,31, 5);
		setStyle(form_wb, specInfo.get("ssiBevelEndMax")+"" ,31, 8);
		setStyle(form_wb, specInfo.get("ssiBevelEndMin")+"" ,31, 8);
		
		setStyle(form_wb, specInfo.get("ssiElbowA")+"" ,33, 5);
		setStyle(form_wb, specInfo.get("ssiElbowAMax")+"" ,33, 8);
		setStyle(form_wb, specInfo.get("ssiElbowAMin")+"" ,33, 10);
		
		String isiFile;
		Map<String,Object> exInfo = new HashMap<String, Object>();
		for(int i =1; i<6; i++) {
			
			isiFile = infoData.get("isiFile"+i)+"";
			exInfo = inspectService.eDataInfo(isiFile);
			
			if(exInfo == null) {
				break;
			}
			
			if(i ==1) {
				
				setStyle(form_wb, exInfo.get("iehOd1")+""+","+exInfo.get("iehOd2")+"" ,15, 11);
				setStyle(form_wb, exInfo.get("iehOd3")+""+","+ exInfo.get("iehOd4")+"",16, 11);
				
				
				setStyle(form_wb, exInfo.get("iehId1")+""+","+exInfo.get("iehId2")+"" ,19, 11);
				setStyle(form_wb, exInfo.get("iehId3")+""+","+exInfo.get("iehId4")+""  ,20, 11);
				
				setStyle(form_wb, exInfo.get("iehT11")+""+","+exInfo.get("iehT12")+"" ,23, 13);
				setStyle(form_wb, exInfo.get("iehT13")+""+","+exInfo.get("iehT14")+"" ,24, 13);
				
				setStyle(form_wb, exInfo.get("iehT21")+""+","+exInfo.get("iehT22")+"" ,27, 13);
				setStyle(form_wb, exInfo.get("iehT23")+""+","+exInfo.get("iehT24")+"" ,28, 13);
				
				
				float arr[] = { Float.parseFloat(exInfo.get("iehBl11")+""),
						Float.parseFloat(exInfo.get("iehBl12")+""),
						Float.parseFloat(exInfo.get("iehBl13")+""),
						Float.parseFloat(exInfo.get("iehBl14")+""),
						Float.parseFloat(exInfo.get("iehBl21")+""),
						Float.parseFloat(exInfo.get("iehBl22")+""),
						Float.parseFloat(exInfo.get("iehBl23")+""),
						Float.parseFloat(exInfo.get("iehBl24")+"")};
				
				Arrays.sort(arr);
				float BlMax = arr[arr.length-1];
				float BlMin = arr[0];
				
				setStyle(form_wb, BlMax+","+BlMin ,31, 13);
				
				setStyle(form_wb, exInfo.get("iehA")+"" ,33, 13);
				
				
			}
			
			if(i ==2) {
				
				setStyle(form_wb, exInfo.get("iehOd1")+""+","+exInfo.get("iehOd2")+"" ,15, 13);
				setStyle(form_wb, exInfo.get("iehOd3")+""+","+ exInfo.get("iehOd4")+"",16, 13);
				
				
				setStyle(form_wb, exInfo.get("iehId1")+""+","+exInfo.get("iehId2")+"" ,19, 13);
				setStyle(form_wb, exInfo.get("iehId3")+""+","+exInfo.get("iehId4")+""  ,20, 13);
				
				setStyle(form_wb, exInfo.get("iehT11")+""+","+exInfo.get("iehT12")+"" ,23, 13);
				setStyle(form_wb, exInfo.get("iehT13")+""+","+exInfo.get("iehT14")+"" ,24, 13);
				
				setStyle(form_wb, exInfo.get("iehT21")+""+","+exInfo.get("iehT22")+"" ,27, 13);
				setStyle(form_wb, exInfo.get("iehT23")+""+","+exInfo.get("iehT24")+"" ,28, 13);
				
				
				float arr[] = { Float.parseFloat(exInfo.get("iehBl11")+""),
						Float.parseFloat(exInfo.get("iehBl12")+""),
						Float.parseFloat(exInfo.get("iehBl13")+""),
						Float.parseFloat(exInfo.get("iehBl14")+""),
						Float.parseFloat(exInfo.get("iehBl21")+""),
						Float.parseFloat(exInfo.get("iehBl22")+""),
						Float.parseFloat(exInfo.get("iehBl23")+""),
						Float.parseFloat(exInfo.get("iehBl24")+"")};
				
				Arrays.sort(arr);
				float BlMax = arr[arr.length-1];
				float BlMin = arr[0];
				
				setStyle(form_wb, BlMax+","+BlMin ,31, 13);
				
				setStyle(form_wb, exInfo.get("iehA")+"" ,33, 13);
				
				
			}
			
			if(i ==3) {
				
				setStyle(form_wb, exInfo.get("iehOd1")+""+","+exInfo.get("iehOd2")+"" ,15, 15);
				setStyle(form_wb, exInfo.get("iehOd3")+""+","+ exInfo.get("iehOd4")+"",16, 15);
				
				
				setStyle(form_wb, exInfo.get("iehId1")+""+","+exInfo.get("iehId2")+"" ,19, 15);
				setStyle(form_wb, exInfo.get("iehId3")+""+","+exInfo.get("iehId4")+""  ,20, 15);
				
				setStyle(form_wb, exInfo.get("iehT11")+""+","+exInfo.get("iehT12")+"" ,23, 15);
				setStyle(form_wb, exInfo.get("iehT13")+""+","+exInfo.get("iehT14")+"" ,24, 15);
				
				setStyle(form_wb, exInfo.get("iehT21")+""+","+exInfo.get("iehT22")+"" ,27, 15);
				setStyle(form_wb, exInfo.get("iehT23")+""+","+exInfo.get("iehT24")+"" ,28, 15);
				
				
				float arr[] = { Float.parseFloat(exInfo.get("iehBl11")+""),
						Float.parseFloat(exInfo.get("iehBl12")+""),
						Float.parseFloat(exInfo.get("iehBl13")+""),
						Float.parseFloat(exInfo.get("iehBl14")+""),
						Float.parseFloat(exInfo.get("iehBl21")+""),
						Float.parseFloat(exInfo.get("iehBl22")+""),
						Float.parseFloat(exInfo.get("iehBl23")+""),
						Float.parseFloat(exInfo.get("iehBl24")+"")};
				
				Arrays.sort(arr);
				float BlMax = arr[arr.length-1];
				float BlMin = arr[0];
				
				setStyle(form_wb, BlMax+","+BlMin ,31, 15);
				
				setStyle(form_wb, exInfo.get("iehA")+"" ,33, 15);
				
				
			}
			
			if(i ==4) {
				
				setStyle(form_wb, exInfo.get("iehOd1")+""+","+exInfo.get("iehOd2")+"" ,15, 17);
				setStyle(form_wb, exInfo.get("iehOd3")+""+","+ exInfo.get("iehOd4")+"",16, 17);
				
				
				setStyle(form_wb, exInfo.get("iehId1")+""+","+exInfo.get("iehId2")+"" ,19, 17);
				setStyle(form_wb, exInfo.get("iehId3")+""+","+exInfo.get("iehId4")+""  ,20, 17);
				
				setStyle(form_wb, exInfo.get("iehT11")+""+","+exInfo.get("iehT12")+"" ,23, 17);
				setStyle(form_wb, exInfo.get("iehT13")+""+","+exInfo.get("iehT14")+"" ,24, 17);
				
				setStyle(form_wb, exInfo.get("iehT21")+""+","+exInfo.get("iehT22")+"" ,27, 17);
				setStyle(form_wb, exInfo.get("iehT23")+""+","+exInfo.get("iehT24")+"" ,28, 17);
				
				
				float arr[] = { Float.parseFloat(exInfo.get("iehBl11")+""),
						Float.parseFloat(exInfo.get("iehBl12")+""),
						Float.parseFloat(exInfo.get("iehBl13")+""),
						Float.parseFloat(exInfo.get("iehBl14")+""),
						Float.parseFloat(exInfo.get("iehBl21")+""),
						Float.parseFloat(exInfo.get("iehBl22")+""),
						Float.parseFloat(exInfo.get("iehBl23")+""),
						Float.parseFloat(exInfo.get("iehBl24")+"")};
				
				Arrays.sort(arr);
				float BlMax = arr[arr.length-1];
				float BlMin = arr[0];
				
				setStyle(form_wb, BlMax+","+BlMin ,31, 17);
				
				setStyle(form_wb, exInfo.get("iehA")+"" ,33, 17);
				
				
			}
			
			if(i ==5) {
				
				setStyle(form_wb, exInfo.get("iehOd1")+""+","+exInfo.get("iehOd2")+"" ,15, 19);
				setStyle(form_wb, exInfo.get("iehOd3")+""+","+ exInfo.get("iehOd4")+"",16, 19);
				
				
				setStyle(form_wb, exInfo.get("iehId1")+""+","+exInfo.get("iehId2")+"" ,19, 19);
				setStyle(form_wb, exInfo.get("iehId3")+""+","+exInfo.get("iehId4")+""  ,20, 19);
				
				setStyle(form_wb, exInfo.get("iehT11")+""+","+exInfo.get("iehT12")+"" ,23, 19);
				setStyle(form_wb, exInfo.get("iehT13")+""+","+exInfo.get("iehT14")+"" ,24, 19);
				
				setStyle(form_wb, exInfo.get("iehT21")+""+","+exInfo.get("iehT22")+"" ,27, 19);
				setStyle(form_wb, exInfo.get("iehT23")+""+","+exInfo.get("iehT24")+"" ,28, 19);
				
				
				float arr[] = { Float.parseFloat(exInfo.get("iehBl11")+""),
						Float.parseFloat(exInfo.get("iehBl12")+""),
						Float.parseFloat(exInfo.get("iehBl13")+""),
						Float.parseFloat(exInfo.get("iehBl14")+""),
						Float.parseFloat(exInfo.get("iehBl21")+""),
						Float.parseFloat(exInfo.get("iehBl22")+""),
						Float.parseFloat(exInfo.get("iehBl23")+""),
						Float.parseFloat(exInfo.get("iehBl24")+"")};
				
				Arrays.sort(arr);
				float BlMax = arr[arr.length-1];
				float BlMin = arr[0];
				
				setStyle(form_wb, BlMax+","+BlMin ,31, 19);
				
				setStyle(form_wb, exInfo.get("iehA")+"" ,33, 19);
				
				
			}
			
			
			
			
			
		}}
		
		
		
		if(type.equals("TEE")) {
			
			setStyle2(form_wb, docNo ,2, 4);
			setStyle2(form_wb, infoData.get("isiItemType")+"" ,3, 4);
			setStyle2(form_wb, itemType2[1] ,4, 4);
			setStyle2(form_wb, infoData.get("isiLotno")+"" ,5, 4);
			setStyle2(form_wb, itemType2[2] ,3, 14);
			setStyle2(form_wb, itemType2[3] ,3, 19);
			setStyle2(form_wb, infoData.get("isiDate")+"" ,4, 14);
			
			setStyle2(form_wb, infoData.get("isiQty")+"" ,5, 14);
			
			Map<String,Object> specInfo = inspectService.spcInfo(itemType);
			
			setStyle(form_wb, specInfo.get("ssiOd01")+"" ,15, 5);
			setStyle(form_wb, specInfo.get("ssiOd01Max")+"" ,15, 8);
			setStyle(form_wb, specInfo.get("ssiOd01Min")+"" ,15, 10);
			setStyle(form_wb, specInfo.get("ssiOd02")+"" ,17, 5);
			setStyle(form_wb, specInfo.get("ssiOd02Max")+"" ,17, 8);
			setStyle(form_wb, specInfo.get("ssiOd02Min")+"" ,17, 10);
			
			setStyle(form_wb, specInfo.get("ssiId01")+"" ,19, 5);
			setStyle(form_wb, specInfo.get("ssiId01Max")+"" ,19, 8);
			setStyle(form_wb, specInfo.get("ssiId01Min")+"" ,19, 10);
			
			setStyle(form_wb, specInfo.get("ssiId02")+"" ,21, 5);
			setStyle(form_wb, specInfo.get("ssiId02Max")+"" ,21, 8);
			setStyle(form_wb, specInfo.get("ssiId02Min")+"" ,21, 10);
			
			setStyle(form_wb, specInfo.get("ssiT1Bevel")+"" ,23, 5);
			setStyle(form_wb, specInfo.get("ssiT1BevelMin")+"" ,23, 10);
			
			setStyle(form_wb, specInfo.get("ssiT1Body")+"" ,25, 5);
			setStyle(form_wb, specInfo.get("ssiT1BodyMin")+"" ,25, 9);
			
			setStyle(form_wb, specInfo.get("ssiT1Bevel")+"" ,27, 5);
			setStyle(form_wb, specInfo.get("ssiT1BevelMin")+"" ,27, 10);
			
			setStyle(form_wb, specInfo.get("ssiBevelEnd")+"" ,31, 5);
			setStyle(form_wb, specInfo.get("ssiBevelEndMax")+"" ,31, 8);
			setStyle(form_wb, specInfo.get("ssiBevelEndMin")+"" ,31, 8);
			
			setStyle(form_wb, specInfo.get("ssiTeeC")+"" ,36, 5);
			setStyle(form_wb, specInfo.get("ssiTeeCMax")+"" ,36, 8);
			setStyle(form_wb, specInfo.get("ssiTeeCMin")+"" ,36, 10);
			
			setStyle(form_wb, specInfo.get("ssiTeeM")+"" ,37, 5);
			setStyle(form_wb, specInfo.get("ssiTeeMMax")+"" ,37, 8);
			setStyle(form_wb, specInfo.get("ssiTeeMMin")+"" ,37, 10);
			
			String isiFile;
			Map<String,Object> exInfo = new HashMap<String, Object>();
			for(int i =1; i<6; i++) {
				
				isiFile = infoData.get("isiFile"+i)+"";
				exInfo = inspectService.eDataInfo(isiFile);
				
				if(exInfo == null) {
					break;
				}
				
				if(i ==1) {
					
					setStyle(form_wb, exInfo.get("iehOd1")+""+","+exInfo.get("iehOd2")+"" ,15, 11);
					setStyle(form_wb, exInfo.get("iehOd3")+""+","+ exInfo.get("iehOd4")+"",16, 11);
					setStyle(form_wb, exInfo.get("iehOd5")+""+","+ exInfo.get("iehOd6")+"" ,17, 11);
					
					setStyle(form_wb, exInfo.get("iehId1")+""+","+exInfo.get("iehId2")+"" ,19, 11);
					setStyle(form_wb, exInfo.get("iehId3")+""+","+exInfo.get("iehId4")+""  ,20, 11);
					setStyle(form_wb, exInfo.get("iehId5")+""+","+exInfo.get("iehId6")+""  ,21, 11);
					
					setStyle(form_wb, exInfo.get("iehT11")+""+","+exInfo.get("iehT12")+"" ,23, 11);
					setStyle(form_wb, exInfo.get("iehT13")+""+","+exInfo.get("iehT14")+"" ,24, 11);
					
					setStyle(form_wb, exInfo.get("iehT31")+""+","+exInfo.get("iehT32")+"" ,25, 11);
					setStyle(form_wb, exInfo.get("iehT33")+""+","+exInfo.get("iehT34")+"" ,26, 11);
					
					setStyle(form_wb, exInfo.get("iehT21")+""+","+exInfo.get("iehT22")+"" ,27, 11);
					setStyle(form_wb, exInfo.get("iehT23")+""+","+exInfo.get("iehT24")+"" ,28, 11);
					
					
					float arr[] = { Float.parseFloat(exInfo.get("iehBl11")+""),
							Float.parseFloat(exInfo.get("iehBl12")+""),
							Float.parseFloat(exInfo.get("iehBl13")+""),
							Float.parseFloat(exInfo.get("iehBl14")+""),
							Float.parseFloat(exInfo.get("iehBl21")+""),
							Float.parseFloat(exInfo.get("iehBl22")+""),
							Float.parseFloat(exInfo.get("iehBl23")+""),
							Float.parseFloat(exInfo.get("iehBl24")+""),
							Float.parseFloat(exInfo.get("iehBl31")+""),
							Float.parseFloat(exInfo.get("iehBl32")+""),
							Float.parseFloat(exInfo.get("iehBl33")+""),
							Float.parseFloat(exInfo.get("iehBl34")+"")};
					
					Arrays.sort(arr);
					float BlMax = arr[arr.length-1];
					float BlMin = arr[0];
					
					setStyle(form_wb, BlMax+","+BlMin ,31, 11);
					
					setStyle(form_wb, exInfo.get("iehC1")+""+","+exInfo.get("iehC2")+"" ,36, 11);
					setStyle(form_wb, exInfo.get("iehM1")+""+","+exInfo.get("iehM2")+"" ,37, 11);
					
					
				}
				
				if(i ==2) {
					
					setStyle(form_wb, exInfo.get("iehOd1")+""+","+exInfo.get("iehOd2")+"" ,15, 13);
					setStyle(form_wb, exInfo.get("iehOd3")+""+","+ exInfo.get("iehOd4")+"",16, 13);
					setStyle(form_wb, exInfo.get("iehOd5")+""+","+ exInfo.get("iehOd6")+"" ,17, 13);
					
					setStyle(form_wb, exInfo.get("iehId1")+""+","+exInfo.get("iehId2")+"" ,19, 13);
					setStyle(form_wb, exInfo.get("iehId3")+""+","+exInfo.get("iehId4")+""  ,20, 13);
					setStyle(form_wb, exInfo.get("iehId5")+""+","+exInfo.get("iehId6")+""  ,21, 13);
					
					setStyle(form_wb, exInfo.get("iehT11")+""+","+exInfo.get("iehT12")+"" ,23, 13);
					setStyle(form_wb, exInfo.get("iehT13")+""+","+exInfo.get("iehT14")+"" ,24, 13);
					
					setStyle(form_wb, exInfo.get("iehT31")+""+","+exInfo.get("iehT32")+"" ,25, 13);
					setStyle(form_wb, exInfo.get("iehT33")+""+","+exInfo.get("iehT34")+"" ,26, 13);
					
					setStyle(form_wb, exInfo.get("iehT21")+""+","+exInfo.get("iehT22")+"" ,27, 13);
					setStyle(form_wb, exInfo.get("iehT23")+""+","+exInfo.get("iehT24")+"" ,28, 13);
					
					
					float arr[] = { Float.parseFloat(exInfo.get("iehBl11")+""),
							Float.parseFloat(exInfo.get("iehBl12")+""),
							Float.parseFloat(exInfo.get("iehBl13")+""),
							Float.parseFloat(exInfo.get("iehBl14")+""),
							Float.parseFloat(exInfo.get("iehBl21")+""),
							Float.parseFloat(exInfo.get("iehBl22")+""),
							Float.parseFloat(exInfo.get("iehBl23")+""),
							Float.parseFloat(exInfo.get("iehBl24")+""),
							Float.parseFloat(exInfo.get("iehBl31")+""),
							Float.parseFloat(exInfo.get("iehBl32")+""),
							Float.parseFloat(exInfo.get("iehBl33")+""),
							Float.parseFloat(exInfo.get("iehBl34")+"")};
					
					Arrays.sort(arr);
					float BlMax = arr[arr.length-1];
					float BlMin = arr[0];
					
					setStyle(form_wb, BlMax+","+BlMin ,31, 13);
					
					setStyle(form_wb, exInfo.get("iehC1")+""+","+exInfo.get("iehC2")+"" ,36, 13);
					setStyle(form_wb, exInfo.get("iehM1")+""+","+exInfo.get("iehM2")+"" ,37, 13);
					
				}
				
				if(i ==3) {
					
					setStyle(form_wb, exInfo.get("iehOd1")+""+","+exInfo.get("iehOd2")+"" ,15, 15);
					setStyle(form_wb, exInfo.get("iehOd3")+""+","+ exInfo.get("iehOd4")+"",16, 15);
					setStyle(form_wb, exInfo.get("iehOd5")+""+","+ exInfo.get("iehOd6")+"" ,17, 15);
					
					setStyle(form_wb, exInfo.get("iehId1")+""+","+exInfo.get("iehId2")+"" ,19, 15);
					setStyle(form_wb, exInfo.get("iehId3")+""+","+exInfo.get("iehId4")+""  ,20, 15);
					setStyle(form_wb, exInfo.get("iehId5")+""+","+exInfo.get("iehId6")+""  ,21, 15);
					
					setStyle(form_wb, exInfo.get("iehT11")+""+","+exInfo.get("iehT12")+"" ,23, 15);
					setStyle(form_wb, exInfo.get("iehT13")+""+","+exInfo.get("iehT14")+"" ,24, 15);
					
					setStyle(form_wb, exInfo.get("iehT31")+""+","+exInfo.get("iehT32")+"" ,25, 15);
					setStyle(form_wb, exInfo.get("iehT33")+""+","+exInfo.get("iehT34")+"" ,26, 15);
					
					setStyle(form_wb, exInfo.get("iehT21")+""+","+exInfo.get("iehT22")+"" ,27, 15);
					setStyle(form_wb, exInfo.get("iehT23")+""+","+exInfo.get("iehT24")+"" ,28, 15);
					
					
					float arr[] = { Float.parseFloat(exInfo.get("iehBl11")+""),
							Float.parseFloat(exInfo.get("iehBl12")+""),
							Float.parseFloat(exInfo.get("iehBl13")+""),
							Float.parseFloat(exInfo.get("iehBl14")+""),
							Float.parseFloat(exInfo.get("iehBl21")+""),
							Float.parseFloat(exInfo.get("iehBl22")+""),
							Float.parseFloat(exInfo.get("iehBl23")+""),
							Float.parseFloat(exInfo.get("iehBl24")+""),
							Float.parseFloat(exInfo.get("iehBl31")+""),
							Float.parseFloat(exInfo.get("iehBl32")+""),
							Float.parseFloat(exInfo.get("iehBl33")+""),
							Float.parseFloat(exInfo.get("iehBl34")+"")};
					
					Arrays.sort(arr);
					float BlMax = arr[arr.length-1];
					float BlMin = arr[0];
					
					setStyle(form_wb, BlMax+","+BlMin ,31, 15);
					
					setStyle(form_wb, exInfo.get("iehC1")+""+","+exInfo.get("iehC2")+"" ,36, 15);
					setStyle(form_wb, exInfo.get("iehM1")+""+","+exInfo.get("iehM2")+"" ,37, 15);
					
					
				}
				
				if(i ==4) {
					
					setStyle(form_wb, exInfo.get("iehOd1")+""+","+exInfo.get("iehOd2")+"" ,15, 17);
					setStyle(form_wb, exInfo.get("iehOd3")+""+","+ exInfo.get("iehOd4")+"",16, 17);
					setStyle(form_wb, exInfo.get("iehOd5")+""+","+ exInfo.get("iehOd6")+"" ,17, 17);
					
					setStyle(form_wb, exInfo.get("iehId1")+""+","+exInfo.get("iehId2")+"" ,19, 17);
					setStyle(form_wb, exInfo.get("iehId3")+""+","+exInfo.get("iehId4")+""  ,20, 17);
					setStyle(form_wb, exInfo.get("iehId5")+""+","+exInfo.get("iehId6")+""  ,21, 17);
					
					setStyle(form_wb, exInfo.get("iehT11")+""+","+exInfo.get("iehT12")+"" ,23, 17);
					setStyle(form_wb, exInfo.get("iehT13")+""+","+exInfo.get("iehT14")+"" ,24, 17);
					
					setStyle(form_wb, exInfo.get("iehT31")+""+","+exInfo.get("iehT32")+"" ,25, 17);
					setStyle(form_wb, exInfo.get("iehT33")+""+","+exInfo.get("iehT34")+"" ,26, 17);
					
					setStyle(form_wb, exInfo.get("iehT21")+""+","+exInfo.get("iehT22")+"" ,27, 17);
					setStyle(form_wb, exInfo.get("iehT23")+""+","+exInfo.get("iehT24")+"" ,28, 17);
					
					
					float arr[] = { Float.parseFloat(exInfo.get("iehBl11")+""),
							Float.parseFloat(exInfo.get("iehBl12")+""),
							Float.parseFloat(exInfo.get("iehBl13")+""),
							Float.parseFloat(exInfo.get("iehBl14")+""),
							Float.parseFloat(exInfo.get("iehBl21")+""),
							Float.parseFloat(exInfo.get("iehBl22")+""),
							Float.parseFloat(exInfo.get("iehBl23")+""),
							Float.parseFloat(exInfo.get("iehBl24")+""),
							Float.parseFloat(exInfo.get("iehBl31")+""),
							Float.parseFloat(exInfo.get("iehBl32")+""),
							Float.parseFloat(exInfo.get("iehBl33")+""),
							Float.parseFloat(exInfo.get("iehBl34")+"")};
					
					Arrays.sort(arr);
					float BlMax = arr[arr.length-1];
					float BlMin = arr[0];
					
					setStyle(form_wb, BlMax+","+BlMin ,31, 17);
					
					setStyle(form_wb, exInfo.get("iehC1")+""+","+exInfo.get("iehC2")+"" ,36, 17);
					setStyle(form_wb, exInfo.get("iehM1")+""+","+exInfo.get("iehM2")+"" ,37, 17);
					
				}
				
				if(i ==5) {
					
					setStyle(form_wb, exInfo.get("iehOd1")+""+","+exInfo.get("iehOd2")+"" ,15, 19);
					setStyle(form_wb, exInfo.get("iehOd3")+""+","+ exInfo.get("iehOd4")+"",16, 19);
					setStyle(form_wb, exInfo.get("iehOd5")+""+","+ exInfo.get("iehOd6")+"" ,17, 19);
					
					setStyle(form_wb, exInfo.get("iehId1")+""+","+exInfo.get("iehId2")+"" ,19, 19);
					setStyle(form_wb, exInfo.get("iehId3")+""+","+exInfo.get("iehId4")+""  ,20, 19);
					setStyle(form_wb, exInfo.get("iehId5")+""+","+exInfo.get("iehId6")+""  ,21, 19);
					
					setStyle(form_wb, exInfo.get("iehT11")+""+","+exInfo.get("iehT12")+"" ,23, 19);
					setStyle(form_wb, exInfo.get("iehT13")+""+","+exInfo.get("iehT14")+"" ,24, 19);
					
					setStyle(form_wb, exInfo.get("iehT31")+""+","+exInfo.get("iehT32")+"" ,25, 19);
					setStyle(form_wb, exInfo.get("iehT33")+""+","+exInfo.get("iehT34")+"" ,26, 19);
					
					setStyle(form_wb, exInfo.get("iehT21")+""+","+exInfo.get("iehT22")+"" ,27, 19);
					setStyle(form_wb, exInfo.get("iehT23")+""+","+exInfo.get("iehT24")+"" ,28, 19);
					
					
					float arr[] = { Float.parseFloat(exInfo.get("iehBl11")+""),
							Float.parseFloat(exInfo.get("iehBl12")+""),
							Float.parseFloat(exInfo.get("iehBl13")+""),
							Float.parseFloat(exInfo.get("iehBl14")+""),
							Float.parseFloat(exInfo.get("iehBl21")+""),
							Float.parseFloat(exInfo.get("iehBl22")+""),
							Float.parseFloat(exInfo.get("iehBl23")+""),
							Float.parseFloat(exInfo.get("iehBl24")+""),
							Float.parseFloat(exInfo.get("iehBl31")+""),
							Float.parseFloat(exInfo.get("iehBl32")+""),
							Float.parseFloat(exInfo.get("iehBl33")+""),
							Float.parseFloat(exInfo.get("iehBl34")+"")};
					
					Arrays.sort(arr);
					float BlMax = arr[arr.length-1];
					float BlMin = arr[0];
					
					setStyle(form_wb, BlMax+","+BlMin ,31, 19);
					
					setStyle(form_wb, exInfo.get("iehC1")+""+","+exInfo.get("iehC2")+"" ,36, 19);
					setStyle(form_wb, exInfo.get("iehM1")+""+","+exInfo.get("iehM2")+"" ,37, 19);
					
					
				}
				
				
				
				
				
			}}
		
		
		FileOutputStream fileoutputstream = new FileOutputStream(afterFileName);
		
        
        form_wb.write(fileoutputstream);
        
        
        Map<String, Object> upMap = new HashMap<String, Object>();
        
        String afterFileImg = beFileName[0]+"-"+Lotno +"-"+infoData.get("isiId")+""+".pdf";
        
        upMap.put("isiId", infoData.get("isiId"));
        upMap.put("isiReportFile", afterFileName);
        upMap.put("isiReportImage", afterFileImg);
        inspectService.updateReportFileName(upMap);
        
        Workbook wb = new Workbook();
        wb.loadFromFile(afterFileName);
        
      //PDF로 저장함
        wb.saveToFile("C:\\test4\\"+afterFileImg,FileFormat.PDF);
		
		return "redirect:/sl/process/inspect/inspectList.do";
	}
	
	
	
	@RequestMapping("/sl/process/inspect/deleteInspect.do")
	public String deleteInspect(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		
		inspectService.deleteInspect(map);
		
	
		
		redirectAttributes.addFlashAttribute("msg","삭제 되었습니다.");
		return "redirect:/sl/process/inspect/inspectList.do";
	}
	
	public void setStyle(XSSFWorkbook form_wb, String str, int x, int y) throws Exception {
		
		
		
		//XSSFWorkbook form_wb = new XSSFWorkbook(fis);
        XSSFSheet form_sheet = form_wb.getSheetAt(0);
        CellStyle cellStyle = form_wb.createCellStyle();
	
        XSSFFont font = form_wb.createFont();
        font.setFontName("Cambria"); //폰트이름
        font.setFontHeight((short)160); //폰트 size -> 260 = 13point
        font.setBold(true); // Bold 설정
        cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
        cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
       
        cellStyle.setFont(font);
        
        form_sheet.getRow(x).getCell(y).setCellStyle(cellStyle);
        form_sheet.getRow(x).getCell(y).setCellValue(str);
        
        
        
	}
	
public void setStyle2(XSSFWorkbook form_wb, String str, int x, int y) throws Exception {
		
		
		
		//XSSFWorkbook form_wb = new XSSFWorkbook(fis);
        XSSFSheet form_sheet = form_wb.getSheetAt(0);
        CellStyle cellStyle = form_wb.createCellStyle();
	
        XSSFFont font = form_wb.createFont();
        font.setFontName("Cambria"); //폰트이름
        font.setFontHeight((short)220); //폰트 size -> 260 = 13point
        font.setBold(true); // Bold 설정
        cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
       
        cellStyle.setFont(font);
        
        form_sheet.getRow(x).getCell(y).setCellStyle(cellStyle);
        form_sheet.getRow(x).getCell(y).setCellValue(str);
        
        
        
	}

@RequestMapping("/sl/process/inspect/downloadInspect.do")
public void downloadInspect(HttpServletRequest request, HttpServletResponse response) {
	
	String filename = request.getParameter("fileName");
	 String realFilename = "";
//        try {
//            String browser = request.getHeader("User-Agent");
//            // 파일 인코딩
//            if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
//                filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
//            } else {
//                filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
//            }
// 
//        } catch (UnsupportedEncodingException e) {
//            System.out.println("UnsupportedEncodingException 발생");
//        }
	 
	 	String filePath2 = "C:\\test4\\";
 
        realFilename = filePath2 + filename;
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
}
