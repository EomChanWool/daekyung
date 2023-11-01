package apc.sl.process.inspect.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface InspectService {
	
	int selectInspectListToCnt(SearchVO searchVO);
	
	int waterListToCnt(SearchVO searchVO);
	
	List<?> selectInspectList(SearchVO searchVO);
	
	List<?> waterList(SearchVO searchVO);
	
	List<?> selectMfList();
	
	List<?> selectInfo2(Map<String,Object> map);
	
	Map<String, Object> excelData(String str);
	
	Map<String, Object> selectInfo(Map<String, Object> map);
	
	Map<String, Object> detailInspec(Map<String, Object> map);
	
	Map<String, Object> spcInfo(String str);
	
	Map<String,Object> eDataInfo(String str);
	
	Map<String,Object> registSiId(Map<String,Object> map);
	
	
	int selectCheckIns(Map<String,Object> map);
	
	void registInspect(Map<String, Object> map);
	
	Map<String, Object> selectInco(Map<String, Object> map);
	
	void modifyInspect(Map<String, Object> map);
	
	void deleteInspect(Map<String, Object> map);
	
	void updateStat(Map<String, Object> map);
	
	void updateReportFileName(Map<String, Object> map);
	

}
