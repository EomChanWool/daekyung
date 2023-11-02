package apc.sl.monitoring.dashBoard.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.monitoring.dashBoard.service.DashBoardService;
import apc.util.SearchVO;
@Service
public class DashBoardServieImpl implements DashBoardService {
	@Resource
	private DashBoardMapper dashBoardMapper;

	@Override
	public List<?> selectNoticeList(SearchVO searchVO) {
		return dashBoardMapper.selectNoticeList(searchVO);
	}

	@Override
	public Map<String, Object> selectNoticeInfo(Map<String, Object> map) {
		return dashBoardMapper.selectNoticeInfo(map);
	}

	@Override
	public List<?> selectItemList() {
		return dashBoardMapper.selectItemList();
	}

	@Override
	public List<?> selectOrdersCnt(String str1) {
		return dashBoardMapper.selectOrdersCnt(str1);
	}

	@Override
	public List<?> selectProdCnt(String str1) {
		return dashBoardMapper.selectProdCnt(str1);
	}

	@Override
	public Map<String, Object> selectYear1() {
		return dashBoardMapper.selectYear1();
	}

	@Override
	public List<?> selectLineYear(String str2) {
		return dashBoardMapper.selectLineYear(str2);
	}

	@Override
	public Map<String, Object> selectYear2() {
		return dashBoardMapper.selectYear2();
	}

	@Override
	public List<?> selectProdCntAc(String str3) {
		return dashBoardMapper.selectProdCntAc(str3);
	}

	@Override
	public Map<String, Object> selectYear3() {
		return dashBoardMapper.selectYear3();
	}

	@Override
	public List<?> selectProdCntAc2(String str3) {
		return dashBoardMapper.selectProdCntAc2(str3);
	}

	@Override
	public List<?> selectLineRunningList(SearchVO searchVO) {
		return dashBoardMapper.selectLineRunningList(searchVO);
	}

}
