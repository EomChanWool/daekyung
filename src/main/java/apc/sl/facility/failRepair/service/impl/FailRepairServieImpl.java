package apc.sl.facility.failRepair.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.facility.failRepair.service.FailRepairService;
import apc.util.SearchVO;
@Service
public class FailRepairServieImpl implements FailRepairService {
	@Resource
	private FailRepairMapper failRepairMapper;

	@Override
	public int selectFailRepairListToCnt(SearchVO searchVO) {
		return failRepairMapper.selectFailRepairListToCnt(searchVO);
	}

	@Override
	public List<?> selectFailRepairList(SearchVO searchVO) {
		return failRepairMapper.selectFailRepairList(searchVO);
	}

	@Override
	public List<?> selectFailList() {
		return failRepairMapper.selectFailList();
	}

	@Override
	public void failReportIscomp(Map<String, Object> map) {
		failRepairMapper.failReportIscomp(map);
	}
	
	@Override
	public void registFailRepair(Map<String, Object> map) {
		failRepairMapper.registFailRepair(map);
	}

	@Override
	public Map<String, Object> selectFailRepairInfo(Map<String, Object> map) {
		return failRepairMapper.selectFailRepairInfo(map);
	}

	@Override
	public void modifyFailRepair(Map<String, Object> map) {
		failRepairMapper.modifyFailRepair(map);
	}

	@Override
	public void deleteFailRepair(Map<String, Object> map) {
		failRepairMapper.deleteFailRepair(map);
	}



}
