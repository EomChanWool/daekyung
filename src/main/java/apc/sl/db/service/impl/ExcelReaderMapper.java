package apc.sl.db.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("ExcelReaderMapper")
public interface ExcelReaderMapper {

	void registdb(Map<String, Object> map);
	
	void registMm(Map<String, String> map);
	
	void registOrder(Map<String, String> map);
	
	void registRelease(Map<String, String> map);
	
	void registProc(Map<String, String> map);
	
	void updateMm(Map<String, Object> map);

	void deleteMm();
	
	void deletedb();
	
	void testRegist(Map<String,String> map);
	
	void registCutpro(Map<String,String> map);
	
	void registPi(Map<String, String> map);
	
	List<Map<String,Object>> outProList();
	
	Map<String, Object> inspCount(String edDate);
	
	List<Map<String, Object>> noUpList(String edDate);
	
	Map<String, Object> mfProc(String str);
	
	void registinspData(Map<String,Object> map);
	
	int checkjungbok(Map<String,String> map);
	
	Map<String,Object> idTestTime(Map<String,Object> map);
	
	int checkVision(Map<String,Object> map);
	
	void insFileStateUpdate(Map<String,Object> map);
	
	Map<String, Object> sublList(Map<String, String> map);

	Map<String, Object> clgoList(Map<String, String> map);
}
