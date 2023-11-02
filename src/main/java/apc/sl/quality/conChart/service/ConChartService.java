package apc.sl.quality.conChart.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface ConChartService {

	int selectConChartListToCnt(SearchVO searchVO);

	List<?> selectConChartList(SearchVO searchVO);

}
