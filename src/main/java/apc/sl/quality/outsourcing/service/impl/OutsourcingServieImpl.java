package apc.sl.quality.outsourcing.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.quality.outsourcing.service.OutsourcingService;
import apc.util.SearchVO;
@Service
public class OutsourcingServieImpl implements OutsourcingService {
	@Resource
	private OutsourcingMapper outsourcingMapper;

	@Override
	public int selectOutsourcingListToCnt(SearchVO searchVO) {
		return outsourcingMapper.selectOutsourcingListToCnt(searchVO);
	}

	@Override
	public List<?> selectOutsourcingList(SearchVO searchVO) {
		return outsourcingMapper.selectOutsourcingList(searchVO);
	}

	@Override
	public List<?> selectOrdersList() {
		return outsourcingMapper.selectOrdersList();
	}

	@Override
	public List<?> selectOrdersInfo(Map<String, Object> map) {
		return outsourcingMapper.selectOrdersInfo(map);
	}

	@Override
	public int selectExistsOrIdx(Map<String, Object> map) {
		return outsourcingMapper.selectExistsOrIdx(map);
	}

	@Override
	public int selectExistsShipment(Map<String, Object> map) {
		return outsourcingMapper.selectExistsShipment(map);
	}

	@Override
	public void registOutSourcing(Map<String, Object> map) {
		outsourcingMapper.registOutSourcing(map);
	}

	@Override
	public void updateOrders(Map<String, Object> map) {
		outsourcingMapper.updateOrders(map);
	}

	@Override
	public Map<String, Object> selectOutsourcingInfo(Map<String, Object> map) {
		return outsourcingMapper.selectOutsourcingInfo(map);
	}

	@Override
	public void modifyOutsourcing(Map<String, Object> map) {
		outsourcingMapper.modifyOutsourcing(map);
	}

	@Override
	public void deleteOutsourcing(Map<String, Object> map) {
		outsourcingMapper.deleteOutsourcing(map);
	}

}
