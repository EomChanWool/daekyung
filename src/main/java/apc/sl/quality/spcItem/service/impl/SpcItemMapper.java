package apc.sl.quality.spcItem.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("SpcItemMapper")
public interface SpcItemMapper {

	int selectSpcItemListToCnt(SearchVO searchVO);

	List<?> selectSpcItemList(SearchVO searchVO);

	List<?> selectAccountList();

	List<?> selectMaterialList();

	List<?> selectItemInfo(Map<String, Object> map);

	void registSpcItem(Map<String, Object> map);

	void updateMaterialCnt(Map<String, Object> map);

	Map<String, Object> selectSpcItemInfo(Map<String, Object> map);

	void modifySpcItem(Map<String, Object> map);

	void deleteSpcItem(Map<String, Object> map);

}
