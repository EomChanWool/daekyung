package apc.sl.collectInfo.vision.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.collectInfo.vision.service.VisionService;
import apc.util.SearchVO;
@Service
public class VisionServieImpl implements VisionService {
	@Resource
	private VisionMapper visionMapper;

	@Override
	public int selectVisionListToCnt(SearchVO searchVO) {
		return visionMapper.selectVisionListToCnt(searchVO);
	}

	@Override
	public List<?> selectVisionList(SearchVO searchVO) {
		return visionMapper.selectVisionList(searchVO);
	}


	@Override
	public List<?> excelAjax(Map<String, Object> map) {
		return visionMapper.excelAjax(map);
	}

	@Override
	public int selectShipmentIdx(Map<String, Object> map) {
		return visionMapper.selectShipmentIdx(map);
	}

	@Override
	public List<?> selectEstimateProdList(Map<String, Object> map) {
		return visionMapper.selectEstimateProdList(map);
	}

	@Override
	public int selectExistsShipment(Map<String, Object> map) {
		return visionMapper.selectExistsShipment(map);
	}

	@Override
	public void updateItem(Map<String, Object> tempMap) {
		visionMapper.updateItem(tempMap);
	}

	@Override
	public void registVision(Map<String, Object> map) {
		visionMapper.registVision(map);
	}

	@Override
	public void updateOrders(Map<String, Object> map) {
		visionMapper.updateOrders(map);
	}

	@Override
	public Map<String, Object> selectVisionInfo(Map<String, Object> map) {
		return visionMapper.selectVisionInfo(map);
	}

	@Override
	public void modifyVision(Map<String, Object> map) {
		visionMapper.modifyVision(map);
	}

	@Override
	public void deleteVision(Map<String, Object> map) {
		visionMapper.deleteVision(map);
	}

	@Override
	public List<?> procAjax(Map<String, Object> map) {
		return visionMapper.procAjax(map);
	}

	@Override
	public Map<String, Object> idTestTime(Map<String, Object> map) {
		return visionMapper.idTestTime(map);
	}

	@Override
	public void updateFileState(Map<String, Object> map) {
		visionMapper.updateFileState(map);
	}

	@Override
	public Map<String, Object> selectData(Map<String, Object> map) {
		return visionMapper.selectData(map);
	}

	@Override
	public void updateState2(Map<String, Object> map) {
		visionMapper.updateState2(map);
	}

}
