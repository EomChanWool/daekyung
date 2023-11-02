package apc.sl.facility.facMaster.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface FacMasterService {

	int selectFacMasterListToCnt(SearchVO searchVO);

	List<?> selectFacMasterList(SearchVO searchVO);

	List<?> selectFacMasterList();

	void registFacMaster(Map<String, Object> map);

	Map<String, Object> selectFacMasterInfo(Map<String, Object> map);

	void modifyFacMaster(Map<String, Object> map);

	void deleteFacMaster(Map<String, Object> map);

	Map<String, Object> selectFacMasterStd(Map<String, Object> map);

}
