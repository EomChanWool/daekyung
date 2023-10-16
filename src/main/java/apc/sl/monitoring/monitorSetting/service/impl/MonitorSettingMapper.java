package apc.sl.monitoring.monitorSetting.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("MonitorSettingMapper")
public interface MonitorSettingMapper {
	List<?> selectSetting();
	
	List<?> selectList();
	
	Map<String,Object> selectMList(Map<String,Object> map);
	
	void settingGo(Map<String,Object> map);
	
	void registGo(Map<String,Object> map);
	
	void modifySet(Map<String, Object> map);
	
	void deleteSet(Map<String,Object> map);
}
