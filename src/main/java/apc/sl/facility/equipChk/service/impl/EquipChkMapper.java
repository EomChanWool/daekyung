package apc.sl.facility.equipChk.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("EquipChkMapper")
public interface EquipChkMapper {

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
