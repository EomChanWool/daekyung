package apc.sl.facility.failRepair.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("FailRepairMapper")
public interface FailRepairMapper {

	int selectFailRepairListToCnt(SearchVO searchVO);

	List<?> selectFailRepairList(SearchVO searchVO);

	List<?> selectFailList();

	void failReportIscomp(Map<String, Object> map);

	void registFailRepair(Map<String, Object> map);

	Map<String, Object> selectFailRepairInfo(Map<String, Object> map);

	void modifyFailRepair(Map<String, Object> map);

	void deleteFailRepair(Map<String, Object> map);
}
