package apc.sl.basicInfo.user.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface UserService {

	int selectUserListToCnt(SearchVO searchVO);
	
	List<?> selectUserList(SearchVO searchVO);
	
	int checkId(Map<String, Object> map);
	
	void registUser(Map<String, Object> map);

	Map<String, Object> selectUserInfo(Map<String, Object> map);

	void modifyUser(Map<String, Object> map);

	void deleteUser(Map<String, Object> map);

}
