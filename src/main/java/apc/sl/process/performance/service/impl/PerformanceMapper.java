package apc.sl.process.performance.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("PerformanceMapper")
public interface PerformanceMapper {

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
