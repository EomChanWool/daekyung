package apc.sl.basicInfo.prPerformance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.basicInfo.prPerformance.service.PrPerformanceService;
import apc.util.SearchVO;

@Service
public class PrPerformanceServieImple implements PrPerformanceService {

	@Resource
	PrPerformanceMapper prPerformanceMapper;

	@Override
	public int selectPrPerformanceToCnt(SearchVO searchVO) {
		return prPerformanceMapper.selectPrPerformanceToCnt(searchVO);
	}

	@Override
	public List<?> selectPrPerformanceList(SearchVO searchVO) {
		return prPerformanceMapper.selectPrPerformanceList(searchVO);
	}

	@Override
	public void registPrPerformance(Map<String, Object> map) {
		prPerformanceMapper.registPrPerformance(map);
	}

	@Override
	public int selectExistsPrPer(Map<String, Object> map) {
		return prPerformanceMapper.selectExistsPrPer(map);
	}

	@Override
	public Map<String, Object> selectPrPerDetail(Map<String,Object> map) {
		return prPerformanceMapper.selectPrPerDetail(map);
	}

	@Override
	public void modifyPrPerformance(Map<String, Object> map) {
		prPerformanceMapper.modifyPrPerformance(map);
	}

	@Override
	public void deletePrPerfomance(Map<String, Object> map) {
		prPerformanceMapper.deletePrPerfomance(map);
	}
	
}
