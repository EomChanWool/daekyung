package apc.sl.basicInfo.qualityInfo.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("QualityInfoMapper")
public interface QualityInfoMapper {

	int selectQualityInfoToCnt(SearchVO searchVO);
	
	int selectStandardInfoToCnt(SearchVO searchVO);
	
	int selectExistsQualInfo(Map<String, Object> map);

	List<?> selectQualityInfoList(SearchVO searchVO);
	
	List<?> selectStandardInfo(SearchVO searchVO);

	List<?> selectStandard();
	
	List<?> selectStandardAjaxInfo(Map<String,Object> map);
	
	List<?> selectStandardList();

	void registQualityInfo(Map<String, Object> map);

	Map<String, Object> selectQualityInfoInfo(Map<String, Object> map);
	
	Map<String, Object> selectDetailQualInfo(Map<String, Object> map);
	
	void registStandard(Map<String, Object> map);
	
	void modifyQualityInfo(Map<String, Object> map);

	void deleteQualityInfo(Map<String, Object> map);
	
	void deleteStandardInfo(Map<String, Object> map);

	int selectAccessLevel(String str);

}
