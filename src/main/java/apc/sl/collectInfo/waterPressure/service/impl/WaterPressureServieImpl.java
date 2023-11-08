package apc.sl.collectInfo.waterPressure.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.collectInfo.waterPressure.service.WaterPressureService;
import apc.util.SearchVO;
@Service
public class WaterPressureServieImpl implements WaterPressureService {
	@Resource
	private WaterPressureMapper waterPressureMapper;

	@Override
	public int selectWaterPressureListToCnt(SearchVO searchVO) {
		return waterPressureMapper.selectWaterPressureListToCnt(searchVO);
	}

	@Override
	public List<?> selectWaterPressureList(SearchVO searchVO) {
		return waterPressureMapper.selectWaterPressureList(searchVO);
	}
	@Override
	public List<?> selectWaterPressureGraphList(SearchVO searchVO) {
		return waterPressureMapper.selectWaterPressureGraphList(searchVO);
	}

	@Override
	public List<?> selectDeliveryList() {
		return waterPressureMapper.selectDeliveryList();
	}

	@Override
	public List<?> selectDeliveryInfo(Map<String, Object> map) {
		return waterPressureMapper.selectDeliveryInfo(map);
	}



	@Override
	public int selectAlreadyRegistDeIdx(Map<String, Object> map) {
		return waterPressureMapper.selectAlreadyRegistDeIdx(map);
	}

	@Override
	public void registWaterPressure(Map<String, Object> map) {
		waterPressureMapper.registWaterPressure(map);
	}

	@Override
	public Map<String, Object> selectCollectInfo(Map<String, Object> map) {
		return waterPressureMapper.selectCollectInfo(map);
	}

	@Override
	public void modifyWaterPressure(Map<String, Object> map) {
		waterPressureMapper.modifyWaterPressure(map);
	}

	@Override
	public void updateDelivery(Map<String, Object> map) {
		waterPressureMapper.updateDelivery(map);
	}

	@Override
	public void deleteCollect(Map<String, Object> map) {
		waterPressureMapper.deleteCollect(map);
	}

}
