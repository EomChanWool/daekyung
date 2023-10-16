package apc.sl.quality.spcSpec.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface SpcSpecService {

	int selectSpcSpecListToCnt(SearchVO searchVO);

	List<?> selectSpcSpecList(SearchVO searchVO);

	List<?> selectWorkOrderList();

	List<?> selectMaterialList();

	int selectMaterialStock(Map<String, Object> map);

	int selectExistsInsertInfo(Map<String, Object> map);

	void registSpcSpec(Map<String, Object> map);

	void updateMaterialStock(Map<String, Object> map);

	void updateWorkOrder(Map<String, Object> map);

	void updateOrders(Map<String, Object> map);

	int selectSpcSpecWorkOrder(Map<String, Object> map);

	Map<String, Object> selectSpcSpecInfo(Map<String, Object> map);

	void modifySpcSpec(Map<String, Object> map);

	void deleteSpcSpec(Map<String, Object> map);

	List<?> selectItemInfo(Map<String, Object> map);

	Map<String, Object> selectInMaterialsInfo(Map<String, Object> map);

	void updateInMaterial(Map<String, Object> map);

}
