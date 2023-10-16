package apc.sl.monitoring.actualOutput.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface ActualOutputService {

	Map<String, Object> selectPressBendingCnt(Map<String, Object> map);

	Map<String, Object> selectPlcCnt();

	List<?> selectProdCnt(SearchVO searchVO);
	
	List<?> selectProdCnt2(SearchVO searchVO);

}
