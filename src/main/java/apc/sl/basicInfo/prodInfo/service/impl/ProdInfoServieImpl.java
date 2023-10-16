package apc.sl.basicInfo.prodInfo.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.basicInfo.prodInfo.service.ProdInfoService;
import apc.util.SearchVO;
@Service
public class ProdInfoServieImpl implements ProdInfoService {
	@Resource
	private ProdInfoMapper prodInfoMapper;

	@Override
	public int selectProdInfoListToCnt(SearchVO searchVO) {
		return prodInfoMapper.selectProdInfoListToCnt(searchVO);
	}

	@Override
	public List<?> selectProdInfoList(SearchVO searchVO) {
		return prodInfoMapper.selectProdInfoList(searchVO);
	}

	@Override
	public void registProdInfo(Map<String, Object> map) {
		prodInfoMapper.registProdInfo(map);
	}

	@Override
	public Map<String, Object> selectProdInfoInfo(Map<String, Object> map) {
		return prodInfoMapper.selectProdInfoInfo(map);
	}

	@Override
	public void modifyProdInfo(Map<String, Object> map) {
		prodInfoMapper.modifyProdInfo(map);
	}

	@Override
	public void deleteProdInfo(Map<String, Object> map) {
		prodInfoMapper.deleteProdInfo(map);
	}
}
