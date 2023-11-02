package apc.sl.facility.equipChk.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface EquipChkService {

	int selectEquipChkListToCnt(SearchVO searchVO);

	List<?> selectEquipChkList(SearchVO searchVO);

	List<?> selectEquipmentChkList();

	List<?> selectRegEquipmentChkList();

	void failReportIscomp(Map<String, Object> map);
	
	void registEquipChk(Map<String, Object> map);

	Map<String, Object> selectEquipChkInfo(Map<String, Object> map);

	void modifyEquipChk(Map<String, Object> map);

	void deleteEquipChk(Map<String, Object> map);

}
