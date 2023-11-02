package apc.sl.process.performance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.process.performance.service.PerformanceService;
import apc.util.SearchVO;
@Service
public class PerformanceServieImpl implements PerformanceService {
	@Resource
	private PerformanceMapper performanceMapper;

	@Override
	public int selectPerformanceListToCnt(SearchVO searchVO) {
		return performanceMapper.selectPerformanceListToCnt(searchVO);
	}

	@Override
	public List<?> selectPerformanceList(SearchVO searchVO) {
		return performanceMapper.selectPerformanceList(searchVO);
	}

	@Override
	public void registcheckPr(Map<String, Object> map) {
		performanceMapper.registcheckPr(map);
	}

	@Override
	public Map<String, Object> selectCheckPrInfo(Map<String, Object> map) {
		return performanceMapper.selectCheckPrInfo(map);
	}

	@Override
	public void modifyCheckPr(Map<String, Object> map) {
		performanceMapper.modifyCheckPr(map);
	}

	@Override
	public void deletePerformance(Map<String, Object> map) {
		performanceMapper.deletePerformance(map);
	}

	@Override
	public List<?> selectFmList() {
		return performanceMapper.selectFmList();
	}

	@Override
	public List<?> selectOrderList() {
		return performanceMapper.selectOrderList();
	}

	@Override
	public List<?> performanceInfo(Map<String, Object> map) {
		return performanceMapper.performanceInfo(map);
	}

	@Override
	public int checkOrid(Map<String, Object> map) {
		return performanceMapper.checkOrid(map);
	}

	@Override
	public List<?> inspectList(Map<String, Object> map) {
		return performanceMapper.inspectList(map);
	}

	@Override
	public int checkExists(Map<String, Object> map) {
		return performanceMapper.checkExists(map);
	}
}
