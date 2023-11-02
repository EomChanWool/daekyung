package apc.sl.collectInfo.document.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.collectInfo.document.service.DocumentService;
import apc.util.SearchVO;
@Service
public class DocumentServieImpl implements DocumentService {
	@Resource
	private DocumentMapper documentMapper;

	@Override
	public int selectDocumentListToCnt(SearchVO searchVO) {
		return documentMapper.selectDocumentListToCnt(searchVO);
	}

	@Override
	public List<?> selectDocumentList(SearchVO searchVO) {
		return documentMapper.selectDocumentList(searchVO);
	}

	@Override
	public void registDocument(Map<String, Object> map) {
		documentMapper.registDocument(map);
	}

	@Override
	public Map<String, Object> selectDocumentInfo(Map<String, Object> map) {
		return documentMapper.selectDocumentInfo(map);
	}

	@Override
	public void modifyDocument(Map<String, Object> map) {
		documentMapper.modifyDocument(map);
	}

	@Override
	public void deleteDocument(Map<String, Object> map) {
		documentMapper.deleteDocument(map);
	}
	
}
