package apc.sl.quality.shipment.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("ShipmentMapper")
public interface ShipmentMapper {

	int selectShipmentListToCnt(SearchVO searchVO);

	List<?> selectShipmentList(SearchVO searchVO);

	List<?> selectAccountList();

	List<?> selectOrderList();

	List<?> selectAccountInfo(Map<String, Object> map);

	List<?> selectOrdersInfo(Map<String, Object> map);

	void registShipment(Map<String, Object> map);

	int selectExistsOutSourcing(Map<String, Object> map);

	void updateOrders(Map<String, Object> map);

	void updateDelivery(Map<String, Object> map);

	Map<String, Object> selectShipmentInfo(Map<String, Object> map);

	void modifyShipment(Map<String, Object> map);

	void deleteShipment(Map<String, Object> map);

}
