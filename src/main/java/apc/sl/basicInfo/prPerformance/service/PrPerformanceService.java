package apc.sl.basicInfo.prPerformance.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface PrPerformanceService {

	int selectPrPerformanceToCnt(SearchVO searchVO);
	
	int selectExistsPrPer(Map<String, Object> map);
	
	List<?> selectPrPerformanceList(SearchVO searchVO);
	
	Map<String,Object> selectPrPerDetail(Map<String, Object> map);
	
	void registPrPerformance(Map<String, Object> map);
	
	void modifyPrPerformance(Map<String, Object> map);
	
	void deletePrPerfomance(Map<String, Object> map);
}
