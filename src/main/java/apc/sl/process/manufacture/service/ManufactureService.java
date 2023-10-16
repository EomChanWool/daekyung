package apc.sl.process.manufacture.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface ManufactureService {
	
	int selectManufactureListToCnt(SearchVO searchVO);
	
	List<?> selectManufactureList(SearchVO searchVO);
	
	List<?> selectMfManager();
	
	int countFinish();
	
	int selectCheckStop(Map<String, Object> map);
	
	Map<String, Object> selectInfo(Map<String,Object> map);
	
	int selctExistsOn(Map<String, Object> map);
	
	int selectExistsLot(Map<String, Object> map);
	
	void registMfLog(Map<String, Object> map);
	
	void updateOrState(Map<String, Object> map);
	
	void registManufacture(Map<String, Object> map);
	
	void registMfStopLog(Map<String, Object> map);
	
	void updateMfStopLog2(Map<String, Object> map);
	
	void updateProcess3(Map<String, Object> map);
	
	void updateLogEdtime(Map<String, Object> map);
	
	void modifyMfManager(Map<String, Object> map);
	
	Map<String, Object> selectCheck(Map<String, Object> map);
	
	Map<String, Object> selectMfInfo(Map<String, Object> map);
	
	Map<String,Object> outData(Map<String, Object> map);
	
	void modifyManufacture(Map<String, Object> map);
	
	void deleteManufacture(Map<String, Object> map);
	
	Map<String, Object> selectDetailManufacture(Map<String, Object> map);
	

}
