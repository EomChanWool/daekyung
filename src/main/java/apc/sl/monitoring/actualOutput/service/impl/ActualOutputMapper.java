package apc.sl.monitoring.actualOutput.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("ActualOutputMapper")
public interface ActualOutputMapper {

	Map<String, Object> selectPressBendingCnt(Map<String, Object> map);

	Map<String, Object> selectPlcCnt();

	List<?> selectProdCnt(SearchVO searchVO);
	
	List<?> selectProdCnt2(SearchVO searchVO);

}
