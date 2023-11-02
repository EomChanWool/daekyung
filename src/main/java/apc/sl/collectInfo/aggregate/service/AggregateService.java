package apc.sl.collectInfo.aggregate.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface AggregateService {

	List<?> selectEstimateList(SearchVO searchVO);

	List<?> selectOrdersList(SearchVO searchVO);

	List<?> selectDeliveryList(SearchVO searchVO);

	List<?> selectCollectList(SearchVO searchVO);

}
