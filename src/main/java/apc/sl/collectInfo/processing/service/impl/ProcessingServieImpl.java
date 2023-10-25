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
	public Map<String, Object> checkStop(Map<String, Object> map) {
		return processingMapper.checkStop(map);
	}

	@Override
	public Map<String, Object> processingAjax(Map<String, Object> map) {
		return processingMapper.processingAjax(map);
	}

	@Override
	public int existPro(Map<String, Object> map) {
		return processingMapper.existPro(map);
	}

	@Override
	public Map<String, Object> processInfo(Map<String, Object> map) {
		return processingMapper.processInfo(map);
	}

	@Override
	public void updatePro(Map<String, Object> map) {
		processingMapper.updatePro(map);
	}

	@Override
	public void updateWorktime(Map<String, Object> map) {
		processingMapper.updateWorktime(map);
	}

	@Override
	public void deletePro(Map<String, Object> map) {
		processingMapper.deletePro(map);
	}

	@Override
	public Map<String, Object> proState(Map<String, Object> map) {
		return processingMapper.proState(map);
	}

	@Override
	public List<?> prodList() {
		return processingMapper.prodList();
	}

	

}
