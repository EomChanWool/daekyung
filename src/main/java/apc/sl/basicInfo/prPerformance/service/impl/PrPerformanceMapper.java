package apc.sl.basicInfo.prPerformance.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("PrPerformanceMapper")
public interface PrPerformanceMapper {
	
	int selectPrPerformanceToCnt(SearchVO searchVO);
	
	int selectExistsPrPer(Map<String, Object> map);
	
	List<?> selectPrPerformanceList(SearchVO searchVO);
	
	Map<String,Object> selectPrPerDetail(Map<String, Object> map);
	
	void registPrPerformance(Map<String, Object> map);
	
	void modifyPrPerformance(Map<String, Object> map);
	
	void deletePrPerfomance(Map<String, Object> map);
}
