package apc.sl.facility.equipPrev.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.facility.equipPrev.service.EquipPrevService;
import apc.util.SearchVO;
@Service
public class EquipPrevServieImpl implements EquipPrevService {
	@Resource
	private EquipPrevMapper equipPrevMapper;

	@Override
	public int selectEquipPrevListToCnt(SearchVO searchVO) {
		return equipPrevMapper.selectEquipPrevListToCnt(searchVO);
	}

	@Override
	public List<?> selectEquipPrevList(SearchVO searchVO) {
		return equipPrevMapper.selectEquipPrevList(searchVO);
	}

	@Override
	public List<?> selectEquipmentList() {
		return equipPrevMapper.selectEquipmentList();
	}

	@Override
	public void failReportIscomp(Map<String, Object> map) {
		equipPrevMapper.failReportIscomp(map);
	}
	
	@Override
	public void registEquipPrev(Map<String, Object> map) {
		equipPrevMapper.registEquipPrev(map);
	}

	@Override
	public Map<String, Object> selectEquipPrevInfo(Map<String, Object> map) {
		return equipPrevMapper.selectEquipPrevInfo(map);
	}

	@Override
	public void modifyEquipPrev(Map<String, Object> map) {
		equipPrevMapper.modifyEquipPrev(map);
	}

	@Override
	public void deleteEquipPrev(Map<String, Object> map) {
		equipPrevMapper.deleteEquipPrev(map);
	}



}
