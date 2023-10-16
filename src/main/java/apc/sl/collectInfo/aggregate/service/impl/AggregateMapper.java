package apc.sl.collectInfo.aggregate.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("AggregateMapper")
public interface AggregateMapper {

	List<?> selectEstimateList(SearchVO searchVO);

	List<?> selectOrdersList(SearchVO searchVO);

	List<?> selectDeliveryList(SearchVO searchVO);

	List<?> selectCollectList(SearchVO searchVO);

}
