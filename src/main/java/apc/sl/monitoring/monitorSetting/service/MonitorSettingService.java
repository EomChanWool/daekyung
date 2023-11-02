package apc.sl.monitoring.monitorSetting.service;

import java.util.List;
import java.util.Map;

public interface MonitorSettingService {

	List<?> selectSetting();
	
	List<?> selectList();
	
	Map<String,Object> selectMList(Map<String,Object> map);
	
	void settingGo(Map<String,Object> map);
	
	void registGo(Map<String,Object> map);
	
	void modifySet(Map<String, Object> map);
	
	void deleteSet(Map<String,Object> map);
	
}
