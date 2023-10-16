package apc.sl.quality.spcSpec.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.quality.spcSpec.service.SpcSpecService;
import apc.util.SearchVO;
@Service
public class SpcSpecServieImpl implements SpcSpecService {
	@Resource
	private SpcSpecMapper spcSpecMapper;

	@Override
	public int selectSpcSpecListToCnt(SearchVO searchVO) {
		return spcSpecMapper.selectSpcSpecListToCnt(searchVO);
	}

	@Override
	public List<?> selectSpcSpecList(SearchVO searchVO) {
		return spcSpecMapper.selectSpcSpecList(searchVO);
	}

	@Override
	public List<?> selectWorkOrderList() {
		return spcSpecMapper.selectWorkOrderList();
	}

	@Override
	public List<?> selectMaterialList() {
		return spcSpecMapper.selectMaterialList();
	}

	@Override
	public int selectMaterialStock(Map<String, Object> map) {
		return spcSpecMapper.selectMaterialStock(map);
	}

	@Override
	public int selectExistsInsertInfo(Map<String, Object> map) {
		return spcSpecMapper.selectExistsInsertInfo(map);
	}

	@Override
	public void registSpcSpec(Map<String, Object> map) {
		spcSpecMapper.registSpcSpec(map);
	}

	@Override
	public void updateMaterialStock(Map<String, Object> map) {
		spcSpecMapper.updateMaterialStock(map);
	}

	@Override
	public void updateWorkOrder(Map<String, Object> map) {
		spcSpecMapper.updateWorkOrder(map);
	}

	@Override
	public void updateOrders(Map<String, Object> map) {
		spcSpecMapper.updateOrders(map);
	}
	
	@Override
	public int selectSpcSpecWorkOrder(Map<String, Object> map) {
		return spcSpecMapper.selectSpcSpecWorkOrder(map);
	}

	@Override
	public Map<String, Object> selectSpcSpecInfo(Map<String, Object> map) {
		return spcSpecMapper.selectSpcSpecInfo(map);
	}

	@Override
	public void modifySpcSpec(Map<String, Object> map) {
		spcSpecMapper.modifySpcSpec(map);
	}

	@Override
	public void deleteSpcSpec(Map<String, Object> map) {
		spcSpecMapper.deleteSpcSpec(map);
	}

	@Override
	public List<?> selectItemInfo(Map<String, Object> map) {
		return spcSpecMapper.selectItemInfo(map);
	}

	@Override
	public Map<String, Object> selectInMaterialsInfo(Map<String, Object> map) {
		return spcSpecMapper.selectInMaterialsInfo(map);
	}

	@Override
	public void updateInMaterial(Map<String, Object> map) {
		spcSpecMapper.updateInMaterial(map);
	}

}
