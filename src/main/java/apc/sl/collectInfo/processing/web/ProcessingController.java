package apc.sl.collectInfo.processing.web;

import java.util.ArrayList;
import java.util.HashMap;
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

import apc.sl.collectInfo.processing.service.ProcessingService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ProcessingController {
	@Autowired
	private ProcessingService processingService;
	
	@RequestMapping("/sl/collectInfo/processing/processingList.do")
	public String processingList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = processingService.selectProcessingListToCnt(searchVO);
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
		List<?> processingList = processingService.selectProcessingList(searchVO);
		model.put("processingList", processingList);
		model.put("paginationInfo", paginationInfo);
		return "sl/collectInfo/processing/processingList";
	}
	
	@RequestMapping("/sl/collectInfo/processing/registProcessing.do")
	public String registProcessing(ModelMap model) {
		List<?> accountList = processingService.selectAccountList();
		model.put("accountList", accountList);
		List<?> companyList = processingService.selectCompanyList();
		model.put("companyList", companyList);
		List<?> prodList = processingService.selectProductList();
		model.put("prodList", prodList);
		return "sl/collectInfo/processing/processingRegist";
	}
	
	@RequestMapping("/sl/collectInfo/processing/registProcessingOk.do")
	public String registProcessingOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttribues, HttpSession session) {
		int num = 1;
		map.put("userId", session.getAttribute("user_id"));
		for(int i=1;i<=10;i++) {
			String itemCd = "itemCd"+i;
			String prod = "prod"+i;
			String cnt = "cnt"+i;
			String perPrice = "perPrice"+i;
			if(map.get(cnt) != null) {
				String item = "esItemCd"+num;
				String p = "esProd"+num;
				String c = "esCnt"+num;
				String pp = "esPerPrice"+num;
				map.put(item, map.get(itemCd));
				map.put(p, map.get(prod));
				if(!map.get(cnt).equals("")) {
					map.put(c, map.get(cnt));
				}else {
					map.put(c, 0);
				}
				map.put(pp, map.get(perPrice));
				num++;
				
				//제품 재고확인
				Map<String, Object> temp = new HashMap<>();
				temp.put("itemCd", map.get(itemCd));
				temp.put("cnt", map.get(cnt));
				int stockChk = processingService.selectProdStockChk(temp);
				if(stockChk == 0) {
					//재고 부족
					redirectAttribues.addFlashAttribute("msg", map.get(prod)+"의 재고가 부족합니다.");
					redirectAttribues.addFlashAttribute("processingVO", map);
					return "redirect:/sl/collectInfo/processing/registProcessing.do";
				}
			}
		}
		
		//등록시 견적서, 수주, 외주, 출하, 납품 순으로 등록
		//견적서 등록
		processingService.registEstimate(map);
		//수주 등록
		processingService.registProcessing(map);
		//외주 등록
		processingService.registOutSourcing(map);
		//출하 등록
		processingService.registShipment(map);
		//납품 등록
		processingService.registDelivery(map);
		
		for(int i=1;i<=10;i++) {
			String itemCd = "itemCd"+i;
			String cnt = "cnt"+i;
			
			if(map.get(cnt) != null) {
				if(!map.get(cnt).equals("")) {
					Map<String, Object> temp = new HashMap<>();
					temp.put("itemCd", map.get(itemCd));
					temp.put("cnt", "-"+map.get(cnt));
					processingService.updateItemCnt(temp);
				}
			}
		}
		
		redirectAttribues.addFlashAttribute("msg", "등록 되었습니다.");
		return "redirect:/sl/collectInfo/processing/processingList.do";
	}
	
	@RequestMapping("/sl/collectInfo/processing/modifyProcessing.do")
	public String modifyProcessing(@RequestParam Map<String, Object> map, ModelMap model) {
		List<?> accountList = processingService.selectAccountList();
		model.put("accountList", accountList);
		List<?> companyList = processingService.selectCompanyList();
		model.put("companyList", companyList);
		
		Map<String, Object> detail = processingService.selectProcessingInfo(map);
		model.put("processingVO", detail);
		List<Map<String, Object>> tempList = new ArrayList<>();
		for(int i=1;i<=10;i++) {
			Map<String, Object> tempMap = new HashMap<>();
			String item = "esItemCd"+i;
			String prod = "esProd"+i;
			String cnt = "esCnt"+i;
			String perPrice = "esPerPrice"+i;
			
			if(detail.get(prod) == null) break;
			
			tempMap.put("esItemCd", detail.get(item));
			tempMap.put("esProd", detail.get(prod));
			tempMap.put("esCnt", detail.get(cnt));
			tempMap.put("esPerPrice", detail.get(perPrice));
			tempList.add(tempMap);
		}
		model.put("prodList", tempList);
		return "sl/collectInfo/processing/processingModify";
	}
	
	@RequestMapping("/sl/collectInfo/processing/modifyProcessingOk.do")
	public String modifyProcessingOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		for(int i=1;i<=10;i++) {
			String itemCd = "itemCd"+i;
			String curCnt = "curCnt"+i;
			String cnt = "cnt"+i;
			if(map.get(itemCd) == null) break;
			
			int before = Integer.parseInt(map.get(curCnt)+"");
			int after = 0;
			if(!map.get(cnt).equals("")) {
				after = Integer.parseInt(map.get(cnt)+""); 
			}else {
				map.replace(cnt, after);
			}
			if(before-after != 0) {
				//수량이 변경 되었으면 재고 갱신
				Map<String, Object> temp = new HashMap<>();
				temp.put("itemCd", map.get(itemCd));
				temp.put("cnt", (before-after));
				processingService.updateItemCnt(temp);
			}
		}
		map.put("userId", session.getAttribute("user_id"));
		processingService.modifyProcessing(map);
		//견적서 수정
		processingService.modifyEstimate(map);
		
		redirectAttributes.addFlashAttribute("msg", "수정 되었습니다.");
		return "redirect:/sl/collectInfo/processing/processingList.do";
	}
	
	@RequestMapping("/sl/collectInfo/processing/detailProcessing.do")
	public String detailProcessing(@RequestParam Map<String, Object> map, ModelMap model) {
		Map<String, Object> detail = processingService.selectProcessingInfo(map);
		model.put("processingVO", detail);
		List<Map<String, Object>> tempList = new ArrayList<>();
		for(int i=1;i<=10;i++) {
			Map<String, Object> tempMap = new HashMap<>();
			String item = "esItemCd"+i;
			String prod = "esProd"+i;
			String cnt = "esCnt"+i;
			String perPrice = "esPerPrice"+i;
			String pp = "pp"+i;
			
			if(detail.get(prod) == null) break;
			
			tempMap.put("esItemCd", detail.get(item));
			tempMap.put("esProd", detail.get(prod));
			tempMap.put("esCnt", detail.get(cnt));
			tempMap.put("esPerPrice", detail.get(perPrice));
			tempMap.put("pp", detail.get(pp));
			tempList.add(tempMap);
		}
		model.put("prodList", tempList);
		
		return "sl/collectInfo/processing/processingDetail";
	}
	
	@RequestMapping("/sl/collectInfo/processing/deleteProcessing.do")
	public String deleteProcessing(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		//납품 삭제
		processingService.deleteDelivery(map);
		//출하계획 삭제
		processingService.deleteShipment(map);
		//외주 삭제
		processingService.deleteOutSourcing(map);
		//수주 삭제
		processingService.deleteProcessing(map);
		//견적서 삭제
		processingService.deleteEstimate(map);
		
		redirectAttributes.addFlashAttribute("msg", "삭제 되었습니다.");
		return "redirect:/sl/collectInfo/processing/processingList.do";
	}
}
