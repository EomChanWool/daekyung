package apc.sl.basicInfo.prodInfo.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("ProdInfoMapper")
public interface ProdInfoMapper {

	int selectProdInfoListToCnt(SearchVO searchVO);

	List<?> selectProdInfoList(SearchVO searchVO);

	void registProdInfo(Map<String, Object> map);

	Map<String, Object> selectProdInfoInfo(Map<String, Object> map);

	void modifyProdInfo(Map<String, Object> map);

	void deleteProdInfo(Map<String, Object> map);

}
