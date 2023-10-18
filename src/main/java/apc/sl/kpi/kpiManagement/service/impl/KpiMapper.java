package apc.sl.kpi.kpiManagement.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("KpiMapper")
public interface KpiMapper {

	int selectKpiListToCnt(SearchVO searchVO);

	List<?> selectKpiList(SearchVO searchVO);

	List<?> selectKpiGraphList(SearchVO searchVO);
	
	List<?> selectErrorOutput(SearchVO searchVO);

	List<?> selectSales(SearchVO searchVO);

	int selectExistsKpi(Map<String, Object> map);

	List<?> selectProdPerPriceInfo(Map<String, Object> map);

	void registKpi(Map<String, Object> map);

	Map<String, Object> selectKpiInfo(Map<String, Object> map);

	void modifyKpi(Map<String, Object> map);

	void deleteKpi(Map<String, Object> map);
	
	List<?> selectProdCnt(SearchVO searchVO);
	
	List<Map<String, Object>> selectWorktime(SearchVO searchVO);
	
	List<Map<String, Object>> selectWorkCnt(SearchVO searchVO);
	
	List<?> selectLeadtime(SearchVO searchVO);
	
	List<?> inspecPer(SearchVO searchVO);

}
