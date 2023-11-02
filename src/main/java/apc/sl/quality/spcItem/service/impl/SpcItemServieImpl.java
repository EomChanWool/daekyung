package apc.sl.quality.spcItem.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.quality.spcItem.service.SpcItemService;
import apc.util.SearchVO;
@Service
public class SpcItemServieImpl implements SpcItemService {
	@Resource
	private SpcItemMapper spcItemMapper;

	@Override
	public int selectSpcItemListToCnt(SearchVO searchVO) {
		return spcItemMapper.selectSpcItemListToCnt(searchVO);
	}

	@Override
	public List<?> selectSpcItemList(SearchVO searchVO) {
		return spcItemMapper.selectSpcItemList(searchVO);
	}

	@Override
	public List<?> selectAccountList() {
		return spcItemMapper.selectAccountList();
	}

	@Override
	public List<?> selectMaterialList() {
		return spcItemMapper.selectMaterialList();
	}

	@Override
	public List<?> selectItemInfo(Map<String, Object> map) {
		return spcItemMapper.selectItemInfo(map);
	}

	@Override
	public void registSpcItem(Map<String, Object> map) {
		spcItemMapper.registSpcItem(map);
	}

	@Override
	public void updateMaterialCnt(Map<String, Object> map) {
		spcItemMapper.updateMaterialCnt(map);
	}
	
	@Override
	public Map<String, Object> selectSpcItemInfo(Map<String, Object> map) {
		return spcItemMapper.selectSpcItemInfo(map);
	}

	@Override
	public void modifySpcItem(Map<String, Object> map) {
		spcItemMapper.modifySpcItem(map);
	}

	@Override
	public void deleteSpcItem(Map<String, Object> map) {
		spcItemMapper.deleteSpcItem(map);
	}

}
