package apc.sl.basicInfo.qualityInfo.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface QualityInfoService {

	int selectQualityInfoToCnt(SearchVO searchVO);
	
	int selectStandardInfoToCnt(SearchVO searchVO);
	
	int selectExistsQualInfo(Map<String, Object> map);

	List<?> selectQualityInfoList(SearchVO searchVO);
	
	List<?> selectStandardInfo(SearchVO searchVO);

	List<?> selectStandard();
	
	List<?> selectStandardAjaxInfo(Map<String,Object> map);
	
	List<?> selectStandardList();
	
	List<Map<String,Object>> spcCodeList(Map<String, Object> map);

	void registQualityInfo(Map<String, Object> map);

	Map<String, Object> selectQualityInfoInfo(Map<String, Object> map);
	
	Map<String, Object> selectDetailQualInfo(Map<String, Object> map);
	
	Map<String,Object> selectSpcInfo(Map<String,Object> map);
	
	void spcCodeReg(Map<String,Object> map);
	
	void spcUpLowReg(Map<String,Object> map);
	
	void registStandard(Map<String, Object> map);

	void modifyQualityInfo(Map<String, Object> map);

	void deleteQualityInfo(Map<String, Object> map);
	
	void deleteQualityInfo2(Map<String, Object> map);
	
	void deleteQualityInfo3(Map<String, Object> map);
	
	void deleteStandardInfo(Map<String, Object> map);

	int selectAccessLevel(String str);
	
	int codeNum(String str);
}
