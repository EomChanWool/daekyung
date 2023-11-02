package apc.sl.collectInfo.aggregate.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.collectInfo.aggregate.service.AggregateService;
import apc.util.SearchVO;
@Service
public class AggregateServieImpl implements AggregateService {
	@Resource
	private AggregateMapper aggregateMapper;

	@Override
	public List<?> selectEstimateList(SearchVO searchVO) {
		return aggregateMapper.selectEstimateList(searchVO);
	}

	@Override
	public List<?> selectOrdersList(SearchVO searchVO) {
		return aggregateMapper.selectOrdersList(searchVO);
	}

	@Override
	public List<?> selectDeliveryList(SearchVO searchVO) {
		return aggregateMapper.selectDeliveryList(searchVO);
	}

	@Override
	public List<?> selectCollectList(SearchVO searchVO) {
		return aggregateMapper.selectCollectList(searchVO);
	}

}
