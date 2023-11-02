package apc.sl.process.incongruentState.service;

import java.util.List;

import apc.util.SearchVO;

public interface IncongruentStateService {

	List<?> selectIncoStateList(SearchVO searchVO);
	
	List<?> selectIncongruity(SearchVO searchVO);
	
	List<?> selectInYearList(SearchVO searchVO);
	
}
