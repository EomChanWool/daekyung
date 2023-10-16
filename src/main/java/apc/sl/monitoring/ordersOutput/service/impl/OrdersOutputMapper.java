package apc.sl.monitoring.ordersOutput.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("OrdersOutputMapper")
public interface OrdersOutputMapper {

	List<?> selectOrderOutputData(SearchVO searchVO);

	List<?> selectOrdersCnt(SearchVO searchVO);

	List<?> selectProdCnt(SearchVO searchVO);

	List<?> selectSales(SearchVO searchVO);

}
