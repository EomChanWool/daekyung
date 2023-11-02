package apc.sl.pop.popCut.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import apc.sl.pop.popCut.service.PopCutService;
import apc.sl.process.cut.service.CutService;
import apc.util.SearchVO;
@Service
public class PopCutServieImpl implements PopCutService {
	@Resource
	private PopCutMapper popCutMapper;

	@Override
	public int selectCutListToCnt(SearchVO searchVO) {
		return popCutMapper.selectCutListToCnt(searchVO);
	}

	@Override
	public List<?> selectCutList(SearchVO searchVO) {
		return popCutMapper.selectCutList(searchVO);
	}

	@Override
	public void registAnalysisData(Map<String, Object> map) {
		popCutMapper.registAnalysisData(map);
	}
	
	@Override
	public void registCut(Map<String, Object> map) {
		popCutMapper.registCut(map);
	}

	@Override
	public void updateProcess2(Map<String, Object> map) {
		popCutMapper.updateProcess2(map);
	}

	@Override
	public void deleteProdResult(Map<String, Object> map) {
		popCutMapper.deleteProdResult(map);
	}

	@Override
	public Map<String, Object> selectOrderState(Map<String, Object> map) {
		return popCutMapper.selectOrderState(map);
	}


	@Override
	public void registCPLLog(Map<String, Object> map) {
		popCutMapper.registCPLLog(map);
	}

	@Override
	public void updateOrState(Map<String, Object> map) {
		popCutMapper.updateOrState(map);
	}

	@Override
	public void registCStopLog(Map<String, Object> map) {
		popCutMapper.registCStopLog(map);
	}

	@Override
	public void updateCSStopLog2(Map<String, Object> map) {
		popCutMapper.updateCSStopLog2(map);
	}

	@Override
	public void updateOrProcess3(Map<String, Object> map) {
		popCutMapper.updateOrProcess3(map);
	}

	@Override
	public void updateLogEdtime(Map<String, Object> map) {
		popCutMapper.updateLogEdtime(map);
	}

	@Override
	public int selectCheckStop(Map<String, Object> map) {
		return popCutMapper.selectCheckStop(map);
	}

	@Override
	public void updateProcess3(Map<String, Object> map) {
		popCutMapper.updateProcess3(map);
	}

	@Override
	public List<?> selectCutManager() {
		return popCutMapper.selectCutManager();
	}
}
