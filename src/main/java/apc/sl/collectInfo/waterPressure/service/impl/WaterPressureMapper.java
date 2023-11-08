package apc.sl.collectInfo.waterPressure.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("WaterPressureMapper")
public interface WaterPressureMapper {

	int selectWaterPressureListToCnt(SearchVO searchVO);

	List<?> selectWaterPressureList(SearchVO searchVO);

	List<?> selectWaterPressureGraphList(SearchVO searchVO);

	List<?> selectDeliveryList();

	List<?> selectDeliveryInfo(Map<String, Object> map);


	int selectAlreadyRegistDeIdx(Map<String, Object> map);

	void registWaterPressure(Map<String, Object> map);

	Map<String, Object> selectCollectInfo(Map<String, Object> map);

	void modifyWaterPressure(Map<String, Object> map);

	void updateDelivery(Map<String, Object> map);

	void deleteCollect(Map<String, Object> map);

}
