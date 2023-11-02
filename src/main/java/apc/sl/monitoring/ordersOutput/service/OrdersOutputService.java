package apc.sl.monitoring.ordersOutput.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface OrdersOutputService {

	List<?> selectOrderOutputData(SearchVO searchVO);

	List<?> selectOrdersCnt(SearchVO searchVO);

	List<?> selectProdCnt(SearchVO searchVO);

	List<?> selectSales(SearchVO searchVO);

}
