package apc.sl.pop.manufacture.service.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.pop.manufacture.service.PopManufactureService;
import apc.util.SearchVO;
@Service
public class PopManufactureServieImpl implements PopManufactureService{

	@Resource
	private PopManufactureMapper popManufactureMapper;

	@Override
	public int selectMfListToCnt(SearchVO searchVO) {
		return popManufactureMapper.selectMfListToCnt(searchVO);
	}

	@Override
	public List<?> selectMfList(SearchVO searchVO) {
		return popManufactureMapper.selectMfList(searchVO);
	}

	@Override
	public void registMfLog(Map<String, Object> map) {
		popManufactureMapper.registMfLog(map);
	}

	@Override
	public void updateOrState(Map<String, Object> map) {
		popManufactureMapper.updateOrState(map);
	}

	@Override
	public void updateMfStopLog2(Map<String, Object> map) {
		popManufactureMapper.updateMfStopLog2(map);
	}

	@Override
	public void registMfStopLog(Map<String, Object> map) {
		popManufactureMapper.registMfStopLog(map);
	}

	@Override
	public int selectCheckStop(Map<String, Object> map) {
		return popManufactureMapper.selectCheckStop(map);
	}

	@Override
	public void updateProcess3(Map<String, Object> map) {
		popManufactureMapper.updateProcess3(map);
	}

	@Override
	public void updateLogEdtime(Map<String, Object> map) {
		popManufactureMapper.updateLogEdtime(map);
	}

	@Override
	public List<?> selectMfManager() {
		return popManufactureMapper.selectMfManager();
	}

	@Override
	public Map<String,Object> outData(String str) {
		return popManufactureMapper.outData(str);
	}

	@Override
	public int countFinish() {
		return popManufactureMapper.countFinish();
	}
}
