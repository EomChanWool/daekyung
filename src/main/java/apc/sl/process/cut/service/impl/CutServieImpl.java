package apc.sl.process.cut.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import apc.sl.process.cut.service.CutService;
import apc.util.SearchVO;
@Service
public class CutServieImpl implements CutService {
	@Resource
	private CutMapper cutMapper;

	@Override
	public int selectCutListToCnt(SearchVO searchVO) {
		return cutMapper.selectCutListToCnt(searchVO);
	}

	@Override
	public List<?> selectCutList(SearchVO searchVO) {
		return cutMapper.selectCutList(searchVO);
	}

	@Override
	public void registAnalysisData(Map<String, Object> map) {
		cutMapper.registAnalysisData(map);
	}
	
	@Override
	public void registCut(Map<String, Object> map) {
		cutMapper.registCut(map);
	}

	@Override
	public int selectExistsProdResult(Map<String, Object> map) {
		return cutMapper.selectExistsProdResult(map);
	}

	@Override
	public Map<String, Object> selectCutInfo(Map<String, Object> map) {
		return cutMapper.selectCutInfo(map);
	}

	@Override
	public void modifyAnalysisData(Map<String, Object> map) {
		cutMapper.modifyAnalysisData(map);
	}

	@Override
	public void modifyCut(Map<String, Object> map) {
		cutMapper.modifyCut(map);
	}

	@Override
	public void deleteCut(Map<String, Object> map) {
		cutMapper.deleteCut(map);
	}

	@Override
	public Map<String, Object> selectAnalysisCnt() {
		return cutMapper.selectAnalysisCnt();
	}

	@Override
	public void updatePoState(Map<String, Object> map) {
		cutMapper.updatePoState(map);
	}

	@Override
	public void updatePrReReSt(Map<String, Object> map) {
		cutMapper.updatePrReReSt(map);
	}

	@Override
	public Map<String, Object> detailCut(Map<String, Object> map) {
		return cutMapper.detailCut(map);
	}


	@Override
	public void updateProcess2(Map<String, Object> map) {
		cutMapper.updateProcess2(map);
	}

	@Override
	public void deleteProdResult(Map<String, Object> map) {
		cutMapper.deleteProdResult(map);
	}

	@Override
	public Map<String, Object> selectOrderState(Map<String, Object> map) {
		return cutMapper.selectOrderState(map);
	}

	@Override
	public List<?> selectEQList() {
		return cutMapper.selectEQList();
	}

	@Override
	public List<?> selectLotnoList() {
		return cutMapper.selectLotnoList();
	}

	@Override
	public Map<String, Object> selectCutAjax(Map<String, Object> map) {
		return cutMapper.selectCutAjax(map);
	}

	@Override
	public int selctExistsOn(Map<String, Object> map) {
		return cutMapper.selctExistsOn(map);
	}

	@Override
	public int selectExistsLot(Map<String, Object> map) {
		return cutMapper.selectExistsLot(map);
	}

	@Override
	public void registCPLLog(Map<String, Object> map) {
		cutMapper.registCPLLog(map);
	}

	@Override
	public void updateOrState(Map<String, Object> map) {
		cutMapper.updateOrState(map);
	}

	@Override
	public void registCStopLog(Map<String, Object> map) {
		cutMapper.registCStopLog(map);
	}

	@Override
	public void updateCSStopLog2(Map<String, Object> map) {
		cutMapper.updateCSStopLog2(map);
	}

	@Override
	public int selectCheckStop(Map<String, Object> map) {
		return cutMapper.selectCheckStop(map);
	}

	@Override
	public void updateOrProcess3(Map<String, Object> map) {
		cutMapper.updateOrProcess3(map);
	}

	@Override
	public void updateLogEdtime(Map<String, Object> map) {
		cutMapper.updateLogEdtime(map);
	}

	@Override
	public void updateProcess3(Map<String, Object> map) {
		cutMapper.updateProcess3(map);
	}

	@Override
	public List<?> selectCutManager() {
		return cutMapper.selectCutManager();
	}

	@Override
	public void modifyCutManger(Map<String, Object> map) {
		cutMapper.modifyCutManger(map);
	}
}
