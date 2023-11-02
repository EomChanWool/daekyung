package apc.sl.quality.spcSpec.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("SpcSpecMapper")
public interface SpcSpecMapper {

	int selectSpcSpecListToCnt(SearchVO searchVO);

	List<?> selectSpcSpecList(SearchVO searchVO);

	List<?> selectWorkOrderList();

	List<?> selectMaterialList();

	int selectMaterialStock(Map<String, Object> map);

	int selectExistsInsertInfo(Map<String, Object> map);

	void registSpcSpec(Map<String, Object> map);

	void updateMaterialStock(Map<String, Object> map);

	int selectSpcSpecWorkOrder(Map<String, Object> map);

	Map<String, Object> selectSpcSpecInfo(Map<String, Object> map);

	void modifySpcSpec(Map<String, Object> map);

	void deleteSpcSpec(Map<String, Object> map);

	void updateWorkOrder(Map<String, Object> map);

	void updateOrders(Map<String, Object> map);

	List<?> selectItemInfo(Map<String, Object> map);

	Map<String, Object> selectInMaterialsInfo(Map<String, Object> map);

	void updateInMaterial(Map<String, Object> map);

}
