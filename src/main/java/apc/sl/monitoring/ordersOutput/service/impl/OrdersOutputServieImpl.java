package apc.sl.monitoring.ordersOutput.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.monitoring.ordersOutput.service.OrdersOutputService;
import apc.util.SearchVO;
@Service
public class OrdersOutputServieImpl implements OrdersOutputService {
	@Resource
	private OrdersOutputMapper ordersOutputMapper;

	@Override
	public List<?> selectOrderOutputData(SearchVO searchVO) {
		return ordersOutputMapper.selectOrderOutputData(searchVO);
	}

	@Override
	public List<?> selectOrdersCnt(SearchVO searchVO) {
		return ordersOutputMapper.selectOrdersCnt(searchVO);
	}

	@Override
	public List<?> selectProdCnt(SearchVO searchVO) {
		return ordersOutputMapper.selectProdCnt(searchVO);
	}

	@Override
	public List<?> selectSales(SearchVO searchVO) {
		return ordersOutputMapper.selectSales(searchVO);
	}

}
