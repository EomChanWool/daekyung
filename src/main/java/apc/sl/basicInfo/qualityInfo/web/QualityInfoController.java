package apc.sl.basicInfo.qualityInfo.web;

import java.util.HashMap;
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

import apc.sl.basicInfo.qualityInfo.service.QualityInfoService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class QualityInfoController {
	@Autowired
	private QualityInfoService qualityInfoService;
	
	@RequestMapping("/sl/basicInfo/qualityInfo/qualityInfoList.do")
	public String qualityInfoList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = qualityInfoService.selectQualityInfoToCnt(searchVO);
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
		List<?> qualityInfoList = qualityInfoService.selectQualityInfoList(searchVO);
		model.put("qualityInfoList", qualityInfoList);
		model.put("paginationInfo", paginationInfo);
		return "sl/basicInfo/qualityInfo/qualityInfoList";
	}
	
	@RequestMapping("/sl/basicInfo/qualityInfo/registQualityInfo.do")
	public String registQualityInfo(ModelMap model) {
		List<?> standardList = qualityInfoService.selectStandard();
		model.put("standardList", standardList);
		return "sl/basicInfo/qualityInfo/qualityInfoRegist";
	}
	
	@RequestMapping(value="/sl/basicInfo/qualityInfo/standardInfoAjax.do", method=RequestMethod.POST)
	public ModelAndView standardInfoAjax(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		List<?> list = qualityInfoService.selectStandardAjaxInfo(map);
		mav.setViewName("jsonView");
		mav.addObject("standard_ajax", list);
		return mav;
		
	}
	
	@RequestMapping("/sl/basicInfo/qualityInfo/registQualityInfoOk.do")
	public String registQualityInfoOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId",session.getAttribute("user_id"));
		
		
		
