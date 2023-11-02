package apc.sl.basicInfo.materialMove.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.basicInfo.materialMove.service.MaterialMoveService;
import apc.util.SearchVO;
@Service
public class MaterialMoveServieImpl implements MaterialMoveService {
	@Resource
	private MaterialMoveMapper materialMoveMapper;

	@Override
	public int selectMaterialMoveListToCnt(SearchVO searchVO) {
		return materialMoveMapper.selectMaterialMoveListToCnt(searchVO);
	}

	@Override
	public List<?> selectMaterialMoveList(SearchVO searchVO) {
		return materialMoveMapper.selectMaterialMoveList(searchVO);
	}

	@Override
	public void registMaterialMove(Map<String, Object> map) {
		materialMoveMapper.registMaterialMove(map);
	}

	@Override
	public Map<String, Object> selectMaterialMoveInfo(Map<String, Object> map) {
		return materialMoveMapper.selectMaterialMoveInfo(map);
	}

	@Override
	public void modifyMaterialMove(Map<String, Object> map) {
		materialMoveMapper.modifyMaterialMove(map);
	}

	@Override
	public void deleteMaterialMove(Map<String, Object> map) {
		materialMoveMapper.deleteMaterialMove(map);
	}

	@Override
	public int selectExistCode(Map<String, Object> map) {
		return materialMoveMapper.selectExistCode(map);
	}

}
