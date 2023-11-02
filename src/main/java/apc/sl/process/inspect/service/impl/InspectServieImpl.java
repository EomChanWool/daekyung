package apc.sl.process.inspect.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.python.antlr.PythonParser.return_stmt_return;
import org.springframework.stereotype.Service;

import apc.sl.process.inspect.service.InspectService;
import apc.util.SearchVO;
@Service
public class InspectServieImpl implements InspectService {
	
	@Resource
	private InspectMapper inspectMapper;
	

	@Override
	public int selectInspectListToCnt(SearchVO searchVO) {
		return inspectMapper.selectInspectListToCnt(searchVO);
	}

	@Override
	public List<?> selectInspectList(SearchVO searchVO) {
	
		return inspectMapper.selectInspectList(searchVO);
	}


	@Override
	public Map<String, Object> selectInfo(Map<String, Object> map) {
		
		return inspectMapper.selectInfo(map);
	}

	@Override
	public int selectCheckIns(Map<String, Object> map) {
		
		return inspectMapper.selectCheckIns(map);
	}

	@Override
	public void registInspect(Map<String, Object> map) {
		inspectMapper.registInspect(map);
		
	}

	@Override
	public Map<String, Object> selectInco(Map<String, Object> map) {
		
		return inspectMapper.selectInco(map);
	}

	@Override
	public void modifyInspect(Map<String, Object> map) {
		
		inspectMapper.modifyInspect(map);
	}

	@Override
	public void deleteInspect(Map<String, Object> map) {
		inspectMapper.deleteInspect(map);
		
	}

	@Override
	public Map<String, Object> detailInspec(Map<String, Object> map) {
		return inspectMapper.detailInspec(map);
	}

	@Override
	public List<?> selectMfList() {
		return inspectMapper.selectMfList();
	}

	@Override
	public List<?> selectInfo2(Map<String, Object> map) {
		return inspectMapper.selectInfo2(map);
	}

	@Override
	public Map<String, Object> spcInfo(String str) {
		return inspectMapper.spcInfo(str);
	}

	@Override
	public Map<String, Object> eDataInfo(String str) {
		return inspectMapper.eDataInfo(str);
	}

	@Override
	public void updateStat(Map<String, Object> map) {
		inspectMapper.updateStat(map);
	}

	@Override
	public Map<String, Object> excelData(String str) {
		return inspectMapper.excelData(str);
	}

	@Override
	public void updateReportFileName(Map<String, Object> map) {
		inspectMapper.updateReportFileName(map);
	}

	@Override
	public Map<String, Object> registSiId(Map<String, Object> map) {
		return inspectMapper.registSiId(map);
	}

	@Override
	public List<?> waterList(SearchVO searchVO) {
		return inspectMapper.waterList(searchVO);
	}

	@Override
	public int waterListToCnt(SearchVO searchVO) {
		return inspectMapper.waterListToCnt(searchVO);
	}



	
}
