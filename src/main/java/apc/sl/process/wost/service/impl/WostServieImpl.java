package apc.sl.process.wost.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.process.wost.service.WostService;
import apc.util.SearchVO;
@Service
public class WostServieImpl implements WostService {
	@Resource
	private WostMapper wostMapper;

	@Override
	public int selectWostListToCnt(SearchVO searchVO) {
		return wostMapper.selectWostListToCnt(searchVO);
	}

	@Override
	public List<?> selectWostList(SearchVO searchVO) {
		return wostMapper.selectWostList(searchVO);
	}

	@Override
	public void registDocument(Map<String, Object> map) {
		wostMapper.registDocument(map);
	}

	@Override
	public Map<String, Object> selectDocumentInfo(Map<String, Object> map) {
		return wostMapper.selectDocumentInfo(map);
	}

	@Override
	public void modifyDocument(Map<String, Object> map) {
		wostMapper.modifyDocument(map);
	}

	@Override
	public void deleteWost(Map<String, Object> map) {
		wostMapper.deleteWost(map);
	}
}
