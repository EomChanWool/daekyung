package apc.sl.process.incongruentState.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.process.incongruentState.service.IncongruentStateService;
import apc.util.SearchVO;

@Service
public class IncongruentStateServieImpl implements IncongruentStateService{

	@Resource
	private IncongruentStateMapper incongruentStateMapper;

	@Override
	public List<?> selectIncoStateList(SearchVO searchVO) {
		return incongruentStateMapper.selectIncoStateList(searchVO);
	}

	@Override
	public List<?> selectIncongruity(SearchVO searchVO) {
		return incongruentStateMapper.selectIncongruity(searchVO);
	}

	@Override
	public List<?> selectInYearList(SearchVO searchVO) {
		
		return incongruentStateMapper.selectInYearList(searchVO);
	}
	
}
