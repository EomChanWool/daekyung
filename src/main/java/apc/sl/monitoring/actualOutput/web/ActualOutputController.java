package apc.sl.monitoring.actualOutput.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import apc.sl.monitoring.actualOutput.service.ActualOutputService;
import apc.util.SearchVO;

@Controller
public class ActualOutputController {
	@Autowired
	private ActualOutputService actualOutputService;
	
	@RequestMapping("/sl/monitoring/actualOutput/actualOutput.do")
	public String actualOutput(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		
		if(searchVO.getSearchCondition().equals("")) {
			  searchVO.setSearchCondition(getYears().get("kiYear")+""); }
		model.put("date", getYears());
		
		
		List<?> prodCntList = actualOutputService.selectProdCnt(searchVO);
		model.put("prodCntList",prodCntList);
		System.out.println("프로드1 : " + prodCntList);
		
		List<?> prodCntList2 = actualOutputService.selectProdCnt2(searchVO);
		model.put("prodCntList2", prodCntList2);		
		System.out.println("프로드2 : " + prodCntList2);
		return "sl/monitoring/actualOutput/actualOutput";
	}
//	
	private Map<String, Object> getYears(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		Date now = new Date();
		int begin = Integer.parseInt(format.format(now))-3;
		int end = begin+5;
		Map<String, Object> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("kiYear", format.format(now));
		return map;
	}
}
