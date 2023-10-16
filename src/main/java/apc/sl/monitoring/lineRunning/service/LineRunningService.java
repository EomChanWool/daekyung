package apc.sl.monitoring.lineRunning.service;

import java.util.List;

import apc.util.SearchVO;

public interface LineRunningService {

	int selectLineRunningListToCnt(SearchVO searchVO);

	List<?> selectLineRunningList(SearchVO searchVO);
	
	List<?> selectDaqName();
	
	List<?> selectLineYear(SearchVO searchVO);
}
