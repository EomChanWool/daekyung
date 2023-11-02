package apc.sl.monitoring.actualOutput.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.monitoring.actualOutput.service.ActualOutputService;
import apc.util.SearchVO;
@Service
public class ActualOutputServieImpl implements ActualOutputService {
	@Resource
	private ActualOutputMapper actualOutputMapper;

	@Override
	public Map<String, Object> selectPressBendingCnt(Map<String, Object> map) {
		return actualOutputMapper.selectPressBendingCnt(map);
	}

	@Override
	public Map<String, Object> selectPlcCnt() {
		return actualOutputMapper.selectPlcCnt();
	}

	@Override
	public List<?> selectProdCnt(SearchVO searchVO) {
		return actualOutputMapper.selectProdCnt(searchVO);
	}

	@Override
	public List<?> selectProdCnt2(SearchVO searchVO) {
		return actualOutputMapper.selectProdCnt2(searchVO);
	}

}
