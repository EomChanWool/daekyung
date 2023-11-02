package apc.sl.quality.shipment.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.quality.shipment.service.ShipmentService;
import apc.util.SearchVO;
@Service
public class ShipmentServieImpl implements ShipmentService {
	@Resource
	private ShipmentMapper shipmentMapper;

	@Override
	public int selectShipmentListToCnt(SearchVO searchVO) {
		return shipmentMapper.selectShipmentListToCnt(searchVO);
	}

	@Override
	public List<?> selectShipmentList(SearchVO searchVO) {
		return shipmentMapper.selectShipmentList(searchVO);
	}

	@Override
	public List<?> selectAccountList() {
		return shipmentMapper.selectAccountList();
	}

	@Override
	public List<?> selectAccountInfo(Map<String, Object> map) {
		return shipmentMapper.selectAccountInfo(map);
	}

	@Override
	public List<?> selectOrdersInfo(Map<String, Object> map) {
		return shipmentMapper.selectOrdersInfo(map);
	}

	@Override
	public List<?> selectOrderList() {
		return shipmentMapper.selectOrderList();
	}

	@Override
	public void registShipment(Map<String, Object> map) {
		shipmentMapper.registShipment(map);
	}

	@Override
	public int selectExistsOutSourcing(Map<String, Object> map) {
		return shipmentMapper.selectExistsOutSourcing(map);
	}

	@Override
	public void updateOrders(Map<String, Object> map) {
		shipmentMapper.updateOrders(map);
	}

	@Override
	public void updateDelivery(Map<String, Object> map) {
		shipmentMapper.updateDelivery(map);
	}

	@Override
	public Map<String, Object> selectShipmentInfo(Map<String, Object> map) {
		return shipmentMapper.selectShipmentInfo(map);
	}

	@Override
	public void modifyShipment(Map<String, Object> map) {
		shipmentMapper.modifyShipment(map);
	}

	@Override
	public void deleteShipment(Map<String, Object> map) {
		shipmentMapper.deleteShipment(map);
	}

}
