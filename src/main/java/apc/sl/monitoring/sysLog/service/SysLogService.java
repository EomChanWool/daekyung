package apc.sl.monitoring.sysLog.service;

import java.util.List;

import apc.util.SearchVO;

public interface SysLogService {
	int selelctSysLogListToCnt(SearchVO searchVO);
	
	List<?> selelctSysLogList(SearchVO searchVO);

}
