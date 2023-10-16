package apc.sl.monitoring.sysLog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.monitoring.sysLog.service.SysLogService;
import apc.util.SearchVO;

@Service
public class SysLogServieImpl implements SysLogService {

	@Resource
	private SysLogMapper sysLogMapper;

	@Override
	public int selelctSysLogListToCnt(SearchVO searchVO) {
		return sysLogMapper.selelctSysLogListToCnt(searchVO);
	}

	@Override
	public List<?> selelctSysLogList(SearchVO searchVO) {
		return sysLogMapper.selelctSysLogList(searchVO);
	}
	
}