//		int exists = qualityInfoService.selectExistsQualInfo(map);
//		
//		
//		
//		if(exists == 1) {
//			redirectAttributes.addFlashAttribute("msg","이미등록된 정보입니다.");
//			return "redirect:/sl/basicInfo/qualityInfo/registQualityInfo.do";
//		}
		System.out.println(map);
		qualityInfoService.registQualityInfo(map);
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/basicInfo/qualityInfo/qualityInfoList.do";
	}
	
	@RequestMapping("/sl/basicInfo/qualityInfo/modifyQualityInfo.do")
	public String modifyQualityInfo(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = qualityInfoService.selectQualityInfoInfo(map);
		model.put("qualityInfoVO", detail);
		return "sl/basicInfo/qualityInfo/qualityInfoModify";
	}
	
	@RequestMapping("/sl/basicInfo/qualityInfo/modifyQualityInfoOk.do")
	public String modifyQualityInfoOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		qualityInfoService.modifyQualityInfo(map);
		redirectAttributes.addFlashAttribute("msg","수정 되었습니다.");
		return "redirect:/sl/basicInfo/qualityInfo/listStandard.do";
	}
	
	@RequestMapping("/sl/basicInfo/qualityInfo/detailQualityInfo.do")
	public String detailQualityInfo(@RequestParam Map<String, Object> map, ModelMap model) {
		
		Map<String, Object> detailQual = qualityInfoService.selectDetailQualInfo(map);
		model.put("detail", detailQual);
		return "sl/basicInfo/qualityInfo/qualityInfoDetail";
	}
	
	@RequestMapping("/sl/basicInfo/qualityInfo/deleteQualityInfo.do")
	public String deleteQualityInfo(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		qualityInfoService.deleteQualityInfo(map);
		
		List<Map<String,Object>> spcCodeList = qualityInfoService.spcCodeList(map);
		
		for(int i=0; i<spcCodeList.size(); i++) {
			Map<String,Object> codeMap = spcCodeList.get(i);
			qualityInfoService.deleteQualityInfo3(codeMap);
		}
		
		qualityInfoService.deleteQualityInfo2(map);
		redirectAttributes.addFlashAttribute("msg","삭제 되었습니다.");
		return "redirect:/sl/basicInfo/qualityInfo/qualityInfoList.do";
	}
	
	@RequestMapping("/sl/basicInfo/qualityInfo/listStandard.do")
	public String listStandard(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = qualityInfoService.selectStandardInfoToCnt(searchVO);
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
		List<?> standardList = qualityInfoService.selectStandardInfo(searchVO);
		
		model.put("standardList", standardList);
		model.put("paginationInfo", paginationInfo);
		return "sl/basicInfo/qualityInfo/standardList";
	}
	
	@RequestMapping("/sl/basicInfo/qualityInfo/registStandard.do")
	public String registStandard(ModelMap model) {
		
		List<?> sList = qualityInfoService.selectStandard();
		model.put("sList", sList);
		
		
		return "sl/basicInfo/qualityInfo/standardRegist";
	}
	@RequestMapping("/sl/basicInfo/qualityInfo/registStandardOk.do")
	public String registStandardOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		String type = "";
		//엘보우
		if(map.get("ithType").equals("90E(L)") || map.get("ithType").equals("90E(S)") || map.get("ithType").equals("45E(L)")) {
			type = "A";
			int codeNum = qualityInfoService.codeNum(type);
			String [] elbowItem = {"Od01","Id01","T1Bevel","BevelEnd","RootFace","ElbowA","OaQ","OpP"};
			
			spcDb(type,elbowItem,map,codeNum);
		}
		
		//TEE
		if(map.get("ithType").equals("T(S)") || map.get("ithType").equals("T(R)")) {
			
			type = "B";
			int codeNum = qualityInfoService.codeNum(type);
			String [] elbowItem = {"Od01","Od02","Id01","Id02","T1Bevel","T1Body","BevelEnd","RootFace","TeeC","TeeM","OaQ","OpP"};
			spcDb(type,elbowItem,map,codeNum);
		}
		//Reduce
		if(map.get("ithType").equals("R(C)") || map.get("ithType").equals("R(E)")) {
			
			type = "C";
			int codeNum = qualityInfoService.codeNum(type);
			String [] elbowItem = {"Od01","Od02","Id01","Id02","T1Bevel","T1Body","BevelEnd","RootFace","ReduH","OaQ"};
			spcDb(type,elbowItem,map,codeNum);
		}
		//CAP
		if(map.get("ithType").equals("CAP")) {
			
			type = "D";
			int codeNum = qualityInfoService.codeNum(type);
			String [] elbowItem = {"Od01","Id01","T1Bevel","BevelEnd","RootFace","CapE","OaQ"};
			spcDb(type,elbowItem,map,codeNum);
		}
		//STUD
		if(map.get("ithType").equals("STUD")) {
			
			type = "E";
			int codeNum = qualityInfoService.codeNum(type);
			String [] elbowItem = {"Od01","Od02","Id01","Id02","T1Bevel","T2Bevel","T1Body","T2Body","BevelEnd","RootFace","StubF","StubG","StubGt","StubR","OaQ","OpP"};
			spcDb(type,elbowItem,map,codeNum);
		}
		System.out.println("map: " + map.get("ithType"));
		qualityInfoService.registStandard(map);
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/basicInfo/qualityInfo/qualityInfoList.do";
	}
	@RequestMapping("/sl/basicInfo/qualityInfo/deleteStandard.do")
	public String deleteStandard(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		qualityInfoService.deleteStandardInfo(map);
		redirectAttributes.addFlashAttribute("msg","삭제 되었습니다.");
		return "redirect:/sl/basicInfo/qualityInfo/listStandard.do";
	}
	
	@RequestMapping("/sl/basicInfo/qualityInfo/modifySpcInfo.do")
	public String modifySpcInfo(@RequestParam Map<String,Object>map,ModelMap model) {
		
		
		Map<String,Object> spcInfo = qualityInfoService.selectSpcInfo(map);
		
		model.put("spcInfo", spcInfo);
		
		return "sl/basicInfo/qualityInfo/spcInfoModify";
	}
	
	@RequestMapping("/sl/basicInfo/qualityInfo/modifySpcInfoOk.do")
	public String modifySpcInfoOk(@RequestParam Map<String,Object>map,RedirectAttributes redirectAttributes) {
		
		System.out.println(map);
		
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/basicInfo/qualityInfo/qualityInfoList.do";
	}
	
	public void spcDb(String type, String[] item, Map<String,Object> map, int num) {
		
		Map<String,Object> temp = new HashMap<String, Object>();
		
		//spc_code테이블
		for(int i=0; i<item.length; i++) {
			temp.put("scCode",type+(num+i));
			temp.put("scProd",map.get("piId"));
			temp.put("scItem",item[i]);
			String Base = map.get("ssi"+item[i])+"";
			String Maxval = map.get("ssi"+item[i]+"Max")+"";
			String Minval = map.get("ssi"+item[i]+"Min")+"";
			
			temp.put("sulBaseVal", Base);
			temp.put("sulMaxVal", Maxval);
			temp.put("sulMinVal", Minval);
		
			
			qualityInfoService.spcCodeReg(temp);
			qualityInfoService.spcUpLowReg(temp);
			
		}
		
		
		
	}
}
