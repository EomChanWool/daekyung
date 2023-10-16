package apc.sl.basicInfo.actualResult.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface ActualResultService {

	Map<String, Object> selectActualResult(Map<String, Object> map);

	int selectActualResultListToCnt(SearchVO searchVO);

	List<?> selectActualResultList(SearchVO searchVO);

	String selectId(Map<String, Object> map);

	void registMemberOk(Map<String, Object> map);

	Map<String, Object> selectMemberInfo(Map<String, Object> map);

	void modifyMember(Map<String, Object> map);

	void deleteMember(Map<String, Object> map);

	void insertSystemLog(Map<String, Object> member);

	List<?> selectMenuLevel();

}
