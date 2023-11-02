package apc.sl.monitoring.monitorSetting.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.monitoring.monitorSetting.service.MonitorSettingService;

@Service
public class MonitorSettingServieImpl implements MonitorSettingService{

	@Resource MonitorSettingMapper monitorSettingMapper;

	@Override
	public List<?> selectSetting() {
		return monitorSettingMapper.selectSetting();
	}

	@Override
	public void settingGo(Map<String, Object> map) {
		monitorSettingMapper.settingGo(map);
	}

	@Override
	public List<?> selectList() {
		return monitorSettingMapper.selectList();
	}

	@Override
	public void registGo(Map<String, Object> map) {
		monitorSettingMapper.registGo(map);
	}

	@Override
	public Map<String, Object> selectMList(Map<String, Object> map) {
		return monitorSettingMapper.selectMList(map);
	}

	@Override
	public void modifySet(Map<String, Object> map) {
		monitorSettingMapper.modifySet(map);
	}

	@Override
	public void deleteSet(Map<String, Object> map) {
		monitorSettingMapper.deleteSet(map);
	}
}
