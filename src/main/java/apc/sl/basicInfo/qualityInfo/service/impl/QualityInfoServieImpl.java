package apc.sl.basicInfo.qualityInfo.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.basicInfo.qualityInfo.service.QualityInfoService;
import apc.util.SearchVO;
@Service
public class QualityInfoServieImpl implements QualityInfoService {
	@Resource
	private QualityInfoMapper qualityInfoMapper;

	@Override
	public int selectQualityInfoToCnt(SearchVO searchVO) {
		return qualityInfoMapper.selectQualityInfoToCnt(searchVO);
	}

	@Override
	public List<?> selectQualityInfoList(SearchVO searchVO) {
		return qualityInfoMapper.selectQualityInfoList(searchVO);
	}

	@Override
	public List<?> selectStandard() {
		return qualityInfoMapper.selectStandard();
	}

	@Override
	public void registQualityInfo(Map<String, Object> map) {
		qualityInfoMapper.registQualityInfo(map);
	}

	@Override
	public Map<String, Object> selectQualityInfoInfo(Map<String, Object> map) {
		return qualityInfoMapper.selectQualityInfoInfo(map);
	}

	@Override
	public void modifyQualityInfo(Map<String, Object> map) {
		qualityInfoMapper.modifyQualityInfo(map);
	}

	@Override
	public void deleteQualityInfo(Map<String, Object> map) {
		qualityInfoMapper.deleteQualityInfo(map);
	}

	@Override
	public int selectAccessLevel(String str) {
		return qualityInfoMapper.selectAccessLevel(str);
	}

	@Override
	public List<?> selectStandardAjaxInfo(Map<String, Object> map) {
		return qualityInfoMapper.selectStandardAjaxInfo(map);
	}

	@Override
	public Map<String, Object> selectDetailQualInfo(Map<String, Object> map) {
		return qualityInfoMapper.selectDetailQualInfo(map);
	}

	@Override
	public List<?> selectStandardList() {
		return qualityInfoMapper.selectStandardList();
	}

	@Override
	public void registStandard(Map<String, Object> map) {
		qualityInfoMapper.registStandard(map);
	}

	@Override
	public int selectStandardInfoToCnt(SearchVO searchVO) {
		return qualityInfoMapper.selectStandardInfoToCnt(searchVO);
	}

	@Override
	public List<?> selectStandardInfo(SearchVO searchVO) {
		return qualityInfoMapper.selectStandardInfo(searchVO);
	}

	@Override
	public void deleteStandardInfo(Map<String, Object> map) {
		qualityInfoMapper.deleteStandardInfo(map);
	}

	@Override
	public int selectExistsQualInfo(Map<String, Object> map) {
		return qualityInfoMapper.selectExistsQualInfo(map);
	}

	@Override
	public int codeNum(String str) {
		return qualityInfoMapper.codeNum(str);
	}

	@Override
	public void spcCodeReg(Map<String, Object> map) {
		qualityInfoMapper.spcCodeReg(map);
	}

	@Override
	public void spcUpLowReg(Map<String, Object> map) {
		qualityInfoMapper.spcUpLowReg(map);
	}

	@Override
	public void deleteQualityInfo2(Map<String, Object> map) {
		qualityInfoMapper.deleteQualityInfo2(map);
	}

	@Override
	public void deleteQualityInfo3(Map<String, Object> map) {
		qualityInfoMapper.deleteQualityInfo3(map);
	}

	@Override
	public List<Map<String,Object>> spcCodeList(Map<String, Object> map) {
		return qualityInfoMapper.spcCodeList(map);
	}

	@Override
	public Map<String, Object> selectSpcInfo(Map<String, Object> map) {
		return qualityInfoMapper.selectSpcInfo(map);
	}


	

}
