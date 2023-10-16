package apc.sl.collectInfo.processing.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.collectInfo.processing.service.ProcessingService;
import apc.util.SearchVO;
@Service
public class ProcessingServieImpl implements ProcessingService {
	@Resource
	private ProcessingMapper processingMapper;

	@Override
	public int selectProcessingListToCnt(SearchVO searchVO) {
		return processingMapper.selectProcessingListToCnt(searchVO);
	}

	@Override
	public List<?> selectProcessingList(SearchVO searchVO) {
		return processingMapper.selectProcessingList(searchVO);
	}

	@Override
	public List<?> selectAccountList() {
		return processingMapper.selectAccountList();
	}

	@Override
	public List<?> selectCompanyList() {
		return processingMapper.selectCompanyList();
	}

	@Override
	public List<?> selectProductList() {
		return processingMapper.selectProductList();
	}

	@Override
	public int selectProdStockChk(Map<String, Object> temp) {
		return processingMapper.selectProdStockChk(temp);
	}

	@Override
	public void registEstimate(Map<String, Object> map) {
		processingMapper.registEstimate(map);
	}

	@Override
	public void registProcessing(Map<String, Object> map) {
		processingMapper.registProcessing(map);
	}

	@Override
	public void registOutSourcing(Map<String, Object> map) {
		processingMapper.registOutSourcing(map);
	}

	@Override
	public void registShipment(Map<String, Object> map) {
		processingMapper.registShipment(map);
	}

	@Override
	public void registDelivery(Map<String, Object> map) {
		processingMapper.registDelivery(map);
	}

	@Override
	public void updateItemCnt(Map<String, Object> temp) {
		processingMapper.updateItemCnt(temp);
	}

	@Override
	public Map<String, Object> selectProcessingInfo(Map<String, Object> map) {
		return processingMapper.selectProcessingInfo(map);
	}

	@Override
	public void modifyProcessing(Map<String, Object> map) {
		processingMapper.modifyProcessing(map);
	}

	@Override
	public void modifyEstimate(Map<String, Object> map) {
		processingMapper.modifyEstimate(map);
	}

	@Override
	public void deleteDelivery(Map<String, Object> map) {
		processingMapper.deleteDelivery(map);
	}

	@Override
	public void deleteShipment(Map<String, Object> map) {
		processingMapper.deleteShipment(map);
	}

	@Override
	public void deleteOutSourcing(Map<String, Object> map) {
		processingMapper.deleteOutSourcing(map);
	}

	@Override
	public void deleteProcessing(Map<String, Object> map) {
		processingMapper.deleteProcessing(map);
	}

	@Override
	public void deleteEstimate(Map<String, Object> map) {
		processingMapper.deleteEstimate(map);
	}

}
