package apc.sl.collectInfo.processing.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface ProcessingService {

	int selectProcessingListToCnt(SearchVO searchVO);
	
	int existPro(Map<String, Object> map);

	List<?> selectProcessingList(SearchVO searchVO);

	Map<String,Object> checkStop(Map<String, Object> map);
	
	Map<String,Object> processingAjax(Map<String,Object> map);
	
	Map<String, Object> processInfo(Map<String, Object> map);
	
	Map<String, Object> proState(Map<String, Object> map);
	
	List<?> prodList();
	
	void updatePro(Map<String,Object> map);
	
	void updateWorktime(Map<String,Object> map);
	
	void deletePro(Map<String, Object> map);
}
