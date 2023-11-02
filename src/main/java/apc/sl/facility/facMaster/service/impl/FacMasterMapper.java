package apc.sl.facility.facMaster.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("FacMasterMapper")
public interface FacMasterMapper {

	int selectFacMasterListToCnt(SearchVO searchVO);

	List<?> selectFacMasterList(SearchVO searchVO);

	List<?> selectFacMasterList();

	void registFacMaster(Map<String, Object> map);

	Map<String, Object> selectFacMasterInfo(Map<String, Object> map);

	void modifyFacMaster(Map<String, Object> map);

	void deleteFacMaster(Map<String, Object> map);

	Map<String, Object> selectFacMasterStd(Map<String, Object> map);

}
