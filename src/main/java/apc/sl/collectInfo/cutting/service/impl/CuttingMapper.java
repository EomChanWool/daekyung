package apc.sl.collectInfo.cutting.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("CuttingMapper")
public interface CuttingMapper {

	int selectCuttingListToCnt(SearchVO searchVO);
	
	int checkEq(Map<String, Object> map);

	List<?> selectCuttingList(SearchVO searchVO);

	List<?> selectAccountList();

	List<?> selectProdList();

	List<?> selectEqList();

	List<?> selectComapnyInfo(Map<String, Object> map);

	List<?> selectProdPerPrice(Map<String, Object> map);

	void registCutting(Map<String, Object> map);

	void registCutting2(Map<String, Object> map);
	
	Map<String, Object> selectCuttingInfo(Map<String, Object> map);

	void modifyCutting(Map<String, Object> map);
	
	void modifyCutting2(Map<String, Object> map);

	void deleteCutting(Map<String, Object> map);

}
