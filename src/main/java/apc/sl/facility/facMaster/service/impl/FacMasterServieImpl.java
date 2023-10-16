package apc.sl.facility.facMaster.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.facility.facMaster.service.FacMasterService;
import apc.util.SearchVO;
@Service
public class FacMasterServieImpl implements FacMasterService {
	@Resource
	private FacMasterMapper facMasterMapper;

	@Override
	public int selectFacMasterListToCnt(SearchVO searchVO) {
		return facMasterMapper.selectFacMasterListToCnt(searchVO);
	}

	@Override
	public List<?> selectFacMasterList(SearchVO searchVO) {
		return facMasterMapper.selectFacMasterList(searchVO);
	}

	@Override
	public List<?> selectFacMasterList() {
		return facMasterMapper.selectFacMasterList();
	}

	@Override
	public void registFacMaster(Map<String, Object> map) {
		facMasterMapper.registFacMaster(map);
	}

	@Override
	public Map<String, Object> selectFacMasterInfo(Map<String, Object> map) {
		return facMasterMapper.selectFacMasterInfo(map);
	}

	@Override
	public void modifyFacMaster(Map<String, Object> map) {
		facMasterMapper.modifyFacMaster(map);
	}

	@Override
	public void deleteFacMaster(Map<String, Object> map) {
		facMasterMapper.deleteFacMaster(map);
	}

	@Override
	public Map<String, Object> selectFacMasterStd(Map<String, Object> map) {
		return facMasterMapper.selectFacMasterStd(map);
	}

}
