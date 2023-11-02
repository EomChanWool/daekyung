package apc.sl.collectInfo.document.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("DocumentMapper")
public interface DocumentMapper {

	int selectDocumentListToCnt(SearchVO searchVO);

	List<?> selectDocumentList(SearchVO searchVO);

	void registDocument(Map<String, Object> map);

	Map<String, Object> selectDocumentInfo(Map<String, Object> map);

	void modifyDocument(Map<String, Object> map);

	void deleteDocument(Map<String, Object> map);

}
