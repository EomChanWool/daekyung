package apc.sl.facility.equipPrev.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("EquipPrevMapper")
public interface EquipPrevMapper {

	int selectEquipPrevListToCnt(SearchVO searchVO);

	List<?> selectEquipPrevList(SearchVO searchVO);

	List<?> selectEquipmentList();

	void failReportIscomp(Map<String, Object> map);

	void registEquipPrev(Map<String, Object> map);

	Map<String, Object> selectEquipPrevInfo(Map<String, Object> map);

	void modifyEquipPrev(Map<String, Object> map);

	void deleteEquipPrev(Map<String, Object> map);
}
