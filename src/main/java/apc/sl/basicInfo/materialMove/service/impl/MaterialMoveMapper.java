package apc.sl.basicInfo.materialMove.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("MaterialMoveMapper")
public interface MaterialMoveMapper {

	int selectMaterialMoveListToCnt(SearchVO searchVO);

	List<?> selectMaterialMoveList(SearchVO searchVO);

	void registMaterialMove(Map<String, Object> map);

	Map<String, Object> selectMaterialMoveInfo(Map<String, Object> map);

	void modifyMaterialMove(Map<String, Object> map);

	void deleteMaterialMove(Map<String, Object> map);

	int selectExistCode(Map<String, Object> map);
}
