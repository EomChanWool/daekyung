package apc.sl.collectInfo.aggregate.web;

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

import apc.sl.collectInfo.aggregate.service.AggregateService;
import apc.util.SearchVO;

@Controller
public class AggregateController {
	@Autowired
	private AggregateService aggregateService;
	
	@RequestMapping("/sl/sales/stateAggregate/stateAggregate.do")
	public String aggregate(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		if(searchVO.getSearchCondition().equals("")) {
			searchVO.setSearchCondition(getYears().get("exYear")+"");
		}
		
		Map<String, Object> map = getYears();
		model.put("date", map);
		
		//월별 견적건수
		List<?> estimateList = aggregateService.selectEstimateList(searchVO);
		model.put("estimateList", estimateList);
		//월별 수주건수(금액)
		List<?> ordersList = aggregateService.selectOrdersList(searchVO);
		model.put("ordersList", ordersList);
		//월별 납품건수(금액)
		List<?> deliveryList = aggregateService.selectDeliveryList(searchVO);
		model.put("deliveryList", deliveryList);
		//월별 수금건수(금액)
		List<?> collectList = aggregateService.selectCollectList(searchVO);
		model.put("collectList", collectList);
		
		return "sl/sales/aggregate/aggregate";
	}
	
	private Map<String, Object> getYears(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		Date now = new Date();
		int begin = Integer.parseInt(format.format(now))-40;
		int end = begin+50;
		Map<String, Object> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("exYear", format.format(now));
		return map;
	}
}
