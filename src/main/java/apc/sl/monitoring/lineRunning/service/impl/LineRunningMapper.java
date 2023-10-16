package apc.sl.monitoring.lineRunning.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("LineRunningMapper")
public interface LineRunningMapper {

	int selectLineRunningListToCnt(SearchVO searchVO);

	List<?> selectLineRunningList(SearchVO searchVO);
	
	List<?> selectDaqName();
	
	List<?> selectLineYear(SearchVO searchVO);

}
