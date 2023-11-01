package apc.sl.process.performance.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface PerformanceService {

	int selectPerformanceListToCnt(SearchVO searchVO);
	
	int checkOrid(Map<String, Object> map);
	
	int checkExists(Map<String, Object> map);

	List<?> selectPerformanceList(SearchVO searchVO);
	
	List<?> selectFmList();
	
	List<?> selectOrderList();
	
	List<?> performanceInfo(Map<String, Object> map);
	
	List<?> inspectList(Map<String, Object> map);
	
	void registcheckPr(Map<String, Object> map);

	Map<String, Object> selectCheckPrInfo(Map<String, Object> map);

	void modifyCheckPr(Map<String, Object> map);

	void deletePerformance(Map<String, Object> map);
}
