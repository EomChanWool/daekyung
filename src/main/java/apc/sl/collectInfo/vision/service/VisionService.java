package apc.sl.collectInfo.vision.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface VisionService {

	int selectVisionListToCnt(SearchVO searchVO);

	List<?> selectVisionList(SearchVO searchVO);

	List<?> selectShipmentList(Map<String, Object> map);

	List<?> excelAjax(Map<String, Object> map);
	
	List<?> procAjax(Map<String, Object> map);

	int selectShipmentIdx(Map<String, Object> map);

	List<?> selectEstimateProdList(Map<String, Object> map);

	int selectExistsShipment(Map<String, Object> map);

	Map<String, Object> selectStockOk(Map<String, Object> map);

	void updateItem(Map<String, Object> tempMap);

	void registVision(Map<String, Object> map);

	void updateShipment(Map<String, Object> map);

	void updateOrders(Map<String, Object> map);

	Map<String, Object> selectVisionInfo(Map<String, Object> map);

	void modifyVision(Map<String, Object> map);

	void deleteVision(Map<String, Object> map);

}
