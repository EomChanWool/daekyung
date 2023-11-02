package apc.sl.facility.failRepair.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface FailRepairService {

	int selectFailRepairListToCnt(SearchVO searchVO);

	List<?> selectFailRepairList(SearchVO searchVO);

	List<?> selectFailList();

	void failReportIscomp(Map<String, Object> map);
	
	void registFailRepair(Map<String, Object> map);

	Map<String, Object> selectFailRepairInfo(Map<String, Object> map);

	void modifyFailRepair(Map<String, Object> map);

	void deleteFailRepair(Map<String, Object> map);

}
