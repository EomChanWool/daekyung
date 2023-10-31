package apc.sl.monitoring.dashBoard.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface DashBoardService {
	
	Map<String, Object> selectYear1();
	
	Map<String, Object> selectYear2();
	
	Map<String, Object> selectYear3();

	List<?> selectNoticeList(SearchVO searchVO);
	
	List<?> selectLineRunningList(SearchVO searchVO);
	
	Map<String, Object> selectNoticeInfo(Map<String, Object> map);
	
	List<?> selectOrdersCnt(String str1);
	
	List<?> selectProdCnt(String str1);
	
	List<?> selectLineYear(String str2);

	List<?> selectItemList();
	
	List<?> selectProdCntAc(String str3);
	
	List<?> selectProdCntAc2(String str3);

}
