package apc.sl.process.incongruentState.service.impl;

import java.util.List;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("IncongruentStateMapper")
public interface IncongruentStateMapper {
	List<?> selectIncoStateList(SearchVO searchVO);
	
	List<?> selectIncongruity(SearchVO searchVO);
	
	List<?> selectInYearList(SearchVO searchVO);
}
