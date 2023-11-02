package apc.sl.pop.manufacture.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("PopManufactureMapper")
public interface PopManufactureMapper {
	
	int selectMfListToCnt(SearchVO searchVO);
	
	int selectCheckStop(Map<String, Object> map);
	
	List<?> selectMfList(SearchVO searchVO);
	
	List<?> selectMfManager();
	
	int countFinish();
	
	Map<String,Object> outData(String str);
	
	void registMfLog(Map<String, Object> map);
	
	void updateOrState(Map<String, Object> map);
	
	void updateMfStopLog2(Map<String, Object> map);
	
	void registMfStopLog(Map<String, Object> map);
	
	void updateProcess3(Map<String, Object> map);
	
	void updateLogEdtime(Map<String, Object> map);

}
