package apc.sl.quality.cpk.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("CpkMapper")
public interface CpkMapper {

	int selectCpkListToCnt(SearchVO searchVO);

	List<?> selectCpkList(SearchVO searchVO);

	List<?> selectItemList(String type);

	List<?> selectItemCntInfo(Map<String, Object> map);

	int selectExistsItemCode(Map<String, Object> map);

	void registCpk(Map<String, Object> map);

	void updateItemCnt(Map<String, Object> map);

	Map<String, Object> selectCpkInfo(Map<String, Object> map);

	void modifyCpk(Map<String, Object> map);

	int selectChkRecent(Map<String, Object> map);

	void deleteCpk(Map<String, Object> map);

}
