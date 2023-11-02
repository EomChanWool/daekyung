package apc.sl.facility.equipChk.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.facility.equipChk.service.EquipChkService;
import apc.util.SearchVO;
@Service
public class EquipChkServieImpl implements EquipChkService {
	@Resource
	private EquipChkMapper equipChkMapper;

	@Override
	public int selectEquipChkListToCnt(SearchVO searchVO) {
		return equipChkMapper.selectEquipChkListToCnt(searchVO);
	}

	@Override
	public List<?> selectEquipChkList(SearchVO searchVO) {
		return equipChkMapper.selectEquipChkList(searchVO);
	}

	@Override
	public List<?> selectEquipmentChkList() {
		return equipChkMapper.selectEquipmentChkList();
	}

	@Override
	public List<?> selectRegEquipmentChkList() {
		return equipChkMapper.selectRegEquipmentChkList();
	}
	
	@Override
	public void failReportIscomp(Map<String, Object> map) {
		equipChkMapper.failReportIscomp(map);
	}
	
	@Override
	public void registEquipChk(Map<String, Object> map) {
		equipChkMapper.registEquipChk(map);
	}

	@Override
	public Map<String, Object> selectEquipChkInfo(Map<String, Object> map) {
		return equipChkMapper.selectEquipChkInfo(map);
	}

	@Override
	public void modifyEquipChk(Map<String, Object> map) {
		equipChkMapper.modifyEquipChk(map);
	}

	@Override
	public void deleteEquipChk(Map<String, Object> map) {
		equipChkMapper.deleteEquipChk(map);
	}





}
