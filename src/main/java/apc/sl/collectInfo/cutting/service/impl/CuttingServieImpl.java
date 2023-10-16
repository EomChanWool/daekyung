package apc.sl.collectInfo.cutting.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.collectInfo.cutting.service.CuttingService;
import apc.util.SearchVO;
@Service
public class CuttingServieImpl implements CuttingService {
	@Resource
	private CuttingMapper cuttingMapper;

	@Override
	public int selectCuttingListToCnt(SearchVO searchVO) {
		return cuttingMapper.selectCuttingListToCnt(searchVO);
	}

	@Override
	public List<?> selectCuttingList(SearchVO searchVO) {
		return cuttingMapper.selectCuttingList(searchVO);
	}

	@Override
	public List<?> selectAccountList() {
		return cuttingMapper.selectAccountList();
	}

	@Override
	public List<?> selectProdList() {
		return cuttingMapper.selectProdList();
	}


	@Override
	public List<?> selectComapnyInfo(Map<String, Object> map) {
		return cuttingMapper.selectComapnyInfo(map);
	}

	@Override
	public List<?> selectProdPerPrice(Map<String, Object> map) {
		return cuttingMapper.selectProdPerPrice(map);
	}

	@Override
	public void registCutting(Map<String, Object> map) {
		cuttingMapper.registCutting(map);
	}
	
	@Override
	public void registCutting2(Map<String, Object> map) {
		cuttingMapper.registCutting2(map);
	}

	@Override
	public Map<String, Object> selectCuttingInfo(Map<String, Object> map) {
		return cuttingMapper.selectCuttingInfo(map);
	}

	@Override
	public void modifyCutting(Map<String, Object> map) {
		cuttingMapper.modifyCutting(map);
	}
	
	@Override
	public void modifyCutting2(Map<String, Object> map) {
		cuttingMapper.modifyCutting2(map);
	}

	@Override
	public void deleteCutting(Map<String, Object> map) {
		cuttingMapper.deleteCutting(map);
	}

	@Override
	public List<?> selectEqList() {
		return cuttingMapper.selectEqList();
	}

	@Override
	public int checkEq(Map<String, Object> map) {
		return cuttingMapper.checkEq(map);
	}

}
