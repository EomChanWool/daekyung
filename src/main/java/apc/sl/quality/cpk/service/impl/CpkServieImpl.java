package apc.sl.quality.cpk.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.quality.cpk.service.CpkService;
import apc.util.SearchVO;
@Service
public class CpkServieImpl implements CpkService {
	@Resource
	private CpkMapper cpkMapper;

	@Override
	public int selectCpkListToCnt(SearchVO searchVO) {
		return cpkMapper.selectCpkListToCnt(searchVO);
	}

	@Override
	public List<?> selectCpkList(SearchVO searchVO) {
		return cpkMapper.selectCpkList(searchVO);
	}

	@Override
	public List<?> selectItemList(String type) {
		return cpkMapper.selectItemList(type);
	}

	@Override
	public List<?> selectItemCntInfo(Map<String, Object> map) {
		return cpkMapper.selectItemCntInfo(map);
	}

	@Override
	public int selectExistsItemCode(Map<String, Object> map) {
		return cpkMapper.selectExistsItemCode(map);
	}

	@Override
	public void registCpk(Map<String, Object> map) {
		cpkMapper.registCpk(map);
	}

	@Override
	public void updateItemCnt(Map<String, Object> map) {
		cpkMapper.updateItemCnt(map);
	}

	@Override
	public Map<String, Object> selectCpkInfo(Map<String, Object> map) {
		return cpkMapper.selectCpkInfo(map);
	}

	@Override
	public void modifyCpk(Map<String, Object> map) {
		cpkMapper.modifyCpk(map);
	}

	@Override
	public int selectChkRecent(Map<String, Object> map) {
		return cpkMapper.selectChkRecent(map);
	}

	@Override
	public void deleteCpk(Map<String, Object> map) {
		cpkMapper.deleteCpk(map);
	}

}
