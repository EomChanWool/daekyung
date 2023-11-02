package apc.sl.pop.manufacture.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface PopManufactureService {
	
	int selectMfListToCnt(SearchVO searchVO);
	
	int selectCheckStop(Map<String, Object> map);
	
	List<?> selectMfList(SearchVO searchVO);
	
	List<?> selectMfManager();
	
	
	Map<String,Object> outData(String str);
	
	int countFinish();
	
	void registMfLog(Map<String, Object> map);

	void updateOrState(Map<String, Object> map);
	
	void updateMfStopLog2(Map<String, Object> map);
	
	void registMfStopLog(Map<String, Object> map);
	
	void updateProcess3(Map<String, Object> map);
	
	void updateLogEdtime(Map<String, Object> map);
}
