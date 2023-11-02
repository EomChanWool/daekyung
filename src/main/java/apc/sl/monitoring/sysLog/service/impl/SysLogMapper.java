package apc.sl.monitoring.sysLog.service.impl;

import java.util.List;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("SysLogMapper")
public interface SysLogMapper {
	
	int selelctSysLogListToCnt(SearchVO searchVO);
	
	List<?> selelctSysLogList(SearchVO searchVO);

}
