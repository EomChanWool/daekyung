package apc.sl.collectInfo.processing.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("ProcessingMapper")
public interface ProcessingMapper {

	int selectProcessingListToCnt(SearchVO searchVO);

	List<?> selectProcessingList(SearchVO searchVO);

	List<?> selectAccountList();

	List<?> selectCompanyList();

	List<?> selectProductList();

	int selectProdStockChk(Map<String, Object> temp);

	void registEstimate(Map<String, Object> map);

	void registProcessing(Map<String, Object> map);

	void registOutSourcing(Map<String, Object> map);

	void registShipment(Map<String, Object> map);

	void registDelivery(Map<String, Object> map);

	void updateItemCnt(Map<String, Object> temp);

	Map<String, Object> selectProcessingInfo(Map<String, Object> map);

	void modifyProcessing(Map<String, Object> map);

	void modifyEstimate(Map<String, Object> map);

	void deleteDelivery(Map<String, Object> map);

	void deleteShipment(Map<String, Object> map);

	void deleteOutSourcing(Map<String, Object> map);

	void deleteProcessing(Map<String, Object> map);

	void deleteEstimate(Map<String, Object> map);

}
