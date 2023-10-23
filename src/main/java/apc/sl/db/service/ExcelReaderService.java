package apc.sl.db.service;

import java.util.List;
import java.util.Map;

public interface ExcelReaderService {

	void registdb(Map<String, Object> map);
	
	void registOrder(Map<String, String> map);
	
	void registMm(Map<String, String> map);
	
	void registRelease(Map<String, String> map);
	
	void registProc(Map<String, String> map);
	
	void updateMm(Map<String, String> map);
	
	void deletedb();
	
	void deleteMm();
	
	void testRegist(Map<String,String> map);
	
	Map<String, Object> inspCount(String edDate);
	
	List<Map<String, Object>> noUpList(String edDate);
	
	Map<String, Object> mfProc(String str);
	
	void registinspData(Map<String,Object> map);
	
}
