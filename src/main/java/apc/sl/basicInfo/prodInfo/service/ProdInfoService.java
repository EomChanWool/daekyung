package apc.sl.basicInfo.prodInfo.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface ProdInfoService {

	int selectProdInfoListToCnt(SearchVO searchVO);

	List<?> selectProdInfoList(SearchVO searchVO);

	void registProdInfo(Map<String, Object> map);

	Map<String, Object> selectProdInfoInfo(Map<String, Object> map);

	void modifyProdInfo(Map<String, Object> map);

	void deleteProdInfo(Map<String, Object> map);

}
