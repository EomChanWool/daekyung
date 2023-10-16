package apc.sl.collectInfo.document.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface DocumentService {

	int selectDocumentListToCnt(SearchVO searchVO);

	List<?> selectDocumentList(SearchVO searchVO);

	void registDocument(Map<String, Object> map);

	Map<String, Object> selectDocumentInfo(Map<String, Object> map);

	void modifyDocument(Map<String, Object> map);

	void deleteDocument(Map<String, Object> map);

}
