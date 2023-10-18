package apc.sl.kpi.kpiManagement.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.kpi.kpiManagement.service.KpiService;
import apc.util.SearchVO;
@Service
public class KpiServieImpl implements KpiService {
	@Resource
	private KpiMapper kpiMapper;

	@Override
	public int selectKpiListToCnt(SearchVO searchVO) {
		return kpiMapper.selectKpiListToCnt(searchVO);
	}

	@Override
	public List<?> selectKpiList(SearchVO searchVO) {
		return kpiMapper.selectKpiList(searchVO);
	}

	@Override
	public List<?> selectKpiGraphList(SearchVO searchVO) {
		return kpiMapper.selectKpiGraphList(searchVO);
	}

	@Override
	public List<?> selectErrorOutput(SearchVO searchVO) {
		return kpiMapper.selectErrorOutput(searchVO);
	}

	@Override
	public List<?> selectSales(SearchVO searchVO) {
		return kpiMapper.selectSales(searchVO);
	}

	@Override
	public int selectExistsKpi(Map<String, Object> map) {
		return kpiMapper.selectExistsKpi(map);
	}

	@Override
	public List<?> selectProdPerPriceInfo(Map<String, Object> map) {
		return kpiMapper.selectProdPerPriceInfo(map);
	}

	@Override
	public void registKpi(Map<String, Object> map) {
		kpiMapper.registKpi(map);
	}

	@Override
	public Map<String, Object> selectKpiInfo(Map<String, Object> map) {
		return kpiMapper.selectKpiInfo(map);
	}

	@Override
	public void modifyKpi(Map<String, Object> map) {
		kpiMapper.modifyKpi(map);
	}

	@Override
	public void deleteKpi(Map<String, Object> map) {
		kpiMapper.deleteKpi(map);
	}

	@Override
	public List<Map<String, Object>> selectWorktime(SearchVO searchVO) {
		return kpiMapper.selectWorktime(searchVO);
	}

	@Override
	public List<Map<String, Object>> selectWorkCnt(SearchVO searchVO) {
		return kpiMapper.selectWorkCnt(searchVO);
	}

	@Override
	public List<?> selectProdCnt(SearchVO searchVO) {
		return kpiMapper.selectProdCnt(searchVO);
	}

	@Override
	public List<?> selectLeadtime(SearchVO searchVO) {
		return kpiMapper.selectLeadtime(searchVO);
	}

	@Override
	public List<?> inspecPer(SearchVO searchVO) {
		return kpiMapper.inspecPer(searchVO);
	}

}
