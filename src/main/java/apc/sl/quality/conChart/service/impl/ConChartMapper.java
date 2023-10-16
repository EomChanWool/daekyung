package apc.sl.quality.conChart.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("ConChartMapper")
public interface ConChartMapper {

	int selectConChartListToCnt(SearchVO searchVO);

	List<?> selectConChartList(SearchVO searchVO);

}
