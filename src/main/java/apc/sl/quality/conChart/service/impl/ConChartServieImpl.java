package apc.sl.quality.conChart.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.quality.conChart.service.ConChartService;
import apc.util.SearchVO;
@Service
public class ConChartServieImpl implements ConChartService {
	@Resource
	private ConChartMapper conChartMapper;

	@Override
	public int selectConChartListToCnt(SearchVO searchVO) {
		return conChartMapper.selectConChartListToCnt(searchVO);
	}

	@Override
	public List<?> selectConChartList(SearchVO searchVO) {
		return conChartMapper.selectConChartList(searchVO);
	}

}
