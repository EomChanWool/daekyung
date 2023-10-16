package apc.sl.monitoring.lineRunning.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.monitoring.lineRunning.service.LineRunningService;
import apc.util.SearchVO;
@Service
public class LineRunningServieImpl implements LineRunningService {
	@Resource
	private LineRunningMapper lineRunningMapper;

	@Override
	public int selectLineRunningListToCnt(SearchVO searchVO) {
		return lineRunningMapper.selectLineRunningListToCnt(searchVO);
	}

	@Override
	public List<?> selectLineRunningList(SearchVO searchVO) {
		return lineRunningMapper.selectLineRunningList(searchVO);
	}

	@Override
	public List<?> selectLineYear(SearchVO searchVO) {
		return lineRunningMapper.selectLineYear(searchVO);
	}

	@Override
	public List<?> selectDaqName() {
		return lineRunningMapper.selectDaqName();
	}

}
