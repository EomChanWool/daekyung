package apc.sl.process.wost.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("WostMapper")
public interface WostMapper {

	int selectWostListToCnt(SearchVO searchVO);

	List<?> selectWostList(SearchVO searchVO);

	void registDocument(Map<String, Object> map);

	Map<String, Object> selectDocumentInfo(Map<String, Object> map);

	void modifyDocument(Map<String, Object> map);

	void deleteWost(Map<String, Object> map);

}
