package apc.sl.pop.popCut.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface PopCutService {

	int selectCutListToCnt(SearchVO searchVO);

	List<?> selectCutList(SearchVO searchVO);
	
	

	void registAnalysisData(Map<String, Object> map);

	List<?> selectCutManager();
	
	
	void registCut(Map<String, Object> map);


	
	Map<String, Object> selectOrderState(Map<String, Object> map);


	int selectCheckStop(Map<String,Object> map);

	

	void updateCSStopLog2(Map<String, Object> map);
	
	void updateProcess2(Map<String, Object> map);
	
	void updateProcess3(Map<String, Object> map);
	
	void deleteProdResult(Map<String, Object> map);
	
	void updateOrState(Map<String, Object> map);
	
	void registCPLLog(Map<String, Object> map);
	
	void registCStopLog(Map<String, Object> map);
	
	void updateOrProcess3(Map<String, Object> map);
	
	void updateLogEdtime(Map<String,Object> map);

}
